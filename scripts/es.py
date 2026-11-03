"""Funcoes pequenas para falar com o Elasticsearch pela API REST.

Usa so a biblioteca padrao do Python (nao precisa instalar nada).
O endereco pode ser trocado com a variavel de ambiente ES_URL.
"""
import json
import os
import sys
import urllib.error
import urllib.request

# Garante acentos corretos no terminal do Windows
try:
    sys.stdout.reconfigure(encoding="utf-8")
except AttributeError:
    pass

ES_URL = os.environ.get("ES_URL", "http://localhost:9200").rstrip("/")


def requisicao(metodo, caminho, corpo=None, ndjson=False):
    """Envia uma requisicao HTTP e devolve (status, resposta_em_json)."""
    url = ES_URL + "/" + caminho.lstrip("/")
    dados = None
    cabecalhos = {}
    if corpo is not None:
        if ndjson:  # formato do _bulk: um JSON por linha
            dados = corpo.encode("utf-8")
            cabecalhos["Content-Type"] = "application/x-ndjson"
        else:
            dados = json.dumps(corpo, ensure_ascii=False).encode("utf-8")
            cabecalhos["Content-Type"] = "application/json"
    req = urllib.request.Request(url, data=dados, method=metodo, headers=cabecalhos)
    try:
        with urllib.request.urlopen(req) as resp:
            texto = resp.read().decode("utf-8")
            return resp.status, (json.loads(texto) if texto else {})
    except urllib.error.HTTPError as erro:
        texto = erro.read().decode("utf-8")
        try:
            return erro.code, json.loads(texto)
        except ValueError:
            return erro.code, {"erro": texto}
    except urllib.error.URLError as erro:
        raise SystemExit(
            f"Nao consegui conectar em {ES_URL}: {erro.reason}\n"
            "O Elasticsearch esta rodando? Rode: docker compose up -d e espere uns 30 segundos."
        )

"""Cria o indice 'produtos' e carrega os 36 produtos de dados/produtos.json.

Uso (na raiz do repositorio):  python scripts/carga.py
Pode rodar quantas vezes quiser: o indice e apagado e recriado do zero.
"""
import json
import pathlib
import time

from es import ES_URL, requisicao

RAIZ = pathlib.Path(__file__).resolve().parent.parent
INDICE = "produtos"


def esperar_elasticsearch():
    print(f"Aguardando o Elasticsearch em {ES_URL} ...")
    for _ in range(60):
        try:
            status, saude = requisicao("GET", "/_cluster/health")
            if status == 200 and saude.get("status") in ("green", "yellow"):
                print(f"  OK - cluster '{saude['cluster_name']}' com status {saude['status']}")
                return
        except SystemExit:
            pass
        time.sleep(2)
    raise SystemExit("O Elasticsearch nao respondeu a tempo.")


def main():
    esperar_elasticsearch()

    # 1) Recria o indice com as configuracoes de analise (portugues, sinonimos...) e o mapeamento
    requisicao("DELETE", f"/{INDICE}")
    definicao = json.loads((RAIZ / "elasticsearch" / "indice_produtos.json").read_text(encoding="utf-8"))
    status, resp = requisicao("PUT", f"/{INDICE}", definicao)
    if status != 200:
        raise SystemExit(f"Erro ao criar o indice: {json.dumps(resp, indent=2, ensure_ascii=False)}")
    print(f"Indice '{INDICE}' criado.")

    # 2) Carga em lote com a Bulk API: uma linha de acao + uma linha com o documento
    produtos = json.loads((RAIZ / "dados" / "produtos.json").read_text(encoding="utf-8"))
    linhas = []
    for p in produtos:
        linhas.append(json.dumps({"index": {"_index": INDICE, "_id": p["sku"]}}))
        linhas.append(json.dumps(p, ensure_ascii=False))
    corpo = "\n".join(linhas) + "\n"
    status, resp = requisicao("POST", "/_bulk?refresh=true", corpo, ndjson=True)
    if resp.get("errors"):
        erros = [i["index"]["error"] for i in resp["items"] if "error" in i["index"]]
        raise SystemExit(f"Alguns documentos falharam: {json.dumps(erros[:3], indent=2, ensure_ascii=False)}")
    print(f"{len(produtos)} produtos enviados em {resp['took']} ms.")

    # 3) Conferencia
    _, contagem = requisicao("GET", f"/{INDICE}/_count")
    _, por_categoria = requisicao("POST", f"/{INDICE}/_search", {
        "size": 0, "aggs": {"categorias": {"terms": {"field": "categoria"}}}
    })
    print(f"Total no indice: {contagem['count']}")
    for b in por_categoria["aggregations"]["categorias"]["buckets"]:
        print(f"  {b['key']:<8} {b['doc_count']}")


if __name__ == "__main__":
    main()

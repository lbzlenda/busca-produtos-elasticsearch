"""Executa as requisicoes de um arquivo .http (formato do Kibana Dev Tools).

Uso:
  python scripts/executar.py consultas/02_consultas.http          # roda todas
  python scripts/executar.py consultas/02_consultas.http C3       # roda so a C3
  python scripts/executar.py consultas/02_consultas.http --json   # mostra a resposta completa

Cada bloco do arquivo comeca com uma linha '### TITULO', seguida de linhas de
comentario '#', da linha 'METODO /caminho' e, se houver, do corpo em JSON.
O mesmo arquivo pode ser colado direto no Kibana Dev Tools.
"""
import json
import pathlib
import sys

from es import requisicao


def ler_blocos(caminho):
    blocos, atual = [], None
    for linha in pathlib.Path(caminho).read_text(encoding="utf-8").splitlines():
        if linha.startswith("###"):
            atual = {"titulo": linha.strip("# ").strip(), "comentarios": [], "requisicao": None, "corpo": []}
            blocos.append(atual)
        elif atual is None:
            continue
        elif atual["requisicao"] is None:
            if linha.startswith("#"):
                atual["comentarios"].append(linha.lstrip("# ").rstrip())
            elif linha.strip():
                atual["requisicao"] = linha.strip()
        else:
            atual["corpo"].append(linha)
    return blocos


def mostrar_busca(resp):
    hits = resp.get("hits", {})
    total = hits.get("total", {}).get("value", 0)
    if hits.get("hits") or not (resp.get("aggregations") or resp.get("suggest")):
        print(f"  -> {total} resultado(s) em {resp.get('took')} ms")
    for h in hits.get("hits", []):
        f = h.get("_source", {})
        score = f"{h['_score']:.3f}" if h.get("_score") is not None else "  -  "
        preco = f"R$ {f['preco']:>8.2f}" if "preco" in f else ""
        extra = ""
        if "notaMedia" in f:
            extra += f"  nota {f['notaMedia']}"
        if "vendas" in f:
            extra += f"  vendas {f['vendas']}"
        print(f"     [{score}] {f.get('sku', h['_id']):<8} {f.get('nome', ''):<42} {preco}{extra}")
        for campo, trechos in h.get("highlight", {}).items():
            print(f"              destaque ({campo}): {' ... '.join(trechos)}")
    for nome, agg in resp.get("aggregations", {}).items():
        print(f"  -> agregacao '{nome}':")
        for b in agg.get("buckets", []):
            chave = b.get("key_as_string", b.get("key"))
            linha = f"     {str(chave):<22} {b['doc_count']}"
            if "top" in b:  # top_hits dentro do bucket
                nomes = [x["_source"]["nome"] for x in b["top"]["hits"]["hits"]]
                linha += "  -> " + " | ".join(nomes)
            print(linha)
    for nome, sugestoes in resp.get("suggest", {}).items():
        print(f"  -> sugestoes '{nome}':")
        for s in sugestoes:
            opcoes = ", ".join(f"{o['text']} ({o.get('freq', '')})" for o in s["options"]) or "(palavra ja existe)"
            print(f"     '{s['text']}' -> {opcoes}")


def main():
    if len(sys.argv) < 2:
        raise SystemExit(__doc__)
    arquivo = sys.argv[1]
    filtro = next((a for a in sys.argv[2:] if not a.startswith("--")), None)
    completo = "--json" in sys.argv

    for bloco in ler_blocos(arquivo):
        if filtro and not bloco["titulo"].upper().startswith(filtro.upper()):
            continue
        print("\n" + "=" * 90)
        print(bloco["titulo"])
        for c in bloco["comentarios"]:
            print("  # " + c)
        metodo, caminho = bloco["requisicao"].split(maxsplit=1)
        texto = "\n".join(bloco["corpo"]).strip()
        corpo = json.loads(texto) if texto else None
        print(f"  {metodo} {caminho}")
        status, resp = requisicao(metodo, caminho, corpo)
        if status >= 300:
            print(f"  ERRO HTTP {status}:")
            print(json.dumps(resp, indent=2, ensure_ascii=False))
        elif completo or "hits" not in resp:
            print(json.dumps(resp, indent=2, ensure_ascii=False))
        else:
            mostrar_busca(resp)


if __name__ == "__main__":
    main()

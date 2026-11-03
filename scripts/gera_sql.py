"""Gera sql/02_carga.sql a partir de dados/produtos.json.

Assim o Elasticsearch e o PostgreSQL ficam com exatamente os mesmos 36 produtos.
Uso: python scripts/gera_sql.py
"""
import json
import pathlib

RAIZ = pathlib.Path(__file__).resolve().parent.parent


def q(valor):
    """Formata um valor Python como literal SQL."""
    if valor is None:
        return "NULL"
    if isinstance(valor, bool):
        return "TRUE" if valor else "FALSE"
    if isinstance(valor, (int, float)):
        return str(valor)
    return "'" + str(valor).replace("'", "''") + "'"


def main():
    produtos = json.loads((RAIZ / "dados" / "produtos.json").read_text(encoding="utf-8"))
    sql = ["-- Gerado por scripts/gera_sql.py a partir de dados/produtos.json", "BEGIN;", ""]

    marcas = sorted({p["marca"] for p in produtos})
    tags = sorted({t for p in produtos for t in p["tags"]})
    clientes = []
    for p in produtos:
        for a in p["avaliacoes"]:
            if (a["cliente"], a["cidade"]) not in clientes:
                clientes.append((a["cliente"], a["cidade"]))

    sql.append("INSERT INTO marcas (nome) VALUES " + ", ".join(f"({q(m)})" for m in marcas) + ";")
    sql.append("INSERT INTO tags (nome) VALUES " + ", ".join(f"({q(t)})" for t in tags) + ";")
    sql.append("INSERT INTO clientes (nome, cidade) VALUES\n  " +
               ",\n  ".join(f"({q(n)}, {q(c)})" for n, c in clientes) + ";")
    sql.append("")

    for p in produtos:
        a = p["atributos"]
        sku = q(p["sku"])
        pid = f"(SELECT id FROM produtos WHERE sku = {sku})"
        sql.append(f"-- {p['sku']} - {p['nome']}")
        sql.append(
            "INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ("
            f"{sku}, {q(p['nome'])}, {q(p['descricao'])}, {q(p['categoria'])}, "
            f"(SELECT id FROM marcas WHERE nome = {q(p['marca'])}), {p['preco']}, {p['estoque']}, {p['vendas']}, {q(p['criadoEm'])});"
        )
        if p["categoria"] == "celular":
            sql.append(
                "INSERT INTO produto_celular VALUES ("
                f"{pid}, {a['armazenamentoGB']}, {a['ramGB']}, {a['telaPolegadas']}, {q(a['cor'])}, {q(a['cincoG'])}, {q(a['sistema'])});"
            )
        elif p["categoria"] == "roupa":
            sql.append(f"INSERT INTO produto_roupa VALUES ({pid}, {q(a['material'])}, {q(a['genero'])});")
            for t in a["tamanhos"]:
                sql.append(f"INSERT INTO roupa_tamanho VALUES ({pid}, {q(t)});")
            for c in a["cores"]:
                sql.append(f"INSERT INTO roupa_cor VALUES ({pid}, {q(c)});")
        else:
            sql.append(
                "INSERT INTO produto_livro VALUES ("
                f"{pid}, {q(a['autor'])}, {q(a['isbn'])}, {a['paginas']}, {q(a['editora'])}, {q(a['idioma'])}, "
                f"{a['anoPublicacao']}, {q(a['formato'])});"
            )
        for t in p["tags"]:
            sql.append(f"INSERT INTO produto_tag VALUES ({pid}, (SELECT id FROM tags WHERE nome = {q(t)}));")
        for av in p["avaliacoes"]:
            sql.append(
                "INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ("
                f"{pid}, (SELECT id FROM clientes WHERE nome = {q(av['cliente'])} AND cidade = {q(av['cidade'])}), "
                f"{av['nota']}, {q(av['comentario'])}, {q(av['data'])});"
            )
        sql.append("")

    sql.append("COMMIT;")
    destino = RAIZ / "sql" / "02_carga.sql"
    destino.write_text("\n".join(sql) + "\n", encoding="utf-8")
    print(f"Gerado {destino} com {len(produtos)} produtos.")


if __name__ == "__main__":
    main()

# Busca de Produtos com Elasticsearch

Trabalho prático de **Bancos de Dados NoSQL** — tipo **Pesquisa (search engine)**.

**Integrantes:** Leonardo Bezerra · Gabriel Anjo · Artur Sousa

**Como o trabalho foi feito:** o grupo desenvolveu o projeto em conjunto, no computador do Leonardo. Por isso, os commits
saem pela conta dele, com os demais integrantes indicados como coautores (`Co-authored-by`).

**Estudo de caso:** busca de produtos de um e-commerce (celulares, roupas e livros) com **relevância, filtros,
autocompletar e tolerância a erro de digitação**.

**Por que Elasticsearch e não outro banco de pesquisa?** Porque é o único da lista que entrega, no mesmo produto,
analisador em português com stemmer e sinônimos, `fuzziness`, `search_as_you_type`, sugestor "você quis dizer",
agregações para facetas e `function_score` para relevância de negócio — e vem com o Kibana, cujo Dev Tools facilita a demo ao vivo.
(Meilisearch e Typesense são mais simples de configurar, mas têm agregações e controle de relevância bem mais limitados.)

---

## Estrutura do repositório

```
├── docker-compose.yml          Elasticsearch + Kibana (+ PostgreSQL no perfil "sql")
├── elasticsearch/
│   └── indice_produtos.json    configurações (analisadores, sinônimos) e mapeamento do índice
├── dados/
│   └── produtos.json           36 produtos (12 celulares, 12 roupas, 12 livros) com 77 avaliações
├── scripts/
│   ├── carga.py                cria o índice e carrega os dados (Bulk API)
│   ├── executar.py             roda os arquivos .http e mostra o resultado formatado
│   ├── es.py                   funções de acesso à API REST (só biblioteca padrão do Python)
│   └── gera_sql.py             gera a carga SQL a partir do mesmo JSON
├── consultas/
│   ├── 01_crud.http            inserir, consultar, atualizar e excluir
│   └── 02_consultas.http       consultas do estudo de caso (C1 a C8)
├── sql/                        modelo relacional para o comparativo
│   ├── 01_schema.sql
│   ├── 02_carga.sql
│   └── 03_consultas.sql
├── docs/
│   ├── modelagem.md            desenho do índice e perguntas x modelagem
│   ├── consultas.md            cada consulta com comando e print
│   └── comparativo.md          ER, SQL e conclusão
└── prints/                     prints dos resultados
```

---

## Como subir o ambiente do zero

**Pré-requisitos:** [Docker Desktop](https://www.docker.com/products/docker-desktop/) (com pelo menos 2 GB de memória livres)
e [Python 3.8+](https://www.python.org/downloads/). Não precisa instalar nenhuma biblioteca Python.

```bash
# 1. Clonar o repositório
git clone <url-deste-repositorio>
cd busca-produtos-elasticsearch

# 2. Subir Elasticsearch (porta 9200) e Kibana (porta 5601)
docker compose up -d

# 3. Conferir se o Elasticsearch respondeu (pode levar ~30 s na primeira vez)
curl http://localhost:9200
#   (no Windows sem curl: abra http://localhost:9200 no navegador)

# 4. Criar o índice e carregar os 36 produtos
python scripts/carga.py
#   (no Linux/Mac pode ser python3)

# 5. Rodar o CRUD e as consultas
python scripts/executar.py consultas/01_crud.http
python scripts/executar.py consultas/02_consultas.http
python scripts/executar.py consultas/02_consultas.http C2     # só uma consulta
python scripts/executar.py consultas/02_consultas.http C4 --json  # resposta completa
```

**Pelo Kibana:** abra http://localhost:5601/app/dev_tools#/console, cole o conteúdo de um arquivo `.http`,
coloque o cursor em uma requisição e aperte `Ctrl+Enter`.

**Comparativo com o PostgreSQL** (opcional):

```bash
docker compose --profile sql up -d postgres
docker exec -it busca-postgres psql -U loja -d loja -f /sql/03_consultas.sql
```

**Para desligar:** `docker compose --profile sql down` (mantém os dados) ou `docker compose --profile sql down -v` (apaga tudo).

### Problemas comuns

| Sintoma | Solução |
|---|---|
| `carga.py` diz que não conectou | O Elasticsearch ainda está subindo. Espere e rode de novo. Veja `docker logs busca-es`. |
| Container `busca-es` para sozinho (código 137) | Falta memória. Aumente a memória do Docker Desktop para 4 GB. |
| No Linux: `max virtual memory areas vm.max_map_count [65530] is too low` | `sudo sysctl -w vm.max_map_count=262144` |
| Porta 9200 ou 5601 ocupada | Pare o outro serviço ou troque a porta da esquerda no `docker-compose.yml` |

---

## 1. Modelagem

Resumo (detalhes e diagramas em [`docs/modelagem.md`](docs/modelagem.md)):

- **Um índice, `produtos`**, com um **documento JSON por produto** e `_id` igual ao SKU.
- Documento **desnormalizado**: marca, tags, atributos da categoria e resumo das avaliações (`notaMedia`, `totalAvaliacoes`, `vendas`) ficam dentro do produto, porque a busca não faz JOIN.
- Campos de **texto livre** (`nome`, `descricao`, `tags.texto`) são `text` com analisador em português: minúsculas, sem acento, sem stopwords, com stemmer — e **sinônimos só na hora da busca**.
- Campos de **filtro e faceta** (`categoria`, `marca`, `tags`, `atributos.*`) são `keyword`; preço, estoque e notas são numéricos.
- `nome` tem **subcampos**: `nome.autocompletar` (`search_as_you_type`), `nome.sugestao` (para o "você quis dizer") e `nome.keyword`.
- Atributos diferentes por categoria convivem no mesmo índice: um `dynamic_template` transforma qualquer atributo de texto novo em `keyword`.

| Pergunta do sistema | Consulta | Recurso da modelagem |
|---|---|---|
| Quais produtos combinam melhor com o que o cliente digitou? | C1 | `text` + analisador pt + pesos por campo |
| Achamos o produto mesmo com erro de digitação? | C2, C2b, C2c | índice invertido + `fuzziness` |
| O que sugerir enquanto a pessoa digita? | C3, C3b | `search_as_you_type` |
| Filtrar por tamanho, preço e estoque mostrando as facetas | C4 | `keyword` + `range` + `aggs` + `post_filter` |
| Encontrar com palavra que não está no cadastro | C5 | `synonym_graph` |
| Ordenar priorizando bem avaliados e mais vendidos | C6 | `function_score` sobre campos numéricos |
| Sugerir a grafia correta ("você quis dizer") | C7 | `term suggester` em `nome.sugestao` |
| Top 3 mais vendidos por categoria | C8 | `terms` + `top_hits` |

## 2. Carga e operações

- **Carga:** `python scripts/carga.py` apaga e recria o índice com [`elasticsearch/indice_produtos.json`](elasticsearch/indice_produtos.json) e envia os **36 produtos** de [`dados/produtos.json`](dados/produtos.json) em uma única requisição `_bulk`.
- **CRUD:** [`consultas/01_crud.http`](consultas/01_crud.http)

| Operação | Requisição |
|---|---|
| Inserir com id | `PUT /produtos/_doc/LIV-013` |
| Inserir com id automático | `POST /produtos/_doc` |
| Consultar por id / por campo | `GET /produtos/_doc/LIV-013` · `GET /produtos/_search` com `term` |
| Atualizar parcial | `POST /produtos/_update/LIV-013` com `doc` |
| Atualizar com script (venda) | `POST /produtos/_update/LIV-013` com `script` |
| Atualizar vários | `POST /produtos/_update_by_query` |
| Excluir por id / por consulta | `DELETE /produtos/_doc/LIV-013` · `POST /produtos/_delete_by_query` |

O script do CRUD termina apagando o que inseriu, então pode ser rodado várias vezes.

## 3. Consultas do estudo de caso

Comandos e prints de cada uma em [`docs/consultas.md`](docs/consultas.md).

| # | Consulta | Resultado esperado |
|---|---|---|
| C1 | "camiseta preta algodao" com pesos e destaque | Camiseta Básica Algodão Preta em 1º |
| **C2** | **"samsumg galxy"** com `fuzziness` (**ponto forte**) | Os 3 Samsung Galaxy |
| **C2b** | **"machdo de asis"** no autor | Dom Casmurro |
| **C2c** | **"iphnoe"** | iPhone 15 e iPhone 15 Pro |
| C3 | Autocompletar "tenis cor" / "harry pot" | Tênis de Corrida Pegasus 41 / Harry Potter e a Pedra Filosofal |
| C4 | Roupas tamanho M, até R$ 400, em estoque + facetas | Camiseta, Legging, Moletom, Vestido + contagens por marca, faixa e tamanho |
| C5 | "telefone 5G" até R$ 2.000 (sinônimo) | Moto G54 e Edge 50 Fusion |
| C6 | "livro classico" com nota e vendas | Clássicos bem avaliados primeiro |
| C7 | "camizeta algodao preeta" → você quis dizer | camiseta, preta |
| C8 | Top 3 mais vendidos por categoria | 3 produtos por categoria |

**Recurso de ponto forte do tipo:** busca com erro de digitação (C2, C2b, C2c), complementada por autocompletar (C3) e "você quis dizer" (C7).

## 4. Comparativo com o relacional

Em [`docs/comparativo.md`](docs/comparativo.md): diagrama ER (11 tabelas), criação das tabelas em
[`sql/01_schema.sql`](sql/01_schema.sql), C2 e C4 reescritas em SQL (testadas no PostgreSQL 16) e a conclusão do grupo.

**Conclusão em uma frase:** para a busca de produtos o Elasticsearch é melhor (relevância, erro de digitação,
sinônimos, autocompletar e facetas são nativos); para estoque, pedidos e pagamentos o relacional continua sendo a escolha certa —
na prática, os dois trabalham juntos.

---

## Roteiro da apresentação (15 min)

| Tempo | Parte | Quem | O que mostrar |
|---|---|---|---|
| 0–2 min | Banco escolhido e por quê | Leonardo | Seção do topo deste README |
| 2–5 min | Modelagem | Leonardo | `indice_produtos.json`: analisadores, sinônimos, subcampos; um documento de exemplo no Kibana |
| 5–7 min | Ambiente e carga | Gabriel | `docker compose up -d` (já subido antes), `python scripts/carga.py` |
| 7–9 min | CRUD | Gabriel | `01_crud.http` no Kibana Dev Tools |
| 9–13 min | Consultas C1–C8 | Artur | Foco no ponto forte: C2 (erro de digitação), C3 (autocompletar), C4 (facetas) |
| 13–15 min | Comparativo e conclusão | Artur | C2 e C4 em SQL lado a lado; conclusão |

**Antes de apresentar:** suba os containers uns 5 minutos antes (o Kibana demora para ficar pronto) e grave um
vídeo da execução como plano B.

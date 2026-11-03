-- =====================================================================
-- Duas consultas do estudo de caso reescritas em SQL (PostgreSQL)
-- Rodar: docker exec -it busca-postgres psql -U loja -d loja -f /sql/03_consultas.sql
-- =====================================================================

-- ---------------------------------------------------------------------
-- C2 em SQL - Tolerancia a erro de digitacao: "samsumg galxy"
-- No Elasticsearch: um multi_match com "fuzziness": "AUTO".
-- No PostgreSQL: precisa da extensao pg_trgm (trigramas) e escolher um
-- limite de similaridade "na mao". Nao ha nota de relevancia por campo,
-- nem pesos, nem stemmer junto com a tolerancia a erro.
-- ---------------------------------------------------------------------
\echo '=== C2 - erro de digitacao: samsumg galxy ==='
SELECT p.sku,
       p.nome,
       p.preco,
       round(similarity(unaccent(lower(p.nome)), 'samsumg galxy')::numeric, 3) AS similaridade
FROM produtos p
WHERE similarity(unaccent(lower(p.nome)), 'samsumg galxy') > 0.25
ORDER BY similaridade DESC
LIMIT 5;

-- Autor com erro de digitacao: "machdo de asis"
\echo '=== C2b - erro de digitacao no autor: machdo de asis ==='
SELECT p.sku, p.nome, l.autor,
       round(similarity(lower(l.autor), 'machdo de asis')::numeric, 3) AS similaridade
FROM produtos p
JOIN produto_livro l ON l.produto_id = p.id
WHERE similarity(lower(l.autor), 'machdo de asis') > 0.3
ORDER BY similaridade DESC;


-- ---------------------------------------------------------------------
-- C4 em SQL - Filtros e facetas: roupas tamanho M, ate R$ 400, com estoque
-- No Elasticsearch: UMA requisicao devolve a lista filtrada + as 3 facetas.
-- No PostgreSQL: uma consulta para a lista e mais uma consulta (GROUP BY)
-- para cada faceta, com JOINs nas tabelas de marca e de tamanhos.
-- ---------------------------------------------------------------------
\echo '=== C4 - lista filtrada ==='
SELECT p.sku, p.nome, p.preco
FROM produtos p
WHERE p.categoria = 'roupa'
  AND p.preco <= 400
  AND p.estoque > 0
  AND EXISTS (SELECT 1 FROM roupa_tamanho t WHERE t.produto_id = p.id AND t.tamanho = 'M')
ORDER BY p.preco;

\echo '=== C4 - faceta: marcas ==='
SELECT m.nome AS marca, count(*) AS produtos
FROM produtos p
JOIN marcas m ON m.id = p.marca_id
WHERE p.categoria = 'roupa'
GROUP BY m.nome
ORDER BY produtos DESC, marca;

\echo '=== C4 - faceta: faixas de preco ==='
SELECT CASE WHEN p.preco < 100 THEN 'ate 100'
            WHEN p.preco < 300 THEN '100 a 300'
            ELSE 'acima de 300' END AS faixa,
       count(*) AS produtos
FROM produtos p
WHERE p.categoria = 'roupa'
GROUP BY faixa
ORDER BY min(p.preco);

\echo '=== C4 - faceta: tamanhos ==='
SELECT t.tamanho, count(*) AS produtos
FROM roupa_tamanho t
JOIN produtos p ON p.id = t.produto_id
WHERE p.categoria = 'roupa'
GROUP BY t.tamanho
ORDER BY produtos DESC, t.tamanho;

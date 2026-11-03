-- =====================================================================
-- Mesmo estudo de caso (busca de produtos) modelado no PostgreSQL
-- =====================================================================

-- Extensoes para busca "aproximada" no relacional:
--   pg_trgm  -> similaridade por trigramas (tolerancia a erro de digitacao)
--   unaccent -> remover acentos
CREATE EXTENSION IF NOT EXISTS pg_trgm;
CREATE EXTENSION IF NOT EXISTS unaccent;

CREATE TABLE marcas (
    id   SERIAL PRIMARY KEY,
    nome VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE produtos (
    id          SERIAL PRIMARY KEY,
    sku         VARCHAR(20)   NOT NULL UNIQUE,
    nome        VARCHAR(150)  NOT NULL,
    descricao   TEXT,
    categoria   VARCHAR(10)   NOT NULL CHECK (categoria IN ('celular', 'roupa', 'livro')),
    marca_id    INT           NOT NULL REFERENCES marcas(id),
    preco       NUMERIC(10,2) NOT NULL CHECK (preco >= 0),
    estoque     INT           NOT NULL DEFAULT 0 CHECK (estoque >= 0),
    vendas      INT           NOT NULL DEFAULT 0,
    criado_em   DATE          NOT NULL DEFAULT CURRENT_DATE
);

-- Atributos especificos de cada categoria: uma tabela por categoria (especializacao 1:1)
CREATE TABLE produto_celular (
    produto_id       INT PRIMARY KEY REFERENCES produtos(id) ON DELETE CASCADE,
    armazenamento_gb INT,
    ram_gb           INT,
    tela_polegadas   NUMERIC(3,1),
    cor              VARCHAR(40),
    cinco_g          BOOLEAN,
    sistema          VARCHAR(40)
);

CREATE TABLE produto_roupa (
    produto_id INT PRIMARY KEY REFERENCES produtos(id) ON DELETE CASCADE,
    material   VARCHAR(80),
    genero     VARCHAR(20)
);

-- Listas viram tabelas (1:N)
CREATE TABLE roupa_tamanho (
    produto_id INT REFERENCES produto_roupa(produto_id) ON DELETE CASCADE,
    tamanho    VARCHAR(10),
    PRIMARY KEY (produto_id, tamanho)
);

CREATE TABLE roupa_cor (
    produto_id INT REFERENCES produto_roupa(produto_id) ON DELETE CASCADE,
    cor        VARCHAR(40),
    PRIMARY KEY (produto_id, cor)
);

CREATE TABLE produto_livro (
    produto_id     INT PRIMARY KEY REFERENCES produtos(id) ON DELETE CASCADE,
    autor          VARCHAR(120),
    isbn           VARCHAR(13),
    paginas        INT,
    editora        VARCHAR(80),
    idioma         VARCHAR(20),
    ano_publicacao INT,
    formato        VARCHAR(20)
);

CREATE TABLE tags (
    id   SERIAL PRIMARY KEY,
    nome VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE produto_tag (
    produto_id INT REFERENCES produtos(id) ON DELETE CASCADE,
    tag_id     INT REFERENCES tags(id),
    PRIMARY KEY (produto_id, tag_id)
);

CREATE TABLE clientes (
    id     SERIAL PRIMARY KEY,
    nome   VARCHAR(100) NOT NULL,
    cidade VARCHAR(60)
);

CREATE TABLE avaliacoes (
    id         SERIAL PRIMARY KEY,
    produto_id INT NOT NULL REFERENCES produtos(id) ON DELETE CASCADE,
    cliente_id INT NOT NULL REFERENCES clientes(id),
    nota       SMALLINT NOT NULL CHECK (nota BETWEEN 1 AND 5),
    comentario TEXT,
    data       DATE NOT NULL
);

-- Indices para as consultas de busca
CREATE INDEX idx_produtos_categoria_preco ON produtos (categoria, preco);
CREATE INDEX idx_produtos_nome_trgm       ON produtos USING gin (lower(nome) gin_trgm_ops);
CREATE INDEX idx_produtos_fts             ON produtos USING gin (to_tsvector('portuguese', nome || ' ' || coalesce(descricao, '')));
CREATE INDEX idx_avaliacoes_produto       ON avaliacoes (produto_id);

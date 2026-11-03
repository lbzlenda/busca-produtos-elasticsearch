-- Gerado por scripts/gera_sql.py a partir de dados/produtos.json
BEGIN;

INSERT INTO marcas (nome) VALUES ('Addison-Wesley'), ('Agir'), ('Alta Books'), ('Apple'), ('Aramis'), ('Atica'), ('Companhia das Letras'), ('Farm'), ('Google'), ('Hering'), ('Levi''s'), ('Live!'), ('Malwee'), ('Motorola'), ('New Era'), ('Nike'), ('Novatec'), ('Penguin-Companhia'), ('Realme'), ('Renner'), ('Reserva'), ('Rocco'), ('Samsung'), ('The North Face'), ('Todavia'), ('Xiaomi');
INSERT INTO tags (nome) VALUES ('5g'), ('academia'), ('acessorio'), ('algodao'), ('algoritmos'), ('android'), ('banco de dados'), ('basico'), ('calcado'), ('casual'), ('classico'), ('computacao'), ('corrida'), ('custo-beneficio'), ('digital'), ('distopia'), ('dobravel'), ('dormir'), ('entrada'), ('esportivo'), ('estampado'), ('fantasia'), ('ficcao'), ('gamer'), ('historia'), ('importado'), ('infantil'), ('infantojuvenil'), ('ingles'), ('inverno'), ('ios'), ('jeans'), ('lancamento'), ('literatura brasileira'), ('nao-ficcao'), ('premiado'), ('premium'), ('programacao'), ('social'), ('tecnico'), ('trabalho'), ('trilha'), ('verao');
INSERT INTO clientes (nome, cidade) VALUES
  ('Mariana Costa', 'Palmas'),
  ('Joao Pedro Lima', 'Goiania'),
  ('Fernanda Alves', 'Brasilia'),
  ('Carlos Souza', 'Araguaina'),
  ('Patricia Rocha', 'Palmas'),
  ('Lucas Martins', 'Gurupi'),
  ('Aline Ferreira', 'Sao Paulo'),
  ('Beatriz Nunes', 'Rio de Janeiro'),
  ('Rafael Oliveira', 'Palmas'),
  ('Juliana Ribeiro', 'Belo Horizonte'),
  ('Gustavo Henrique', 'Brasilia'),
  ('Camila Duarte', 'Palmas'),
  ('Thiago Barros', 'Porto Nacional'),
  ('Larissa Mendes', 'Palmas'),
  ('Diego Carvalho', 'Goiania'),
  ('Renata Gomes', 'Araguaina'),
  ('Bruno Teixeira', 'Palmas'),
  ('Vanessa Pinto', 'Palmas'),
  ('Marcelo Araujo', 'Imperatriz'),
  ('Isabela Moura', 'Gurupi'),
  ('Felipe Cardoso', 'Palmas'),
  ('Amanda Lopes', 'Brasilia'),
  ('Rodrigo Freitas', 'Goiania'),
  ('Sandra Melo', 'Paraiso do Tocantins'),
  ('Paulo Vieira', 'Palmas'),
  ('Eduardo Santos', 'Sao Paulo'),
  ('Leticia Campos', 'Palmas'),
  ('Henrique Dias', 'Brasilia'),
  ('Ana Clara Reis', 'Palmas'),
  ('Marcos Paulo', 'Gurupi'),
  ('Tatiane Lima', 'Araguaina'),
  ('Vinicius Prado', 'Palmas'),
  ('Fabio Moreira', 'Goiania'),
  ('Gabriela Fontes', 'Rio de Janeiro'),
  ('Priscila Torres', 'Palmas'),
  ('Livia Marques', 'Brasilia'),
  ('Otavio Nascimento', 'Curitiba'),
  ('Bianca Castro', 'Palmas'),
  ('Andre Luiz', 'Palmas'),
  ('Carolina Brito', 'Goiania'),
  ('Ricardo Neves', 'Brasilia'),
  ('Elaine Rocha', 'Porto Nacional'),
  ('Leandro Siqueira', 'Palmas'),
  ('Natalia Barbosa', 'Palmas'),
  ('Simone Farias', 'Araguaina'),
  ('Kelly Andrade', 'Gurupi'),
  ('Mauricio Pires', 'Florianopolis'),
  ('Igor Batista', 'Palmas'),
  ('Danilo Ramos', 'Goiania'),
  ('Caio Medeiros', 'Palmas'),
  ('Roberta Sales', 'Palmas'),
  ('Cristiane Lopes', 'Brasilia'),
  ('Helena Prado', 'Palmas'),
  ('Samuel Costa', 'Araguaina'),
  ('Otavio Ramos', 'Belo Horizonte'),
  ('Juliana Vaz', 'Palmas'),
  ('Leonardo Bezerra', 'Palmas'),
  ('Gabriel Anjo', 'Palmas'),
  ('Artur Sousa', 'Palmas'),
  ('Pedro Henrique', 'Brasilia'),
  ('Mateus Silva', 'Palmas'),
  ('Yasmin Cruz', 'Goiania'),
  ('Claudio Reis', 'Palmas'),
  ('Monica Duarte', 'Sao Paulo'),
  ('Fabiana Rocha', 'Gurupi'),
  ('Lara Gomes', 'Palmas'),
  ('Rogerio Alves', 'Araguaina'),
  ('Debora Lima', 'Palmas'),
  ('Gilberto Nunes', 'Brasilia'),
  ('Marta Silveira', 'Salvador'),
  ('Joana Freire', 'Palmas'),
  ('Vitor Hugo', 'Palmas'),
  ('Rebeca Antunes', 'Goiania'),
  ('Sofia Martins', 'Palmas'),
  ('Enzo Ribeiro', 'Porto Nacional'),
  ('Alice Carvalho', 'Brasilia'),
  ('Luana Teixeira', 'Palmas');

-- CEL-001 - Samsung Galaxy S24 128GB
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('CEL-001', 'Samsung Galaxy S24 128GB', 'Smartphone Samsung com 128 GB de armazenamento, 8 GB de memória RAM e tela de 6,2 polegadas. Conectividade 5G. Sistema Android 14, cor Preto.', 'celular', (SELECT id FROM marcas WHERE nome = 'Samsung'), 3999.0, 25, 201, '2026-04-01');
INSERT INTO produto_celular VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-001'), 128, 8, 6.2, 'Preto', TRUE, 'Android 14');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-001'), (SELECT id FROM tags WHERE nome = 'android'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-001'), (SELECT id FROM tags WHERE nome = '5g'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-001'), (SELECT id FROM tags WHERE nome = 'lancamento'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-001'), (SELECT id FROM clientes WHERE nome = 'Mariana Costa' AND cidade = 'Palmas'), 5, 'Camera excelente e muito rapido.', '2026-08-14');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-001'), (SELECT id FROM clientes WHERE nome = 'Joao Pedro Lima' AND cidade = 'Goiania'), 4, 'Bateria poderia durar mais.', '2026-09-02');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-001'), (SELECT id FROM clientes WHERE nome = 'Fernanda Alves' AND cidade = 'Brasilia'), 5, 'Melhor celular que ja tive.', '2026-09-20');

-- CEL-002 - Samsung Galaxy A55 256GB
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('CEL-002', 'Samsung Galaxy A55 256GB', 'Smartphone Samsung com 256 GB de armazenamento, 8 GB de memória RAM e tela de 6,6 polegadas. Conectividade 5G. Sistema Android 14, cor Azul.', 'celular', (SELECT id FROM marcas WHERE nome = 'Samsung'), 2199.0, 40, 263, '2026-04-02');
INSERT INTO produto_celular VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-002'), 256, 8, 6.6, 'Azul', TRUE, 'Android 14');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-002'), (SELECT id FROM tags WHERE nome = 'android'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-002'), (SELECT id FROM tags WHERE nome = '5g'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-002'), (SELECT id FROM tags WHERE nome = 'custo-beneficio'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-002'), (SELECT id FROM clientes WHERE nome = 'Carlos Souza' AND cidade = 'Araguaina'), 5, 'Otimo custo-beneficio.', '2026-07-10');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-002'), (SELECT id FROM clientes WHERE nome = 'Patricia Rocha' AND cidade = 'Palmas'), 4, 'Tela muito boa, camera ok.', '2026-08-01');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-002'), (SELECT id FROM clientes WHERE nome = 'Lucas Martins' AND cidade = 'Gurupi'), 3, 'Esquenta jogando.', '2026-08-22');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-002'), (SELECT id FROM clientes WHERE nome = 'Aline Ferreira' AND cidade = 'Sao Paulo'), 5, 'Chegou antes do prazo.', '2026-09-15');

-- CEL-003 - Apple iPhone 15 128GB
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('CEL-003', 'Apple iPhone 15 128GB', 'Smartphone Apple com 128 GB de armazenamento, 6 GB de memória RAM e tela de 6,1 polegadas. Conectividade 5G. Sistema iOS 17, cor Rosa.', 'celular', (SELECT id FROM marcas WHERE nome = 'Apple'), 5299.0, 15, 157, '2026-04-03');
INSERT INTO produto_celular VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-003'), 128, 6, 6.1, 'Rosa', TRUE, 'iOS 17');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-003'), (SELECT id FROM tags WHERE nome = 'ios'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-003'), (SELECT id FROM tags WHERE nome = '5g'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-003'), (SELECT id FROM tags WHERE nome = 'premium'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-003'), (SELECT id FROM clientes WHERE nome = 'Beatriz Nunes' AND cidade = 'Rio de Janeiro'), 5, 'Fotos incriveis.', '2026-06-30');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-003'), (SELECT id FROM clientes WHERE nome = 'Rafael Oliveira' AND cidade = 'Palmas'), 2, 'Muito caro pelo que entrega.', '2026-07-18');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-003'), (SELECT id FROM clientes WHERE nome = 'Juliana Ribeiro' AND cidade = 'Belo Horizonte'), 4, 'Bom, mas o carregador e vendido a parte.', '2026-08-09');

-- CEL-004 - Apple iPhone 15 Pro 256GB
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('CEL-004', 'Apple iPhone 15 Pro 256GB', 'Smartphone Apple com 256 GB de armazenamento, 8 GB de memória RAM e tela de 6,1 polegadas. Conectividade 5G. Sistema iOS 17, cor Titanio Natural.', 'celular', (SELECT id FROM marcas WHERE nome = 'Apple'), 7999.0, 8, 148, '2026-04-04');
INSERT INTO produto_celular VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-004'), 256, 8, 6.1, 'Titanio Natural', TRUE, 'iOS 17');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-004'), (SELECT id FROM tags WHERE nome = 'ios'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-004'), (SELECT id FROM tags WHERE nome = '5g'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-004'), (SELECT id FROM tags WHERE nome = 'premium'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-004'), (SELECT id FROM clientes WHERE nome = 'Gustavo Henrique' AND cidade = 'Brasilia'), 5, 'Acabamento em titanio muito bonito.', '2026-09-05');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-004'), (SELECT id FROM clientes WHERE nome = 'Camila Duarte' AND cidade = 'Palmas'), 5, 'Desempenho absurdo.', '2026-09-28');

-- CEL-005 - Motorola Edge 50 Fusion 256GB
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('CEL-005', 'Motorola Edge 50 Fusion 256GB', 'Smartphone Motorola com 256 GB de armazenamento, 8 GB de memória RAM e tela de 6,7 polegadas. Conectividade 5G. Sistema Android 14, cor Verde.', 'celular', (SELECT id FROM marcas WHERE nome = 'Motorola'), 1899.0, 30, 162, '2026-04-05');
INSERT INTO produto_celular VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-005'), 256, 8, 6.7, 'Verde', TRUE, 'Android 14');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-005'), (SELECT id FROM tags WHERE nome = 'android'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-005'), (SELECT id FROM tags WHERE nome = '5g'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-005'), (SELECT id FROM tags WHERE nome = 'custo-beneficio'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-005'), (SELECT id FROM clientes WHERE nome = 'Thiago Barros' AND cidade = 'Porto Nacional'), 4, 'Tela curva linda.', '2026-08-11');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-005'), (SELECT id FROM clientes WHERE nome = 'Larissa Mendes' AND cidade = 'Palmas'), 5, 'Carrega muito rapido.', '2026-08-30');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-005'), (SELECT id FROM clientes WHERE nome = 'Diego Carvalho' AND cidade = 'Goiania'), 4, 'Bom pelo preco.', '2026-10-03');

-- CEL-006 - Motorola Moto G54 128GB
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('CEL-006', 'Motorola Moto G54 128GB', 'Smartphone Motorola com 128 GB de armazenamento, 4 GB de memória RAM e tela de 6,5 polegadas. Conectividade 5G. Sistema Android 13, cor Azul.', 'celular', (SELECT id FROM marcas WHERE nome = 'Motorola'), 1099.0, 60, 121, '2026-04-06');
INSERT INTO produto_celular VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-006'), 128, 4, 6.5, 'Azul', TRUE, 'Android 13');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-006'), (SELECT id FROM tags WHERE nome = 'android'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-006'), (SELECT id FROM tags WHERE nome = '5g'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-006'), (SELECT id FROM tags WHERE nome = 'entrada'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-006'), (SELECT id FROM clientes WHERE nome = 'Renata Gomes' AND cidade = 'Araguaina'), 3, 'Um pouco lento com muitos apps.', '2026-07-25');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-006'), (SELECT id FROM clientes WHERE nome = 'Bruno Teixeira' AND cidade = 'Palmas'), 4, 'Bateria dura o dia todo.', '2026-08-19');

-- CEL-007 - Xiaomi Redmi Note 13 256GB
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('CEL-007', 'Xiaomi Redmi Note 13 256GB', 'Smartphone Xiaomi com 256 GB de armazenamento, 8 GB de memória RAM e tela de 6,67 polegadas. Conectividade 4G. Sistema Android 13, cor Preto.', 'celular', (SELECT id FROM marcas WHERE nome = 'Xiaomi'), 1499.0, 45, 167, '2026-04-07');
INSERT INTO produto_celular VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-007'), 256, 8, 6.67, 'Preto', FALSE, 'Android 13');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-007'), (SELECT id FROM tags WHERE nome = 'android'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-007'), (SELECT id FROM tags WHERE nome = 'custo-beneficio'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-007'), (SELECT id FROM clientes WHERE nome = 'Vanessa Pinto' AND cidade = 'Palmas'), 5, 'Muito celular pelo preco.', '2026-06-12');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-007'), (SELECT id FROM clientes WHERE nome = 'Marcelo Araujo' AND cidade = 'Imperatriz'), 2, 'Veio com propaganda no sistema.', '2026-07-01');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-007'), (SELECT id FROM clientes WHERE nome = 'Isabela Moura' AND cidade = 'Gurupi'), 4, 'Camera boa de dia.', '2026-07-29');

-- CEL-008 - Xiaomi Poco X6 Pro 512GB
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('CEL-008', 'Xiaomi Poco X6 Pro 512GB', 'Smartphone Xiaomi com 512 GB de armazenamento, 12 GB de memória RAM e tela de 6,67 polegadas. Conectividade 5G. Sistema Android 14, cor Amarelo.', 'celular', (SELECT id FROM marcas WHERE nome = 'Xiaomi'), 2399.0, 20, 170, '2026-04-08');
INSERT INTO produto_celular VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-008'), 512, 12, 6.67, 'Amarelo', TRUE, 'Android 14');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-008'), (SELECT id FROM tags WHERE nome = 'android'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-008'), (SELECT id FROM tags WHERE nome = '5g'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-008'), (SELECT id FROM tags WHERE nome = 'gamer'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-008'), (SELECT id FROM clientes WHERE nome = 'Felipe Cardoso' AND cidade = 'Palmas'), 5, 'Roda tudo no maximo.', '2026-09-09');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-008'), (SELECT id FROM clientes WHERE nome = 'Amanda Lopes' AND cidade = 'Brasilia'), 4, 'Esquenta um pouco, mas e rapido.', '2026-09-27');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-008'), (SELECT id FROM clientes WHERE nome = 'Rodrigo Freitas' AND cidade = 'Goiania'), 5, 'Perfeito para jogos.', '2026-10-12');

-- CEL-009 - Samsung Galaxy A15 128GB
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('CEL-009', 'Samsung Galaxy A15 128GB', 'Smartphone Samsung com 128 GB de armazenamento, 4 GB de memória RAM e tela de 6,5 polegadas. Conectividade 4G. Sistema Android 14, cor Azul Claro.', 'celular', (SELECT id FROM marcas WHERE nome = 'Samsung'), 899.0, 80, 174, '2026-04-09');
INSERT INTO produto_celular VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-009'), 128, 4, 6.5, 'Azul Claro', FALSE, 'Android 14');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-009'), (SELECT id FROM tags WHERE nome = 'android'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-009'), (SELECT id FROM tags WHERE nome = 'entrada'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-009'), (SELECT id FROM clientes WHERE nome = 'Sandra Melo' AND cidade = 'Paraiso do Tocantins'), 4, 'Simples e funciona bem.', '2026-05-20');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-009'), (SELECT id FROM clientes WHERE nome = 'Paulo Vieira' AND cidade = 'Palmas'), 1, 'Parou de carregar em 2 semanas.', '2026-06-15');

-- CEL-010 - Google Pixel 8 128GB
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('CEL-010', 'Google Pixel 8 128GB', 'Smartphone Google com 128 GB de armazenamento, 8 GB de memória RAM e tela de 6,2 polegadas. Conectividade 5G. Sistema Android 14, cor Branco.', 'celular', (SELECT id FROM marcas WHERE nome = 'Google'), 4299.0, 6, 84, '2026-04-10');
INSERT INTO produto_celular VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-010'), 128, 8, 6.2, 'Branco', TRUE, 'Android 14');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-010'), (SELECT id FROM tags WHERE nome = 'android'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-010'), (SELECT id FROM tags WHERE nome = '5g'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-010'), (SELECT id FROM tags WHERE nome = 'importado'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-010'), (SELECT id FROM clientes WHERE nome = 'Eduardo Santos' AND cidade = 'Sao Paulo'), 5, 'Android puro e camera top.', '2026-08-03');

-- CEL-011 - Realme 12 Pro+ 256GB
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('CEL-011', 'Realme 12 Pro+ 256GB', 'Smartphone Realme com 256 GB de armazenamento, 12 GB de memória RAM e tela de 6,7 polegadas. Conectividade 5G. Sistema Android 14, cor Azul.', 'celular', (SELECT id FROM marcas WHERE nome = 'Realme'), 2599.0, 12, 98, '2026-04-11');
INSERT INTO produto_celular VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-011'), 256, 12, 6.7, 'Azul', TRUE, 'Android 14');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-011'), (SELECT id FROM tags WHERE nome = 'android'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-011'), (SELECT id FROM tags WHERE nome = '5g'));

-- CEL-012 - Motorola Razr 40 Ultra 256GB
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('CEL-012', 'Motorola Razr 40 Ultra 256GB', 'Smartphone Motorola com 256 GB de armazenamento, 8 GB de memória RAM e tela de 6,9 polegadas. Conectividade 5G. Sistema Android 13, cor Magenta.', 'celular', (SELECT id FROM marcas WHERE nome = 'Motorola'), 4499.0, 5, 144, '2026-04-12');
INSERT INTO produto_celular VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-012'), 256, 8, 6.9, 'Magenta', TRUE, 'Android 13');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-012'), (SELECT id FROM tags WHERE nome = 'android'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-012'), (SELECT id FROM tags WHERE nome = '5g'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-012'), (SELECT id FROM tags WHERE nome = 'dobravel'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-012'), (SELECT id FROM clientes WHERE nome = 'Leticia Campos' AND cidade = 'Palmas'), 5, 'Chama atencao onde eu chego.', '2026-09-14');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'CEL-012'), (SELECT id FROM clientes WHERE nome = 'Henrique Dias' AND cidade = 'Brasilia'), 3, 'Dobradica marca a tela.', '2026-10-06');

-- ROU-001 - Camiseta Básica Algodão Preta
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('ROU-001', 'Camiseta Básica Algodão Preta', 'Camiseta Básica Algodão Preta da marca Hering, feito em 100% algodão. Tamanhos disponíveis: P, M, G, GG. Cores: Preto. Modelo unissex.', 'roupa', (SELECT id FROM marcas WHERE nome = 'Hering'), 49.9, 200, 176, '2026-04-13');
INSERT INTO produto_roupa VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-001'), '100% algodão', 'unissex');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-001'), 'P');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-001'), 'M');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-001'), 'G');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-001'), 'GG');
INSERT INTO roupa_cor VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-001'), 'Preto');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-001'), (SELECT id FROM tags WHERE nome = 'basico'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-001'), (SELECT id FROM tags WHERE nome = 'algodao'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-001'), (SELECT id FROM clientes WHERE nome = 'Ana Clara Reis' AND cidade = 'Palmas'), 5, 'Tecido grosso, nao ficou transparente.', '2026-07-07');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-001'), (SELECT id FROM clientes WHERE nome = 'Marcos Paulo' AND cidade = 'Gurupi'), 4, 'Encolheu um pouco na lavagem.', '2026-08-12');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-001'), (SELECT id FROM clientes WHERE nome = 'Tatiane Lima' AND cidade = 'Araguaina'), 5, 'Comprei 3 iguais.', '2026-09-01');

-- ROU-002 - Calça Jeans Slim Masculina
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('ROU-002', 'Calça Jeans Slim Masculina', 'Calça Jeans Slim Masculina da marca Levi''s, feito em 98% algodão, 2% elastano. Tamanhos disponíveis: 38, 40, 42, 44, 46. Cores: Azul Escuro, Preto. Modelo masculino.', 'roupa', (SELECT id FROM marcas WHERE nome = 'Levi''s'), 299.9, 70, 111, '2026-04-14');
INSERT INTO produto_roupa VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-002'), '98% algodão, 2% elastano', 'masculino');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-002'), '38');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-002'), '40');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-002'), '42');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-002'), '44');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-002'), '46');
INSERT INTO roupa_cor VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-002'), 'Azul Escuro');
INSERT INTO roupa_cor VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-002'), 'Preto');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-002'), (SELECT id FROM tags WHERE nome = 'jeans'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-002'), (SELECT id FROM clientes WHERE nome = 'Vinicius Prado' AND cidade = 'Palmas'), 4, 'Caimento otimo.', '2026-06-21');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-002'), (SELECT id FROM clientes WHERE nome = 'Fabio Moreira' AND cidade = 'Goiania'), 2, 'Tamanho veio menor que o normal.', '2026-07-15');

-- ROU-003 - Vestido Midi Floral
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('ROU-003', 'Vestido Midi Floral', 'Vestido Midi Floral da marca Farm, feito em viscose. Tamanhos disponíveis: PP, P, M, G. Cores: Floral Verde. Modelo feminino.', 'roupa', (SELECT id FROM marcas WHERE nome = 'Farm'), 389.0, 30, 147, '2026-04-15');
INSERT INTO produto_roupa VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-003'), 'viscose', 'feminino');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-003'), 'PP');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-003'), 'P');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-003'), 'M');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-003'), 'G');
INSERT INTO roupa_cor VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-003'), 'Floral Verde');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-003'), (SELECT id FROM tags WHERE nome = 'verao'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-003'), (SELECT id FROM tags WHERE nome = 'estampado'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-003'), (SELECT id FROM clientes WHERE nome = 'Gabriela Fontes' AND cidade = 'Rio de Janeiro'), 5, 'Lindo e fresquinho.', '2026-09-03');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-003'), (SELECT id FROM clientes WHERE nome = 'Priscila Torres' AND cidade = 'Palmas'), 5, 'Recebi muitos elogios.', '2026-09-22');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-003'), (SELECT id FROM clientes WHERE nome = 'Livia Marques' AND cidade = 'Brasilia'), 4, 'Amassa facil.', '2026-10-10');

-- ROU-004 - Moletom Canguru Cinza
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('ROU-004', 'Moletom Canguru Cinza', 'Moletom Canguru Cinza da marca Nike, feito em algodão e poliéster. Tamanhos disponíveis: P, M, G, GG. Cores: Cinza Mescla, Preto. Modelo unissex.', 'roupa', (SELECT id FROM marcas WHERE nome = 'Nike'), 349.9, 45, 127, '2026-04-16');
INSERT INTO produto_roupa VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-004'), 'algodão e poliéster', 'unissex');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-004'), 'P');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-004'), 'M');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-004'), 'G');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-004'), 'GG');
INSERT INTO roupa_cor VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-004'), 'Cinza Mescla');
INSERT INTO roupa_cor VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-004'), 'Preto');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-004'), (SELECT id FROM tags WHERE nome = 'inverno'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-004'), (SELECT id FROM tags WHERE nome = 'esportivo'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-004'), (SELECT id FROM clientes WHERE nome = 'Otavio Nascimento' AND cidade = 'Curitiba'), 5, 'Muito quente.', '2026-06-05');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-004'), (SELECT id FROM clientes WHERE nome = 'Bianca Castro' AND cidade = 'Palmas'), 4, 'Bonito, mas o capuz e pequeno.', '2026-07-20');

-- ROU-005 - Tênis de Corrida Pegasus 41
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('ROU-005', 'Tênis de Corrida Pegasus 41', 'Tênis de Corrida Pegasus 41 da marca Nike, feito em mesh. Tamanhos disponíveis: 37, 38, 39, 40, 41, 42, 43. Cores: Branco, Preto. Modelo unissex.', 'roupa', (SELECT id FROM marcas WHERE nome = 'Nike'), 799.9, 35, 220, '2026-04-17');
INSERT INTO produto_roupa VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-005'), 'mesh', 'unissex');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-005'), '37');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-005'), '38');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-005'), '39');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-005'), '40');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-005'), '41');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-005'), '42');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-005'), '43');
INSERT INTO roupa_cor VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-005'), 'Branco');
INSERT INTO roupa_cor VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-005'), 'Preto');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-005'), (SELECT id FROM tags WHERE nome = 'esportivo'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-005'), (SELECT id FROM tags WHERE nome = 'calcado'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-005'), (SELECT id FROM tags WHERE nome = 'corrida'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-005'), (SELECT id FROM clientes WHERE nome = 'Andre Luiz' AND cidade = 'Palmas'), 5, 'Amortecimento excelente para correr na orla.', '2026-08-16');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-005'), (SELECT id FROM clientes WHERE nome = 'Carolina Brito' AND cidade = 'Goiania'), 5, 'Leve e confortavel.', '2026-09-07');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-005'), (SELECT id FROM clientes WHERE nome = 'Ricardo Neves' AND cidade = 'Brasilia'), 4, 'Forma um pouco pequena.', '2026-09-30');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-005'), (SELECT id FROM clientes WHERE nome = 'Elaine Rocha' AND cidade = 'Porto Nacional'), 5, 'Ja corri 200 km com ele.', '2026-10-15');

-- ROU-006 - Camisa Social Slim Branca
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('ROU-006', 'Camisa Social Slim Branca', 'Camisa Social Slim Branca da marca Aramis, feito em algodão egípcio. Tamanhos disponíveis: 1, 2, 3, 4. Cores: Branco. Modelo masculino.', 'roupa', (SELECT id FROM marcas WHERE nome = 'Aramis'), 259.0, 50, 118, '2026-04-18');
INSERT INTO produto_roupa VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-006'), 'algodão egípcio', 'masculino');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-006'), '1');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-006'), '2');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-006'), '3');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-006'), '4');
INSERT INTO roupa_cor VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-006'), 'Branco');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-006'), (SELECT id FROM tags WHERE nome = 'social'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-006'), (SELECT id FROM tags WHERE nome = 'trabalho'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-006'), (SELECT id FROM clientes WHERE nome = 'Leandro Siqueira' AND cidade = 'Palmas'), 4, 'Nao precisa passar muito.', '2026-07-11');

-- ROU-007 - Legging Fitness Cintura Alta
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('ROU-007', 'Legging Fitness Cintura Alta', 'Legging Fitness Cintura Alta da marca Live!, feito em poliamida e elastano. Tamanhos disponíveis: P, M, G. Cores: Preto, Vinho, Verde Militar. Modelo feminino.', 'roupa', (SELECT id FROM marcas WHERE nome = 'Live!'), 189.9, 90, 173, '2026-04-19');
INSERT INTO produto_roupa VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-007'), 'poliamida e elastano', 'feminino');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-007'), 'P');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-007'), 'M');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-007'), 'G');
INSERT INTO roupa_cor VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-007'), 'Preto');
INSERT INTO roupa_cor VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-007'), 'Vinho');
INSERT INTO roupa_cor VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-007'), 'Verde Militar');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-007'), (SELECT id FROM tags WHERE nome = 'esportivo'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-007'), (SELECT id FROM tags WHERE nome = 'academia'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-007'), (SELECT id FROM clientes WHERE nome = 'Natalia Barbosa' AND cidade = 'Palmas'), 5, 'Nao fica transparente no agachamento.', '2026-08-25');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-007'), (SELECT id FROM clientes WHERE nome = 'Simone Farias' AND cidade = 'Araguaina'), 4, 'Veste bem.', '2026-09-18');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-007'), (SELECT id FROM clientes WHERE nome = 'Kelly Andrade' AND cidade = 'Gurupi'), 1, 'Costura abriu na primeira semana.', '2026-10-02');

-- ROU-008 - Jaqueta Corta-Vento Impermeável
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('ROU-008', 'Jaqueta Corta-Vento Impermeável', 'Jaqueta Corta-Vento Impermeável da marca The North Face, feito em nylon. Tamanhos disponíveis: P, M, G, GG. Cores: Azul Marinho, Vermelho. Modelo unissex.', 'roupa', (SELECT id FROM marcas WHERE nome = 'The North Face'), 699.0, 18, 85, '2026-04-20');
INSERT INTO produto_roupa VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-008'), 'nylon', 'unissex');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-008'), 'P');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-008'), 'M');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-008'), 'G');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-008'), 'GG');
INSERT INTO roupa_cor VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-008'), 'Azul Marinho');
INSERT INTO roupa_cor VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-008'), 'Vermelho');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-008'), (SELECT id FROM tags WHERE nome = 'inverno'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-008'), (SELECT id FROM tags WHERE nome = 'trilha'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-008'), (SELECT id FROM clientes WHERE nome = 'Mauricio Pires' AND cidade = 'Florianopolis'), 5, 'Segurou chuva forte na trilha.', '2026-06-28');

-- ROU-009 - Bermuda Sarja Bege
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('ROU-009', 'Bermuda Sarja Bege', 'Bermuda Sarja Bege da marca Reserva, feito em sarja de algodão. Tamanhos disponíveis: 38, 40, 42, 44. Cores: Bege, Caqui. Modelo masculino.', 'roupa', (SELECT id FROM marcas WHERE nome = 'Reserva'), 219.0, 55, 204, '2026-04-21');
INSERT INTO produto_roupa VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-009'), 'sarja de algodão', 'masculino');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-009'), '38');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-009'), '40');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-009'), '42');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-009'), '44');
INSERT INTO roupa_cor VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-009'), 'Bege');
INSERT INTO roupa_cor VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-009'), 'Caqui');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-009'), (SELECT id FROM tags WHERE nome = 'verao'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-009'), (SELECT id FROM tags WHERE nome = 'casual'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-009'), (SELECT id FROM clientes WHERE nome = 'Igor Batista' AND cidade = 'Palmas'), 4, 'Boa para o calor de Palmas.', '2026-09-11');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-009'), (SELECT id FROM clientes WHERE nome = 'Danilo Ramos' AND cidade = 'Goiania'), 3, 'Tecido fino.', '2026-10-01');

-- ROU-010 - Blusa de Tricô Gola Alta
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('ROU-010', 'Blusa de Tricô Gola Alta', 'Blusa de Tricô Gola Alta da marca Renner, feito em acrílico. Tamanhos disponíveis: P, M, G. Cores: Off White, Caramelo. Modelo feminino.', 'roupa', (SELECT id FROM marcas WHERE nome = 'Renner'), 129.9, 0, 12, '2026-04-22');
INSERT INTO produto_roupa VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-010'), 'acrílico', 'feminino');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-010'), 'P');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-010'), 'M');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-010'), 'G');
INSERT INTO roupa_cor VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-010'), 'Off White');
INSERT INTO roupa_cor VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-010'), 'Caramelo');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-010'), (SELECT id FROM tags WHERE nome = 'inverno'));

-- ROU-011 - Boné Aba Curva
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('ROU-011', 'Boné Aba Curva', 'Boné Aba Curva da marca New Era, feito em poliéster. Tamanhos disponíveis: Unico. Cores: Preto, Branco. Modelo unissex.', 'roupa', (SELECT id FROM marcas WHERE nome = 'New Era'), 199.9, 40, 152, '2026-04-23');
INSERT INTO produto_roupa VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-011'), 'poliéster', 'unissex');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-011'), 'Unico');
INSERT INTO roupa_cor VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-011'), 'Preto');
INSERT INTO roupa_cor VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-011'), 'Branco');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-011'), (SELECT id FROM tags WHERE nome = 'acessorio'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-011'), (SELECT id FROM tags WHERE nome = 'casual'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-011'), (SELECT id FROM clientes WHERE nome = 'Caio Medeiros' AND cidade = 'Palmas'), 5, 'Original, veio com etiqueta.', '2026-08-07');

-- ROU-012 - Pijama Infantil Dinossauro
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('ROU-012', 'Pijama Infantil Dinossauro', 'Pijama Infantil Dinossauro da marca Malwee, feito em algodão. Tamanhos disponíveis: 2, 4, 6, 8, 10. Cores: Verde. Modelo infantil.', 'roupa', (SELECT id FROM marcas WHERE nome = 'Malwee'), 89.9, 65, 158, '2026-04-24');
INSERT INTO produto_roupa VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-012'), 'algodão', 'infantil');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-012'), '2');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-012'), '4');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-012'), '6');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-012'), '8');
INSERT INTO roupa_tamanho VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-012'), '10');
INSERT INTO roupa_cor VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-012'), 'Verde');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-012'), (SELECT id FROM tags WHERE nome = 'infantil'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-012'), (SELECT id FROM tags WHERE nome = 'dormir'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-012'), (SELECT id FROM clientes WHERE nome = 'Roberta Sales' AND cidade = 'Palmas'), 5, 'Meu filho nao quer tirar.', '2026-09-24');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'ROU-012'), (SELECT id FROM clientes WHERE nome = 'Cristiane Lopes' AND cidade = 'Brasilia'), 5, 'Brilha mesmo no escuro!', '2026-10-08');

-- LIV-001 - Dom Casmurro
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('LIV-001', 'Dom Casmurro', 'Livro de Machado de Assis, publicado pela editora Penguin-Companhia em 1899, com 256 páginas. Edição em português, formato brochura.', 'livro', (SELECT id FROM marcas WHERE nome = 'Penguin-Companhia'), 34.9, 120, 168, '2026-04-25');
INSERT INTO produto_livro VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-001'), 'Machado de Assis', '9788582850350', 256, 'Penguin-Companhia', 'português', 1899, 'brochura');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-001'), (SELECT id FROM tags WHERE nome = 'classico'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-001'), (SELECT id FROM tags WHERE nome = 'literatura brasileira'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-001'), (SELECT id FROM clientes WHERE nome = 'Helena Prado' AND cidade = 'Palmas'), 5, 'Capitu traiu ou nao? Leitura obrigatoria.', '2026-05-14');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-001'), (SELECT id FROM clientes WHERE nome = 'Samuel Costa' AND cidade = 'Araguaina'), 4, 'Edicao com otimas notas.', '2026-06-02');

-- LIV-002 - Grande Sertão: Veredas
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('LIV-002', 'Grande Sertão: Veredas', 'Livro de João Guimarães Rosa, publicado pela editora Companhia das Letras em 1956, com 560 páginas. Edição em português, formato capa dura.', 'livro', (SELECT id FROM marcas WHERE nome = 'Companhia das Letras'), 89.9, 40, 174, '2026-04-26');
INSERT INTO produto_livro VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-002'), 'João Guimarães Rosa', '9788535932348', 560, 'Companhia das Letras', 'português', 1956, 'capa dura');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-002'), (SELECT id FROM tags WHERE nome = 'classico'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-002'), (SELECT id FROM tags WHERE nome = 'literatura brasileira'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-002'), (SELECT id FROM clientes WHERE nome = 'Otavio Ramos' AND cidade = 'Belo Horizonte'), 5, 'Obra-prima.', '2026-07-03');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-002'), (SELECT id FROM clientes WHERE nome = 'Juliana Vaz' AND cidade = 'Palmas'), 3, 'Linguagem dificil no comeco.', '2026-08-21');

-- LIV-003 - Banco de Dados NoSQL: Uma Introdução
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('LIV-003', 'Banco de Dados NoSQL: Uma Introdução', 'Livro de Pramod J. Sadalage e Martin Fowler, publicado pela editora Novatec em 2013, com 220 páginas. Edição em português, formato brochura.', 'livro', (SELECT id FROM marcas WHERE nome = 'Novatec'), 79.0, 25, 220, '2026-04-27');
INSERT INTO produto_livro VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-003'), 'Pramod J. Sadalage e Martin Fowler', '9788575223383', 220, 'Novatec', 'português', 2013, 'brochura');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-003'), (SELECT id FROM tags WHERE nome = 'tecnico'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-003'), (SELECT id FROM tags WHERE nome = 'computacao'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-003'), (SELECT id FROM tags WHERE nome = 'banco de dados'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-003'), (SELECT id FROM clientes WHERE nome = 'Leonardo Bezerra' AND cidade = 'Palmas'), 5, 'Explica muito bem os tipos de NoSQL.', '2026-10-20');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-003'), (SELECT id FROM clientes WHERE nome = 'Gabriel Anjo' AND cidade = 'Palmas'), 5, 'Ajudou muito na aula 10.', '2026-10-21');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-003'), (SELECT id FROM clientes WHERE nome = 'Artur Sousa' AND cidade = 'Palmas'), 4, 'Curto e direto.', '2026-10-22');

-- LIV-004 - Código Limpo
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('LIV-004', 'Código Limpo', 'Livro de Robert C. Martin, publicado pela editora Alta Books em 2009, com 425 páginas. Edição em português, formato brochura.', 'livro', (SELECT id FROM marcas WHERE nome = 'Alta Books'), 99.9, 33, 163, '2026-04-28');
INSERT INTO produto_livro VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-004'), 'Robert C. Martin', '9788576082675', 425, 'Alta Books', 'português', 2009, 'brochura');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-004'), (SELECT id FROM tags WHERE nome = 'tecnico'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-004'), (SELECT id FROM tags WHERE nome = 'computacao'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-004'), (SELECT id FROM tags WHERE nome = 'programacao'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-004'), (SELECT id FROM clientes WHERE nome = 'Pedro Henrique' AND cidade = 'Brasilia'), 5, 'Todo dev deveria ler.', '2026-06-18');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-004'), (SELECT id FROM clientes WHERE nome = 'Mateus Silva' AND cidade = 'Palmas'), 4, 'Alguns exemplos datados, mas vale.', '2026-07-30');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-004'), (SELECT id FROM clientes WHERE nome = 'Yasmin Cruz' AND cidade = 'Goiania'), 5, 'Mudou meu jeito de programar.', '2026-08-28');

-- LIV-005 - Sapiens: Uma Breve História da Humanidade
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('LIV-005', 'Sapiens: Uma Breve História da Humanidade', 'Livro de Yuval Noah Harari, publicado pela editora Companhia das Letras em 2011, com 472 páginas. Edição em português, formato brochura.', 'livro', (SELECT id FROM marcas WHERE nome = 'Companhia das Letras'), 69.9, 75, 179, '2026-04-29');
INSERT INTO produto_livro VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-005'), 'Yuval Noah Harari', '9788535933925', 472, 'Companhia das Letras', 'português', 2011, 'brochura');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-005'), (SELECT id FROM tags WHERE nome = 'nao-ficcao'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-005'), (SELECT id FROM tags WHERE nome = 'historia'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-005'), (SELECT id FROM clientes WHERE nome = 'Claudio Reis' AND cidade = 'Palmas'), 5, 'Leitura fascinante.', '2026-05-08');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-005'), (SELECT id FROM clientes WHERE nome = 'Monica Duarte' AND cidade = 'Sao Paulo'), 4, 'Algumas partes repetitivas.', '2026-06-11');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-005'), (SELECT id FROM clientes WHERE nome = 'Fabiana Rocha' AND cidade = 'Gurupi'), 5, 'Recomendo demais.', '2026-07-22');

-- LIV-006 - O Pequeno Príncipe
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('LIV-006', 'O Pequeno Príncipe', 'Livro de Antoine de Saint-Exupéry, publicado pela editora Agir em 1943, com 96 páginas. Edição em português, formato brochura.', 'livro', (SELECT id FROM marcas WHERE nome = 'Agir'), 29.9, 150, 121, '2026-04-30');
INSERT INTO produto_livro VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-006'), 'Antoine de Saint-Exupéry', '9788522008731', 96, 'Agir', 'português', 1943, 'brochura');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-006'), (SELECT id FROM tags WHERE nome = 'infantil'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-006'), (SELECT id FROM tags WHERE nome = 'classico'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-006'), (SELECT id FROM clientes WHERE nome = 'Lara Gomes' AND cidade = 'Palmas'), 5, 'Li com minha filha.', '2026-09-06');

-- LIV-007 - 1984
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('LIV-007', '1984', 'Livro de George Orwell, publicado pela editora Companhia das Letras em 1949, com 416 páginas. Edição em português, formato brochura.', 'livro', (SELECT id FROM marcas WHERE nome = 'Companhia das Letras'), 44.9, 90, 184, '2026-05-01');
INSERT INTO produto_livro VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-007'), 'George Orwell', '9788535914849', 416, 'Companhia das Letras', 'português', 1949, 'brochura');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-007'), (SELECT id FROM tags WHERE nome = 'classico'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-007'), (SELECT id FROM tags WHERE nome = 'distopia'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-007'), (SELECT id FROM tags WHERE nome = 'ficcao'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-007'), (SELECT id FROM clientes WHERE nome = 'Rogerio Alves' AND cidade = 'Araguaina'), 5, 'Assustadoramente atual.', '2026-06-25');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-007'), (SELECT id FROM clientes WHERE nome = 'Debora Lima' AND cidade = 'Palmas'), 5, 'Nao consegui parar de ler.', '2026-08-04');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-007'), (SELECT id FROM clientes WHERE nome = 'Gilberto Nunes' AND cidade = 'Brasilia'), 2, 'Final muito pesado para mim.', '2026-09-13');

-- LIV-008 - Torto Arado
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('LIV-008', 'Torto Arado', 'Livro de Itamar Vieira Junior, publicado pela editora Todavia em 2019, com 264 páginas. Edição em português, formato brochura.', 'livro', (SELECT id FROM marcas WHERE nome = 'Todavia'), 59.9, 60, 140, '2026-05-02');
INSERT INTO produto_livro VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-008'), 'Itamar Vieira Junior', '9786580309313', 264, 'Todavia', 'português', 2019, 'brochura');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-008'), (SELECT id FROM tags WHERE nome = 'literatura brasileira'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-008'), (SELECT id FROM tags WHERE nome = 'premiado'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-008'), (SELECT id FROM tags WHERE nome = 'ficcao'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-008'), (SELECT id FROM clientes WHERE nome = 'Marta Silveira' AND cidade = 'Salvador'), 5, 'Livro necessario.', '2026-07-16');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-008'), (SELECT id FROM clientes WHERE nome = 'Joana Freire' AND cidade = 'Palmas'), 5, 'Personagens marcantes.', '2026-08-27');

-- LIV-009 - Entendendo Algoritmos
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('LIV-009', 'Entendendo Algoritmos', 'Livro de Aditya Y. Bhargava, publicado pela editora Novatec em 2017, com 264 páginas. Edição em português, formato brochura.', 'livro', (SELECT id FROM marcas WHERE nome = 'Novatec'), 74.9, 28, 94, '2026-05-03');
INSERT INTO produto_livro VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-009'), 'Aditya Y. Bhargava', '9788575225639', 264, 'Novatec', 'português', 2017, 'brochura');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-009'), (SELECT id FROM tags WHERE nome = 'tecnico'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-009'), (SELECT id FROM tags WHERE nome = 'computacao'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-009'), (SELECT id FROM tags WHERE nome = 'algoritmos'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-009'), (SELECT id FROM clientes WHERE nome = 'Vitor Hugo' AND cidade = 'Palmas'), 5, 'Os desenhos ajudam muito.', '2026-09-19');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-009'), (SELECT id FROM clientes WHERE nome = 'Rebeca Antunes' AND cidade = 'Goiania'), 4, 'Otimo para iniciantes.', '2026-10-05');

-- LIV-010 - The Pragmatic Programmer (Ebook)
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('LIV-010', 'The Pragmatic Programmer (Ebook)', 'Livro de David Thomas e Andrew Hunt, publicado pela editora Addison-Wesley em 2019, com 352 páginas. Edição em inglês, formato ebook.', 'livro', (SELECT id FROM marcas WHERE nome = 'Addison-Wesley'), 159.0, 999, 32, '2026-05-04');
INSERT INTO produto_livro VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-010'), 'David Thomas e Andrew Hunt', '9780135957059', 352, 'Addison-Wesley', 'inglês', 2019, 'ebook');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-010'), (SELECT id FROM tags WHERE nome = 'tecnico'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-010'), (SELECT id FROM tags WHERE nome = 'computacao'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-010'), (SELECT id FROM tags WHERE nome = 'ingles'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-010'), (SELECT id FROM tags WHERE nome = 'digital'));

-- LIV-011 - Harry Potter e a Pedra Filosofal
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('LIV-011', 'Harry Potter e a Pedra Filosofal', 'Livro de J.K. Rowling, publicado pela editora Rocco em 1997, com 208 páginas. Edição em português, formato brochura.', 'livro', (SELECT id FROM marcas WHERE nome = 'Rocco'), 49.9, 110, 221, '2026-05-05');
INSERT INTO produto_livro VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-011'), 'J.K. Rowling', '9788532530783', 208, 'Rocco', 'português', 1997, 'brochura');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-011'), (SELECT id FROM tags WHERE nome = 'fantasia'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-011'), (SELECT id FROM tags WHERE nome = 'infantojuvenil'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-011'), (SELECT id FROM tags WHERE nome = 'ficcao'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-011'), (SELECT id FROM clientes WHERE nome = 'Sofia Martins' AND cidade = 'Palmas'), 5, 'Reli pela quinta vez.', '2026-06-09');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-011'), (SELECT id FROM clientes WHERE nome = 'Enzo Ribeiro' AND cidade = 'Porto Nacional'), 5, 'Comecei a serie agora!', '2026-08-15');
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-011'), (SELECT id FROM clientes WHERE nome = 'Alice Carvalho' AND cidade = 'Brasilia'), 4, 'Classico da infancia.', '2026-10-11');

-- LIV-012 - Quarto de Despejo
INSERT INTO produtos (sku, nome, descricao, categoria, marca_id, preco, estoque, vendas, criado_em) VALUES ('LIV-012', 'Quarto de Despejo', 'Livro de Carolina Maria de Jesus, publicado pela editora Atica em 1960, com 200 páginas. Edição em português, formato brochura.', 'livro', (SELECT id FROM marcas WHERE nome = 'Atica'), 39.9, 45, 85, '2026-05-06');
INSERT INTO produto_livro VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-012'), 'Carolina Maria de Jesus', '9788508171275', 200, 'Atica', 'português', 1960, 'brochura');
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-012'), (SELECT id FROM tags WHERE nome = 'literatura brasileira'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-012'), (SELECT id FROM tags WHERE nome = 'nao-ficcao'));
INSERT INTO produto_tag VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-012'), (SELECT id FROM tags WHERE nome = 'classico'));
INSERT INTO avaliacoes (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produtos WHERE sku = 'LIV-012'), (SELECT id FROM clientes WHERE nome = 'Luana Teixeira' AND cidade = 'Palmas'), 5, 'Forte e emocionante.', '2026-09-29');

COMMIT;

-- =====================================================
-- PROJETO: SISTEMA DE GESTAO DE FUNCIONARIOS E PROJETOS
-- TECNOLOGIA: SQLITE
-- =====================================================

PRAGMA foreign_keys = ON;

-- =====================================================
-- 1. CRIACAO DAS TABELAS
-- =====================================================

CREATE TABLE empregados (
    ID INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    departamento VARCHAR(100) NOT NULL,
    salario REAL NOT NULL
);

CREATE TABLE projetos (
    id_projeto INTEGER PRIMARY KEY,
    nome_projeto VARCHAR(100) NOT NULL,
    id_gerente INTEGER NOT NULL,

    FOREIGN KEY (id_gerente)
        REFERENCES empregados(ID)
);

-- =====================================================
-- 2. CADASTRO DE FUNCIONARIOS
-- =====================================================

INSERT INTO empregados (ID, nome, departamento, salario)
VALUES
    (1, 'Heitor Vieira', 'Financeiro', 4959.22),
    (2, 'Daniel Campos', 'Vendas', 3884.44),
    (3, 'Luiza Dias', 'TI', 8205.78),
    (4, 'Davi Lucas Moraes', 'Financeiro', 8437.02),
    (5, 'Pietro Cavalcanti', 'TI', 4946.88),
    (6, 'Evelyn da Mata', 'Vendas', 5278.88),
    (7, 'Isabella Rocha', 'Marketing', 4006.03),
    (8, 'Manuela Azevedo', 'Vendas', 6101.88),
    (9, 'Brenda Cardoso', 'TI', 8853.34),
    (10, 'Danilo Souza', 'TI', 8242.14);

-- =====================================================
-- 3. CADASTRO DE PROJETOS
-- =====================================================

INSERT INTO projetos (id_projeto, nome_projeto, id_gerente)
VALUES
    (1, 'Casa', 1),
    (2, 'Predio', 2),
    (3, 'Rua', 3);

-- =====================================================
-- 4. CONSULTAS DE FUNCIONARIOS
-- =====================================================

-- Lista todos os funcionarios de Vendas.
SELECT *
FROM empregados
WHERE departamento = 'Vendas';

-- Lista funcionarios com salario superior a 5000.
SELECT *
FROM empregados
WHERE salario > 5000;

-- Lista funcionarios de Vendas com salario de ate 6000.
SELECT nome, salario
FROM empregados
WHERE departamento = 'Vendas'
  AND salario <= 6000;

-- Ordena funcionarios pelo salario, do maior para o menor.
SELECT nome, departamento, salario
FROM empregados
ORDER BY salario DESC;

-- =====================================================
-- 5. ATUALIZACAO DE DADOS
-- =====================================================

-- Atualiza os salarios dos funcionarios de TI.
UPDATE empregados
SET salario = 7500
WHERE departamento = 'TI';

-- =====================================================
-- 6. EXCLUSAO DE DADOS
-- =====================================================

-- Exclui funcionarios com salario inferior a 4000.
-- Gerentes de projeto sao preservados para manter a integridade
-- referencial (a FOREIGN KEY impede excluir quem gerencia um projeto).
DELETE FROM empregados
WHERE salario < 4000
  AND ID NOT IN (SELECT id_gerente FROM projetos);

-- =====================================================
-- 7. CONSULTAS DE PROJETOS
-- =====================================================

-- Lista todos os projetos.
SELECT *
FROM projetos;

-- Lista os projetos gerenciados pelo funcionario de ID 2.
SELECT *
FROM projetos
WHERE id_gerente = 2;

-- =====================================================
-- 8. RELACIONAMENTO ENTRE FUNCIONARIOS E PROJETOS
-- =====================================================

-- Exibe cada projeto junto ao nome do seu gerente.
SELECT
    projetos.nome_projeto,
    empregados.nome AS nome_gerente,
    empregados.departamento
FROM projetos
INNER JOIN empregados
    ON projetos.id_gerente = empregados.ID;

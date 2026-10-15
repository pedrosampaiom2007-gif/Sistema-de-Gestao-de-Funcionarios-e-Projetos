# Sistema de Gestão de Funcionários e Projetos

**SQL · SQLite · Modelagem de dados · Consultas relacionais**

## Sobre o projeto

Este projeto consiste em um banco de dados relacional desenvolvido com SQL e SQLite para gerenciar funcionários, departamentos, salários e projetos empresariais.

O objetivo é praticar os principais comandos SQL utilizados na criação, consulta, atualização e exclusão de dados, além de implementar relacionamentos entre tabelas por meio de chaves primárias e estrangeiras.

## Tecnologias utilizadas

- SQL
- SQLite

## Estrutura do repositório

```
Sistema-de-Gestao-de-Funcionarios-e-Projetos/
├── database.sql   # Criação das tabelas, dados iniciais e operações SQL
└── README.md      # Documentação do projeto
```

## Estrutura do banco de dados

### Tabela `empregados`

Armazena os dados dos funcionários da empresa.

| Coluna         | Tipo         | Descrição                          |
|----------------|--------------|------------------------------------|
| `ID`           | INTEGER (PK) | Identificador único do funcionário |
| `nome`         | VARCHAR(100) | Nome do funcionário                |
| `departamento` | VARCHAR(100) | Departamento em que trabalha       |
| `salario`      | REAL         | Salário do funcionário             |

### Tabela `projetos`

Armazena os projetos e seus respectivos gerentes.

| Coluna         | Tipo         | Descrição                                         |
|----------------|--------------|---------------------------------------------------|
| `id_projeto`   | INTEGER (PK) | Identificador único do projeto                    |
| `nome_projeto` | VARCHAR(100) | Nome do projeto                                   |
| `id_gerente`   | INTEGER (FK) | Identificador do funcionário responsável pelo projeto |

O campo `id_gerente` é uma chave estrangeira que referencia `empregados.ID`, estabelecendo um relacionamento entre as duas tabelas.

## Funcionalidades implementadas

- Criação de tabelas com `CREATE TABLE`.
- Inserção de registros com `INSERT INTO`.
- Filtragem de dados com `WHERE`.
- Aplicação de operadores lógicos com `AND`.
- Ordenação de resultados com `ORDER BY`.
- Atualização de registros com `UPDATE`.
- Exclusão de registros com `DELETE`.
- Relacionamento entre tabelas com `FOREIGN KEY`.
- Combinação de informações com `INNER JOIN`.

## Como executar

1. Instale o SQLite ou utilize uma ferramenta online compatível.
2. Abra o arquivo `database.sql`.
3. Execute o script em uma base de dados vazia.
4. Execute as consultas para verificar os resultados.

Pelo terminal:

```bash
sqlite3 empresa.db < database.sql
```

## Objetivo de aprendizagem

Este projeto foi desenvolvido para consolidar fundamentos de SQL, modelagem relacional, integridade referencial e manipulação de dados, servindo como parte do meu portfólio de estudos em Ciência da Computação e análise de dados.

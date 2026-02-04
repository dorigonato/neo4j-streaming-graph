# 🎬 Modelagem de Dados em Grafos - Serviço de Streaming (Neo4j)

Projeto desenvolvido como parte do desafio da DIO (Digital Innovation One) com o objetivo de praticar a modelagem de dados em grafos utilizando o Neo4j AuraDB.

## 📌 Objetivo

Modelar um domínio de serviço de streaming utilizando banco de dados orientado a grafos, representando usuários, filmes, séries, atores, diretores e gêneros, bem como os relacionamentos entre essas entidades, permitindo consultas exploratórias sobre o grafo.

## 🧠 Modelo de Dados

### Nós (Labels)
- Usuario
- Filme
- Serie
- Ator
- Diretor
- Genero

### Relacionamentos
- (Usuario)-[:ASSISTIU {avaliacao}]->(Filme)
- (Ator)-[:ATUOU_EM]->(Filme)
- (Diretor)-[:DIRIGIU]->(Filme)
- (Filme)-[:TEM_GENERO]->(Genero)
- (Serie)-[:TEM_GENERO]->(Genero)

## 🛠️ Implementação

- O arquivo `script.cypher` contém:
  - Limpeza do banco
  - Criação dos nós (Usuários, Filmes, Séries, Atores, Diretores e Gêneros)
  - Criação dos relacionamentos entre as entidades
  - Inserção de dados de exemplo usando `UNWIND`
  - Consultas de exemplo para exploração do grafo

- O arquivo `Cypher.docx` contém o código Cypher e as consultas documentadas.

- Contém capturas de tela do Neo4j Aura mostrando:
  - Visão geral do grafo
  - Execução de consultas
  - Detalhes de relacionamentos

- Contém arquivos CSV com os resultados de consultas exportadas do Neo4j.

## 📷 Evidências

- Print_01.png: Visão geral do grafo
- Print_02.png: Execução de consulta no Neo4j
- Print_03.png: Detalhe de um relacionamento no grafo

## 🚀 Como Executar

1. Criar uma instância no Neo4j AuraDB (versão gratuita).
2. Abrir o Neo4j Browser (Query).
3. Copiar e colar o conteúdo do arquivo `script.cypher`.
4. Executar o script para criar e popular o grafo.
5. Executar as consultas de exemplo ao final do arquivo.

🔍 Exemplos de Consultas (para explorar o grafo)

// Listar filmes assistidos pelo usuário 1

MATCH (u:Usuario {id:1})-[:ASSISTIU]->(c)
RETURN u.nome, c.titulo;

// Filmes do gênero Ação

MATCH (f:Filme)-[:TEM_GENERO]->(g:Genero {nome:"Ação"})
RETURN f.titulo, g.nome;

// Atores e os filmes em que atuaram

MATCH (a:Ator)-[:ATUOU_EM]->(f:Filme)
RETURN a.nome, f.titulo;

## ✅ Conclusão

Este projeto demonstra o uso de bancos de dados orientados a grafos para modelar um serviço de streaming, explorando nós, relacionamentos e propriedades, e evidenciando as vantagens do Neo4j para consultas baseadas em relacionamentos.

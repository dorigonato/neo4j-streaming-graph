# 🎬 Modelagem de Dados em Grafos - Serviço de Streaming (Neo4j)

Projeto desenvolvido como parte do desafio da DIO para praticar modelagem de dados em grafos utilizando o Neo4j Aura.

## 📌 Objetivo

Modelar um serviço de streaming utilizando banco de dados orientado a grafos, representando usuários, filmes, séries, atores, diretores e gêneros, bem como seus relacionamentos.

## 🧠 Modelo Conceitual

Entidades (Nós):
- Usuario
- Filme
- Serie
- Ator
- Diretor
- Genero

Relacionamentos:
- (Usuario)-[:ASSISTIU {avaliacao}]->(Filme|Serie)
- (Ator)-[:ATUOU_EM]->(Filme|Serie)
- (Diretor)-[:DIRIGIU]->(Filme|Serie)
- (Filme|Serie)-[:TEM_GENERO]->(Genero)

## 🛠️ Implementação

- O arquivo `script.cypher` contém o código para criação dos nós e relacionamentos.
- O arquivo `Cypher.docx` contém o código e as consultas documentadas.
- contém prints do grafo e das consultas no Neo4j Aura.
- contém os resultados das consultas exportados em CSV.

## 📷 Evidências

- Print_01.png: Visão geral do grafo
- Print_02.png: Execução de consulta
- Print_03.png: Detalhe de relacionamento

## ✅ Conclusão

Este projeto demonstra o uso do Neo4j para modelar um domínio de streaming, explorando nós e relacionamentos e evidenciando as vantagens do uso de grafos.

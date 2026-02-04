// ============================================
// LIMPEZA DO BANCO
// ============================================
MATCH (n) DETACH DELETE n;

// ============================================
// CRIAÇÃO DOS USUÁRIOS
// ============================================
UNWIND range(1,10) AS i
CREATE (:Usuario {id: i, nome: "Usuario " + i});

// ============================================
// CRIAÇÃO DOS GÊNEROS
// ============================================
CREATE (:Genero {nome:"Ação"});
CREATE (:Genero {nome:"Drama"});
CREATE (:Genero {nome:"Comédia"});
CREATE (:Genero {nome:"Terror"});
CREATE (:Genero {nome:"Ficção Científica"});

// ============================================
// CRIAÇÃO DOS FILMES
// ============================================
UNWIND range(1,10) AS i
CREATE (:Filme {id: i, titulo: "Filme " + i, ano: 2015 + i});

// ============================================
// CRIAÇÃO DAS SÉRIES
// ============================================
UNWIND range(1,5) AS i
CREATE (:Serie {id: i, titulo: "Serie " + i, ano: 2018 + i});

// ============================================
// CRIAÇÃO DOS ATORES
// ============================================
UNWIND range(1,10) AS i
CREATE (:Ator {nome: "Ator " + i});

// ============================================
// CRIAÇÃO DOS DIRETORES
// ============================================
UNWIND range(1,5) AS i
CREATE (:Diretor {nome: "Diretor " + i});

// ============================================
// RELACIONAMENTOS: FILME -> GENERO
// ============================================
MATCH (f:Filme), (g:Genero)
WITH f, g
WHERE id(f) % 5 = id(g) % 5
CREATE (f)-[:TEM_GENERO]->(g);

// ============================================
// RELACIONAMENTOS: SERIE -> GENERO
// ============================================
MATCH (s:Serie), (g:Genero)
WITH s, g
WHERE id(s) % 5 = id(g) % 5
CREATE (s)-[:TEM_GENERO]->(g);

// ============================================
// RELACIONAMENTOS: ATOR -> FILME
// ============================================
MATCH (a:Ator), (f:Filme)
WITH a, f
WHERE id(a) % 3 = id(f) % 3
CREATE (a)-[:ATUOU_EM]->(f);

// ============================================
// RELACIONAMENTOS: DIRETOR -> FILME
// ============================================
MATCH (d:Diretor), (f:Filme)
WITH d, f
WHERE id(d) % 2 = id(f) % 2
CREATE (d)-[:DIRIGIU]->(f);

// ============================================
// RELACIONAMENTOS: USUARIO -> FILME (ASSISTIU)
// ============================================
MATCH (u:Usuario), (f:Filme)
WITH u, f
WHERE id(u) % 4 = id(f) % 4
CREATE (u)-[:ASSISTIU {avaliacao: (id(u) % 5) + 1}]->(f);

// ============================================
// CONSULTAS DE EXEMPLO
// ============================================

// O que o Usuário 1 assistiu
MATCH (u:Usuario {id:1})-[:ASSISTIU]->(c)
RETURN c.titulo;

// Filmes de Ação
MATCH (f:Filme)-[:TEM_GENERO]->(g:Genero {nome:"Ação"})
RETURN f.titulo;

// Atores e filmes
MATCH (a:Ator)-[:ATUOU_EM]->(f:Filme)
RETURN a.nome, f.titulo;

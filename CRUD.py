from conexao import *
meucursor = conexao.cursor()

# =====================================
#SELECT para mostrar todos os gêneros
# ======================================

#Nomeando as colunas
colunas = ['id', 'gênero', 'descricao', 'publico']

#SELECT da tabela de gêneros
consulta = 'SELECT * FROM generos;'
meucursor.execute(consulta)
resultados = meucursor.fetchall()

#Transformar cada linha em um dicionário
generos = []
for linha in resultados:
    genero = dict(zip(colunas, linha))
    generos.append(genero)

#Exibindo a consulta
for genero in generos:
    print(genero)
    

# ===================================
#SELECT para mostrar a tabela filmes
# ===================================

#Nomeando as colunas
colunas = ['Filme', 'Ano', 'Gênero', 'Diretor']

#SELECT da tabela filmes usando a relação entre as tabelas gênero e diretores
consulta = """SELECT filmes.titulo AS Filme, 
filmes.ano_lancamento AS Ano, 
generos.nome AS Genero, 
diretores.nome AS Diretor 
FROM filmes 
INNER JOIN generos ON filmes.id_genero = generos.id
INNER JOIN diretores ON filmes.diretor_id = diretores.id;"""
meucursor.execute(consulta)
resultado = meucursor.fetchall()

#Transformar cada linha em um dicionário
filmes = []
for linha in resultado:
    filme = dict(zip(colunas, linha))
    filmes.append(filme)

#Exibindo a consulta
for x in filmes:
    print(x)


# ==================
#CREATE novo gênero
#===================

#Inserir novo gênero
meucursor.execute(
    """INSERT INTO generos (nome, descricao, publico) 
    VALUES ('Animação', 'Filmes com narrativas criativas e personagens animados', 'Geral');"""
)

#SELECT para verificar se o gênero foi cadastrado
meucursor.execute('SELECT * FROM generos;')
resultado = meucursor.fetchall()

print("Gêneros cadastrados:")
for linha in resultado:
    print(linha)


# ==================================
#UPDATE DE FILMES COM GENERO ERRADO
# ==================================

#Atualizar gênero dos filmes (Frozen, Shrek, Os Incríveis) para Animação
meucursor.execute('UPDATE filmes SET id_genero = 23 WHERE id IN (13, 16, 18);')


#Repetindo o SELECT para ver os filmes com o gênero atualizado
colunas = ['Filme', 'Ano', 'Gênero', 'Diretor']
consulta = """SELECT filmes.titulo AS Filme, 
filmes.ano_lancamento AS Ano, 
generos.nome AS Genero, 
"diretores.nome AS Diretor 
FROM filmes 
INNER JOIN generos ON filmes.id_genero = generos.id
INNER JOIN diretores ON filmes.diretor_id = diretores.id;"""
meucursor.execute(consulta)
resultado = meucursor.fetchall()

filmes = []
for linha in resultado:
    filme = dict(zip(colunas, linha))
    filmes.append(filme)

#exibindo a consulta
for x in filmes:
    print(x)



# =================================================
#SELECT para exibir informações gerais de um filme
# =================================================

consulta = """SELECT
filmes.titulo AS Filme,
diretores.nome AS Diretor,
atores.nome AS Ator
FROM filmes
INNER JOIN diretores ON filmes.diretor_id = diretores.id
INNER JOIN filmes_atores ON filmes.id = filmes_atores.filme_id
INNER JOIN atores ON filmes_atores.ator_id = atores.id
WHERE filmes.titulo = %s;
"""

titulo_do_filme = 'Harry Potter e a Pedra filosofal'

meucursor.execute(consulta, (titulo_do_filme,))
resultado = meucursor.fetchall()

if not resultado:
    print("Filme não encontrado ou sem atores cadastrados.")
else: 
    filme = resultado[0][0]
    diretor = resultado[0][1]
    atores = [linha[2] for linha in resultado]

    #Exibe o título do filme e o nome do diretor apenas uma vez
    print(f"Filme: {filme}")
    print(f"Diretor: {diretor}")
    print("Atores:")
    for ator in atores:
        print(f" - {ator}")


# ==========================================
#DELETE atores que não pertencem a um filme
# ==========================================

delete = "DELETE FROM filmes_atores WHERE filme_id = 5 AND ator_id IN (2, 3);"
meucursor.execute(delete)

#SELECT para mostrar que os atores foram excluídos
consulta = """SELECT atores.nome AS Ator 
FROM filmes
INNER JOIN filmes_atores ON filmes.id = filmes_atores.filme_id
INNER JOIN atores ON filmes_atores.ator_id = atores.id
WHERE filmes.titulo = 'Harry Potter e a pedra filosofal';"""

meucursor.execute(consulta)
resultado = meucursor.fetchall()

print ("Atores cadastrados no filme: ")
for ator in resultado:
    print(f" - {ator[0]}")


conexao.commit()


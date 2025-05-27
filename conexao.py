#area de conexão com o banco de dados
import mysql.connector

conexao = mysql.connector.connect( host='localhost', database='movie_schema', user='root', password='projetocrud')


if conexao.is_connected():
    print("Conectado ao banco de dados!") #mensagem parqa sinalizar que o python está conectado com o banco

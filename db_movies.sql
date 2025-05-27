CREATE DATABASE movie_schema;
USE movie_schema;

-- Tabela generos
CREATE TABLE generos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(100),
    publico VARCHAR(50)
);

-- Tabela filmes
CREATE TABLE filmes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    ano_lancamento INT,
    id_genero INT,
    FOREIGN KEY (id_genero) REFERENCES generos(id)
);

-- Tabela atores
CREATE TABLE atores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    nacionalidade VARCHAR(50)
);

-- Tabela diretores
CREATE TABLE diretores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    nacionalidade VARCHAR(50)
);

-- Tabela filmes_atores
CREATE TABLE filmes_atores (
    filme_id INT,
    ator_id INT,
    PRIMARY KEY (filme_id, ator_id),
    FOREIGN KEY (filme_id) REFERENCES filmes(id),
    FOREIGN KEY (ator_id) REFERENCES atores(id)
);

-- Tabela filmes_diretores
CREATE TABLE filmes_diretores (
    filme_id INT,
    diretor_id INT,
    PRIMARY KEY (filme_id, diretor_id),
    FOREIGN KEY (filme_id) REFERENCES filmes(id),
    FOREIGN KEY (diretor_id) REFERENCES diretores(id)
);

INSERT INTO generos (nome, descricao, publico) VALUES
('Musical', 'Filmes com performances musicais', 'Geral'),
('Romance', 'Filmes com foco em histórias de amor', 'Geral'),
('Drama', 'Narrativas emocionantes e realistas', 'Geral'),
('Aventura', 'Filmes com jornadas e desafios', 'Geral'),
('Ficção Científica', 'Histórias futuristas ou tecnológicas', 'Geral'),
('Ação', 'Sequências de combate e adrenalina', 'Geral'),
('Fantasia', 'Universos mágicos e sobrenaturais', 'Geral'),
('Comédia', 'Filmes para fazer rir', 'Geral');

INSERT INTO filmes (titulo, ano_lancamento, id_genero) VALUES
('Wicked', 2024, 1),
('Titanic', 1997, 2),
('Orgulho e Preconceito', 2005, 2),
('Jogos Vorazes', 2012, 4),
('Harry Potter e a Pedra Filosofal', 2001, 7),
('Vingadores: Ultimato', 2019, 6),
('Interestelar', 2014, 5),
('A Origem', 2010, 5),
('O Senhor dos Anéis: A Sociedade do Anel', 2001, 7),
('Pantera Negra', 2018, 6),
('La La Land', 2016, 1),
('O Rei Leão', 1994, 7),
('Frozen', 2013, 7),
('Coringa', 2019, 3),
('A Culpa é das Estrelas', 2014, 2),
('Shrek', 2001, 8),
('Avatar', 2009, 5),
('Os Incríveis', 2004, 6),
('As Crônicas de Nárnia: O Leão, a Feiticeira e o Guarda-Roupa', 2005, 7),
('Piratas do Caribe: A Maldição do Pérola Negra', 2003, 4);

INSERT INTO atores (nome, data_nascimento, nacionalidade) VALUES
('Cynthia Erivo', '1987-01-08', 'Britânica'),
('Ariana Grande', '1993-06-26', 'Americana'),
('Leonardo DiCaprio', '1974-11-11', 'Americana'),
('Kate Winslet', '1975-10-05', 'Britânica'),
('Keira Knightley', '1985-03-26', 'Britânica'),
('Jennifer Lawrence', '1990-08-15', 'Americana'),
('Daniel Radcliffe', '1989-07-23', 'Britânica'),
('Emma Watson', '1990-04-15', 'Britânica'),
('Robert Downey Jr.', '1965-04-04', 'Americana'),
('Scarlett Johansson', '1984-11-22', 'Americana'),
('Matthew McConaughey', '1969-11-04', 'Americana'),
('Elliot Page', '1987-02-21', 'Canadense'),
('Elijah Wood', '1981-01-28', 'Americana'),
('Chadwick Boseman', '1976-11-29', 'Americana'),
('Ryan Gosling', '1980-11-12', 'Canadense'),
('Emma Stone', '1988-11-06', 'Americana'),
('Joaquin Phoenix', '1974-10-28', 'Americana'),
('Shailene Woodley', '1991-11-15', 'Americana'),
('Mike Myers', '1963-05-25', 'Canadense'),
('Zoe Saldana', '1978-06-19', 'Americana');


INSERT INTO diretores (nome, data_nascimento, nacionalidade) VALUES
('Jon M. Chu', '1979-11-02', 'Americana'),
('James Cameron', '1954-08-16', 'Canadense'),
('Joe Wright', '1972-08-25', 'Britânico'),
('Francis Lawrence', '1971-03-26', 'Austríaco'),
('Chris Columbus', '1958-09-10', 'Americano'),
('Anthony Russo', '1970-02-03', 'Americano'),
('Joe Russo', '1971-07-18', 'Americano'),
('Christopher Nolan', '1970-07-30', 'Britânico'),
('Peter Jackson', '1961-10-31', 'Neozelandês'),
('Ryan Coogler', '1986-05-23', 'Americano'),
('Damien Chazelle', '1985-01-19', 'Americano'),
('Roger Allers', '1949-06-29', 'Americano'),
('Jennifer Lee', '1971-10-22', 'Americana'),
('Todd Phillips', '1970-12-20', 'Americano'),
('Josh Boone', '1979-04-05', 'Americano'),
('Andrew Adamson', '1966-12-01', 'Neozelandês'),
('Gore Verbinski', '1964-03-16', 'Americano'),
('Brad Bird', '1957-09-24', 'Americano'),
('Robert Stevenson', '1905-03-31', 'Britânico'),
('James Cameron', '1954-08-16', 'Canadense');

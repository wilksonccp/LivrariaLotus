-- seeds_autor.sql
-- Script para popular a tabela Autor com dados iniciais
-- Seleciona o banco de dados para uso
USE main.livraria_db;
GO
-- Insere autores na tabela Autor
INSERT INTO main.Autor (AutorId,NomeCompleto, Nacionalidade, DataNascimento, Biografia, Ativo)
VALUES
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF0','Paulo Coelho', 'Brasileira', '1947-08-24', 'Paulo Coelho é um renomado autor brasileiro, conhecido por suas obras de ficção e autoajuda.', 1),
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF1','Stephen King', 'Americana', '1947-09-21', 'Stephen King é um prolífico escritor americano, famoso por seus livros de terror e suspense.', 1),
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF2','J.R.R. Tolkien', 'Britânica', '1892-01-03', 'J.R.R. Tolkien foi um escritor, poeta e professor britânico, conhecido por criar o universo da Terra Média.', 1),
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF3','Agatha Christie', 'Britânica', '1890-09-15', 'Agatha Christie foi uma escritora britânica, famosa por seus romances policiais e personagens icônicos como Hercule Poirot.', 1),
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF4','Gabriel García Márquez', 'Colombiana', '1927-03-06', 'Gabriel García Márquez foi um escritor colombiano, vencedor do Prêmio Nobel de Literatura, conhecido por suas obras de realismo mágico.', 1),
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF5','J.K. Rowling', 'Britânica', '1965-07-31', 'J.K. Rowling é uma autora britânica, famosa por criar a série Harry Potter.', 1),
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF6','George R.R. Martin', 'Americana', '1948-09-20', 'George R.R. Martin é um autor americano, conhecido por sua série de fantasia As Crônicas de Gelo e Fogo.', 1),
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF7','Isabel Allende', 'Chilena', '1942-08-02', 'Isabel Allende é uma escritora chilena, conhecida por seus romances que misturam realismo mágico e história.', 1),
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF8','Haruki Murakami', 'Japonesa', '1949-01-12', 'Haruki Murakami é um autor japonês, conhecido por suas obras que misturam o cotidiano e o surreal.', 1),
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF9','Chimamanda Ngozi Adichie', 'Nigeriana', '1977-09-15', 'Chimamanda Ngozi Adichie é uma escritora nigeriana, conhecida por seus romances e ensaios sobre identidade e feminismo.', 1);
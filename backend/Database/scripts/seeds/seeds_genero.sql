-- seeds_genero.sql
-- Script para popular a tabela Genero com dados iniciais
-- Seleciona o banco de dados para uso
USE main.livraria_db;
GO
-- Insere gêneros na tabela Genero
INSERT INTO main.Genero (GeneroId, Nome, Descricao)
VALUES
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', 'Ficção', 'Obras que contêm elementos imaginários ou fictícios.'),
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF1', 'Não-ficção', 'Obras baseadas em fatos reais e informações verificáveis.'),
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF2', 'Fantasia', 'Obras que contêm elementos mágicos ou sobrenaturais.'),
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF3', 'Biografia', 'Obras que narram a vida de uma pessoa real.'),
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF4', 'Romance', 'Obras que exploram relacionamentos amorosos.'),
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF5', 'Mistério', 'Obras que envolvem enigmas ou crimes a serem resolvidos.'),
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF6', 'Terror', 'Obras destinadas a assustar ou provocar medo no leitor.'),
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF7', 'Autoajuda', 'Obras que oferecem conselhos e estratégias para o desenvolvimento pessoal.'),
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF8', 'Infantil', 'Obras destinadas ao público infantil, com linguagem e temas apropriados.'),
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF9', 'História', 'Obras que exploram eventos históricos e suas implicações.'),
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF10', 'Ciência', 'Obras que abordam temas científicos e suas descobertas.');
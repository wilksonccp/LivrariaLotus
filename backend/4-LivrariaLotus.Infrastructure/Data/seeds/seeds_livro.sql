-- seeds_livro.sql
-- Script para popular a tabela Livro com dados iniciais
-- Seleciona o banco de dados para uso
USE main.livraria_db;
GO
-- Insere livros na tabela Livro
INSERT INTO main.Livro (GeneroId, EditoraId, ISBN, Titulo, PrecoLista, AnoPublicacao, Edicao, Ativo, Estoque)
VALUES
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF4','A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', '978-3-16-148410-0', 'O Alquimista', 29.90, 1988, 1, 1, 100),
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF1', 'A1B2C3D4-E5F6-7890-1234-56789ABCDEF1', '978-1-4028-9462-6', 'A Guerra dos Tronos', 39.90, 1996, 1, 1, 50),
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF2', 'A1B2C3D4-E5F6-7890-1234-56789ABCDEF2', '978-0-7475-3274-0', 'Harry Potter e a Pedra Filosofal', 39.90, 1997, 1, 1, 200),
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF3', 'A1B2C3D4-E5F6-7890-1234-56789ABCDEF3', '978-0-06-112008-4', 'O Sol é Para Todos', 24.90, 1960, 1, 1, 75),
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF4', 'A1B2C3D4-E5F6-7890-1234-56789ABCDEF4', '978-0-7432-7356-5', 'Cem Anos de Solidão', 34.90, 1967, 1, 1, 60);
GO
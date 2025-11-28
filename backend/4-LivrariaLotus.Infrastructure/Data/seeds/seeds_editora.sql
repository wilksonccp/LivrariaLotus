-- seeds_editoras.sql
-- Script para popular a tabela Editora com dados iniciais
-- Seleciona o banco de dados para uso
USE main.livraria_db;
GO
-- Insere editoras na tabela Editora
INSERT INTO main.Editora (EditoraId, Nome, Site)
VALUES
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', 'Editora Alpha', 'www.editoraalpha.com'),
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF1', 'Beta Books', 'www.betabooks.com'),
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF2', 'Gamma Publications', 'www.gammapublications.com'),
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF3', 'Delta Press', 'www.deltapress.com'),
('A1B2C3D4-E5F6-7890-1234-56789ABCDEF4', 'Epsilon Editors', 'www.epsiloneditors.com');
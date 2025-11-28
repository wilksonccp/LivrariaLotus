-- seeds_editoraa.sql
-- Script para popular a tabela Editora com dados iniciais
-- Seleciona o banco de dados para uso
USE main.livraria_db;
GO
-- Insere editoras na tabela Editora
INSERT INTO main.Editora (Nome, Site)
VALUES
('Editora Alpha', 'www.editoraalpha.com'),
('Beta Books', 'www.betabooks.com'),
('Gamma Publications', 'www.gammapublications.com'),
('Delta Press', 'www.deltapress.com'),
('Epsilon Editors', 'www.epsiloneditors.com');
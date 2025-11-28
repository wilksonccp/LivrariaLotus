-- seeds_clientes.sql
-- Script para popular a tabela Cliente com dados iniciais
-- Seleciona o banco de dados para uso
USE main.livraria_db;
GO
-- Insere clientes na tabela Cliente
INSERT INTO main.Cliente (ClienteId, NomeCompleto, Email, SenhaHash, Ativo, DataCadastro)
VALUES 
(NEWID(), 'João Silva', 'joao.silva@example.com', 'hashed_password_1', 1 , GETDATE()),
(NEWID(), 'Maria Oliveira', 'maria.oliveira@example.com', 'hashed_password_2', 1 , GETDATE()),
(NEWID(), 'Carlos Souza', 'carlos.souza@example.com', 'hashed_password_3', 1 , GETDATE()),
(NEWID(), 'Ana Costa', 'ana.costa@example.com', 'hashed_password_4', 1 , GETDATE()),
(NEWID(), 'Fernanda Lima', 'fernanda.lima@example.com', 'hashed_password_5', 1 , GETDATE()),
(NEWID(), 'Pedro Alves', 'pedro.alves@example.com', 'hashed_password_6', 0 , GETDATE());

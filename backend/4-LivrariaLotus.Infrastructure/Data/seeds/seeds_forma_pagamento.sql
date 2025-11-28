-- seeds_forma_pagamento.sql
-- Script para popular a tabela FormaPagamento com dados iniciais
-- Seleciona o banco de dados para uso
USE main.livraria_db;
GO
-- Insere formas de pagamento na tabela FormaPagamento
INSERT INTO main.FormaPagamento (Nome, Descricao)
VALUES
('Cartão de Crédito', 'Pagamento realizado via cartão de crédito.'),
('Boleto Bancário', 'Pagamento realizado via boleto bancário.'),
('Pix', 'Pagamento instantâneo via Pix.'),
('Transferência Bancária', 'Pagamento realizado via transferência entre contas bancárias.'),
('Dinheiro', 'Pagamento realizado em dinheiro na entrega.');
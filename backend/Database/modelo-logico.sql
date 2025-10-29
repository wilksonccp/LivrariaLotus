---- ============================================
-- SCRIPT DE CRIAÇÃO DO BANCO DE DADOS
-- Projeto: Sistema de Livraria Lotus
-- Autor: Wilkson
-- Data: 2025-10-28
-- Versão: 1.0
-- SQL Server
-- ============================================

-- Criação do banco de dados
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'livraria_db')
BEGIN
    CREATE DATABASE malivraria_db;
END
GO
-- Seleciona o banco de dados para uso
USE main.livraria_db;
GO
-- Verifica se o schema main já existe e o cria se necessário
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'main')
BEGIN
    EXEC('CREATE SCHEMA main');
END
GO
-- Criação da tabela de Autor
CREATE TABLE IF NOT EXISTS main.Autor (
    AutorId UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID() PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Nacionalidade VARCHAR(50),
    DataNascimento DATE,
    Biografia VARCHAR(MAX),
    Ativo BOOLEAN NOT NULL DEFAULT TRUE
);
GO
-- Criação da tabela de Genero
CREATE TABLE IF NOT EXISTS main.Genero (
    GeneroId UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID() PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Descricao VARCHAR(255)
);
GO
-- Criação da tabela de Editora
CREATE TABLE IF NOT EXISTS main.Editora (
    EditoraId UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID() PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Site VARCHAR(50)
);
GO
-- Criação da tabela de Livro
CREATE TABLE IF NOT EXISTS main.Livro (
    LivroId UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID() PRIMARY KEY,
    GeneroId UNIQUEIDENTIFIER NOT NULL,
    EditoraId UNIQUEIDENTIFIER NOT NULL,
    ISBN VARCHAR(20) NOT NULL UNIQUE,
    Titulo VARCHAR(50) NOT NULL,
    PrecoLista DECIMAL(10, 2) NOT NULL CHECK (PrecoLista >= 0),
    AnoPublicacao VARCHAR(4),
    Edicao VARCHAR(2),
    Ativo BIT NOT NULL DEFAULT 0,
    Estoque INT NOT NULL DEFAULT 0 CHECK (Estoque >= 0),
    CONSTRAINT FK_Livro_Genero FOREIGN KEY (GeneroId) REFERENCES main.Genero(GeneroId),
    CONSTRAINT FK_Livro_Editora FOREIGN KEY (EditoraId) REFERENCES main.Editora(EditoraId)
);
GO
-- Criação da tabela de LivroAutor (tabela de relacionamento muitos-para-muitos)
CREATE TABLE IF NOT EXISTS main.LivroAutor (
    LivroAutorId UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID() PRIMARY KEY,
    LivroId UNIQUEIDENTIFIER NOT NULL,
    AutorId UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT FK_LivroAutor_Livro FOREIGN KEY (LivroId) REFERENCES main.Livro(LivroId),
    CONSTRAINT FK_LivroAutor_Autor FOREIGN KEY (AutorId) REFERENCES main.Autor(AutorId),
    CONSTRAINT UQ_LivroAutor_LivroId_AutorId UNIQUE (LivroId, AutorId)
);
GO
-- Criação da tabela de Cliente
CREATE TABLE IF NOT EXISTS main.Cliente (
    ClienteId UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID() PRIMARY KEY,
    NomeCompleto VARCHAR(100) NOT NULL UNIQUE,
    DataCadastro DATETIME NOT NULL DEFAULT GETDATE(),
    Ativo BIT NOT NULL DEFAULT 1
);
GO
-- Indice para otimizar a busca por nome completo do cliente
IF NOT EXISTS (
    SELECT * FROM sys.indexes
    WHERE name = 'IX_Cliente_NomeCompleto' AND object_id = OBJECT_ID('main.Cliente'))
BEGIN
    CREATE INDEX IX_Cliente_NomeCompleto ON main.Cliente (NomeCompleto);
END
GO
-- Criação da tabela de Endereco
CREATE TABLE IF NOT EXISTS main.Endereco (
    EnderecoId UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID() PRIMARY KEY,
    ClienteId UNIQUEIDENTIFIER NOT NULL,
    Logradouro VARCHAR(50) NOT NULL,
    Numero VARCHAR(10) NOT NULL DEFAULT 'S/N',
    Complemento VARCHAR(100),
    Bairro VARCHAR(50) NOT NULL,
    Cidade VARCHAR(50) NOT NULL,
    Estado CHAR(2) NOT NULL,
    CEP CHAR(9) NOT NULL CHECK (LEN(CEP) = 9),
    Pais VARCHAR(50) NOT NULL DEFAULT 'Brasil',
    TipoEEndereco VARCHAR(20) NOT NULL DEFAULT 'Residencial',
    CONSTRAINT FK_Endereco_Cliente FOREIGN KEY (ClienteId) REFERENCES main.Cliente(ClienteId),
    CHECK (TipoEEndereco IN ('Residencial', 'Comercial'))
);
GO
-- Criação da tabela de Contato
CREATE TABLE IF NOT EXISTS main.Contato (
    ContatoId UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID() PRIMARY KEY,
    ClienteId UNIQUEIDENTIFIER NOT NULL,
    Valor VARCHAR(50) NOT NULL,
    TipoContato VARCHAR(100) NOT NULL,
    Validado BIT NOT NULL DEFAULT 0,
    Preferencial BIT NOT NULL DEFAULT 0,
    CONSTRAINT FK_Contato_Cliente FOREIGN KEY (ClienteId) REFERENCES main.Cliente(ClienteId),
    CONSTRAINT UQ_Contato_Cliente_TipoValor UNIQUE (ClienteId, TipoContato, Valor),
    CHECK (TipoContato IN ('Email', 'Telefone', 'WhatsApp'))
);
GO
-- Índice filtrado para garantir apenas um contato preferencial por cliente
IF NOT EXISTS (
    SELECT * FROM sys.indexes
    WHERE name = 'IX_Contato_Cliente_Preferencial' AND object_id = OBJECT_ID('main.Contato'))
BEGIN
    CREATE UNIQUE INDEX IX_Contato_Cliente_Preferencial ON main.Contato (ClienteId)
    WHERE Preferencial = TRUE;
END
GO
-- Criação da tabela de Pedido
CREATE TABLE IF NOT EXISTS main.Pedido (
    PedidoId UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID() PRIMARY KEY,
    ClienteId UNIQUEIDENTIFIER NOT NULL,
    DataPedido DATETIME(3) NOT NULL DEFAULT SYSDATETIME(),
    StatusPedido VARCHAR(20) NOT NULL DEFAULT 'Pendente',
    SubTotal DECIMAL(10, 2) NOT NULL CHECK (SubTotal >= 0),
    Desconto DECIMAL(10, 2) NOT NULL CHECK (Desconto >= 0),
    ValorTotal DECIMAL(10, 2) NOT NULL CHECK (ValorTotal= SubTotal - Desconto AND ValorTotal >= 0),
    EnderecoLogradouro VARCHAR(50) NOT NULL,
    EnderecoNumero VARCHAR(10) NOT NULL DEFAULT 'S/N',
    EnderecoComplemento VARCHAR(100),
    EnderecoBairro VARCHAR(50) NOT NULL,
    EnderecoCidade VARCHAR(50) NOT NULL,
    EnderecoEstado CHAR(2) NOT NULL,
    EnderecoCEP CHAR(9) NOT NULL CHECK (LEN(EnderecoCEP) = 9),
    EnderecoPais VARCHAR(50) NOT NULL DEFAULT 'Brasil',
    TipoEEndereco VARCHAR(20) NOT NULL DEFAULT 'Residencial',
    CONSTRAINT FK_Pedido_Cliente FOREIGN KEY (ClienteId) REFERENCES main.Cliente(ClienteId),
    CHECK (StatusPedido IN ('Pendente', 'Processando', 'Enviado', 'Entregue', 'Cancelado'))
);
GO
-- Criação da tabela de PedidoItem
CREATE TABLE IF NOT EXISTS main.PedidoItem (
    PedidoItemId UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID() PRIMARY KEY,
    PedidoId UNIQUEIDENTIFIER NOT NULL,
    LivroId UNIQUEIDENTIFIER NOT NULL,
    Quantidade INT NOT NULL CHECK (Quantidade > 0),
    PrecoUnitarioNoMomento DECIMAL(10, 2) NOT NULL CHECK (PrecoUnitarioNoMomento >= 0),
    Desconto DECIMAL(10, 2) NOT NULL CHECK (Desconto >= 0),
    ValorTotal DECIMAL(10, 2) NOT NULL CHECK (ValorTotal >= 0),
    CONSTRAINT FK_PedidoItem_Pedido FOREIGN KEY (PedidoId) REFERENCES main.Pedido(PedidoId),
    CONSTRAINT FK_PedidoItem_Livro FOREIGN KEY (LivroId) REFERENCES main.Livro(LivroId)
);
GO
-- Criação da tabela de EstoqueMovimento
CREATE TABLE IF NOT EXISTS main.EstoqueMovimento (
    EstoqueMovimentoId UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID() PRIMARY KEY,
    LivroId UNIQUEIDENTIFIER NOT NULL,
    PedidoId UNIQUEIDENTIFIER,
    TipoMovimento CHAR(10) NOT NULL,
    Quantidade INT NOT NULL CHECK (Quantidade > 0),
    DataMovimento DATETIME(3) NOT NULL DEFAULT SYSDATETIME(),
    Observacao VARCHAR(255),
    CONSTRAINT FK_EstoqueMovimento_Livro FOREIGN KEY (LivroId) REFERENCES main.Livro(LivroId),
    CONSTRAINT FK_EstoqueMovimento_Pedido FOREIGN KEY (PedidoId) REFERENCES main.Pedido(PedidoId),
    CHECK (TipoMovimento IN ('Entrada', 'Saída', 'Ajuste'))
);
GO
-- Criaçãod e indices para otimizar consultas por LivroId e DataMovimento
IF NOT EXISTS (
    SELECT * FROM sys.indexes
    WHERE name = 'IX_EstoqueMovimento_LivroId_DataMovimento' AND object_id = OBJECT_ID('main.EstoqueMovimento'))
BEGIN
    CREATE INDEX IX_EstoqueMovimento_LivroId_DataMovimento ON main.EstoqueMovimento (LivroId, DataMovimento);
END
GO
-- Criação da tabela de FormaPagamento
CREATE TABLE IF NOT EXISTS main.FormaPagamento (
    FormaPagamentoId UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID() PRIMARY KEY,
    NomePagamento VARCHAR(100) NOT NULL,
    Ativa BIT NOT NULL DEFAULT 1
);
GO
-- Criação da tabela de FormaPagamento
CREATE TABLE IF NOT EXISTS main.FormaPagamento (
    FormaPagamentoId UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID() PRIMARY KEY,
    NomePagamento VARCHAR(100) NOT NULL,
    Ativa BIT NOT NULL DEFAULT 1
);
GO
-- Criação da tabela de Pagamento
CREATE TABLE IF NOT EXISTS main.Pagamento (
    PagamentoId UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID() PRIMARY KEY,
    PedidoId UNIQUEIDENTIFIER NOT NULL,
    FormaPagamentoId UNIQUEIDENTIFIER NOT NULL,
    ValorBruto DECIMAL(10, 2) NOT NULL CHECK (ValorBruto >= 0),
    DescontoAplicado DECIMAL(10, 2) NOT NULL CHECK (DescontoAplicado >= 0 AND DescontoAplicado <= ValorBruto),
    ValorLiquido DECIMAL(10, 2) NOT NULL CHECK (ValorLiquido >= 0),
    DataPagamento DATETIME(3) NOT NULL DEFAULT SYSDATETIME(),
    AutorizacaoStatus BIT NOT NULL DEFAULT 0,
    AutorizacaoCodigo VARCHAR(50),
    StatusPagamento VARCHAR(20) NOT NULL DEFAULT 'Pendente',
    CONSTRAINT FK_Pagamento_Pedido FOREIGN KEY (PedidoId) REFERENCES main.Pedido(PedidoId),
    CONSTRAINT FK_Pagamento_FormaPagamento FOREIGN KEY (FormaPagamentoId) REFERENCES main.FormaPagamento(FormaPagamentoId),
    CHECK (StatusPagamento IN ('Pendente', 'Autorizado', 'Falhou', 'Cancelado'))
);
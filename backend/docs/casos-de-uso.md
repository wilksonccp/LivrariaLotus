# Casos de Uso - Livraria Lotus

## 1. Cadastrar Usuário
**Ator**: Usuário  
**Objetivo**: Fazer cadastro no sistema para poder autenticar  
**Pré-condições**: Informar dados mínimos e senha segura  
**Fluxo principal**:
1. Usuário insere Nome Completo, E-mail, Telefone e Senha
2. Sistema salva os dados no banco
3. Usuário é direcionado para a tela de login

---

## 2. Autenticar Usuário
**Ator**: Usuário  
**Objetivo**: Obter token JWT para acessar funcionalidades protegidas  
**Pré-condições**: Usuário cadastrado com email e senha válidos  
**Fluxo principal**:
1. Usuário envia email e senha
2. Sistema valida credenciais
3. Sistema retorna token JWT

---

## 3. Listar Livros
**Ator**: Visitante ou Cliente  
**Objetivo**: Visualizar todos os livros disponíveis  
**Pré-condições**: Nenhuma  
**Fluxo principal**:
1. Usuário acessa a página principal
2. Sistema retorna lista de livros

---

## 4. Filtrar Livros
**Ator**: Cliente  
**Objetivo**: Encontrar livros por autor, título, gênero ou preço  
**Pré-condições**: Nenhuma  
**Fluxo principal**:
1. Usuário envia parâmetros de filtro
2. Sistema retorna lista filtrada

---

## 5. Incluir Item no Carrinho
**Ator**: Cliente  
**Objetivo**: Adicionar livro ao carrinho  
**Pré-condições**: Cliente autenticado, livro disponível  
**Fluxo principal**:
1. Cliente seleciona livro e quantidade
2. Sistema adiciona item ao carrinho ativo

---

## 6. Efetuar Pagamento
**Ator**: Cliente  
**Objetivo**: Finalizar compra dos itens no carrinho  
**Pré-condições**: Carrinho com itens, cliente autenticado  
**Fluxo principal**:
1. Cliente escolhe forma de pagamento
2. Sistema processa pagamento
3. Sistema registra pedido e atualiza estoque

---

## 7. Gerar Relatórios de Venda
**Ator**: Funcionário  
**Objetivo**: Acompanhar desempenho de vendas  
**Pré-condições**: Funcionário autenticado  
**Fluxo principal**:
1. Funcionário seleciona filtros
2. Sistema gera relatório

---

## 8. Inserir Novo Item (Livro, Autor, Gênero, Editora)
**Ator**: Funcionário  
**Objetivo**: Inserir novo item no sistema  
**Pré-condições**: Funcionário autenticado, item não existente  
**Fluxo principal**:
1. Funcionário insere dados do novo item
2. Sistema salva item no banco

---

## 9. Alterar Item Cadastrado
**Ator**: Funcionário  
**Objetivo**: Alterar informações de item existente  
**Pré-condições**: Funcionário autenticado, item existente  
**Fluxo principal**:
1. Funcionário pesquisa item
2. Realiza alterações
3. Sistema atualiza dados no banco

---

## 🔮 Futuras Implementações
- Reset de senha de cliente feito por funcionário  
- Alterações de dados cadastrais feitas pelo próprio cliente
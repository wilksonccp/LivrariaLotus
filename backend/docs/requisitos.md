# Requisitos - Livraria Lotus

## 📌 Visão Geral
A Livraria Lotus é uma aplicação web voltada para venda de livros, permitindo que clientes visualizem o catálogo, adicionem itens ao carrinho e realizem pagamentos. Funcionários têm acesso a relatórios de vendas.

---

## ✅ Requisitos Funcionais

1. **Listar livros disponíveis**
   - Qualquer usuário pode visualizar o catálogo de livros.

2. **Filtrar livros**
   - Filtros por autor, título, gênero e faixa de preço.

3. **Autenticar usuário**
   - Login via email e senha, com retorno de token JWT.

4. **Adicionar itens ao carrinho**
   - Clientes autenticados podem incluir livros e definir quantidade.

5. **Efetuar pagamento**
   - Clientes podem finalizar a compra dos itens no carrinho.

6. **Gerar relatórios de venda**
   - Funcionários autenticados podem gerar relatórios por livro, categoria e período.

---

## 🚫 Requisitos Não Funcionais

1. **Segurança**
   - Autenticação via JWT para proteger endpoints privados.

2. **Desempenho**
   - As pesquisas e filtros devem ser otimizados para resposta rápida.

3. **Persistência**
   - Histórico de carrinhos e pagamentos deve ser mantido.

4. **Documentação**
   - API documentada via Swagger para facilitar testes e integração.

---

## 👥 Tipos de Usuário

- **Cliente**
  - Pode visualizar livros, adicionar ao carrinho e realizar pagamentos.

- **Funcionário**
  - Pode autenticar e gerar relatórios de venda.

---

## 🔐 Regras de Negócio

- Usuários precisam estar autenticados para comprar ou gerar relatórios.
- Visualização de livros é pública.
- Cada cliente pode ter múltiplos carrinhos (histórico).
- Funcionário é um tipo de usuário com permissões específicas.

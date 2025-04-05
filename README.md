# 🛒 Projeto Ecommerce - Modelagem de Dados
## Desafio Bootcamp DIO - Heineken - Inteligência Artificial Aplicada a Dados com Copilot

## 📖 Descrição

Este projeto apresenta a modelagem de dados de um sistema de **Ecommerce**, em que produtos são vendidos por uma plataforma online e podem ser ofertados por diferentes vendedores (terceiros). A modelagem considera clientes (PF e PJ), produtos, pedidos, pagamentos e entregas, respeitando as principais regras de negócio envolvidas em uma operação de vendas online.

---

## 📚 Narrativas de Negócio

### 🛍 Produto
- Os produtos são vendidos exclusivamente por uma **plataforma online**.
- Podem ter **vendedores distintos** (terceiros).
- Cada produto possui um **único fornecedor**.
- Um ou mais produtos podem compor um **pedido**.

### 👥 Cliente
- O cliente pode se cadastrar com **CPF (Pessoa Física)** ou **CNPJ (Pessoa Jurídica)**.
- Um cliente **só pode ser PF ou PJ**, nunca ambos.
- O **endereço do cliente** é utilizado para calcular o valor do **frete**.
- Um cliente pode realizar **vários pedidos**.
- Cada pedido possui um período de **carência para devolução**.

### 🧾 Pedido
- Os pedidos são criados por **clientes**.
- Contêm informações sobre:
  - Produtos adquiridos
  - Endereço de entrega
  - Status da entrega
- Um pedido pode ser **cancelado**.
- Pode conter **uma ou mais formas de pagamento**.

---

## 💳 Pagamento

- Cada pedido pode conter **diversas formas de pagamento** (ex: parte no cartão, parte no Pix).
- A modelagem possui uma tabela `Forma de Pagamento` genérica com especializações:
  - `FormaPagamento_Cartao`
  - `FormaPagamento_Pix`
  - `FormaPagamento_Boleto`
- Uma tabela intermediária (`PagamentoForma`) relaciona **pagamentos com valores parciais** a um pedido.

---

## 🚚 Entrega

- Cada pedido possui informações de entrega:
  - **Status da entrega** (ex: Pendente, Enviado, Entregue, Cancelado)
  - **Código de rastreio**

---

## 📌 Regras de Modelagem

- Um cliente deve ser **exclusivamente PF ou PJ**.
- Pagamentos podem ser compostos por **múltiplas formas de pagamento**.
- Cada forma de pagamento possui **atributos específicos**.
- O sistema deve possibilitar o **rastreamento de entrega**.
- A modelagem suporta **devoluções dentro do período de carência**.



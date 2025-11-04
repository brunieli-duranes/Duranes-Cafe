# ☕ Duranes Café - Sistema de Pedidos e Produtos

## 🎯 Descrição do Projeto
O **Duranes Café** é um sistema desenvolvido como parte do **Módulo 3** da disciplina de **Banco de Dados**.  
O objetivo é criar e manipular um **banco de dados relacional** para gerenciar **produtos e pedidos** de um pequeno café, aplicando também o **controle de versão com Git e GitHub**.

---

## 🧩 Objetivos do Projeto
- Modelar um banco de dados normalizado, utilizando entidades e relacionamentos adequados.  
- Implementar as tabelas, chaves primárias e estrangeiras com SQL.  
- Executar operações de manipulação de dados (inserção, atualização, remoção e consultas).  
- Versionar o projeto com **Git**, registrando os commits e publicando o código no **GitHub**.  

---

## 🧱 Estrutura do Banco de Dados

O banco de dados se chama **DuranesCafe** e contém **quatro tabelas principais**, interligadas por relacionamentos:

| Tabela | Descrição |
|--------|------------|
| **Categorias** | Armazena os tipos de produtos (Bebidas, Salgados, Doces). |
| **Produtos** | Contém os produtos disponíveis, seus preços e a categoria correspondente. |
| **Pedidos** | Registra os pedidos feitos pelos clientes, com data e forma de pagamento. |
| **Itens_Pedido** | Relaciona os produtos aos pedidos, permitindo múltiplos itens por pedido. |

---

## 🧮 Estrutura Relacional (DER Simplificado)


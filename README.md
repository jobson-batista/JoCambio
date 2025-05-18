# JoCambio

JoCambio é um app de conversão de moedas que permite ao usuário consultar taxas de câmbio em tempo real e realizar conversões de forma simples e intuitiva.

## Imagens do app

<div style="display: flex; flex-wrap: wrap; gap: 10px;">
  <img src="https://github.com/user-attachments/assets/dc14ade1-4140-447b-bd85-97363ec7fd16" width="30%" />
  <img src="https://github.com/user-attachments/assets/6e7c6657-2e86-4c5f-841e-e98537227b14" width="30%" />
  <img src="https://github.com/user-attachments/assets/f88a0a88-2d53-4368-8b5d-40fd0b3c1b04" width="30%" />
  <img src="https://github.com/user-attachments/assets/c9d10017-63eb-43ae-903d-61832e289d66" width="30%" />
  <img src="https://github.com/user-attachments/assets/8af5ddff-5f61-4f4a-8334-6a0c5d64f2bb" width="30%" />
  <img src="https://github.com/user-attachments/assets/d3597bfc-a531-414c-9735-0e26665e6d9e" width="30%" />
</div>



## Telas Principais

### Conversão de Moedas

- [x] Seleção de moeda de origem e destino.
- [x] Campo de entrada para o valor a ser convertido.
- [x] Exibição do valor convertido em tempo real.

### Listagem de Moedas

- [x] Exibe uma lista de moedas disponíveis com código e nome.
- [x] Tela dedicada separada da tela de conversão.

## Features

### Obrigatórias

- [x] Obtenção das moedas suportadas via API `/list`.
- [x] Obtenção das taxas de câmbio em tempo real via API `/live`.
- [x] Tratamento de erros:

  - [x] Fluxos de exceção.
  - [x] Busca vazia.
  - [ ] Feedback de carregamento e falhas.

### Opcionais

- [x] Busca na lista de moedas por nome ou código.
- [x] Ordenação da lista de moedas.
- [ ] Persistência local de moedas e taxas.
- [ ] Testes unitários e/ou funcionais.
- [x] Arquitetura MVVM.
- [ ] Pipeline de CI/CD.

## Tecnologias Utilizadas

* Swift
* UIKit
* URLSession
* MVVM

## API Utilizada

* [Supported Currencies (`/list`)](https://api.exchangeratesapi.io/v1/list)
* [Real-time Rates (`/live`)](https://api.exchangeratesapi.io/v1/live)

## Este projeto é a resolução do Desafio do BTG Pactual para vaga de Dev Mobile (iOS ou Android)

* Veja o desafio técnico [aqui](https://github.com/btg-mobile/mobile-challenge)


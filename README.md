# JoCambio

JoCambio é um app de conversão de moedas que permite ao usuário consultar taxas de câmbio em tempo real e realizar conversões de forma simples e intuitiva.

## Telas Principais

### Conversão de Moedas

* Seleção de moeda de origem e destino.
* Campo de entrada para o valor a ser convertido.
* Exibição do valor convertido em tempo real.

### Listagem de Moedas

* Exibe uma lista de moedas disponíveis com código e nome.
* Tela dedicada separada da tela de conversão.

## Features

### Obrigatórias

* Obtenção das moedas suportadas via API `/list`.
* Obtenção das taxas de câmbio em tempo real via API `/live`.
* Tratamento de erros:

  * Fluxos de exceção.
  * Busca vazia.
  * Feedback de carregamento e falhas.

### Opcionais

* Busca na lista de moedas por nome ou código.
* Ordenação da lista de moedas.
* Persistência local de moedas e taxas.
* Testes unitários e/ou funcionais.
* Arquitetura MVVM.
* Pipeline de CI/CD.

## Tecnologias Utilizadas

* Swift
* UIKit
* URLSession
* MVVM

## API Utilizada

* [Supported Currencies (`/list`)](https://api.exchangeratesapi.io/v1/list)
* [Real-time Rates (`/live`)](https://api.exchangeratesapi.io/v1/live)

## Esse projeto é a resolução do Desafio do BTG Pactual para vaga de Dev Mobile (iOS ou Android)

* Veja o desafio técnico [aqui](https://github.com/btg-mobile/mobile-challenge)


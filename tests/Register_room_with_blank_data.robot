*** Settings ***
Resource        ../resources/main.robot
Resource        ../resources/pages/rooms.robot
Test Setup      Dado que eu acesse o GEP e faça o login pelo navegador
Test Teardown   Fechar o navegador

*** Test Cases ***   
Cadastrar sala com nome em branco
    Dado que logue na pagina
    E clique em salas na navbar
    Quando clique no botão adicinar na grid
    Então cadastra sala com nome em branco

Cadastrar sala com sigla em branco
    Dado que logue na pagina
    E clique em salas na navbar
    Quando clique no botão adicinar na grid
    Então cadastra sala com sigla em branco
*** Settings ***
Resource        ../resources/main.robot
Resource        ../resources/pages/rooms.robot
Test Setup      Dado que eu acesse o GEP e faça o login pelo navegador
Test Teardown   Fechar o navegador

*** Test Cases ***   
Verificar se ao fazer login redirecinameto foi para a pagina do GEP
    Dado que logue na pagina     

Verificar se ao precher corretamete os campos do crud de salas uma sala é criada e adicionada na grid
    Dado que logue na pagina
    E clique em salas na navbar
    Quando clique no botão adicinar na grid
    E clique no botão adicinar baia
    Enatão prencher os campos do formulario e verifique 1 sala com baia esperada


Verificar se ao precher corretamete os campos do crud de salas uma sala é criada sem baia
    Dado que logue na pagina
    E clique em salas na navbar
    Quando clique no botão adicinar na grid
    Enatão prencher os campos do formulario e verifique 1 sala sem baia
    



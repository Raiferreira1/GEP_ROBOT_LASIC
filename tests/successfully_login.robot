*** Settings ***
Resource        ../resources/main.robot
Resource        ../resources/pages/rooms.robot
Test Setup      Dado que eu acesse o GEP e faça o login pelo navegador
Test Teardown   Fechar o navegador


*** Test Cases ***
Verificar se ao fazer login redirecinameto foi para a pagina do GEP
    Dado que logue na pagina     

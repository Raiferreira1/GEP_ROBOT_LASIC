*** Settings ***
Resource        ../resources/main.robot
Resource        ../resources/pages/rooms.robot
Test Setup      Dado que eu acesse o GEP e faça o login pelo navegador
Test Teardown   Fechar o navegador

*** Test Cases ***   
Verificar se uma sala invalida pode ser encotrada
    Dado que logue na pagina
    E clique em salas na navbar
    Então pesquise uma sala por um dado invalido
    

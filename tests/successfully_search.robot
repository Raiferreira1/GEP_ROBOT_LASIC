*** Settings ***
Resource        ../resources/main.robot
Resource        ../resources/pages/rooms.robot
Test Setup      Dado que eu acesse o GEP e faça o login pelo navegador
Test Teardown   Fechar o navegador

*** Test Cases ***   
Verificar se ao ter pelo menos 1 sala criada ela pode ser editada
    Dado que logue na pagina
    E clique em salas na navbar
    Então pequise uma sala
    
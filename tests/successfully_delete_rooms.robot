*** Settings ***
Resource        ../resources/main.robot
Resource        ../resources/pages/rooms.robot
Test Setup      Dado que eu acesse o GEP e faça o login pelo navegador
Test Teardown   Fechar o navegador

*** Test Cases ***   
Verificar se ao ter pelo menos 1 sala criada ela pode ser deletada
    Dado que logue na pagina
    E clique em salas na navbar
    Então delete primera sala 
Verificar se ao canceler um sala de ser deletada ela permanece na grid
    Dado que logue na pagina
    E clique em salas na navbar
    Então cancele a deleção de uma sala
    
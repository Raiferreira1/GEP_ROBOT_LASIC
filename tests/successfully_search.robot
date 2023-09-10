*** Settings ***
Resource        ../resources/main.robot
Resource        ../resources/pages/rooms.robot
Test Setup      Dado que eu acesse o GEP e faça o login pelo navegador
Test Teardown   Fechar o navegador

*** Test Cases ***   
Verificar se ao ter pelo menos 1 sala criada ela pode ser encotrada pelo nome
    Dado que logue na pagina
    E clique em salas na navbar
    Então pesquise uma sala pelo nome
    

Verificar se ao ter pelo menos 1 sala criada ela pode ser encotrada pela sigla
    Dado que logue na pagina
    E clique em salas na navbar
    Então pesquise uma sala pela sigla



Verificar se ao ter pelo menos 1 sala criada ela pode ser encotrada pela observation
    Dado que logue na pagina
    E clique em salas na navbar
    Então pesquise uma sala pela observação
    
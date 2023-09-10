*** Settings ***
Resource        ../resources/main.robot
Resource        ../resources/pages/rooms.robot
Test Setup      Dado que eu acesse o GEP e faça o login pelo navegador
Test Teardown   Fechar o navegador

*** Test Cases ***   
Verificar se ao ter pelo menos 1 sala criada ela pode ter o nome editado
    Dado que logue na pagina
    E clique em salas na navbar
    Então edite nome da sala

Verificar se ao ter pelo menos 1 sala criada ela pode ter a sigla editada
    Dado que logue na pagina
    E clique em salas na navbar
    Então edite sigla da sala
 

Verificar se ao ter pelo menos 1 sala criada ela pode ter a sigla e a nome editados
    Dado que logue na pagina
    E clique em salas na navbar
    Então edite sigla e nome da sala
 

Verificar se ao ter pelo menos 1 sala criada ela pode ter a observação editada
    Dado que logue na pagina
    E clique em salas na navbar
    Então edite observação da sala
 
 
 
 
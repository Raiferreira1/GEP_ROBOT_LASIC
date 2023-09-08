*** Settings ***
Resource    ../main.robot
Resource    ../pages/rooms.robot
*** Variables ***
${LOGIN_BUTTON}       id:google-btn
${INPUT_EMAIL}        id:identifierId
${INPUT_PASSWORD}     xpath:  //*[@type="password"]
${LOGIN}              testeqa07@gmail.com
${PASSWORD}           88881860


*** Keywords ***
Dado que eu acesse o GEP e faça o login pelo navegador
    Open Browser    url=http://localhost:3000    browser=Chrome

    Esperar Elemento Visível e Clicável  ${LOGIN_BUTTON}
    Click Button    ${LOGIN_BUTTON}

    Esperar Elemento Visível e Clicável    ${INPUT_EMAIL}
    Input Text    ${INPUT_EMAIL}    ${LOGIN}
    Press Keys    ${INPUT_EMAIL}     RETURN

    Esperar Elemento Visível e Clicável    ${INPUT_PASSWORD}
    Input Text   ${INPUT_PASSWORD}    ${PASSWORD}    
    Press Keys    ${INPUT_PASSWORD}     RETURN  
 
Fechar o navegador
    close browser
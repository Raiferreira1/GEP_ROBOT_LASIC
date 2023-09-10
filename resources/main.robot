*** Settings ***
Library         SeleniumLibrary
Library         FakerLibrary    locale=pt_BR
Library         Collections

Resource        shared/setup_teardown.robot


*** Keywords ***
Esperar Elemento Visível e Clicável
    [Arguments]    ${elemento}
    Wait Until Element Is Visible    ${elemento}    timeout=20s    error=Elemento não está visível
    Wait Until Element Is Enabled    ${elemento}


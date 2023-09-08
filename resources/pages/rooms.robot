*** Settings ***
Resource  ../main.robot



*** Variables ***
${HOME_PAGE_URL}                   http://localhost:3000/home
${CRUD_ROOMS}                      link: Salas
${BTN_ADD_GRID}                    id:Add
${INPUT_SEARCH_GRID}               id:input-search-data-grid
${BTN_EDIT_GRID}                   id:barrosTomeSeuId0
${BTN_DEL_GRID}                    id:humbertoTomeSeuId0
${BTN_ADD_SPACE}                   id:add-space-btn
${ROOM_ADD_INPUT_NAME}             id:name-room-textfield
${ROOM_ADD_INPUT_ACRONYM}          id:abbreviation-room-textfield
${ROOM_ADD_INPUT_OBS}              id:description-room-textfield
${ROOM_ADD_BUTTON_CANCEL}          id cancel-bnt
${ROOM_ADD_BUTTON_SALVAR}          id:save-bnt
${ROOM_ADD_DEL_SPACE}              id:trash-icon-0
${ROOM_ADD_SPACE_INPUT_NAME}       id:space-room-textfield-0
${ROOM_ADD_SPACE_INPUT_ACRONYM}    id:abbreviation-room-textfield-0
${ROOM_ADD_SPACE_INPUT_OBS}        id:observation-room-textfield-0
${ROOM_DELETE_CONFIRM_BUTTON}      id:confirm-btn
${ROOM_TABLE_ACRONYM}              xpath:  //tbody//tr[1]/td[@scope="row"][1]
${ROOM_TABLE_NAME}                 xpath:  //tbody//tr[1]/td[@scope="row"][2]
${ROOM_TABLE_OBS}                  xpath:  //tbody//tr[1]/td[@scope="row"][3]
${TABLE_SELECTOR}                  css:table.max-h-full

*** Keywords ***
Dado que logue na pagina
     Wait Until Location Is    ${HOME_PAGE_URL}     10s 
     Location Should Be        ${HOME_PAGE_URL}
E clique em salas na navbar
   Esperar Elemento Visível e Clicável  ${CRUD_ROOMS}
   Click Element     ${CRUD_ROOMS}
Quando clique no botão adicinar na grid
   Esperar Elemento Visível e Clicável    ${BTN_ADD_GRID}
   Click Element     ${BTN_ADD_GRID}

E clique no botão adicinar baia
     Esperar Elemento Visível e Clicável   ${BTN_ADD_SPACE}
     Click Element    ${BTN_ADD_SPACE}

Enatão prencher os campos do formulario e verifique 1 sala esperada
    
   ${RANDOM_WORD} =    FakerLibrary.Word
   ${NAME_ROOM} =    Catenate    lab        ${RANDOM_WORD}
    Input Text    ${ROOM_ADD_INPUT_NAME}    ${NAME_ROOM}
    
    ${ACRONYM_ROOM}      FakerLibrary.Word 
    Input Text    ${ROOM_ADD_INPUT_ACRONYM}    ${ACRONYM_ROOM}

    ${OBS_ROOM}     FakerLibrary.Sentence
    Input Text    ${ROOM_ADD_INPUT_OBS}    ${OBS_ROOM}
    
    ${RANDOM_WORD}     FakerLibrary.Word
    ${SPACE_NAME}     Catenate    space           ${RANDOM_WORD}
    Input Text    ${ROOM_ADD_SPACE_INPUT_NAME}    ${SPACE_NAME}

    ${ACRONYM_SPACE}  FakerLibrary.Word 
    Input Text    ${ROOM_ADD_SPACE_INPUT_ACRONYM}    ${ACRONYM_SPACE}

    ${OBS_SPACE}  FakerLibrary.Sentence
    Input Text    ${ROOM_ADD_SPACE_INPUT_OBS}    ${OBS_SPACE}

    Click Element    ${ROOM_ADD_BUTTON_SALVAR}
    
    
    Wait Until Page Contains Element    ${TABLE_SELECTOR}  10s
    ${LIST_DATA_TO_CHECK}    Create List   ${ACRONYM_ROOM}  ${NAME_ROOM}   ${OBS_ROOM}
    ${CELLS}       Get WebElements         ${TABLE_SELECTOR} tbody tr td
    ${LIST_CELL_TEXTS}     Create List  
    
    FOR    ${CELL}    IN    @{CELLS}
        ${texto_da_linha}     Get Text    ${CELL}  
        Append To List    ${LIST_CELL_TEXTS}    ${texto_da_linha}  
    END  
    List Should Contain Sub List    ${LIST_CELL_TEXTS}    ${LIST_DATA_TO_CHECK}
    

    
Então delete primera sala 
    Esperar Elemento Visível e Clicável  ${BTN_DEL_GRID}
    Click Element    ${BTN_DEL_GRID}
    Esperar Elemento Visível e Clicável  ${ROOM_DELETE_CONFIRM_BUTTON}
    Click Element    ${ROOM_DELETE_CONFIRM_BUTTON}

Então edite primera sala
    Esperar Elemento Visível e Clicável   ${BTN_EDIT_GRID}
    Click Element    ${BTN_EDIT_GRID}
    
   ${RANDOM_WORD}     FakerLibrary.Word
   ${NAME_ROOM}     Catenate    lEdit    ${RANDOM_WORD}

    Esperar Elemento Visível e Clicável    ${ROOM_ADD_INPUT_NAME}
    Input Text    ${ROOM_ADD_INPUT_NAME}    ${NAME_ROOM}
    Clear Element Text   ${ROOM_ADD_INPUT_NAME}

    Input Text    ${ROOM_ADD_INPUT_NAME}    ${NAME_ROOM}
    Click Element    ${ROOM_ADD_BUTTON_SALVAR}
    
    Wait Until Page Contains Element    ${TABLE_SELECTOR}
    ${LIST_DATA_TO_CHECK}    Create List     ${NAME_ROOM}  
    ${CELLS}    Get WebElements    ${TABLE_SELECTOR} tbody tr td
    ${LIST_CELL_TEXTS}     Create List  
    
    FOR    ${CELL}    IN    @{CELLS}
        ${texto_da_linha}     Get Text    ${CELL}  
        Append To List    ${LIST_CELL_TEXTS}    ${texto_da_linha}  
    END  
  
    List Should Contain Sub List    ${LIST_CELL_TEXTS}    ${LIST_DATA_TO_CHECK}

Então pequise uma sala
    Wait Until Element Is Visible    ${INPUT_SEARCH_GRID}
    ${SEARSH_TEXT}  Get Text    ${ROOM_TABLE_NAME}
    Input Text    ${INPUT_SEARCH_GRID}   ${SEARSH_TEXT}  
    Element Text Should Be    ${ROOM_TABLE_NAME}    ${SEARSH_TEXT}       

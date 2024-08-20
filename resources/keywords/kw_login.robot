*** Settings ***
Resource    ../main.robot

*** Keywords ***
Login auth
    ${body}=    Create Dictionary   
    ...    mail=sysadmin@qacoders.com    
    ...    password=1234@Test    

    Log    ${body}

    ${resposta}=    POST On Session    
    ...    alias=su    
    ...    url=/api/login    
    ...    json=${body}    
    ...    expected_status=200
    Log    ${resposta.json()}

    Set Global Variable    ${TOKEN}        ${resposta.json()['token']}
    Status Should Be       200   
    Should Be Equal        ${TOKEN}        ${resposta.json()['token']}
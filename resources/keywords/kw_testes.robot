*** Settings ***
Resource    ../main.robot

*** Keywords ***
Login admin
    Criar sessao
    Login auth

Criar sessao
    ${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json
    Create Session    alias=su    url=${url_suits}    headers=${headers}    verify=true
*** Settings ***
Resource    ../resources/main.robot
Suite Setup  Criar sessao

*** Test Cases ***
Login com sucesso
    [Tags]    CT001
    Login auth
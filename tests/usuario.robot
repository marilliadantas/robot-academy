*** Settings ***
Resource    ../resources/main.robot
Suite Setup      Login admin
Suite Teardown   Deletar usuario

*** Test Cases ***
Cadastrar usuario com sucesso
    Cadastrar usuario

Listar usuarios
    Listar usuarios

Contar usuarios
    Contar usuarios
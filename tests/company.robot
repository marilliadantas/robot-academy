*** Settings ***
Resource    ../resources/main.robot
Suite Setup      Login admin

*** Test Cases ***
Cadastrar empresa com sucesso
    Criar empresa
    Deletar empresa

Listar empresas
    Listar empresas

Contar empresas
    Contar empresa

Atualizar empresa
    Criar empresa
    Atualizar empresa

Deletar empresa
    Criar empresa
    Deletar empresa
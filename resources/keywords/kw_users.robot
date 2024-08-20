*** Settings ***
Resource    ../main.robot

*** Keywords ***
Cadastrar usuario
    ${nome}         gerarNome
    ${email}        gerarEmail
    ${cpf}          FakerLibrary.cpf
    ${cpf}          Remove String    ${cpf}    .    -
    ${password}     gerarPassword
    
    ${headers}=    Create Dictionary    Authorization=${TOKEN}

    ${body}=    Create Dictionary    
    ...    fullName=${nome}    
    ...    mail=${email}   
    ...    password=${password}   
    ...    accessProfile=${ACESSO}   
    ...    cpf=${cpf}
    ...    confirmPassword=${password}   

    Log    ${body}
    ${resposta}=    POST On Session    alias=su    url=/api/user    headers=${headers}    json=${body}    expected_status=201
    Log    ${resposta.json()}
    Set Global Variable    ${ID_USER}    ${resposta.json()['user']['_id']}

Listar usuarios
    ${headers}=     Create Dictionary    Authorization=${TOKEN}
    ${resposta}=    GET On Session       alias=su    url=/api/user    headers=${headers}    expected_status=200     
    Log    ${resposta.json()}   

Contar usuarios
    ${headers}=     Create Dictionary    Authorization=${TOKEN}
    ${resposta}=    GET On Session       alias=su    url=/api/user/count    headers=${headers}    expected_status=200
    Log    ${resposta.json()}

Deletar usuario
    ${headers}=     Create Dictionary    Authorization=${TOKEN}
    ${resposta}=    DELETE On Session    alias=su    url=/api/user/${ID_USER}    headers=${headers}    expected_status=200
    Log    ${resposta}
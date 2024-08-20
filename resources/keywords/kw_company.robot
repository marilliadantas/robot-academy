*** Settings ***
Resource    ../main.robot

*** Keywords ***
Criar empresa
    ${headers}    Create Dictionary    Authorization=${TOKEN}
    ${cnpj}=      FakerLibrary.cnpj
    ${cnpj}=      Remove String   ${cnpj}    .    -    /

    ${address}    Create Dictionary    
    ...    zipCode=04777001    
    ...    city=São Paulo
    ...    state=SP    
    ...    district=Rua das Flores    
    ...    street=Avenida Interlagos    
    ...    number=50
    ...    complement=ao lado de biritiba    
    ...    country=Brasil  
    
    ${address}    Create List    ${address}

    ${body}    Create Dictionary      
    ...    corporateName=Teste do Teste    
    ...    registerCompany=${cnpj}
    ...    mail=test@test.com    
    ...    matriz=Teste    
    ...    responsibleContact=Marcio   
    ...    telephone=99999999999999    
    ...    serviceDescription=Testes    
    ...    address=${address}

    ${resposta}=    POST On Session    alias=su    url=/api/company    headers=${headers}    json=${body}    expected_status=201
    Set Global Variable    ${ID_COMPANY}     ${resposta.json()['newCompany']['_id']}    
    Log    ${resposta.json()}

Listar empresas
    ${headers}=     Create Dictionary    Authorization=${TOKEN}
    ${resposta}=    GET On Session       alias=su    url=/api/company    headers=${headers}    expected_status=200     
    Log    ${resposta.json()}   
    
Contar empresa
    ${headers}=     Create Dictionary    Authorization=${TOKEN}
    ${resposta}=    GET On Session       alias=su    url=/api/company/count    headers=${headers}    expected_status=200
    Log    ${resposta.json()}

Atualizar empresa
    ${headers}=    Create Dictionary    Authorization=${TOKEN}

    ${body}        Create Dictionary      
    ...    corporateName=${EMPTY}    
    ...    registerCompany=${EMPTY}
    ...    mail=${EMPTY}    
    ...    matriz=${EMPTY}    
    ...    responsibleContact=${EMPTY}  
    ...    telephone=${EMPTY}   
    ...    serviceDescription=${EMPTY}    
    ...    address=${EMPTY}
    
    ${resposta}=    PUT On Session    alias=su    url=/api/company/${ID_COMPANY}    headers=${headers}    json=${body}    expected_status=201
    Log    ${resposta}

Deletar empresa
    ${headers}=     Create Dictionary    Authorization=${TOKEN}
    ${resposta}=    DELETE On Session    alias=su    url=/api/company/${ID_COMPANY}    headers=${headers}    expected_status=200
    Log    ${resposta}
*** Settings ***
Documentation    Arquivo com keywords de geração de massa
Resource         ../main.robot

*** Keywords ***
gerarNome
    ${nome}=              Generate Random String    10    [LOWER]
    ${sobrenome}=         Generate Random String    10    [UPPER]
    ${nome_composto}=     Catenate                  ${nome}    ${sobrenome}
    ${nome_composto}      Evaluate                  "${nome_composto}".title()
    RETURN   ${nome_composto}

gerarEmail
    ${nome}=       Generate Random String    10    [LOWER]
    ${dominio}=    Set Variable              @exemple.com
    RETURN         ${nome}${dominio}

gerarEmailPersonalizado
    ${nome}        Generate Random String    10    [LOWER]
    ${dominio}     Evaluate                  random.choice(['@gmail.com', '@yahoo.com', '@outlook.com'])

    RETURN    ${nome}    ${dominio}

gerarEstado
    ${estado} =    Evaluate    random.choice(['PI', 'SP', 'MA'])    
    RETURN    ${estado}   

gerarCpf
    ${cpf} =     Generate Random String    11    [NUMBERS]
    RETURN    ${cpf}

gerarCep
    ${cep} =     Generate Random String    8    [NUMBERS]
    RETURN    ${cep}

gerarNumero
    ${numero} =     Generate Random String    13    [NUMBERS]
    RETURN    ${numero}

gerarPassword
    ${password_numero} =         Generate Random String    3    [NUMBERS]
    ${password_letras}=          Generate Random String    2    [LOWER]
    ${password_letras1}=         Generate Random String    2    [UPPER]
    ${caracteres_especiais} =    Generate Random String    1    @#$%
    ${password}=    Catenate    ${password_numero}${caracteres_especiais}${password_letras}${password_letras1}
    RETURN    ${password}

gerarNomeDiretoria
    ${nome} =     Generate Random String    5    [LOWER]
    ${nome_personalizado} =    Evaluate    "${nome}".title()
    RETURN    ${nome_personalizado}
*** Settings ***
Documentation   Tarefa 5 do curso de Robot Framework da Udemy
Library    String

*** Variable ***
&{PESSOA}       nome=João   sobrenome=Batista

*** Test Cases ***
Mostrar email gerado
    Gerar um email

*** Keywords ***
Gerar um email
    ${RES}    Unir nome e sobrenome com string    ${PESSOA.nome}    ${PESSOA.sobrenome}
    Log    ${RES}

Unir nome e sobrenome com string
    [Arguments]    ${NOME}    ${SOBRENOME}
    ${RANDOM_STRING}    Generate Random String
    ${RES}    Set Variable    ${NOME}${SOBRENOME}${RANDOM_STRING}@teste.com
    [Return]    ${RES}
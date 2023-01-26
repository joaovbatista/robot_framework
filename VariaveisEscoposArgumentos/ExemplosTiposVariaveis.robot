*** Settings ***
Resource    ../WebTesting/amazon_resources.robot
Documentation   Exemplo de tipos de variáveis: SIMPLES, LISTAS e DICIONÁRIOS
*** Variable ***
#Simples
${SIMPLES}   Vamos ver os tipos de variáveis no robot!

#Tipo Lista (arrays) - separar itens com espaço duplo
@{FRUTAS}    morango   banana   maça   uva   abacaxi

#Tipo Dicionário (chave=valor) - separar cada chave=valor com espaço duplo
&{PESSOA}    nome=May Fernandes   email=mayfernandes@exemplo.com.br   idade=28   sexo=feminino

@{MES}    janeiro    fevereiro    março    abril    maio    junho    julho    agosto    setembro    outubro    novembro    dezembro

&{CALENDARIO}    janeiro=31    fevereiro=28    março=31    abril=30    maio=31    junho=30    julho=30    agosto=31    setembro=30    outubro=31    novembro=30    dezembro=31

*** Test Cases ***
Caso de teste de exemplo 01
    Uma keyword qualquer 01

*** Keywords ***
Uma keyword qualquer 01
    # Lendo um valor Simples
    Log    ${SIMPLES}

    # Lendo um item de uma Lista
    Log    Essa tem que ser maça: ${FRUTAS[2]} e essa tem que ser morango: ${FRUTAS[0]}

    # Lendo chaves de um Dicionário
    Log    Nome: ${PESSOA.nome} e email: ${PESSOA.email}
    
    Log To Console    message=O mês ${MES[0]} tem ${CALENDARIO.janeiro}. 
    Log To Console    message=O mês ${MES[1]} tem ${CALENDARIO.fevereiro}.
    Log To Console    message=O mês ${MES[2]} tem ${CALENDARIO.março}.
    Log To Console    message=O mês ${MES[3]} tem ${CALENDARIO.abril}.
    Log To Console    message=O mês ${MES[4]} tem ${CALENDARIO.maio}.
    Log To Console    message=O mês ${MES[5]} tem ${CALENDARIO.junho}.
    Log To Console    message=O mês ${MES[6]} tem ${CALENDARIO.julho}.
    Log To Console    message=O mês ${MES[7]} tem ${CALENDARIO.agosto}.
    Log To Console    message=O mês ${MES[8]} tem ${CALENDARIO.setembro}.
    Log To Console    message=O mês ${MES[9]} tem ${CALENDARIO.outubro}.
    Log To Console    message=O mês ${MES[10]} tem ${CALENDARIO.novembro}.
    Log To Console    message=O mês ${MES[11]} tem ${CALENDARIO.dezembro}.

  

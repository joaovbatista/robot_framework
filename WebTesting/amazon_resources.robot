*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                         https://www.amazon.com.br/
${MENU_ELETRONICOS}            //a[contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}          //h1[contains(.,'Eletrônicos e Tecnologia')]
*** Keywords ***

Abrir o navegador
    Open Browser    browser=edge
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS} 
    # dentro do XPath //a[contains(.,'Eletrônicos')] o 'Eletrônicos' pode ser subistituido por uma variável passada como parâmetro

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    # um exemplo do que foi comentado na linha 23
    # aqui pôde ser feita a subistituição total da variável, ja que o parâmetro é passado como texto, e usado como texto, o que não se repete em baixo
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}
    # aqui poderia ser usado da seguinte forma: //h1[contains(.,'${FRASE}')] ja que a variável ${FRASE} contem o texto 'Eletrônicos e Tecnologia'

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//img[contains(@alt,'${NOME_CATEGORIA}')]
    #um exemplo na prática do que foi comentado na linha 29

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

Verificar o resultado da pesquisa, listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=//span[@class='a-color-state a-text-bold'][contains(.,'"${PRODUTO}"')]    
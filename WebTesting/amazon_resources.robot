*** Settings ***
Library    SeleniumLibrary
Library    Screenshot

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


#GHERKIN STEPS#


Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"
    
Quando pesquisar pelo produto "${PRODUTO}"
    Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão de pesquisa
    
Então o título da página deve ficar "${TITULO}"
    Verificar se o título da página fica "${TITULO}"
    
E um produto da linha "${PRODUTO}" deve ser mostrado na página
    Verificar o resultado da pesquisa, listando o produto "${PRODUTO}"

Quando adicionar o produto "Console Xbox Series S" no carrinho
    Wait Until Element Is Visible    locator=//img[contains(@alt,'Xbox Series S')]
    Click Element    locator=//img[contains(@alt,'Xbox Series S')]
    Wait Until Element Is Visible    locator=//input[contains(@name,'submit.add-to-cart')]
    Click Button    locator=//input[contains(@name,'submit.add-to-cart')]

Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
    Wait Until Element Is Visible    locator=//span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]

Quando adiciono o produto ao carrinho
    Quando pesquisar pelo produto "Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página
    Quando adicionar o produto "Console Xbox Series S" no carrinho
    Então o produto "Console Xbox Series S" deve ser mostrado no carrinho

E existe o produto "Console Xbox Series S" no carrinho
    Click Element    locator=//span[@aria-hidden='true'][contains(.,'Carrinho')]
    Wait Until Element Is Visible    locator=//span[@class='a-truncate-cut'][contains(.,'Xbox Series S')]

Quando remover o produto "Console Xbox Series S" do carrinho
    Wait Until Element Is Visible    locator=//input[contains(@name,'submit.delete')]
    Click Element    locator=//input[contains(@name,'submit.delete')]

Então o carrinho deve ficar vazio
    Wait Until Element Is Visible    locator=//span[@class='a-size-base'][contains(.,'Xbox Series S')]
    Capture Page Screenshot

*** Settings ***
Library    SeleniumLibrary



*** Variables ***
${URL}    https://www.amazon.com.br/
${MENU_VENDAS}            //a[@href='/gp/browse.html?node=17877554011&ref_=nav_cs_sell'][contains(.,'Venda na Amazon')]
${BOTAO_LOGIN}            //span[@class='nav-line-1 nav-progressive-content'][contains(.,'Olá, faça seu login')]
${TEXTO_LOGIN}            //input[@type='email'][contains(@id,'email')]
${CONFIRMACAO_HOMEPAGE}   //a[contains(@class,'nav-logo-link nav-progressive-attribute')]


*** Keywords ***

abrir navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Dado que o usuario esteja no site amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_VENDAS}

Quando o usuario clicar no botão Olá, faça seu login
    Click Element    locator=${BOTAO_LOGIN}

E for redirecionado para a página Fazer Login
    Wait Until Element Is Visible    locator=${TEXTO_LOGIN}

E ao inserir um email valido
    Input Text    locator=${TEXTO_LOGIN}   text=testeqa20222@gmail.com

E clicar no botão Continuar
    Click Element    locator=continue

E ao inserir uma senha valida
    Input Password    locator=ap_password    password=teste2022

E clicar no botão Fazer login    
    Click Element    locator=signInSubmit

Então o usuario deverá ser redirecionado para a página home com o login efetuado
    Wait Until Element Is Visible    locator=${CONFIRMACAO_HOMEPAGE}
    
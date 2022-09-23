*** Settings *** 
Resource      amazon_resources.robot
Test Setup    abrir navegador



*** Test Cases ***

Tela de login Amazon
    Dado que o usuario esteja no site amazon.com.br
    Quando o usuario clicar no botão Olá, faça seu login
    E for redirecionado para a página Fazer Login
    E ao inserir um email valido
    E clicar no botão Continuar
    E ao inserir uma senha valida
    E clicar no botão Fazer login
    Então o usuario deverá ser redirecionado para a página home com o login efetuado
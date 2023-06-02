*** Settings ***
Resource         ../resources/serve-rest-front.resource

Suite Teardown   Close Browser  ALL


*** Test Cases ***
Logim com sucesso Serve Rest front
    Abrir o navegador
    Ir para tela home
    Preencher os dados do novo usuario e cadastrar 
    Conferir usuario Cadastrado

    
    
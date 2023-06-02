*** Settings ***
Library                Browser
Library                FakerLibrary

*** Variables ***
${Browser}                                        chromium
${HEADLESS}                                       ${false}
${Site}                                           https://front.serverest.dev/
${Botao_Cadastra-se}                              xpath=//a[@data-testid='cadastrar'][contains(.,'Cadastre-se')]
${Campo_Nome}                                     id=nome
${Campo_Email}                                    id=email
${Campo_Senha}                                    id=password
${Title}                                          Front - ServeRest
*** Keywords ***
Abrir o navegador
    New Browser         browser=${Browser}
    ...                 headless=${HEADLESS}
   New Context          viewport={'width': 1200, 'height': 800}

Ir para tela home
    New Page             ${Site}
    ${Title}             Get Title  ==   Front - ServeRest
            
Preencher os dados do novo usuario e cadastrar
    Click                       text="Cadastre-se"
    ${Email}                    fakerlibrary.email
    Fill Text                   ${Campo_Nome}           Juarez test
    Fill Text                   ${Campo_Email}           ${Email}
    Fill Text                   ${Campo_Senha}           Elder123@
    Check Checkbox              css=input[data-testid='checkbox']
    Click                       css=button[data-testid='cadastrar']
    sleep     5


Conferir usuario Cadastrado
    Wait For Elements State                h1        visible   
    Get Text                               h1     ==    Bem Vindo Juarez test
    
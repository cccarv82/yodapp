*Settings*


*Keywords*
Acessar a pagina inicial
    Go To                               ${BASE_URL} 
    Wait For Elements State             .carousel                               visible             5s

Acessar o cadastro de usuario
    Click                               a[href*='new'] >> text=Novo

    Wait For Elements State             p[class='card-header-title'] >> text=Cadastrar novo usuário
    ...                                 visible     5s

Preencher dados do usuário
    [Arguments]                         ${usuario}
    Fill Text                           input[name='nome']                      ${usuario}[nome]
    Fill Text                           id=email                                ${usuario}[email]

    Select Options By                   .ordem select                           text                ${usuario}[ordem]

    Selectionar data de nascimento      ${usuario}[data-de-nascimento]

    Fill Text                           input[name='instagram']                 ${usuario}[instagram]


Selecionar tipo de Jedi
    [Arguments]                         ${tpJedi}
    Click                               xpath=//input[@value='${tpJedi}']/..//span[@class='check']

Selecionar o check de aceitar comunicacoes
    Click                               xpath=//input[@name='comunications']/..//span[@class='check']

Selectionar data de nascimento
    [Arguments]                         ${data-de-nascimento}
    @{date}                             Split String                                                    ${data-de-nascimento}
    ...                                                                                                 -
    Click                               input[name='Data de nascimento']
    Select Options By                   xpath=(//header[@class='datepicker-header']//select)[1]         text        ${date}[1]
    Select Options By                   xpath=(//header[@class='datepicker-header']//select)[2]         text        ${date}[2]
    Click                               xpath=//a[contains(@class,'datepicker-cell')]//span[text()='${date}[0]']

Submeter o formulario de cadastro de usuario
    Click                               button >> text=Cadastrar

Mensagem do Toaster deve ser
    [Arguments]                         ${expected-message}
    ${element_toast}                    Set Variable    .toast div

    Wait For Elements State             ${element_toast}      visible         5s
    Get Text                            ${element_toast}      equal           ${expected-message}

Pegar codigo fonte da pagina
    Wait For Elements State             .toast                visible         5s
    ${sourcecode}                       Get Page Source
    Log                                 ${sourcecode}

Validar usuario na lista de usuarios
    [Arguments]                         ${usuario}
    ${elements}                         Set Variable          xpath=//td[contains(text(),'${usuario}[email]')]/..

    Wait For Elements State             ${elements}           visible         5s
    Get Text                            ${elements}           contains        ${usuario}[nome] 
    Get Text                            ${elements}           contains        ${usuario}[instagram] 
    Take Screenshot

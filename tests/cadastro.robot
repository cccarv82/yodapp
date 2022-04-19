*Settings*
Documentation           Suíte de testes para cadastro de usuários
Resource                ${EXECDIR}/resources/base.robot

Test Setup              Session Start
Test Teardown           End Session

*Test Cases*
Deve cadastrar um novo personagem
    [Tags]                                          cenario_positivo

    ${usuario}                                      Factory Users1

    Acessar o cadastro de usuario
    Preencher dados do usuário                      ${usuario}
    Selecionar tipo de Jedi                         ${usuario}[tpJedi]
    Selecionar o check de aceitar comunicacoes
    Submeter o formulario de cadastro de usuario
    Mensagem do Toaster deve ser                    Usuário cadastrado com sucesso!
    Acessar a pagina inicial
    Validar usuario na lista de usuarios            ${usuario}

Email incorreto
    [Tags]                                          cenario_negativo

    ${usuario}                                      Factory Users2

    Acessar o cadastro de usuario
    Preencher dados do usuário                      ${usuario}
    Submeter o formulario de cadastro de usuario
    Mensagem do Toaster deve ser                    Oops! O email é incorreto.
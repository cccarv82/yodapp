*Settings*
Documentation       Verificar se o Yodapp está online
Resource            ${EXECDIR}/resources/base.robot

Test Setup          Session Start
Test Teardown       End Session

*Test Cases*
Yodapp deve estar online
    Get Title       equal                           Yodapp | QAninja

Deve exibir mensagem de boas vindas
    Wait For Elements State         a[class='navbar-item'] >> text= Que a Força (qualidade) esteja com você! 
    ...                             visible     5s


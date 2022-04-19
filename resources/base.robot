*Settings*
Documentation           Arquivo base do projeto

Library                 Browser
Library                 String
Library                 ${EXECDIR}/resources/factories/users.py
Resource                ${EXECDIR}/resources/actions.robot

*Variables*
${BASE_URL}             https://yodapp-testing.vercel.app


*Keywords*
Session Start
    New Browser     ${BROWSER}                        headless=${HEADLESS}
    New Page        ${BASE_URL}

End Session
    Take Screenshot

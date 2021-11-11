*Settings*
Documentation           Login do projeto GetGeeks

Resource                ${EXECDIR}/resources/Base.robot

Test Setup              Start Session
Test Teardown           End Session

#robot -d ./logs tests/Login.robot
#./run.sh

*Test Cases*

User Login GetGeeks
    [Tags]                  login           login_signup

    ${user}                 factory_user    login
         
    Go to Login Page
    Fill Credentials             ${user}                      
    Check "Remember-me"
    Submit Login form
    User Should Be Logged In    ${user}
    
Wrong Login

    [Tags]                  attempt_login
    
    ${user}                 factory_user    faker

    Go to Login Page
    Fill Credentials             ${user}
    Check "Remember-me"
    Submit Login form
    Modal Content Should Be                 Usuário e/ou senha inválidos.

Incorret Pass 

    [Tags]          password_fail

    ${user}         Create Dictionary       email=danyel@email.com
    ...                                     password=abc123

    Go to Login Page
    Fill Credentials                         ${user}
    Submit Login form
    Modal Content Should Be                 Usuário e/ou senha inválidos.

User not Found 

    [Tags]          user_404        no_user

    ${user}         Create Dictionary       email=danyel@email.com
    ...                                     password=abc123

    Go to Login Page
    Fill Credentials                         ${user}
    Submit Login form
    Modal Content Should Be                 Usuário e/ou senha inválidos.

Incorret Email

    [Tags]          i_email

    ${user}         Create Dictionary       email=danyel#email.com
    ...                                     password=abc123

    Go to Login Page
    Fill Credentials                         ${user}
    Submit Login form
    Tooltip email should Be 


Required Email
    [Tags]      temp
    
    ${user}         Create Dictionary       email=${EMPTY}      password=abc123

    Go To Login Page
    Fill Credentials    ${user}
    Submit Login form
    Alert Span Should Be    E-mail obrigatório

Required Pass
    [Tags]      temp
    ${user}         Create Dictionary       email=papito@hotmail.com      password=${EMPTY}

    Go To Login Page
    Fill Credentials    ${user}
    Submit Login form
    Alert Span Should Be    Senha obrigatória

Required Fields
    [Tags]      temp
    @{expected_alerts}      Create List
    ...                     E-mail obrigatório
    ...                     Senha obrigatória

    Go To Login Page
    Submit Login form
    Alert Spans Should Be    ${expected_alerts} 


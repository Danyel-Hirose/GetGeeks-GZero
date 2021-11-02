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

    ${user}                 factory_user_login
         
    Go to Login Page
    Fill Credetials             ${user}                      
    Check "Remember-me"
    Submit Login form
    User Should Be Logged In    ${user}
    
Wrong Login

    [Tags]                  attempt_login
    
    ${user}                 factory_user_01

    Go to Login Page
    Fill Credetials             ${user}
    Check "Remember-me"
    Submit Login form
    Modal Content Should Be                 Usuário e/ou senha inválidos.

Incorret Pass 

    [Tags]          password_fail

    ${user}         Create Dictionary       email=danyel@email.com
    ...                                     password=abc123

    Go to Login Page
    Fill Credetials                         ${user}
    Submit Login form
    Modal Content Should Be                 Usuário e/ou senha inválidos.

User not Found 

    [Tags]          user_404

    ${user}         Create Dictionary       email=danyel@email.com
    ...                                     password=abc123

    Go to Login Page
    Fill Credetials                         ${user}
    Submit Login form
    Modal Content Should Be                 Usuário e/ou senha inválidos.

Incorret Email

    [Tags]          i_email

    ${user}         Create Dictionary       email=danyel#email.com
    ...                                     password=abc123

    Go to Login Page
    Fill Credetials                         ${user}
    Submit Login form
    Tooltip email should Be 


Required Fields

    [Tags]                  attempt_signup      reqf

    Go to Login Page
    Check "Remember-me"
    Submit Login form
    Span Notification Should Be   E-mail obrigatório
    Span Notification Should Be   Senha obrigatória


Empty email
    [Tags]                  attempt_signup      reqf

    Go to Login Page
    Check "Remember-me"
    Submit Login form
    Span Notification Should Be   E-mail obrigatório

Empty password
    [Tags]                  attempt_signup      reqf

    Go to Login Page
    Check "Remember-me"
    Submit Login form
    Span Notification Should Be   Senha obrigatória


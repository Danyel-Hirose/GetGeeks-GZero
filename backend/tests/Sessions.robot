*Settings*
Documentation           Session route test suite

Resource        ${EXECDIR}/resources/Base.robot

*Variables*
&{inv_pass}      email=danyel@email.com     password=abc123
&{inv_email}     email=kate.com.br          password=abc123
&{email_404}     email=kate@404.com         password=abc123
&{empty_email}   email=${EMPTY}             password=abc123
&{wo_email}      password=abc123
&{empty_pass}    email=danyel@email.com     password=${EMPTY}
&{wo_pass}       email=danyel@email.com

*Test Cases*
User session

    ${payload}      factory_user_session       signup
    POST User       ${payload}
    
    #Dado que temos um User cadastrado
    ${payload}      factory_user_session       login

    #Quando faço uma requisição POST na Sessions
    ${response}     POST Session   ${payload}
    
    #Então o status code deve ser 200
    Status Should Be        200                     ${response}

    #E deve gerar um token
    ${size}                 Get Length              ${response.json()}[token]
    ${expected_size}        Convert To Integer      140

    Should Be Equal         ${expected_size}        ${size}

    #E esse token deve expirar em 10 dias
    Should Be Equal         10d                     ${response.json()}[expires_in]

Should Not Get Token
    [Template]              Attempt POST Session

    ${inv_pass}             401     Unauthorized
    ${inv_email}            400     Incorrect email
    ${email_404}            401     Unauthorized
    ${empty_email}          400     Required email
    ${wo_email}             400     Required email
    ${empty_pass}           400     Required pass
    ${wo_pass}              400     Required pass

*Keywords*
Attempt POST Session
    [Arguments]         ${payload}      ${status_code}      ${error_message}

    ${response}     POST Session        ${payload}

    Status Should Be        ${status_code}      ${response}
    Should Be Equal         ${error_message}    ${response.json()}[error]
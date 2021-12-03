*Settings*
Documentation           Documentação Base

*Variables*

${INPUT_EMAIL}          id=email
${INPUT_PASS}           id=password

*Keywords*

Go to Login Page

    Go to       ${BASE_URL}

    Wait For Elements State
    ...         css=.login-form
    ...         visible     5

Fill Credentials

    [Arguments]             ${user}          

    Fill Text               ${INPUT_EMAIL}          ${user}[email]
    Fill Text               ${INPUT_PASS}           ${user}[password]

Check "Remember-me"
    Check Checkbox          xpath=//*[@id="yes"]


Submit Login form
    Click            css=.submit-button >> text=Entrar
    

User Should Be Logged In (Alone))
    Wait For Elements State
    ...         css=.logo-container
    ...         visible     5

User Should Be Logged In 
    [Arguments]         ${user}

    ${element}              Set Variable        css=a[href="/profile"]
    ${element_fullname}     Set Variable        ${user}[name] ${user}[lastname]

    Wait For Elements State
    ...         ${element}
    ...         visible     5
    Get Text
    ...         ${element}
    ...         Equal
    ...         ${element_fullname}

Wrong Login Notification should Be 
    [Arguments]         ${expect_notice}

    Wait For Elements State
    ...             id=swal2-html-container >> text=${expect_notice}
    ...             visible     5

Span Notification Should Be 
    [Arguments]         ${expect_span}

    Wait For Elements State
    ...             xpath=//span[@class="error"] >> text=${expect_span}
    ...             visible     5

Tooltip email should Be
    Get Property           ${INPUT_EMAIL}            type        equal       email

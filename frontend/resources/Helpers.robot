*Settings*
Documentation           Test Helpers

*Keywords*
Add User From Database
    [Arguments]     ${user}

    Connect To Postgres
    Insert User    ${user}
    Disconnect From Database

Do Login

    [Arguments]                 ${user}

    Go to Login Page
    Fill Credentials             ${user}
    Submit Login form
    User Should Be Logged In    ${user}

Create Geek Profile Service
    [Arguments]         ${user}
    
    ${token}    Get Token Service   ${user}
    Be a Geek Service    ${user}[geek_profile]     ${token}


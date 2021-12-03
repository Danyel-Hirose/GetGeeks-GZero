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
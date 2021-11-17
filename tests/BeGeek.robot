*Settings*
Documentation           BeGeek do projeto GetGeeks

Resource                ${EXECDIR}/resources/Base.robot

Test Setup              Start Session
Test Teardown           End Session

#robot -d ./logs tests/BeGeek.robot
#./run.sh

*Test Cases*
Be a Geek

    ${user}      factory_user   be_geek

    Do Login     ${user}
    Go to Geek Form   
    Fill Geek form  ${user}[geek_profile]
    Submit Geek form
    Geek Form Should Be Sucess

Short Description

    ${user}      factory_user   short_desc  
    Do Login     ${user}

    Go to Geek Form   
    Fill Geek form  ${user}[geek_profile]
    Submit Geek form
    Alert Span Should Be  A descrição deve ter no minimo 80 caracteres



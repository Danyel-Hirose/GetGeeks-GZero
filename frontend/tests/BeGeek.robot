*Settings*
Documentation           BeGeek do projeto GetGeeks

Resource                ${EXECDIR}/resources/Base.robot

Test Setup              Start Session
Test Teardown           After Test

#robot -d ./logs tests/BeGeek.robot
#./run.sh

*Test Cases*
Be a Geek
    [Tags]       smoke

    ${user}      factory_user   be_geek

    Do Login     ${user}
    Go to Geek Form   
    Fill Geek form  ${user}[geek_profile]
    Submit Geek form
    Geek Form Should Be Sucess

*Settings*
Documentation           Login do projeto GetGeeks

Resource                ${EXECDIR}/resources/Base.robot

Test Setup              Start Session
Test Teardown           End Session

#robot -d ./logs tests/BeGeek.robot
#./run.sh

*Test Cases*
Be a Geek

    ${user}      factory_user_be_geek

    Do Login     ${user}   

    

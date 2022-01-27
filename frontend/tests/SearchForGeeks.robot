*Settings*
Documentation           Search for Geeks test suite

Resource                ${EXECDIR}/resources/Base.robot

Test Setup              Start Session
Test Teardown           After Test

#robot -d ./logs tests/BeGeek.robot
#./run.sh

*Test Cases*

Search for Alien Geek

    ${alien}    Factory User        search_alien
    Create Geek Profile Service     ${alien}   


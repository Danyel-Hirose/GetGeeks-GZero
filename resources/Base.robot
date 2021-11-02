*Settings*
Documentation           Base Test

Library     Browser
Library     Collections
Library     factories/Users.py

Resource    actions/_SharedActions.robot
Resource    actions/SingupActions.robot
Resource    actions/LoginActions.robot

Resource    Database.robot
Resource    Helpers.robot

*Variables*
${BASE_URL}         https://getgeeks-danyel-miranda.herokuapp.com

*Keywords*
Start Session
    New Browser     chromium        headless=False      slowMo=00:00:00
    New Page        ${BASE_URL}

End Session
    Take Screenshot
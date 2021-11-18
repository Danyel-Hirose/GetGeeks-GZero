*Settings*
Documentation           Base Test

Library     Browser
Library     Collections

Library     factories/Users.py

Resource    actions/_SharedActions.robot
Resource    actions/BeGeekActions.robot
Resource    actions/SingupActions.robot
Resource    actions/LoginActions.robot

Resource    Database.robot
Resource    Helpers.robot

*Variables*
${BASE_URL}         https://getgeeks-danyel-miranda.herokuapp.com

*Keywords*
Start Session
    New Browser     chromium        headless=False      slowMo=00:00:01
    New Page        ${BASE_URL}
    Set Viewport Size               1280    720

End Session
    Take Screenshot                 fullPage=True
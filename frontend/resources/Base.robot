*Settings*
Documentation           Base Test

Library     Browser
Library     Collections

Library     factories/Users.py
Library     Utils.py

Resource    actions/_SharedActions.robot
Resource    actions/BeGeekActions.robot
Resource    actions/SingupActions.robot
Resource    actions/LoginActions.robot

Resource    Database.robot
Resource    Helpers.robot


#git push -u origin main - "Empurrar"
#git pull origin main - "Puxar"
#./run.sh

*Variables*
${BASE_URL}         https://getgeeks-danyel-miranda.herokuapp.com

*Keywords*
Start Session
    New Browser                     ${BROWSER}          headless=${HEADLESS}       slowMo=00:00:01
    New Page                        ${BASE_URL}
    Set Viewport Size               1280    720

After Test
    ${shot_name}                    Screenshot Name
    Take Screenshot                 fullPage=True       filename=${shot_name}
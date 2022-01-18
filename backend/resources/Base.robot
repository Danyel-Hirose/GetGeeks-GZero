*Settings*
Documentation           Session route test suite

Library                 RequestsLibrary
Library                 factories/Users.py

Resource                routes/SessionsRoute.robot
Resource                routes/UsersRoute.robot
Resource                routes/GeeksRoute.robot

Resource                Helpers.robot

*Variables*
${API_USERS}            https://getgeeks-gateway-danyel-mirand.herokuapp.com
${API_GEEKS}            https://getgeeks-gateway-danyel-mirand.herokuapp.com

#./run2.sh
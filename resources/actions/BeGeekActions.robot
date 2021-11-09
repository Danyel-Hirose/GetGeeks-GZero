*Settings*
Documentation           Documentação Base

Library   Browser
Library   String 

*Variables*

*Keywords*
Go to Geek Form  
    Click       xpath=a[href="/be-geek"] >> text=Seja um Geek

    Wait For Elements State
    ...             css=.be-geek-form
    ...             visible     5

    #Wait For Elements State
    #...             css=.title >> text=Trabalhe com suporte técnico quando e onde quiser
    #...             visible     5

Fill Geek form
    [Arguments]             ${geek_profile}

    Fill Text               xpath=//*[@class="sc-crrszt fQQZxO"]//input[@id="whatsapp"]             ${user}[whatsapp]
    Fill Text               id=desc                                                                 ${user}[description]
    Select Options By       id=printer_repair                                                       value       ${user}[printer_repair]
    Select Options By       id=work                                                                 value       ${user}[type_work]
    Fill Text               id=cost                                                                 ${user}[cost]
    
Submit Be_geek form
    Click           xpath=//button[@type="submit"] >> text=Quero ser um Geek

    Wait For Elements State
    ...             xpath=//h1[text()="Parabéns!"]
    ...             visible     5

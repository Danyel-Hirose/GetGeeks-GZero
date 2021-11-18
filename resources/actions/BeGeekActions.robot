*Settings*
Documentation           Documentação Base

Library   Browser
Library   String 

*Variables*

*Keywords*
Go to Geek Form  
    Click           css=a[href="/be-geek"] >> text=Seja um Geek

    Wait For Elements State
    ...             css=.be-geek-form
    ...             visible     5

    #Wait For Elements State
    #...             css=.title >> text=Trabalhe com suporte técnico quando e onde quiser
    #...             visible     5

Fill Geek form
    [Arguments]             ${geek_profile}

    Reset Geek form

    Fill Text               id=whatsapp                       ${geek_profile}[whatsapp]
    Fill Text               id=desc                           ${geek_profile}[description]

    IF      '${geek_profile}[printer_repair]'
        Select Options By       id=printer_repair                 value       ${geek_profile}[printer_repair]
    END
    
    IF       '${geek_profile}[type_work]'
        Select Options By       id=work                           value       ${geek_profile}[type_work]
    END


    Fill Text               id=cost                           ${geek_profile}[cost]
    
Submit Geek form
    Click           xpath=//button[@type="submit"] >> text=Quero ser um Geek

Geek Form Should Be Sucess
    ${expected_message}         Set Variable        Seu Cadastro está na nossa lista de geeks. Agora é só ficar de olho no seu WhatsApp.

    Wait For Elements State
    ...             css=p >> text=${expected_message}
    ...             visible     5

Reset Geek form

    Execute Javascript              document.getElementsByClassName("be-geek-form")[0].reset();
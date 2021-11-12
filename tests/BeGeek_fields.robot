*** Settings ***
Documentation           BeGeek_Fields do projeto GetGeeks
Resource            ${EXECDIR}/resources/Base.robot


Suite Setup          Geek With No Field
Test Teardown        End Session


*** Variable ***
${WHATS}        id=whatsapp
${DESC}         id=desc
${COST}         id=cost

*** Test Case ***
Whats Blank Space
    [Tags]          geek_required
    ${be_geek}      Create Dictionary
    ...             whatsapp=${EMPTY}      
    ...             description=Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur nisi nibh, porttitor sed sagittis suscipit, sollicitudin id quam. Cras tempus quis tortor molestie mollis. Morbi interdum lectus sit amet condimentum sagittis.
    ...             printer_repair=Sim    type_work=Remoto
    ...             cost=175
    
    Fill Geek form       ${be_geek}
    Submit Geek Form
    Alert Span Should Be        O Whatsapp deve ter 11 digitos contando com o DDD

WhatsApp Only DDD
    [Tags]          geek_required
    ${be_geek}      Create Dictionary
    ...             whatsapp=21
    ...             description=Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur nisi nibh, porttitor sed sagittis suscipit, sollicitudin id quam. Cras tempus quis tortor molestie mollis. Morbi interdum lectus sit amet condimentum sagittis.
    ...             printer_repair=Sim    type_work=Remoto
    ...             cost=175

    Fill Geek form       ${be_geek}
    Submit Geek Form
    Alert Span Should Be        O Whatsapp deve ter 11 digitos contando com o DDD

WhatsApp 10 digits
    [Tags]          geek_required
    ${be_geek}      Create Dictionary
    ...             whatsapp=2112345678
    ...             description=Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur nisi nibh, porttitor sed sagittis suscipit, sollicitudin id quam. Cras tempus quis tortor molestie mollis. Morbi interdum lectus sit amet condimentum sagittis.
    ...             printer_repair=Sim    type_work=Remoto
    ...             cost=175

    Fill Geek form       ${be_geek}
    Submit Geek Form
    Alert Span Should Be        O Whatsapp deve ter 11 digitos contando com o DDD

Description Blank Space
    [Tags]      geek_required
    ${be_geek}     Create Dictionary
    ...         whatsapp=11123456789
    ...         description=${EMPTY}
    ...         printer_repair=Sim    
    ...         type_work=Remoto
    ...         cost=175

    Fill Geek form       ${be_geek}
    Submit Geek Form
    Alert Span Should Be        Informe a descrição do seu trabalho

Cost Value Blank Space
    [Tags]      geek_required
    ${be_geek}     Create Dictionary
    ...         whatsapp=11123456789
    ...         description=Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur nisi nibh, porttitor sed sagittis suscipit, sollicitudin id quam. Cras tempus quis tortor molestie mollis. Morbi interdum lectus sit amet condimentum sagittis.
    ...         printer_repair=Sim    
    ...         type_work=Remoto
    ...         cost=${EMPTY}

    Fill Geek form       ${be_geek}
    Submit Geek Form
    Alert Span Should Be        Valor hora deve ser numérico

Cost Value With Alphanumeric
    [Tags]      geek_required
    ${be_geek}      Create Dictionary
    ...             whatsapp=2112345678
    ...             description=Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur nisi nibh, porttitor sed sagittis suscipit, sollicitudin id quam. Cras tempus quis tortor molestie mollis. Morbi interdum lectus sit amet condimentum sagittis.
    ...             printer_repair=Sim    type_work=Remoto
    ...             cost=ABC123

    Fill Geek form       ${be_geek}
    Submit Geek Form
    Alert Span Should Be        Valor hora deve ser numérico

Cost Value With Letters
    [Tags]      geek_required
    ${be_geek}      Create Dictionary
    ...             whatsapp=2112345678
    ...             description=Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur nisi nibh, porttitor sed sagittis suscipit, sollicitudin id quam. Cras tempus quis tortor molestie mollis. Morbi interdum lectus sit amet condimentum sagittis.
    ...             printer_repair=Sim    type_work=Remoto
    ...             cost=ABCDEF

    Fill Geek form       ${be_geek}
    Submit Geek Form
    Alert Span Should Be        Valor hora deve ser numérico

Cost Value With Special Characters
    [Tags]      geek_required
    ${be_geek}      Create Dictionary
    ...             whatsapp=2112345678
    ...             description=Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur nisi nibh, porttitor sed sagittis suscipit, sollicitudin id quam. Cras tempus quis tortor molestie mollis. Morbi interdum lectus sit amet condimentum sagittis.
    ...             printer_repair=Sim    type_work=Remoto
    ...             cost=@@@@@
    
    Fill Geek form       ${be_geek}
    Submit Geek Form
    Alert Span Should Be        Valor hora deve ser numérico


*** Keywords ***
Geek With No Field

    ${user}      factory_user      be_geek_fields

    Start Session
    Do Login            ${user}
    Go To Geek Form
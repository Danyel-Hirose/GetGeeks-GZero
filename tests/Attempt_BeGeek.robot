*Settings*
Documentation           BeGeek do projeto GetGeeks

Resource                ${EXECDIR}/resources/Base.robot

Test Setup              Start Session For Attempt Be Geek

#robot -d ./logs tests/Attempt_BeGeek.robot
#./run.sh
*Variables*
${long_desc}        Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas

*Test Cases*
Should Not Be a Geek
    [Template]  Attemmpt Be a Geek

    description        Formato o PC            A descrição deve ter no minimo 80 caracteres
    description        ${long_desc}            A descrição deve ter no máximo 255 caracteres
    description        ${EMPTY}                Informe a descrição do seu trabalho
    whatsapp           11                      O Whatsapp deve ter 11 digitos contando com o DDD
    whatsapp           123456789               O Whatsapp deve ter 11 digitos contando com o DDD
    whatsapp           ${EMPTY}                O Whatsapp deve ter 11 digitos contando com o DDD
    cost               aaaa                    Valor hora deve ser numérico
    cost               aa12                    Valor hora deve ser numérico
    cost               @@@@                    Valor hora deve ser numérico
    cost               ${EMPTY}                Valor hora deve ser numérico


*Keywords*
Attemmpt Be a Geek

    [Arguments]         ${key}          ${input_field}          ${output_message}

    ${user}             factory_user        attempt_BeGeek

    Set To Dictionary                   ${user}[geek_profile]             ${key}         ${input_field}

    Fill Geek form                      ${user}[geek_profile]   
    Submit Geek form
    Alert Span Should Be                ${output_message}

    Take Screenshot                     fullPage=True

Start Session For Attempt Be Geek

    ${user}             factory_user        attempt_BeGeek

    Start Session
    Do Login            ${user}
    Go to Geek Form
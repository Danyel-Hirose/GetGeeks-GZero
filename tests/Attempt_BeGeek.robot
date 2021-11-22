*Settings*
Documentation           BeGeek do projeto GetGeeks

Resource                ${EXECDIR}/resources/Base.robot

Suite Setup              Start Session For Attempt Be Geek
Test Template           Attemmpt Be a Geek

#robot -d ./logs tests/Attempt_BeGeek.robot
#./run.sh
*Variables*
${long_desc}        Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas

*Test Cases*
Short desc              description        Formato o PC            A descrição deve ter no minimo 80 caracteres
Long desc               description        ${long_desc}            A descrição deve ter no máximo 255 caracteres
Empty desc              description        ${EMPTY}                Informe a descrição do seu trabalho
Whats Only DDD          whatsapp           11                      O Whatsapp deve ter 11 digitos contando com o DDD
Whats Only number       whatsapp           123456789               O Whatsapp deve ter 11 digitos contando com o DDD
Empty Whats             whatsapp           ${EMPTY}                O Whatsapp deve ter 11 digitos contando com o DDD
Cost letters            cost               aaaa                    Valor hora deve ser numérico
Cost Alpha              cost               aa12                    Valor hora deve ser numérico
Cost Special Char       cost               @@@@                    Valor hora deve ser numérico
Empty Cost              cost               ${EMPTY}                Valor hora deve ser numérico
No Rrinter Repair       printer_repair     ${EMPTY}                Por favor, informe se você é um Geek Supremo
No Work                 type_work          ${EMPTY}                Por favor, selecione o modelo de trabalho

*Keywords*
Attemmpt Be a Geek

    [Arguments]         ${key}          ${input_field}          ${output_message}

    ${user}             factory_user        attempt_BeGeek

    Set To Dictionary                   ${user}[geek_profile]             ${key}         ${input_field}

    Fill Geek form                      ${user}[geek_profile]   
    Submit Geek form
    Alert Span Should Be                ${output_message}

    After Test

Start Session For Attempt Be Geek

    ${user}             factory_user        attempt_BeGeek

    Start Session
    Do Login            ${user}
    Go to Geek Form
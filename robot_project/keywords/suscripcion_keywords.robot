*** Settings ***
Documentation    Keywords de la sección Subscription de la página de inicio.
Resource         comunes.robot


*** Keywords ***
Abrir Pagina De Inicio
    Ir A La Pagina    /    ${CAMPO_EMAIL_SUSCRIPCION}

Ir A La Seccion De Suscripcion
    Scroll Element Into View    ${TITULO_SUSCRIPCION}
    Element Should Be Visible    ${TITULO_SUSCRIPCION}
    Page Should Contain Element    ${CAMPO_EMAIL_SUSCRIPCION}

Suscribirse Con El Correo
    [Arguments]    ${email}
    Escribir En Campo    ${CAMPO_EMAIL_SUSCRIPCION}    ${email}
    Hacer Clic    ${BOTON_SUSCRIBIR}

Validar Mensaje De Suscripcion Exitosa
    [Arguments]    ${mensaje_esperado}
    Wait Until Element Is Visible    ${MENSAJE_SUSCRIPCION}
    Element Text Should Be    ${MENSAJE_SUSCRIPCION}    ${mensaje_esperado}
    Page Should Contain    ${mensaje_esperado}

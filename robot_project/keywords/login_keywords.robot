*** Settings ***
Documentation    Keywords de la página de Login.
Resource         comunes.robot


*** Keywords ***
Abrir Pagina De Login
    Ir A La Pagina    /login    ${LOGIN_EMAIL}

Iniciar Sesion Con
    [Documentation]    Llena el formulario de login con el correo y contraseña indicados y presiona Login.
    [Arguments]    ${email}    ${password}
    Escribir En Campo    ${LOGIN_EMAIL}    ${email}
    Escribir En Campo    ${LOGIN_PASSWORD}    ${password}
    Hacer Clic    ${LOGIN_BOTON}

Validar Mensaje De Error De Login
    [Documentation]    Valida que el mensaje de error sea visible y tenga el texto esperado.
    [Arguments]    ${mensaje_esperado}
    Wait Until Element Is Visible    ${LOGIN_MENSAJE_ERROR}
    Element Should Be Visible    ${LOGIN_MENSAJE_ERROR}
    Element Text Should Be    ${LOGIN_MENSAJE_ERROR}    ${mensaje_esperado}
    Page Should Contain    ${mensaje_esperado}

Validar Que El Usuario No Inicio Sesion
    Page Should Not Contain Element    ${ENLACE_USUARIO_LOGUEADO}
    Location Should Contain    /login

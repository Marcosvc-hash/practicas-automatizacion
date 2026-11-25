*** Settings ***
Documentation     Ejercicio 2 - Login Incorrecto
...               Tipo de prueba: funcional - autenticación y manejo de errores.
...               Se intenta iniciar sesión con credenciales no registradas y se valida
...               el mensaje de error mostrado por la aplicación.
Resource          ../keywords/login_keywords.robot
Test Setup        Abrir Navegador En El Sitio
Test Teardown     Cerrar Navegador


*** Test Cases ***
Login Con Credenciales Invalidas Muestra Mensaje De Error
    [Tags]    funcional    autenticacion    ejercicio2
    Abrir Pagina De Login
    Title Should Be    ${TITULO_LOGIN}
    Iniciar Sesion Con    ${EMAIL_INVALIDO}    ${PASSWORD_INVALIDO}
    Validar Mensaje De Error De Login    ${MSG_LOGIN_INCORRECTO}
    Validar Que El Usuario No Inicio Sesion
    Tomar Captura De Evidencia    ej02_login_incorrecto

*** Settings ***
Documentation     Ejercicio 6 - Suscripción
...               Tipo de prueba: funcional - formulario de captura de datos.
...               Se registra un correo en la sección de suscripción del pie de página
...               y se valida el mensaje de éxito.
Resource          ../keywords/suscripcion_keywords.robot
Test Setup        Abrir Navegador En El Sitio
Test Teardown     Cerrar Navegador


*** Test Cases ***
Suscripcion Con Correo Valido Muestra Mensaje De Exito
    [Tags]    funcional    formulario    ejercicio6
    Abrir Pagina De Inicio
    Title Should Be    ${TITULO_INICIO}
    Ir A La Seccion De Suscripcion
    Suscribirse Con El Correo    ${EMAIL_SUSCRIPCION}
    Validar Mensaje De Suscripcion Exitosa    ${MSG_SUSCRIPCION_EXITOSA}
    Tomar Captura De Evidencia    ej06_suscripcion

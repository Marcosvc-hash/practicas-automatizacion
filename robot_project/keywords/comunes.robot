*** Settings ***
Documentation    Keywords reutilizables comunes a todos los escenarios.
Library          SeleniumLibrary
Resource         ../variables/config.robot
Resource         ../variables/datos_prueba.robot
Resource         ../variables/localizadores.robot


*** Keywords ***
Abrir Navegador En El Sitio
    [Documentation]    Abre el navegador configurado, define tiempos de espera y carpeta de capturas.
    Open Browser    ${URL}    ${BROWSER}    options=${OPCIONES_NAVEGADOR}
    Set Window Size    ${ANCHO_VENTANA}    ${ALTO_VENTANA}
    Set Selenium Timeout    ${TIMEOUT}
    Set Screenshot Directory    ${SCREENSHOT_DIR}

Cerrar Navegador
    [Documentation]    Si la prueba falló guarda una captura del error y luego cierra el navegador.
    Run Keyword If Test Failed    Capture Page Screenshot    FALLO_{index}.png
    Close All Browsers

Ir A La Pagina
    [Documentation]    Navega a una ruta del sitio y espera un elemento. Reintenta si el sitio está saturado.
    [Arguments]    ${ruta}    ${elemento_esperado}
    Wait Until Keyword Succeeds    3x    5s    Cargar Pagina    ${ruta}    ${elemento_esperado}

Cargar Pagina
    [Arguments]    ${ruta}    ${elemento_esperado}
    Go To    ${URL}${ruta}
    Wait Until Element Is Visible    ${elemento_esperado}

Escribir En Campo
    [Documentation]    Espera a que el campo sea visible, lo limpia y escribe el texto.
    [Arguments]    ${localizador}    ${texto}
    Wait Until Element Is Visible    ${localizador}
    Input Text    ${localizador}    ${texto}    clear=True

Hacer Clic
    [Documentation]    Desplaza el elemento a la vista, espera que esté habilitado y hace clic.
    [Arguments]    ${localizador}
    Wait Until Element Is Visible    ${localizador}
    Scroll Element Into View    ${localizador}
    Wait Until Element Is Enabled    ${localizador}
    Click Element    ${localizador}

Tomar Captura De Evidencia
    [Documentation]    Guarda una captura de pantalla en la carpeta screenshots/.
    [Arguments]    ${nombre}
    Capture Page Screenshot    ${nombre}.png

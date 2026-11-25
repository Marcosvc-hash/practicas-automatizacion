*** Settings ***
Documentation    Variables de configuración general del proyecto (navegador, URL, tiempos y carpetas).


*** Variables ***
${URL}                  https://automationexercise.com
${BROWSER}              edge
${TIMEOUT}              10s
${ANCHO_VENTANA}        1280
${ALTO_VENTANA}         900
${SCREENSHOT_DIR}       ${CURDIR}${/}..${/}screenshots

# Bloquea los dominios de publicidad para que los anuncios de pantalla completa
# del sitio no interrumpan la automatización.
${OPCIONES_NAVEGADOR}    add_argument("--host-resolver-rules=MAP *.googlesyndication.com ~NOTFOUND, MAP *.doubleclick.net ~NOTFOUND, MAP *.googleadservices.com ~NOTFOUND, MAP adservice.google.com ~NOTFOUND, MAP fundingchoicesmessages.google.com ~NOTFOUND")

*** Settings ***
Documentation    Datos de prueba y mensajes esperados usados por los escenarios.


*** Variables ***
# Ejercicio 2 - Login incorrecto
${EMAIL_INVALIDO}               usuario.falso@test.com
${PASSWORD_INVALIDO}            ClaveIncorrecta123
${MSG_LOGIN_INCORRECTO}         Your email or password is incorrect!
${TITULO_LOGIN}                 Automation Exercise - Signup / Login

# Ejercicio 3 - Búsqueda de productos
${TERMINO_BUSQUEDA}             jeans
${TITULO_PRODUCTOS}             Automation Exercise - All Products
${TEXTO_RESULTADOS}             Searched Products

# Ejercicio 6 - Suscripción
${EMAIL_SUSCRIPCION}            marcos.prueba@test.com
${MSG_SUSCRIPCION_EXITOSA}      You have been successfully subscribed!
${TITULO_INICIO}                Automation Exercise

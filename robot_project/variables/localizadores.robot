*** Settings ***
Documentation    Localizadores de los elementos de cada página (ID, Name, XPath y CSS Selector).


*** Variables ***
# Página de Login (/login)
${LOGIN_EMAIL}                  xpath://form[@action='/login']//input[@name='email']
${LOGIN_PASSWORD}               name:password
${LOGIN_BOTON}                  css:button[data-qa='login-button']
${LOGIN_MENSAJE_ERROR}          xpath://form[@action='/login']//p
${ENLACE_USUARIO_LOGUEADO}      xpath://a[contains(., 'Logged in as')]

# Página de Productos (/products)
${BUSCADOR_PRODUCTOS}           id:search_product
${BOTON_BUSCAR}                 id:submit_search
${TITULO_RESULTADOS}            css:.features_items h2.title
${NOMBRES_PRODUCTOS}            css:.features_items .productinfo p

# Página de Inicio - sección Subscription
${TITULO_SUSCRIPCION}           xpath://div[@class='single-widget']/h2
${CAMPO_EMAIL_SUSCRIPCION}      id:susbscribe_email
${BOTON_SUSCRIBIR}              id:subscribe
${MENSAJE_SUSCRIPCION}          css:#success-subscribe .alert-success

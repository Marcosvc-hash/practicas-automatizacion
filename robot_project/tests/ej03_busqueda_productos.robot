*** Settings ***
Documentation     Ejercicio 3 - Búsqueda de Productos
...               Tipo de prueba: funcional - búsqueda y filtrado de información.
...               Se ingresa a la sección de productos, se realiza una búsqueda y se valida
...               que los resultados correspondan al término buscado.
Resource          ../keywords/productos_keywords.robot
Test Setup        Abrir Navegador En El Sitio
Test Teardown     Cerrar Navegador


*** Test Cases ***
Buscar Producto Muestra Resultados Relacionados
    [Tags]    funcional    busqueda    ejercicio3
    Abrir Pagina De Productos
    Title Should Be    ${TITULO_PRODUCTOS}
    Buscar Producto    ${TERMINO_BUSQUEDA}
    Location Should Contain    search=${TERMINO_BUSQUEDA}
    Validar Seccion De Resultados
    Validar Que Los Resultados Contienen    ${TERMINO_BUSQUEDA}
    Tomar Captura De Evidencia    ej03_busqueda_productos

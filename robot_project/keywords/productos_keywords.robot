*** Settings ***
Documentation    Keywords de la página de Productos.
Resource         comunes.robot


*** Keywords ***
Abrir Pagina De Productos
    Ir A La Pagina    /products    ${BUSCADOR_PRODUCTOS}

Buscar Producto
    [Documentation]    Escribe el término en el buscador y presiona el botón buscar.
    [Arguments]    ${termino}
    Escribir En Campo    ${BUSCADOR_PRODUCTOS}    ${termino}
    Hacer Clic    ${BOTON_BUSCAR}
    Wait Until Location Contains    search=${termino}

Validar Seccion De Resultados
    Wait Until Element Is Visible    ${TITULO_RESULTADOS}
    Element Should Be Visible    ${TITULO_RESULTADOS}
    Page Should Contain    ${TEXTO_RESULTADOS}

Validar Que Los Resultados Contienen
    [Documentation]    Valida que haya resultados y que todos los nombres contengan el término buscado.
    [Arguments]    ${termino}
    Page Should Contain Element    ${NOMBRES_PRODUCTOS}
    ${productos}=    Get WebElements    ${NOMBRES_PRODUCTOS}
    ${cantidad}=    Get Length    ${productos}
    Should Be True    ${cantidad} > 0    La búsqueda no devolvió productos
    FOR    ${producto}    IN    @{productos}
        ${nombre}=    Get Text    ${producto}
        Should Contain    ${nombre.lower()}    ${termino.lower()}    El producto "${nombre}" no corresponde a la búsqueda
        Log    Producto encontrado: ${nombre}
    END
    Log    Total de productos encontrados: ${cantidad}

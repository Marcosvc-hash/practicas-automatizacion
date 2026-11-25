"""
Ejercicio 4 - Búsqueda de Productos
Tipo de prueba: funcional - búsqueda y filtrado de información.

Se busca un producto y se valida que los resultados correspondan
al criterio de búsqueda.
"""
from pages.products_page import ProductsPage

TERMINO = "jeans"


def test_busqueda_productos(driver, evidencia):
    pagina = ProductsPage(driver).abrir()

    # Assert 1: se cargó la página de productos
    assert "All Products" in driver.title, f"Título inesperado: {driver.title}"

    pagina.buscar(TERMINO)
    titulo = pagina.obtener_titulo_resultados()
    productos = pagina.obtener_nombres_productos()
    evidencia("ej4_busqueda_resultados")

    # Assert 2: la URL contiene el término buscado
    assert f"search={TERMINO}" in driver.current_url, f"URL inesperada: {driver.current_url}"

    # Assert 3: aparece la sección de resultados de búsqueda
    assert titulo.upper() == "SEARCHED PRODUCTS", f"Título obtenido: '{titulo}'"

    # Assert 4: hay al menos un resultado
    assert len(productos) > 0, "La búsqueda no devolvió productos"

    # Assert 5: todos los resultados corresponden al criterio de búsqueda
    no_relacionados = [p for p in productos if TERMINO.lower() not in p.lower()]
    assert not no_relacionados, f"Productos que no contienen '{TERMINO}': {no_relacionados}"

    print(f"Productos encontrados ({len(productos)}): {productos}")

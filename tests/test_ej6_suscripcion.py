"""
Ejercicio 6 - Suscripción
Tipo de prueba: funcional - formulario de captura de datos.

Se registra un correo en la sección de suscripción del pie de página
y se valida el mensaje de éxito.
"""
from pages.home_page import HomePage

EMAIL = "marcos.prueba@test.com"
MENSAJE_ESPERADO = "You have been successfully subscribed!"


def test_suscripcion(driver, evidencia):
    pagina = HomePage(driver).abrir()

    # Assert 1: se cargó la página principal
    assert driver.title == "Automation Exercise", f"Título inesperado: {driver.title}"

    # Assert 2: existe la sección de suscripción
    titulo = pagina.obtener_titulo_suscripcion()
    assert titulo.upper() == "SUBSCRIPTION", f"Título obtenido: '{titulo}'"

    pagina.suscribirse(EMAIL)
    mensaje = pagina.obtener_mensaje_exito()
    evidencia("ej6_suscripcion_mensaje_exito")

    # Assert 3: se muestra el mensaje de éxito exacto
    assert mensaje == MENSAJE_ESPERADO, f"Mensaje obtenido: '{mensaje}'"

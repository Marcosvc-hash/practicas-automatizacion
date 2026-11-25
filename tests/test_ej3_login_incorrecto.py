"""
Ejercicio 3 - Inicio de Sesión Incorrecto
Tipo de prueba: funcional - autenticación y manejo de errores.

Se intenta iniciar sesión con credenciales no registradas y se valida
que el sistema muestre el mensaje de error y no permita el acceso.
"""
from pages.login_page import LoginPage

EMAIL_INVALIDO = "usuario.falso@test.com"
PASSWORD_INVALIDO = "ClaveIncorrecta123"
MENSAJE_ESPERADO = "Your email or password is incorrect!"


def test_login_incorrecto(driver, evidencia):
    pagina = LoginPage(driver).abrir()

    # Assert 1: se cargó la página de login
    assert "Signup / Login" in driver.title, f"Título inesperado: {driver.title}"

    pagina.iniciar_sesion(EMAIL_INVALIDO, PASSWORD_INVALIDO)
    mensaje = pagina.obtener_mensaje_error()
    evidencia("ej3_login_incorrecto_mensaje_error")

    # Assert 2: se muestra el mensaje de error exacto
    assert mensaje == MENSAJE_ESPERADO, f"Mensaje obtenido: '{mensaje}'"

    # Assert 3: el usuario NO inició sesión
    assert not pagina.sesion_iniciada(), "El usuario no debería haber iniciado sesión"

    # Assert 4: el usuario permanece en la página de login
    assert "/login" in driver.current_url, f"URL inesperada: {driver.current_url}"

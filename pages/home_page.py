from selenium.webdriver.common.by import By

from pages.base_page import BasePage


class HomePage(BasePage):
    """Página principal https://automationexercise.com/ (sección Subscription del pie de página)."""

    # Localizadores
    TITULO_SUSCRIPCION = (By.XPATH, "//div[@class='single-widget']/h2")          # XPath
    CAMPO_EMAIL_SUSCRIPCION = (By.ID, "susbscribe_email")                         # ID (así está escrito en el sitio)
    BOTON_SUSCRIBIR = (By.ID, "subscribe")                                        # ID
    MENSAJE_EXITO = (By.CSS_SELECTOR, "#success-subscribe .alert-success")        # CSS Selector

    def abrir(self):
        self.ir_a("/")
        return self

    def obtener_titulo_suscripcion(self):
        return self.desplazar_hasta(self.TITULO_SUSCRIPCION).text.strip()

    def suscribirse(self, email):
        self.desplazar_hasta(self.CAMPO_EMAIL_SUSCRIPCION)
        self.escribir(self.CAMPO_EMAIL_SUSCRIPCION, email)
        self.clic(self.BOTON_SUSCRIBIR)

    def obtener_mensaje_exito(self):
        return self.esperar_visible(self.MENSAJE_EXITO).text.strip()

from selenium.webdriver.common.by import By

from pages.base_page import BasePage


class LoginPage(BasePage):
    """Página https://automationexercise.com/login"""

    # Localizadores
    CAMPO_EMAIL = (By.XPATH, "//form[@action='/login']//input[@name='email']")   # XPath
    CAMPO_PASSWORD = (By.NAME, "password")                                       # Name
    BOTON_LOGIN = (By.CSS_SELECTOR, "button[data-qa='login-button']")            # CSS Selector
    MENSAJE_ERROR = (By.XPATH, "//form[@action='/login']//p")                    # XPath
    ENLACE_USUARIO_LOGUEADO = (By.XPATH, "//a[contains(., 'Logged in as')]")     # XPath

    def abrir(self):
        self.ir_a("/login")
        self.esperar_visible(self.CAMPO_EMAIL)
        return self

    def iniciar_sesion(self, email, password):
        self.escribir(self.CAMPO_EMAIL, email)
        self.escribir(self.CAMPO_PASSWORD, password)
        self.clic(self.BOTON_LOGIN)

    def obtener_mensaje_error(self):
        return self.esperar_visible(self.MENSAJE_ERROR).text.strip()

    def sesion_iniciada(self):
        return self.existe(self.ENLACE_USUARIO_LOGUEADO)

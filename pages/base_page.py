from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait

BASE_URL = "https://automationexercise.com"


class BasePage:
    """Funciones comunes a todas las páginas (Page Object Model)."""

    def __init__(self, driver, timeout=10):
        self.driver = driver
        self.wait = WebDriverWait(driver, timeout)

    def ir_a(self, ruta):
        self.driver.get(BASE_URL + ruta)

    def esperar_visible(self, localizador):
        return self.wait.until(EC.visibility_of_element_located(localizador))

    def esperar_clicable(self, localizador):
        return self.wait.until(EC.element_to_be_clickable(localizador))

    def escribir(self, localizador, texto):
        campo = self.esperar_visible(localizador)
        campo.clear()
        campo.send_keys(texto)

    def clic(self, localizador):
        elemento = self.esperar_clicable(localizador)
        self.driver.execute_script("arguments[0].scrollIntoView({block: 'center'});", elemento)
        elemento.click()

    def existe(self, localizador):
        return len(self.driver.find_elements(*localizador)) > 0

    def desplazar_hasta(self, localizador):
        elemento = self.esperar_visible(localizador)
        self.driver.execute_script("arguments[0].scrollIntoView({block: 'center'});", elemento)
        return elemento

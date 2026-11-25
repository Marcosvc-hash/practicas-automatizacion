from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC

from pages.base_page import BasePage


class ProductsPage(BasePage):
    """Página https://automationexercise.com/products"""

    # Localizadores
    CAMPO_BUSQUEDA = (By.ID, "search_product")                                    # ID
    BOTON_BUSCAR = (By.ID, "submit_search")                                       # ID
    TITULO_RESULTADOS = (By.CSS_SELECTOR, ".features_items h2.title")             # CSS Selector
    NOMBRES_PRODUCTOS = (By.CSS_SELECTOR, ".features_items .productinfo p")       # CSS Selector

    def abrir(self):
        self.ir_a("/products")
        self.esperar_visible(self.CAMPO_BUSQUEDA)
        return self

    def buscar(self, termino):
        self.escribir(self.CAMPO_BUSQUEDA, termino)
        self.clic(self.BOTON_BUSCAR)
        self.wait.until(EC.url_contains("search="))

    def obtener_titulo_resultados(self):
        return self.esperar_visible(self.TITULO_RESULTADOS).text.strip()

    def obtener_nombres_productos(self):
        self.esperar_visible(self.NOMBRES_PRODUCTOS)
        return [p.text.strip() for p in self.driver.find_elements(*self.NOMBRES_PRODUCTOS) if p.text.strip()]

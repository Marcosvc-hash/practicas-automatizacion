"""
Configuración común de Pytest para la Práctica 2 - Selenium WebDriver.

- Crea y cierra el navegador (fixture `driver`).
- Ofrece la fixture `evidencia` para guardar capturas de pantalla.
- Si una prueba falla, guarda automáticamente una captura del fallo.
"""
import os
from datetime import datetime

import pytest
from selenium import webdriver

BASE_URL = "https://automationexercise.com"
CARPETA_EVIDENCIAS = os.path.join(os.path.dirname(__file__), "evidencias")

# Dominios de publicidad que se bloquean para que los anuncios de pantalla
# completa del sitio no interrumpan la automatización.
DOMINIOS_PUBLICIDAD = [
    "googlesyndication.com",
    "doubleclick.net",
    "googleadservices.com",
    "adservice.google.com",
    "fundingchoicesmessages.google.com",
]


def pytest_addoption(parser):
    parser.addoption("--browser", action="store", default="edge",
                     choices=["edge", "chrome"], help="Navegador a usar")
    parser.addoption("--headless", action="store_true",
                     help="Ejecutar sin abrir la ventana del navegador")


def _opciones(navegador, headless):
    opciones = webdriver.EdgeOptions() if navegador == "edge" else webdriver.ChromeOptions()
    reglas = ", ".join(f"MAP *.{d} ~NOTFOUND, MAP {d} ~NOTFOUND" for d in DOMINIOS_PUBLICIDAD)
    opciones.add_argument(f"--host-resolver-rules={reglas}")
    opciones.add_argument("--window-size=1280,900")
    if headless:
        opciones.add_argument("--headless=new")
    return opciones


@pytest.fixture
def driver(request):
    navegador = request.config.getoption("--browser")
    headless = request.config.getoption("--headless")
    opciones = _opciones(navegador, headless)

    # Selenium Manager descarga automáticamente el driver correcto (msedgedriver / chromedriver).
    driver = webdriver.Edge(options=opciones) if navegador == "edge" else webdriver.Chrome(options=opciones)
    driver.set_page_load_timeout(30)

    yield driver

    # Captura automática si la prueba falló
    reporte = getattr(request.node, "rep_call", None)
    if reporte is not None and reporte.failed:
        os.makedirs(CARPETA_EVIDENCIAS, exist_ok=True)
        hora = datetime.now().strftime("%Y%m%d_%H%M%S")
        driver.save_screenshot(os.path.join(CARPETA_EVIDENCIAS, f"FALLO_{request.node.name}_{hora}.png"))

    driver.quit()


@pytest.fixture
def evidencia(driver):
    """Devuelve una función que guarda una captura en la carpeta evidencias/."""
    os.makedirs(CARPETA_EVIDENCIAS, exist_ok=True)

    def tomar_captura(nombre):
        ruta = os.path.join(CARPETA_EVIDENCIAS, f"{nombre}.png")
        assert driver.save_screenshot(ruta), f"No se pudo guardar la captura {ruta}"
        print(f"Captura guardada: {ruta}")
        return ruta

    return tomar_captura


@pytest.hookimpl(hookwrapper=True)
def pytest_runtest_makereport(item, call):
    resultado = yield
    reporte = resultado.get_result()
    setattr(item, f"rep_{reporte.when}", reporte)

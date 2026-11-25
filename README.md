# Prácticas de Automatización - Práctica 2: Selenium WebDriver

Pruebas automatizadas con **Selenium WebDriver + Python + Pytest** sobre el sitio
[automationexercise.com](https://automationexercise.com).

Autor: Marcos Javier Vargas Callizaya

## Ejercicios resueltos

| Ejercicio | Archivo | Tipo de prueba funcional |
|---|---|---|
| 3. Inicio de sesión incorrecto | `tests/test_ej3_login_incorrecto.py` | Autenticación y manejo de errores |
| 4. Búsqueda de productos | `tests/test_ej4_busqueda_productos.py` | Búsqueda y filtrado de información |
| 6. Suscripción | `tests/test_ej6_suscripcion.py` | Formulario de captura de datos |

## Estructura

```
practicas-automatizacion/
├── conftest.py          # Navegador (fixture driver), capturas y captura automática si falla
├── pytest.ini           # Configuración de Pytest y reporte HTML
├── requirements.txt
├── pages/               # Page Object Model: localizadores y acciones de cada página
│   ├── base_page.py
│   ├── login_page.py
│   ├── products_page.py
│   └── home_page.py
├── tests/               # Casos de prueba con sus asserts
└── evidencias/          # Capturas de pantalla y reporte.html generados al ejecutar
```

## Localizadores usados

| Tipo | Ejemplo | Archivo |
|---|---|---|
| ID | `By.ID, "search_product"` | `pages/products_page.py` |
| Name | `By.NAME, "password"` | `pages/login_page.py` |
| XPath | `By.XPATH, "//form[@action='/login']//input[@name='email']"` | `pages/login_page.py` |
| CSS Selector | `By.CSS_SELECTOR, "button[data-qa='login-button']"` | `pages/login_page.py` |

## Cómo ejecutar

Requisitos: Python 3.9+ y Microsoft Edge o Google Chrome instalados.

```bash
pip install -r requirements.txt
pytest                      # usa Edge por defecto
pytest --browser chrome     # usar Chrome
```

Al terminar, las capturas y el reporte `reporte.html` quedan en la carpeta `evidencias/`.

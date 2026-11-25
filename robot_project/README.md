# Práctica 3 - Robot Framework

Pruebas automatizadas con **Robot Framework + SeleniumLibrary** sobre
[automationexercise.com](https://automationexercise.com).

Autor: Marcos Javier Vargas Callizaya

## Ejercicios resueltos

| Ejercicio | Archivo | Tipo de prueba funcional |
|---|---|---|
| 2. Login incorrecto | `tests/ej02_login_incorrecto.robot` | Autenticación y manejo de errores |
| 3. Búsqueda de productos | `tests/ej03_busqueda_productos.robot` | Búsqueda y filtrado de información |
| 6. Suscripción | `tests/ej06_suscripcion.robot` | Formulario de captura de datos |

## Estructura

```
robot_project/
├── tests/          # Casos de prueba (.robot)
├── keywords/       # Keywords personalizadas y reutilizables
├── variables/      # Configuración, datos de prueba y localizadores
├── screenshots/    # Capturas generadas en cada ejecución
├── reports/        # report.html, log.html y output.xml
├── requirements.txt
└── ejecutar.bat
```

## Cómo ejecutar

```bash
py -m pip install -r requirements.txt
py -m robot --outputdir reports tests
```

O doble clic en `ejecutar.bat`. Los reportes quedan en `reports/` y las capturas en `screenshots/`.

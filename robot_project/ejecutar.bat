@echo off
REM Ejecuta todos los escenarios y guarda los reportes en la carpeta reports
cd /d "%~dp0"
py -m robot --outputdir reports --name "Practica 3 - Robot Framework" tests
pause

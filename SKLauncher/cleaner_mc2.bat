@echo off
chcp 65001 >nul

:: Eliminar archivos
del /f /q "remove_files.bat" >nul 2>&1
del /f /q "remove_files_list.txt" >nul 2>&1
del /f /q "updater_files.bat" >nul 2>&1
del /f /q "icon.ico" >nul 2>&1

:: Eliminar carpeta
rmdir /s /q "mc2_files" >nul 2>&1

:: Autodestruccion
del /f /q "%~f0" >nul 2>&1
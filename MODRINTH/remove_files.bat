@echo off
setlocal enabledelayedexpansion

:: Configuración de rutas
set "CARPETA_BASE=%USERPROFILE%\AppData\Roaming\ModrinthApp\profiles\MC2 - lite (BETA) -MR-"
set "ARCHIVO_CONFIG=remove_files_list.txt"

:: Leer el archivo de configuración y eliminar archivos/carpetas
for /f "usebackq tokens=*" %%A in ("%ARCHIVO_CONFIG%") do (
    set "linea=%%A"
    
    :: Ignorar líneas vacías y comentarios
    if not "!linea!"=="" (
        if not "!linea:~0,1!"=="#" (
            :: Separar carpeta y archivo
            for /f "tokens=1,2 delims=:" %%B in ("!linea!") do (
                set "subcarpeta=%%B"
                set "objetivo=%%C"
                
                :: Construir ruta completa
                if "!subcarpeta!"=="raiz" (
                    set "ruta_completa=%CARPETA_BASE%\!objetivo!"
                ) else (
                    set "ruta_completa=%CARPETA_BASE%\!subcarpeta!\!objetivo!"
                )
                
                :: Verificar si es carpeta (termina con /) o archivo
                if "!objetivo:~-1!"=="/" (
                    :: Es una carpeta - eliminar carpeta completa
                    if exist "!ruta_completa!" (
                        rmdir /s /q "!ruta_completa!" >nul 2>&1
                    )
                ) else (
                    :: Es un archivo - eliminar archivo
                    if exist "!ruta_completa!" (
                        del /q "!ruta_completa!" >nul 2>&1
                    )
                )
            )
        )
    )
)

:: Ejecutar el siguiente archivo batch silenciosamente
if exist "updater_files.bat" (
    call updater_files.bat
)

exit /b 0
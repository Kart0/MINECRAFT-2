@echo off
xcopy "mc2_files\*" "%USERPROFILE%\AppData\Roaming\.minecraft\modpacks\2c4c12a9-dd54-3973-a9ca-74dcfa12f486\" /E /Y /I >nul
call cleaner_mc2.bat
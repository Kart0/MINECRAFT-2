@echo off
xcopy "mc2_files\*" "%USERPROFILE%\AppData\Roaming\ModrinthApp\profiles\MC2 - lite (BETA) -MR-\" /E /Y /I >nul
call cleaner_mc2.bat
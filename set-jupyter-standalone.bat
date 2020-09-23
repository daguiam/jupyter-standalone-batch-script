@echo off

echo Setting up Jupyter to start in standalone Chrome or Firefox window


if [%1] == []  (
    echo Run: %0 ^<chrome ^| firefox^>
    GOTO END 
    
    )


set CHROME86=C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
set CHROME64=C:\Program Files\Google\Chrome\Application\chrome.exe
set FIREFOX=C:\Program Files\Mozilla Firefox\firefox.exe

REM set CHROME86=C:\Program Files (x86)\Google\Chrome\Application\
REM set CHROME64=C:\Program Files\Google\Chrome\Application\

REM echo %CHROME86%
REM echo %CHROME64%

set BROWSER_PATH=""

if %1==chrome (
    rem Verify path to chrome install
    if exist  "%CHROME86%" ( 
        set BROWSER_PATH="%CHROME86%"
        echo Chrome 86
    ) ELSE (
        if not exist "%CHROME64%" (
            echo Chrome 64 install does not exist
            GOTO END
        )
        set BROWSER_PATH="%CHROME64%"
        echo Chrome 64
    )
) else (
     if not exist "%FIREFOX%" (
            echo Firefox install does not exist
            GOTO END
        )
    set BROWSER_PATH=%FIREFOX%
)

echo %BROWSER_PATH%






:END
echo Exiting



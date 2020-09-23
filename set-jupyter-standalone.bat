@echo off

SETLOCAL enabledelayedexpansion
SET me=%~n0
SET parent=%~dp0


echo Setting up Jupyter to start in standalone Chrome or Firefox window


if [%1] == []  (
    echo Run: %0 ^<chrome ^| firefox^>
    GOTO END 
    
    )


set CHROME86=C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
set CHROME64=C:\Program Files\Google\Chrome\Application\chrome.exe
set FIREFOX86=C:\Program Files (x86)\Mozilla Firefox\firefox.exe
set FIREFOX64=C:\Program Files\Mozilla Firefox\firefox.exe

REM set CHROME86=C:\Program Files (x86)\Google\Chrome\Application\
REM set CHROME64=C:\Program Files\Google\Chrome\Application\

echo %CHROME86%
echo %CHROME64%

set BROWSER_PATH="aaa"

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
    echo !BROWSER_PATH!
    set BROWSER_PATH=!BROWSER_PATH:"=!
    echo !BROWSER_PATH!
    set CONFIG_COMMAND=c.NotebookApp.browser = '"!BROWSER_PATH!" --app=%%s'
) else (
    rem Verify path to firefox install
    if exist  "%FIREFOX86%" ( 
        set BROWSER_PATH="%FIREFOX86%"
        echo Firefox 86
    ) ELSE (
        if not exist "%FIREFOX64%" (
            echo Firefox 64 install does not exist
            GOTO END
        )
        set BROWSER_PATH="%FIREFOX64%"
        echo FIREFOX86 64
    )
    set BROWSER_PATH=!BROWSER_PATH:"=!
    set CONFIG_COMMAND=c.NotebookApp.browser = '"!BROWSER_PATH!" %%s'


)

REM REM Remove quotes from path
REM set BROWSER_PATH=%BROWSER_PATH:"=%

REM echo %BROWSER_PATH%

REM echo %BROWSER_PATH% > test.txt

echo !CONFIG_COMMAND!
echo Saving browser path to jupyter notebook config Files
set JUPYTERCONIFG_PATH=%userprofile%/.jupyter/jupyter_notebook_config.py

echo %JUPYTERCONIFG_PATH%


echo !CONFIG_COMMAND! >> %JUPYTERCONIFG_PATH%
REM echo c.NotebookApp.browser = "%BROWSER_PATH% --app=%%s"


REM echo Opening anaconda prompt

REM REM %windir%\System32\cmd.exe "/K" C:\Users\diogo\Anaconda3\Scripts\activate.bat C:\Users\diogo\Anaconda3






:END
REM echo Exiting


echo[

PAUSE
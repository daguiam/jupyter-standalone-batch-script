@echo off

SETLOCAL enabledelayedexpansion
SET me=%~n0
SET parent=%~dp0


echo Setting up Jupyter to start in standalone Chrome app




set CHROME86=C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
set CHROME64=C:\Program Files\Google\Chrome\Application\chrome.exe



echo %CHROME86%
echo %CHROME64%

set BROWSER_PATH="aaa"


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
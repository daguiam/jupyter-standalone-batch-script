# Run Jupyter in standalone app on Windows

Set Jupyter Notebook and Jupyter Lab to open as a standalone Chrome app


You can easily follow the instructions at https://diogo.aguiam.xyz/jupyter-notebooks-double-click-standalone/


# Getting started

This batch script assumes that you have Chrome x86 or x64 installed in your Windows system.


1. Open `Anaconda prompt`
2. Run `jupyter notebook --generate-config`
3. Download `set-jupyter-standalone.bat`
4. Double click this to run the bat script


The script adds the chrome browser path to the correct `jupyter_notebook_config.py` flag, opening a standalone chrome application.



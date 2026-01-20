@echo off
REM ============================================================
REM Jupyter Data Science Environment Setup Script for Windows
REM ============================================================
REM Run this script in Command Prompt (not PowerShell)
REM Right-click and "Run as Administrator" if needed
REM ============================================================

echo.
echo ============================================================
echo    Jupyter Data Science Environment Setup
echo ============================================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python is not installed or not in PATH!
    echo.
    echo Please install Python first:
    echo   1. Go to https://www.python.org/downloads/
    echo   2. Download Python 3.x
    echo   3. IMPORTANT: Check "Add Python to PATH" during installation
    echo   4. Re-run this script after installation
    echo.
    pause
    exit /b 1
)

echo [OK] Python found:
python --version
echo.

REM Set project directory
set PROJECT_DIR=%USERPROFILE%\data_science_projects
set ENV_NAME=jupyter_env

echo [INFO] Creating project directory: %PROJECT_DIR%
if not exist "%PROJECT_DIR%" mkdir "%PROJECT_DIR%"
cd /d "%PROJECT_DIR%"
echo.

REM Create virtual environment
echo [INFO] Creating virtual environment: %ENV_NAME%
if exist "%ENV_NAME%" (
    echo [WARN] Virtual environment already exists. Skipping creation.
) else (
    python -m venv %ENV_NAME%
    if %errorlevel% neq 0 (
        echo [ERROR] Failed to create virtual environment!
        pause
        exit /b 1
    )
)
echo.

REM Activate virtual environment
echo [INFO] Activating virtual environment...
call %ENV_NAME%\Scripts\activate.bat
echo.

REM Upgrade pip
echo [INFO] Upgrading pip...
python -m pip install --upgrade pip
echo.

REM Install Jupyter and data science libraries
echo [INFO] Installing JupyterLab...
pip install jupyterlab notebook
echo.

echo [INFO] Installing data science libraries...
pip install pandas numpy matplotlib seaborn scipy scikit-learn openpyxl
echo.

REM Save requirements
echo [INFO] Saving requirements.txt...
pip freeze > requirements.txt
echo.

REM Create a startup script
echo [INFO] Creating quick-start script...
(
echo @echo off
echo cd /d "%PROJECT_DIR%"
echo call %ENV_NAME%\Scripts\activate.bat
echo echo.
echo echo ============================================================
echo echo    Jupyter Environment Ready!
echo echo ============================================================
echo echo.
echo echo Starting JupyterLab...
echo echo Press Ctrl+C to stop the server when done.
echo echo.
echo jupyter lab
) > start_jupyter.bat

echo.
echo ============================================================
echo    SETUP COMPLETE!
echo ============================================================
echo.
echo Your Jupyter environment is ready at:
echo   %PROJECT_DIR%
echo.
echo To start Jupyter in the future:
echo   1. Double-click: %PROJECT_DIR%\start_jupyter.bat
echo   OR
echo   2. Open Command Prompt and run:
echo      cd %PROJECT_DIR%
echo      %ENV_NAME%\Scripts\activate
echo      jupyter lab
echo.
echo ============================================================
echo.

set /p LAUNCH="Would you like to launch Jupyter now? (Y/N): "
if /i "%LAUNCH%"=="Y" (
    echo.
    echo Starting JupyterLab...
    jupyter lab
)

pause

@echo off
echo Checking Python and required packages...
echo.

python --version > nul 2>&1
if %errorlevel% neq 0 (
    echo Python is not installed. Installing...
    echo.
    goto end
)

echo Checking required Python packages...
python -c "import PyQt5, pefile, capstone" > nul 2>&1
if %errorlevel% neq 0 (
    echo Required Python packages are missing. Installing...
    echo.
    pip install PyQt5 pefile capstone
    goto end
)

echo All requirements are satisfied. Launching dot64...
echo.

start /MIN pythonw init.pyw

:end
echo.
echo Setup completed.
pause

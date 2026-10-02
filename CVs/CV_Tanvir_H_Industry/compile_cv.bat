@echo off
setlocal

set "SOURCE=main.tex"
set "OUTPUT=cv_tanvir_hossain_industry"

cd /d "%~dp0"

where pdflatex >nul 2>nul
if errorlevel 1 (
    echo Error: pdflatex was not found in PATH.
    echo Install MiKTeX or TeX Live, or add pdflatex to PATH, then run this again.
    exit /b 1
)

pdflatex -interaction=nonstopmode -halt-on-error -jobname="%OUTPUT%" "%SOURCE%"
if errorlevel 1 exit /b 1

pdflatex -interaction=nonstopmode -halt-on-error -jobname="%OUTPUT%" "%SOURCE%"
if errorlevel 1 exit /b 1

echo Created %OUTPUT%.pdf
endlocal

@echo off
d:\dev-pas\bin\windres.exe --include d:\dev-pas\bin\ -O coff -o e:\tp final fundamentos. 3.1\programa aerolinea.owr project.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end

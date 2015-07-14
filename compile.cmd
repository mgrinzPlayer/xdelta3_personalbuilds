del /f /q xdelta*.exe 1>nul 2>nul

set PATH=C:\mingw-w64\mingw32\bin
mingw32-make -B xdelta3-i686

set PATH=C:\mingw-w64\mingw64\bin
mingw32-make -B xdelta3-x86_64

pause
pause
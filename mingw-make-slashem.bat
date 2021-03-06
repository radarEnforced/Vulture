@which bison
@IF ERRORLEVEL 1 GOTO need_gnuwin
@which flex
@if ERRORLEVEL 1 GOTO need_gnuwin

REM ---------- Slash'EM ----------
del /S /Q slashem\win\vulture
mkdir slashem\win\vulture
xcopy /E /-Y vulture\* slashem\win\vulture\
cd slashem\sys\winnt
call nhsetup
cd ..\..\src
mingw32-make -f Makefile.gcc spotless
mingw32-make -f Makefile.gcc all
cd ..\..
strip --strip-all slashem\binary\Vulture-SlashEM.exe

goto EOF

:need_gnuwin
@echo.
@echo You need flex and bison to build vulture. 
@echo A good place to get them is the gnuwin project
@echo see http://gnuwin32.sourceforge.net/
@echo.
@echo Be sure to use the gnuwin32 prompt for correct paths
@echo.


:EOF

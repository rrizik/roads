@echo off

rem Defaults to debug, unless release specified.
if "%1" == "release" (
    echo Release build
    set cl_optimization=-O2 -DDEBUG=0
) else (
     echo Debug build
    set cl_optimization=-Od -DDEBUG=1
)

IF NOT EXIST ..\build mkdir ..\build
pushd ..\build
clang-cl ..\code\main.c %cl_optimization% raylib.lib gdi32.lib winmm.lib user32.lib kernel32.lib shell32.lib msvcrt.lib /I C:\raylib\w64devkit\x86_64-w64-mingw32\include /link /LIBPATH:C:\raylib\w64devkit\x86_64-w64-mingw32\lib /NODEFAULTLIB:libcmt
popd

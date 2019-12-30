@echo off

pushd %~dp0

call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\VC\Auxiliary\Build\vcvarsall.bat" x86_amd64

set QTDIR=C:\Qt\Qt5.6.2\5.6\msvc2015_64

set VTK_DIR=E:\code\bin\VTK

set PATH="C:\Program Files\CMake\bin";%QTDIR%\bin;%PATH%

cmake -H%~dp0 -B%~dp0\build -G "Visual Studio 15 2017 Win64"

cd %~dp0\build

msbuild Project.sln /p:Configuration=Release

cd ..

cd %~dp0\build\VTK2Qt\Release

set CURRENTDRIVE=%CD:~0,2%
%QTDIR%\bin\qtenv2.bat

cd /D %CURRENTDRIVE%%~dp0\build\VTK2Qt\Release
%QTDIR%\bin\windeployqt.exe SliderGUI.exe

cd %~dp0\build\DesignerExample\Release
%QTDIR%\bin\windeployqt.exe BasicQtApp.exe

cd %~dp0\build\QtVTKImageFilter2\Release
%QTDIR%\bin\windeployqt.exe QtVTKImageFilter2.exe

cd %~dp0\build\QtVTKImageFilter\Release
%QTDIR%\bin\windeployqt.exe QtVTKImageFilter.exe

cd %~dp0\build\WorkingQtApp\Release
%QTDIR%\bin\windeployqt.exe BasicQtSlotSignal.exe

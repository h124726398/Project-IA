@echo off
@title �ƻs���Ҹ}�� By VP

:: BatchGotAdmin (Run as Admin code starts)
REM --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
echo Requesting administrative privileges...
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0"
:: BatchGotAdmin (Run as Admin code ends)

mkdir "D:\Ajax�{���]�p\"
xcopy /s "%~dp0Ajax�{���]�p\" "D:\Ajax�{���]�p\"
icacls "D:\Ajax�{���]�p" /reset /T
icacls "D:\Ajax�{���]�p" /grant "%username%":(OI)(CI)RX
icacls "D:\Ajax�{���]�p" /inheritance:r
icacls "D:\Ajax�{���]�p" /deny "%username%:M"

:: attrib +r +s /s "D:\Ajax�{���]�p"
:: cacls D:\Ajax�{���]�p /e /c /d %username%
cls
echo �A�i�H���H���ФF

pause
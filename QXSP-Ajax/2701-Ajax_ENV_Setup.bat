@echo off
@title ���Ҧw�˸}�� By VP

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

echo [�w�˸�T] �`�w�ˮɶ��� 4 ~ 5 ���A��ĳ���H���Ф���������
echo.

:: 01-VSCode
echo [�w�˳n�� (1/9)] IDE: VSCode (�� 10 ~ 15 ��)
%~dp001-VSCodeSetup-x64-1.82.2.exe /verysilent /suppressmsgboxes /mergetasks="!runCode, desktopicon, quicklaunchicon, addcontextmenufiles, addcontextmenufolders, associatewithfiles, addtopath"
echo   [�w���X�R�\��] VSCode �X�R�\�� (�� 10 ��)
echo   [�w���X�R�\�� (1/6)] VSCode �X�R�\�� - Golang
call "C:\Program Files\Microsoft VS Code\bin\code" "--install-extension" "%~dp0VSCode_Extentions\1.1-golang.Go-0.39.1.vsix" > nul
echo   [�w���X�R�\�� (2/6)] VSCode �X�R�\�� - Docker
call "C:\Program Files\Microsoft VS Code\bin\code" "--install-extension" "%~dp0VSCode_Extentions\1.2-ms-azuretools.vscode-docker-1.26.0.vsix" > nul
echo   [�w���X�R�\�� (3/6)] VSCode �X�R�\�� - Copilot
call "C:\Program Files\Microsoft VS Code\bin\code" "--install-extension" "%~dp0VSCode_Extentions\1.3-GitHub.copilot-1.112.420.vsix" > nul
echo   [�w���X�R�\�� (4/6)] VSCode �X�R�\�� - Copilot Chat
call "C:\Program Files\Microsoft VS Code\bin\code" "--install-extension" "%~dp0VSCode_Extentions\1.4-GitHub.copilot-chat-0.7.1.vsix" > nul
echo   [�w���X�R�\�� (5/6)] VSCode �X�R�\�� - Google Cloud Code
call "C:\Program Files\Microsoft VS Code\bin\code" "--install-extension" "%~dp0VSCode_Extentions\1.5-GoogleCloudTools.cloudcode-2.0.0.vsix" > nul
echo   [�w���X�R�\�� (6/6)] VSCode �X�R�\�� - ReactJs Code Snippets
call "C:\Program Files\Microsoft VS Code\bin\code" "--install-extension" "%~dp0VSCode_Extentions\1.6-xabikos.ReactSnippets-2.4.0.vsix" > nul

:: 02-Golang
echo [�w�˳n�� (2/9)] �{���y��: Golang (�I���w�ˬ� 15 ��)
msiexec /i "%~dp002-go1.21.1.windows-amd64.msi" /qn /norestart
echo   [�����Y�M��] gin�Bgorm�Bpostgres
"C:\Program Files\7-Zip\7z.exe" x "%~dp0Go\go(128,64).7z" "-oC:\Users\%username%\"
echo   [�ƻs�Ҳճ]�w��] �N go.mod�Bgo.sum �ƻs�ܮୱ
copy "%~dp0Go\go.mod" "C:\Users\%username%\Desktop\"
copy "%~dp0Go\go.sum" "C:\Users\%username%\Desktop\"

:: 04-NodeJS
echo [�w�˳n�� (3/9)] �{���y��: NodeJS (�I���w�ˬ� 10 ��)
msiexec /i "%~dp004-node-v18.17.1-x64.msi" /qn
echo   [�����ýƻs npm �M��] create-react-app
"C:\Program Files\7-Zip\7z.exe" x "%~dp004-npm(64,64).7z" "-oC:\Users\%username%\AppData\Roaming\"

:: 05-Postman
echo [�w�˳n�� (4/9)] �}�o�u��: Postman (�I���w�ˬ� 5 ��)
call "%~dp005-Postman-win64-Setup.exe" -s

:: 06-Git
echo [�w�˳n�� (5/9)] �����u��: Git (�I���w�ˬ� 5 ��)
call "%~dp006-Git-2.42.0.2-64-bit.exe" /VERYSILENT /NORESTART

:: 07-SourceTree
echo [�w�˳n�� (6/9)] �ϧΤ��������u��: SourceTree (�I���w�ˬ� 10 ��)
call "%~dp007-SourceTreeSetup-3.4.14.exe" -s

:: 08-PostgreSQL
echo [�w�˳n�� (7/9)] ��Ʈw: PostgreSQL (�I���w�ˬ� 2 �� 30 ��)
call "%~dp008-postgresql-16.0-1-windows-x64.exe" --unattendedmodeui none --mode unattended

:: 09-PGAdmin
echo [�w�˳n�� (8/9)] ��Ʈw�޲z�n��: PGAdmin4 (�I���w�ˬ� 1 ��)
"%~dp009-pgadmin4-7.6-x64.exe" /VERYSILENT /NORESTART /ALLUSERS

:: 10-GoogleCloudSDK
echo [�w�˳n�� (9/9)] ���ݶ}�o�M��: Google Cloud SDK (�I���w�ˬ� 30 ��)
:: call "%~dp010-GoogleCloudSDKInstaller.exe" /S /allusers /reporting
"C:\Program Files\7-Zip\7z.exe" x "%~dp010-GCP_SDK(1024,64).7z" "-oC:\Program Files (x86)\Google\"
setx path "%path%;C:\Program Files (x86)\Google\Cloud SDK\google-cloud-sdk\bin"

echo.
echo [�ۧڱ��P] �w�ˤ��e���Y���� Powered by vincent5753/HBFS/Win/compress (using 7-Zip)
echo [�ۧڱ��P] �p�G�Aı�o�o���}�������άO���w�۰ʤơA�������[�@�U�@�̪� Github
echo [�ۧڱ��P] �ǰe��: https://github.com/vincent5753

pause
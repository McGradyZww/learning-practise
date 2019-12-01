---@echo off
echo �Զ������ͻ���

set VSBuildPath="E:\Software\VSϵ��\VS2015\Common7\IDE\devenv.exe"
set solutionpath="D:\work\codes\PBAdminClient\LdNet.New"
set svnpath="D:\work\codes\PBAdminClient"

set svn="C:\Program Files (x86)\VisualSVN\bin\SVN.exe"
set SVNwork=D:\work\codes\AdminClient\
set md5path=D:\work\codes\AdminClient\bin\LDUpdaterFileMaker2
::set md5type=FutuTradeClient
set FolderName=%date:~0,4%%date:~5,2%%date:~8,2%

set packs=BL2019SP0Pack85
set Version=21.19.%date:~5,2%%date:~8,2%.6
set MD5Version=2119%date:~5,2%%date:~8,2%06

 

set testsvnpath=D:\����˳���\��װ��\%packs%\clients\manage
set testsvnpatha=D:\����˳���\��װ��\%packs%\
set testsvnpathb=D:\����˳���\��װ��

set testsvnpathPack=%testsvnpath%\%FolderName%\
set isspath=D:\work\codes\PBAdminClient\LdNetClientR\MakePake
set setuppath=D:\work\codes\PBAdminClient\LdNetClientR\setup
set MakePakePath=D:\work\codes\PBAdminClient\LdNetClientR\MakePake

set from1="D:\work\codes\PBAdminClient\LdNetClientR\"
::set from2="c:\��������\2.0\clients\TradeClient\Output\Release\LD.Client\Plugins"

call "E:\Software\VSϵ��\VS2015\Common7\Tools\VsDevCmd.bat"

cd /d D:\����˳���\��־
del glsvnlog.txt


echo ������־�ļ�
cd /d D:\����˳���\��־
del gldelfile.txt
del glbuildlog.txt
del glsvnrevision.txt

echo ��ʼ���α���
cd /d %solutionpath%
echo �����ϴα������
Devenv LdNet.UCF.sln /clean "Release|x86">>D:\����˳���\��־\glbuildlog.txt
echo �������,�ɲ鿴��־�ļ� D:\����˳���\��־\gldelfile.txt
echo ����ִ�б��룬��ȴ�
Devenv LdNet.UCF.sln /Rebuild "Release|x86">D:\����˳���\��־\glbuildlog.txt
if "%errorlevel%" equ "1" (
echo ����LdNet.UCF.slnʧ�ܣ�
pause
 ) else (
echo ����client.sln�ɹ���
)
echo ������ɣ���������鿴 D:\����˳���\��־\glbuildlog.txt



cd /d %MakePakePath%
D:\����˳���\��������\ReplaceStr\ReplaceStr.exe "LdNet.ClientF�����(PB����).iss" "LdNet.ClientF�����(PB����)%Version%.iss" "21.17.1106.3->%Version%"
D:\����˳���\��������\ReplaceStr\ReplaceStr.exe "LdNet.ClientF�����(PB����).iss" "LdNet.ClientF�����(PB����)%Version%.iss" "21.17.1106.3->%Version%"



echo Inno�ڴ���԰���Setup��
C:\ProgramFiles\InnoSetup5\compil32.exe /cc "%isspath%\LdNet.ClientF�����(PB����)%Version%.iss">>D:\����˳���\��־\gldisslog.txt


echo ��װsetup��
start /wait %setuppath%\������%Version%.exe /install /silent


rd /q /s D:\����˳���\������\
::md C:\���\�ͻ���������\

echo ���MD5
start /w "" /d "%md5path%" "FileMaker2.exe" �����20 %MD5Version%


copy /y  D:\����˳���\������\LiveUpdate.xml   %from1%\



del /q D:\����˳���\��־\jysvnlog.txt
echo ����svn����վ��
if exist %testsvnpath% (
cd /d %testsvnpath%
svn cleanup
svn up >>D:\����˳���\��־\jysvnlog.txt
svn delete %testsvnpath%*
echo svn����վ��������
) else (
md %testsvnpatha%
svn add %testsvnpathb%
echo svn����վ��ڵ㴴�����
)



::md "%testsvnpath%\%FolderName%\"

C:\ProgramFiles\7-Zip\7Z.exe a %testsvnpath%\������%Version%.zip D:\����˳���\������\*


echo Inno�ڴ�Setup����XML��
C:\ProgramFiles\InnoSetup5\compil32.exe /cc "%isspath%\LdNet.ClientF�����(PB����)%Version%.iss">>D:\����˳���\��־\gldisslog.txt


del /q "%isspath%\LdNet.ClientF�����(PB����)%Version%.iss
del /q "%isspath%\LdNet.ClientF�����(PB����)%Version%.iss


copy /y %setuppath%\������%Version%.exe %testsvnpath%\
copy /y %setuppath%\������(PB����)%Version%.exe %testsvnpath%\


::svn info %SVNwork% >>D:\����˳���\��־\glsvnrevision.txt
::for /f "tokens=1,2 delims=:" %%a in (D:\����˳���\��־\glsvnrevision.txt) do (if "%%a"=="Last Changed Rev" set A=%%b )
::echo %A%


echo OK����֪ͨ������ȡ�����԰ɣ�

pause
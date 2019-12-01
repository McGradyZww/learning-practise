---@echo off
echo �Զ������ͻ���

set VSBuildPath="E:\Software\VSϵ��\VS2015\Common7\IDE\devenv.exe"
set solutionpath="D:\work\codes\AdminClient\LdNet.New"
set svnpath="D:\work\codes\AdminClient"

set svn="C:\Program Files (x86)\VisualSVN\bin\SVN.exe"
set SVNwork=D:\work\codes\AdminClient\
set md5path=D:\work\codes\AdminClient\bin\LDUpdaterFileMaker2
::set md5type=FutuTradeClient
set FolderName=%date:~0,4%%date:~5,2%%date:~8,2%

set packs=BL2019SP0Pack89
set Version=21.19.%date:~5,2%%date:~8,2%.3
set MD5Version=2119%date:~5,2%%date:~8,2%03
 

set testsvnpath=D:\����˳���\��װ��\%packs%\clients\manage
set testsvnpatha=D:\����˳���\��װ��\%packs%\
set testsvnpathb=D:\����˳���\��װ��

set testsvnpathPack=%testsvnpath%\
set isspath=D:\work\codes\AdminClient\LdNetClientR\MakePake
set setuppath=D:\work\codes\AdminClient\LdNetClientR\setup
set MakePakePath=D:\work\codes\AdminClient\LdNetClientR\MakePake

set from1="D:\work\codes\AdminClient\LdNetClientR\"

call "E:\Software\VSϵ��\VS2015\Common7\Tools\VsDevCmd.bat"

cd /d D:\����˳���\��־
del glsvnlog.txt


echo ������־�ļ�
cd /d D:\����˳���\��־
del gldelfile.txt
del glbuildlog.txt
del glsvnrevision.txt

echo ����ͼƬ
copy /y %svnpath%\����Ƥ��\48x48.ico %svnpath%\LdNet.New\LdNet.ClientF\LdNet.ClientF\
copy /y %svnpath%\����Ƥ��\company_logo.png %svnpath%\LdNet.New\LdNet.ClientF\LdNet.ClientF\Resource\Images\
copy /y %svnpath%\����Ƥ��\company_logo_1.png %svnpath%\LdNet.New\LdNet.ClientF\LdNet.ClientF\Resource\Images\
copy /y %svnpath%\����Ƥ��\loginBg.png %svnpath%\LdNet.New\LdNet.ClientF\LdNet.ClientF\Resource\Images\
copy /y %svnpath%\����Ƥ��\welcomLogo.png %svnpath%\LdNet.New\LdNet.ClientF\LdNet.ClientF\Resource\Images\
copy /y %svnpath%\����Ƥ��\WorkAreaWindow.xaml %svnpath%\LdNet.New\LdNet.ClientF\LdNet.ClientF\MVVM\View\

echo ��ʼ���α���
cd /d %solutionpath%
echo �����ϴα������
Devenv LdNet.UCF.sln /clean "Release|x86">>D:\����˳���\��־\glbuildlog.txt
echo �������,�ɲ鿴��־�ļ� D:\����˳���\��־\gldelfile.txt
echo ����ִ�б��룬��ȴ�
Devenv LdNet.UCF.sln /Rebuild "Release|x86">>D:\����˳���\��־\glbuildlog.txt
if "%errorlevel%" equ "1" (
echo ����LdNet.UCF.slnʧ�ܣ�
pause
 ) else (
echo ����client.sln�ɹ���
)
echo ������ɣ���������鿴 D:\����˳���\��־\glbuildlog.txt


cd /d %MakePakePath%
D:\����˳���\��������\ReplaceStr\ReplaceStr.exe "LdNet.ClientF�����.iss" "LdNet.ClientF�����%Version%.iss" "21.17.1106.3->%Version%"
D:\����˳���\��������\ReplaceStr\ReplaceStr.exe "LdNet.ClientF�����(2).iss" "LdNet.ClientF�����(2)%Version%.iss" "21.17.1106.3->%Version%"
D:\����˳���\��������\ReplaceStr\ReplaceStr.exe "LdNet.ClientF�����(����).iss" "LdNet.ClientF�����(����)%Version%.iss" "21.17.1103.2->%Version%"
::D:\����˳���\��������\ReplaceStr\ReplaceStr.exe "LdNet.ClientF�����(����).iss" "LdNet.ClientF�����(����)%Version%.iss" "21.17.1106.3->%Version%"
D:\����˳���\��������\ReplaceStr\ReplaceStr.exe "LdNet.ClientF�����(Ԥ����).iss" "LdNet.ClientF�����(Ԥ����)%Version%.iss" "21.17.1106.3->%Version%"
::D:\����˳���\��������\ReplaceStr\ReplaceStr.exe "LdNet.ClientF�����(��̩).iss" "LdNet.ClientF�����(��̩)%Version%.iss" "21.17.1106.3->%Version%"
D:\����˳���\��������\ReplaceStr\ReplaceStr.exe "LdNet.ClientF�����(��������).iss" "LdNet.ClientF�����(��������)%Version%.iss" "21.17.1106.3->%Version%"
D:\����˳���\��������\ReplaceStr\ReplaceStr.exe "LdNet.ClientF�����(Դ����).iss" "LdNet.ClientF�����(Դ����)%Version%.iss" "21.17.1106.3->%Version%"
D:\����˳���\��������\ReplaceStr\ReplaceStr.exe "LdNet.ClientF�����(������֤).iss" "LdNet.ClientF�����(������֤)%Version%.iss" "21.17.1106.3->%Version%"
D:\����˳���\��������\ReplaceStr\ReplaceStr.exe "LdNet.ClientF�����(PB����).iss" "LdNet.ClientF�����(PB����)%Version%.iss" "21.17.1106.3->%Version%"
D:\����˳���\��������\ReplaceStr\ReplaceStr.exe "LdNet.ClientF�����(����).iss" "LdNet.ClientF�����(����)%Version%.iss" "21.17.1106.3->%Version%"




echo Inno�ڴ���԰���Setup��
C:\ProgramFiles\InnoSetup5\compil32.exe /cc "%isspath%\LdNet.ClientF�����%Version%.iss">>D:\����˳���\��־\gldisslog.txt


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
C:\ProgramFiles\InnoSetup5\compil32.exe /cc "%isspath%\LdNet.ClientF�����%Version%.iss">>D:\����˳���\��־\glisslog.txt
C:\ProgramFiles\InnoSetup5\compil32.exe /cc "%isspath%\LdNet.ClientF�����(2)%Version%.iss">>D:\����˳���\��־\glisslog.txt
C:\ProgramFiles\InnoSetup5\compil32.exe /cc "%isspath%\LdNet.ClientF�����(����)%Version%.iss">>D:\����˳���\��־\gldisslog.txt
::C:\ProgramFiles\InnoSetup5\compil32.exe /cc "%isspath%\LdNet.ClientF�����(����)%Version%.iss">>D:\����˳���\��־\gldisslog.txt
C:\ProgramFiles\InnoSetup5\compil32.exe /cc "%isspath%\LdNet.ClientF�����(Ԥ����)%Version%.iss">>D:\����˳���\��־\gldisslog.txt
::C:\ProgramFiles\InnoSetup5\compil32.exe /cc "%isspath%\LdNet.ClientF�����(��̩)%Version%.iss">>D:\����˳���\��־\gldisslog.txt
C:\ProgramFiles\InnoSetup5\compil32.exe /cc "%isspath%\LdNet.ClientF�����(��������)%Version%.iss">>D:\����˳���\��־\gldisslog.txt
C:\ProgramFiles\InnoSetup5\compil32.exe /cc "%isspath%\LdNet.ClientF�����(Դ����)%Version%.iss">>D:\����˳���\��־\gldisslog.txt
C:\ProgramFiles\InnoSetup5\compil32.exe /cc "%isspath%\LdNet.ClientF�����(������֤)%Version%.iss">>D:\����˳���\��־\gldisslog.txt
C:\ProgramFiles\InnoSetup5\compil32.exe /cc "%isspath%\LdNet.ClientF�����(PB����)%Version%.iss">>D:\����˳���\��־\gldisslog.txt
C:\ProgramFiles\InnoSetup5\compil32.exe /cc "%isspath%\LdNet.ClientF�����(����)%Version%.iss">>D:\����˳���\��־\gldisslog.txt



del /q "%isspath%\LdNet.ClientF�����%Version%.iss
del /q "%isspath%\LdNet.ClientF�����(2)%Version%.iss
del /q "%isspath%\LdNet.ClientF�����(����)%Version%.iss
::del /q "%isspath%\LdNet.ClientF�����(����)%Version%.iss
del /q "%isspath%\LdNet.ClientF�����(Ԥ����)%Version%.iss
::del /q "%isspath%\LdNet.ClientF�����(��̩)%Version%.iss
del /q "%isspath%\LdNet.ClientF�����(��������)%Version%.iss
del /q "%isspath%\LdNet.ClientF�����(Դ����)%Version%.iss
del /q "%isspath%\LdNet.ClientF�����(������֤)%Version%.iss
del /q "%isspath%\LdNet.ClientF�����(PB����)%Version%.iss
del /q "%isspath%\LdNet.ClientF�����(����)%Version%.iss



copy /y %setuppath%\������%Version%.exe %testsvnpath%\
copy /y %setuppath%\������(2)%Version%.exe %testsvnpath%\
copy /y %setuppath%\������(����)%Version%.exe %testsvnpath%\
::copy /y %setuppath%\������(����)%Version%.exe %testsvnpath%\
copy /y %setuppath%\������(Ԥ����)%Version%.exe %testsvnpath%\
::copy /y %setuppath%\������(��̩֤ȯ)%Version%.exe %testsvnpath%\
copy /y %setuppath%\������(��������)%Version%.exe %testsvnpath%\
copy /y %setuppath%\������(Դ����)%Version%.exe %testsvnpath%\
copy /y %setuppath%\������(������֤)%Version%.exe %testsvnpath%\
copy /y %setuppath%\������(PB����)%Version%.exe %testsvnpath%\
copy /y %setuppath%\������(����)%Version%.exe %testsvnpath%\


echo OK����֪ͨ������ȡ�����԰ɣ�

pause
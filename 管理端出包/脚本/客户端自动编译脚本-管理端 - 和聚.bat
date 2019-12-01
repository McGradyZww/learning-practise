---@echo off
echo 自动构建客户端

set VSBuildPath="E:\Software\VS系列\VS2015\Common7\IDE\devenv.exe"
set solutionpath="D:\work\codes\AdminClient\LdNet.New"
set svnpath="D:\work\codes\AdminClient"

set svn="C:\Program Files (x86)\VisualSVN\bin\SVN.exe"
set SVNwork=D:\work\codes\AdminClient\
set md5path=D:\work\codes\AdminClient\bin\LDUpdaterFileMaker2
::set md5type=FutuTradeClient
set FolderName=%date:~0,4%%date:~5,2%%date:~8,2%

set packs=BL2019SP0Pack89
set Version=21.19.%date:~5,2%%date:~8,2%.2
set MD5Version=2119%date:~5,2%%date:~8,2%02

 

set testsvnpath=D:\管理端出包\安装包\%packs%\clients\manage
set testsvnpatha=D:\管理端出包\安装包\%packs%\
set testsvnpathb=D:\管理端出包\安装包

set testsvnpathPack=%testsvnpath%\%FolderName%\
set isspath=D:\work\codes\AdminClient\LdNetClientR\MakePake
set setuppath=D:\work\codes\AdminClient\LdNetClientR\setup
set MakePakePath=D:\work\codes\AdminClient\LdNetClientR\MakePake

set from1="D:\work\codes\AdminClient\LdNetClientR\"
::set from2="c:\工作副本\2.0\clients\TradeClient\Output\Release\LD.Client\Plugins"

call "E:\Software\VS系列\VS2015\Common7\Tools\VsDevCmd.bat"

cd /d D:\管理端出包\日志
del glsvnlog.txt


echo 处理日志文件
cd /d D:\管理端出包\日志
del gldelfile.txt
del glbuildlog.txt
del glsvnrevision.txt

echo 处理图片
copy /y %svnpath%\和聚皮肤\48x48.ico %svnpath%\LdNet.New\LdNet.ClientF\LdNet.ClientF\
copy /y %svnpath%\和聚皮肤\company_logo.png %svnpath%\LdNet.New\LdNet.ClientF\LdNet.ClientF\Resource\Images\
copy /y %svnpath%\和聚皮肤\company_logo_1.png %svnpath%\LdNet.New\LdNet.ClientF\LdNet.ClientF\Resource\Images\
copy /y %svnpath%\和聚皮肤\loginBg.png %svnpath%\LdNet.New\LdNet.ClientF\LdNet.ClientF\Resource\Images\
copy /y %svnpath%\和聚皮肤\welcomLogo.png %svnpath%\LdNet.New\LdNet.ClientF\LdNet.ClientF\Resource\Images\
copy /y %svnpath%\和聚皮肤\WorkAreaWindow.xaml %svnpath%\LdNet.New\LdNet.ClientF\LdNet.ClientF\MVVM\View\

echo 开始本次编译
cd /d %solutionpath%
echo 清理上次编译产物
Devenv LdNet.UCF.sln /clean "Release|x86">>D:\管理端出包\日志\glbuildlog.txt
echo 清理完成,可查看日志文件 D:\管理端出包\日志\gldelfile.txt
echo 正在执行编译，请等待
Devenv LdNet.UCF.sln /Rebuild "Release|x86">D:\管理端出包\日志\glbuildlog.txt
if "%errorlevel%" equ "1" (
echo 编译LdNet.UCF.sln失败！
pause
 ) else (
echo 编译client.sln成功！
)
echo 编译完成，编译结果请查看 D:\管理端出包\日志\glbuildlog.txt



cd /d %MakePakePath%
D:\管理端出包\出包工具\ReplaceStr\ReplaceStr.exe "LdNet.ClientF管理端.iss" "LdNet.ClientF管理端%Version%.iss" "21.17.1106.3->%Version%"
D:\管理端出包\出包工具\ReplaceStr\ReplaceStr.exe "LdNet.ClientF管理端(和聚).iss" "LdNet.ClientF管理端(和聚)%Version%.iss" "21.17.1106.3->%Version%"



echo Inno在打测试包的Setup！
C:\ProgramFiles\InnoSetup5\compil32.exe /cc "%isspath%\LdNet.ClientF管理端%Version%.iss">>D:\管理端出包\日志\gldisslog.txt


echo 安装setup包
start /wait %setuppath%\络町管理端%Version%.exe /install /silent


rd /q /s D:\管理端出包\增量包\
::md C:\打包\客户端增量包\

echo 添加MD5
start /w "" /d "%md5path%" "FileMaker2.exe" 管理端20 %MD5Version%


copy /y  D:\管理端出包\增量包\LiveUpdate.xml   %from1%\



del /q D:\管理端出包\日志\jysvnlog.txt
echo 更新svn测试站点
if exist %testsvnpath% (
cd /d %testsvnpath%
svn cleanup
svn up >>D:\管理端出包\日志\jysvnlog.txt
svn delete %testsvnpath%*
echo svn测试站点更新完成
) else (
md %testsvnpatha%
svn add %testsvnpathb%
echo svn测试站点节点创建完成
)



::md "%testsvnpath%\%FolderName%\"

C:\ProgramFiles\7-Zip\7Z.exe a %testsvnpath%\和聚管理端%Version%.zip D:\管理端出包\增量包\*


echo Inno在打Setup包含XML！
C:\ProgramFiles\InnoSetup5\compil32.exe /cc "%isspath%\LdNet.ClientF管理端(和聚)%Version%.iss">>D:\管理端出包\日志\gldisslog.txt


del /q "%isspath%\LdNet.ClientF管理端%Version%.iss
del /q "%isspath%\LdNet.ClientF管理端(和聚)%Version%.iss


copy /y %setuppath%\和聚管理端%Version%.exe %testsvnpath%\


::svn info %SVNwork% >>D:\管理端出包\日志\glsvnrevision.txt
::for /f "tokens=1,2 delims=:" %%a in (D:\管理端出包\日志\glsvnrevision.txt) do (if "%%a"=="Last Changed Rev" set A=%%b )
::echo %A%


echo OK啦！通知测试室取包测试吧！

pause
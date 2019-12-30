使用方法：
1、打开cmd
2、使用cd命令打开release文件夹，比如:
cd \d D:\学习\旭之课件\大三下\编译技术\release
3、运行主函数，比如：
java Main t1.c
输入源文件名，比如：
t1.c
4、运行时，自动弹出语法分析树，四元式结果保存在“Quaternary”文件中，请自行用编辑器查看，建议不要用记事本。

antlr环境配置
默认已经配置好了java环境变量。使用本程序前，需要配置好antlr环境变量。
配置方法，就是在CLASSPATH环境变量里添加antlr-4.0-complete.jar的路径。比如：
“;.;D:\workspace\java\lib\antlr-4.0-complete.jar”
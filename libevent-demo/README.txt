/*
 *  之前学习过开源网络框架libevent和ACE，一直都想自己实现一个类似的网络库
 *  libevent是C语言实现的，其他一些著名的网络通信框架也大都是用的C。
 *  ACE是C++实现，但是过于庞大复杂，所以一直应用不广泛。最近学习协议比较
 *  多，于是就打算实现一个类似的通信框架，作为一些测试程序的库。个人比较
 *  喜欢C++，所以这个库是用C++实现的
 */

一直没有想到很好的代号作为该库的名称，最后不得已，所有的类都已I字母作为
名称起始，表示是我个人用的测试产品

我希望我的这个网络框架能够实现以下一些比较通用的功能
1、定时器             (ITimerHandler、IPeriodicHandler)
2、网络IO             (IReadHandler、IWriteHandler)
3、信号量             (ISignalHandler)
4、协议解析           (IPacketHandler)
5、协议超时重传机制   (IWriteHandler、IPeriodicHandler))
6、协议保活           (IReadHandler、IPeriodicHandler)
7、网络IO限速
8、网络代理           (IPairHandler、IReadHandler、IWriteHandler)
9、网络信息过滤       (IFilterHandler、IReadHandler、IWriteHandler)
如果可能，以后会加上网络安全相关功能

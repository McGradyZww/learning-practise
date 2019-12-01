/*跨平台的环境配置头文件定义
源程序名称: config_env.h
软件著作权: 络町网络
系统名称: 络町中间件
模块名称: 跨平台封装适配层 
功能说明: 根据各平台开发环境下已定义的宏包括常用头文件，统一定义常用宏.
	      各个跨平台封装对象应首先包含本文件，本文件再根据具体的平台引用config_win32.h或config_posix.h。
	      可引用的编译器环境宏如下：
	         _MSC_VER     MS VC编译器版本
	         __cplusplus  c++编译器
	         __GNUC__     gcc/g++编译器
	      可引用的操作系统环境宏如下：	         
	         _WIN32       Win32类操作系统
	         __linux__    linux类操作系统
审核:
修改记录
修改日期:
修改人员:
修改说明:
*******************************************************************/

#ifndef _CONFIG_ENV_INC_
#define _CONFIG_ENV_INC_


#ifndef __cplusplus
#error "the os lib only be used in c++"
#endif

#if defined (_MSC_VER) && _MSC_VER < 1200
#error "please use this header only over MSVC 6.0 if using vc compiler"
#endif


#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>

///本项目命名空间定义
#define LD_MIDDLEWARE_NAMESPACE			LD_MIDDLEWARE

///define the namesapce
#define NAMESPACE_BEGIN(x)		namespace x {
#define NAMESPACE_END			}
#define USING_NAMESPACE(x)		using namespace x;

#define BEGIN_LD_MIDDLEWARE_NAMESPACE	NAMESPACE_BEGIN(LD_MIDDLEWARE_NAMESPACE)
#define END_LD_MIDDLEWARE_NAMESPACE		NAMESPACE_END
#define USING_LD_MIDDLEWARE_NAMESPACE	USING_NAMESPACE(LD_MIDDLEWARE_NAMESPACE)

//BEGIN_LD_MIDDLEWARE_NAMESPACE
//END_LD_MIDDLEWARE_NAMESPACE

///无效的句柄
#define InvalidHandle 0L

//根据具体的平台引用config_win32.h或config_posix.h
#ifdef _WIN32
#include <OS_Independen/config_win32.h>
#else  ///for unix or linux
#include <OS_Independen/config_posix.h>
#endif

//定义忽略的警告
#ifdef _WIN32
	#pragma message("_WIN32 macro activated!")
	#if defined(_WIN32)&& _MSC_VER < 1300
	#pragma warning(disable: 4786)				// 需加在被包含的STL头文件前
	#pragma warning(disable: 4976)
	#pragma warning(disable: 4291)				// 忽略使用 new(nothrow)的异常
	#endif
	#if defined(_MSC_VER)
	#pragma warning(disable:4284)
	#pragma warning(disable: 4996)
	#pragma warning(disable: 4309)
	#endif
#endif

//TRACE宏定义，在_DEBUG下输出调试信息
#if defined (_DEBUG) && !defined(TRACE)
	#define TRACE		printf
#else
	#ifdef _WIN32
	#define TRACE		(void)
	#else
	#define TRACE(...)  ((void)0)
	#endif
#endif

//当编译器支持C++模板分离模式（本项目所用编译器均不支持）时，定义USE_EXPORT
/*alog.h,alog.cpp等用到，不支持分离模式时，注意此类cpp（模板类的实现代码）不应直接编译cpp*/
#if defined(USE_EXPORT)
#define TEMPLATE_EXPORT		export
#else
#define TEMPLATE_EXPORT
#endif

#include <new>
#define LD_MIDDLEWARE_NEW new(std::nothrow)

#endif


#ifdef _WIN32
  #if !defined( LD_CALL_MODE )
	#define LD_CALL_MODE		__stdcall
  #endif
  #ifdef BUILDING_DLL
    #define API_EXPORT __declspec(dllexport)
  #else
    #define API_EXPORT __declspec(dllimport)
  #endif
  #define DLLLOCAL
#else
  #define LD_CALL_MODE
  #define API_EXPORT __attribute__ ((visibility("default")))
  #define DLLLOCAL __attribute__ ((visibility("hidden")))
#endif

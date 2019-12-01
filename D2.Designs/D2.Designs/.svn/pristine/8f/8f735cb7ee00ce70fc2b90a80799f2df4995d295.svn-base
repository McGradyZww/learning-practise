/*Win32平台环境配置头文件定义
源程序名称: config_win32.h
软件著作权: 络町网络
系统名称: 络町中间件
模块名称:
功能说明: 此文件被config_env.h所包含，不应直接包括此头文件。
审核: 
修改记录
修改日期:
修改人员:
修改说明:
*******************************************************************/

#if !defined _CONFIG_WIN32_INC_ && defined _WIN32
#define _CONFIG_WIN32_INC_

#define _WINSOCKAPI_ // 禁止windows.h包含winsock.h
#include <windows.h>
#include <winsock2.h>
#include <ws2tcpip.h>
#include <io.h>
#include <direct.h>
#include <time.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/timeb.h>


#ifndef __FUNCTION__
#define __FUNCTION__ "null"
#endif
#define __func__ __FUNCTION__



///定义一组与标准c不同名的函数别名
#define strcasecmp			  _stricmp
#define strncasecmp			  _strnicmp
#define snprintf			  _snprintf
#define stat				  _stat
#define access				  _access
#define mkdir                 _mkdir
#define splitpath             _splitpath
#define bzero				  ZeroMemory
#define unlink                _unlink

///文件存在
#define F_OK					0
///文件可写
#define W_OK					2
///文件可读
#define R_OK					4
#define DIR_SLASH				'\\'

///清除屏幕的系统调用
#define CLEAR_CMD				"cls"
///动态库文件后缀
#define LIB_POSTFIX				".DLL"
///动态库文件前缀
#define LIB_PREFIX				""


#  define I64d "%I64d"
#  define I64u "%I64u"

#endif

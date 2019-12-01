/**	Linux/Unix平台下posix标准的环境配置头文件定义
源程序名称: config_posix.h
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

#if !defined _CONFIG_POSIX_INC_ && !defined _WIN32
#define _CONFIG_POSIX_INC_

#include <pthread.h>
#include <semaphore.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <sys/timeb.h>
#include <sys/ioctl.h>
#include <strings.h>
#include <sys/socket.h>
#include <dlfcn.h>
#include <netinet/in.h>
#include <OS_Independen/basetypes.h>
#include <arpa/inet.h>
#include <signal.h>
#include <sys/wait.h>
#include <errno.h>
#include <dirent.h>
#include <fnmatch.h>

#if defined _XOPEN_STREAMS && _XOPEN_STREAMS == -1
// no stropts.h
#else
#include <stropts.h>
#endif

#if !defined(OS_UNIX)
#define OS_UNIX
#endif

//对于gcc 编译器
#if defined(__GNUC__)
#include <ctype.h>
#endif

///平台相关
///针对redhat linux
#if defined(__linux__)
#include <sys/poll.h>
#elif defined(_AIX)
#include <sys/poll.h>
#endif

#define __stdcall

///与socket相关宏定义，与windows保持一致
#define closesocket				close

#ifndef INVALID_SOCKET
#define INVALID_SOCKET			(SOCKET)(~0)
#endif

#ifndef SOCKET_ERROR
#define SOCKET_ERROR			(-1)
#endif

#ifndef INADDR_NONE
#define INADDR_NONE				(0xFFFFFFFFL)
#endif

#ifndef INADDR_ANY
#define INADDR_ANY				((uint32)0x00000000L)
#endif
	
#define SD_RECEIVE      0x00				///停止接收
#define SD_SEND         0x01				///停止发送
#define SD_BOTH         0x02				///双向停止

///定义linux/unix下目录分隔符
#define DIR_SLASH			'/'
///定义linux/unix下目录路径字符串的最大长度
#define MAX_PATH			256


//#define OS_UNIX
static const int INFINITE = (-1);

#define INVALID_HANDLE_VALUE    -1

///动态库文件后缀
#define LIB_POSTFIX		".so"
///动态库文件前缀
#define LIB_PREFIX		"lib"

///清除屏幕的系统调用
#define CLEAR_CMD			"clear"

#define SEM_NAME_LEN		255

#ifndef MAXLONG
#define MAXLONG ((1 << (sizeof(long) * 8 - 1)) - 1)			//~(1 << (sizeof(long) * 8 - 1))
#endif

#ifndef MAXULONG
#define MAXULONG ((1 << (sizeof(unsigned long) * 8)) - 1)
#endif

///与windows同义，表明创建的对象已经被传创建
#define ERROR_ALREADY_EXISTS        183L

#if !defined( PLUGINS_CALL )
#define PLUGINS_CALL	
#endif

#  define I64d "%lld"
#  define I64u "%llu"

#endif

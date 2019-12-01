#ifndef _BASETYPES_H_
#define _BASETYPES_H_

#include <OS_Independen/config_env.h>

///���û�������
typedef unsigned char		BYTE;		///sizeof(BYTE) = 1
typedef unsigned short		WORD;		///sizeof(WORD) = 2
#ifndef _WIN32
typedef unsigned long DWORD;		  ///sizeof(DWORD) = 8
typedef int     BOOL;
const int FALSE=0;
const int TRUE=0;
#endif


///�������Ͷ���
#ifdef _WIN32
typedef char				int8;
typedef short				int16;
typedef int					int32;
typedef __int64				int64;
typedef unsigned char		uint8;
typedef unsigned short		uint16;
typedef unsigned int		uint32;
typedef unsigned __int64	uint64;

#else

#include <sys/types.h>
#if defined(__linux__)
#include <stdint.h>
#endif
typedef int8_t				int8;
typedef int16_t				int16;
typedef int32_t				int32;
typedef int64_t				int64;
typedef uint8_t				uint8;
typedef uint16_t			uint16;
typedef uint32_t			uint32;
typedef uint64_t			uint64;
#endif

///�߳̾��
#ifdef _WIN32
typedef  HANDLE    THREAD;
#else
typedef  pthread_t THREAD;
#endif

///�̻߳�����
#ifdef _WIN32
typedef CRITICAL_SECTION    THREADMUTEX;
#else
typedef pthread_mutex_t     THREADMUTEX;
#endif

///socket��ض���
#ifdef _WIN32
	#ifndef SOCKET_LEN_TYPE
	#define SOCKET_LEN_TYPE			int
	#endif

	typedef int	socklen_t;
#else
	#ifndef SOCKET
	#define SOCKET					int
	#endif

	#ifndef SOCKET_LEN_TYPE
	#define SOCKET_LEN_TYPE		socklen_t
	#endif
#endif

#endif // _BASETYPES_H_

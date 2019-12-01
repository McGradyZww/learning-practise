/**	Linux/Unixƽ̨��posix��׼�Ļ�������ͷ�ļ�����
Դ��������: config_posix.h
�������Ȩ: �������
ϵͳ����: ����м��
ģ������:
����˵��: ���ļ���config_env.h����������Ӧֱ�Ӱ�����ͷ�ļ���
���: 
�޸ļ�¼
�޸�����:
�޸���Ա:
�޸�˵��:
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

//����gcc ������
#if defined(__GNUC__)
#include <ctype.h>
#endif

///ƽ̨���
///���redhat linux
#if defined(__linux__)
#include <sys/poll.h>
#elif defined(_AIX)
#include <sys/poll.h>
#endif

#define __stdcall

///��socket��غ궨�壬��windows����һ��
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
	
#define SD_RECEIVE      0x00				///ֹͣ����
#define SD_SEND         0x01				///ֹͣ����
#define SD_BOTH         0x02				///˫��ֹͣ

///����linux/unix��Ŀ¼�ָ���
#define DIR_SLASH			'/'
///����linux/unix��Ŀ¼·���ַ�������󳤶�
#define MAX_PATH			256


//#define OS_UNIX
static const int INFINITE = (-1);

#define INVALID_HANDLE_VALUE    -1

///��̬���ļ���׺
#define LIB_POSTFIX		".so"
///��̬���ļ�ǰ׺
#define LIB_PREFIX		"lib"

///�����Ļ��ϵͳ����
#define CLEAR_CMD			"clear"

#define SEM_NAME_LEN		255

#ifndef MAXLONG
#define MAXLONG ((1 << (sizeof(long) * 8 - 1)) - 1)			//~(1 << (sizeof(long) * 8 - 1))
#endif

#ifndef MAXULONG
#define MAXULONG ((1 << (sizeof(unsigned long) * 8)) - 1)
#endif

///��windowsͬ�壬���������Ķ����Ѿ���������
#define ERROR_ALREADY_EXISTS        183L

#if !defined( PLUGINS_CALL )
#define PLUGINS_CALL	
#endif

#  define I64d "%lld"
#  define I64u "%llu"

#endif

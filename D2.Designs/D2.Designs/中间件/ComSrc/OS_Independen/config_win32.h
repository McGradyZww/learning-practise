/*Win32ƽ̨��������ͷ�ļ�����
Դ��������: config_win32.h
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

#if !defined _CONFIG_WIN32_INC_ && defined _WIN32
#define _CONFIG_WIN32_INC_

#define _WINSOCKAPI_ // ��ֹwindows.h����winsock.h
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



///����һ�����׼c��ͬ���ĺ�������
#define strcasecmp			  _stricmp
#define strncasecmp			  _strnicmp
#define snprintf			  _snprintf
#define stat				  _stat
#define access				  _access
#define mkdir                 _mkdir
#define splitpath             _splitpath
#define bzero				  ZeroMemory
#define unlink                _unlink

///�ļ�����
#define F_OK					0
///�ļ���д
#define W_OK					2
///�ļ��ɶ�
#define R_OK					4
#define DIR_SLASH				'\\'

///�����Ļ��ϵͳ����
#define CLEAR_CMD				"cls"
///��̬���ļ���׺
#define LIB_POSTFIX				".DLL"
///��̬���ļ�ǰ׺
#define LIB_PREFIX				""


#  define I64d "%I64d"
#  define I64u "%I64u"

#endif

/**
有名管道：用于进程间通讯
**/

#ifndef NAMEDPIPE_H_INCLUDE
#define NAMEDPIPE_H_INCLUDE

#include <OS_Independen/config_env.h>
#include <OS_Independen/basetypes.h>

#ifndef _WIN32
#include <sys/ipc.h>
#endif

#define MAX_PIPE_BUF_SIZE	10240


BEGIN_LD_MIDDLEWARE_NAMESPACE

#ifdef _WIN32
	#if !defined(MAX_INSTANCE)
		#define MAX_INSTANCE	64
	#endif

	#define CONNECTING_STATE 0 
	#define READING_STATE 1 
	#define READ_STATE 2 
	//#define INSTANCES 4 
	#define PIPE_TIMEOUT 5000
	#define BUFSIZE 4096

	typedef struct 
	{ 
		OVERLAPPED oOverlap; 
		HANDLE hPipeInst; 
		DWORD dwState; 
		BOOL fPendingIO; 
	} PIPEINST, *LPPIPEINST; 
#endif

class API_EXPORT CNamedPipe
{
private:
	char	m_szName[256];
#ifdef _WIN32
	HANDLE	m_handle;
	PIPEINST	m_Pipes[MAX_INSTANCE]; 
	HANDLE		m_Events[MAX_INSTANCE];
	VOID _DisconnectAndReconnect(DWORD i);
	BOOL _ConnectToNewClient(HANDLE hPipe, LPOVERLAPPED lpo);
#else
	bool	m_bCreated;
	int		m_fd;
	int		m_fdDummy;	// 服务端使用，不使用
#endif

public:
	CNamedPipe(const char *szName);
	~CNamedPipe();
	bool Create();
	bool Connect();
	bool Read(void *buf, uint32 size, uint32 &plen, uint32 uMs = (uint32)INFINITE);
	bool Write(const void *buf, uint32 len);
};

END_LD_MIDDLEWARE_NAMESPACE

#endif

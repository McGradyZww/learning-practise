#ifndef NAMEDEVENT_H_
#define NAMEDEVENT_H_

#include <OS_Independen/config_env.h>

BEGIN_LD_MIDDLEWARE_NAMESPACE

#ifndef _WIN32
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/sem.h>
#if defined(__GNU_LIBRARY__) && !defined(_SEM_SEMUN_UNDEFINED)
/* union semun is defined by including <sys/sem.h> */
#else
/* according to X/OPEN we have to define it ourselves */
union semun {
	int val;                  /* value for SETVAL */
	struct semid_ds *buf;     /* buffer for IPC_STAT, IPC_SET */
	unsigned short *array;    /* array for GETALL, SETALL */
	/* Linux specific part: */
	struct seminfo *__buf;    /* buffer for IPC_INFO */
};
#endif

#endif


class API_EXPORT CNamedEvent
{
public:
    CNamedEvent();
    ~CNamedEvent();
    
    ///初始化
    /**
     *@raturn: 0 创建成功, 1 打开成功(已被创建), 其它初始化失败
     */
	int Init(const char* szName, bool bInit = false);

	int Wait(long dwMillsSecond = INFINITE);

	int Set(void);	

	int Reset();
	
	int Close();
private:	
	const char * m_szName;
	
#ifdef _WIN32
    ///事件对象句柄
    HANDLE  m_hEvent;
#else
	int		m_hSem;    
#endif
};

END_LD_MIDDLEWARE_NAMESPACE

#endif

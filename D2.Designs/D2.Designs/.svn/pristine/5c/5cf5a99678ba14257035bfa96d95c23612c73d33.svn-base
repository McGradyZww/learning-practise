/*
	跨平台事件对象
*/

#ifndef __LD_EVENT_INC__
#define __LD_EVENT_INC__

#include <OS_Independen/config_env.h>

BEGIN_LD_MIDDLEWARE_NAMESPACE

 
///等待事件时返回值
/**
 *EVENT_FAILED 		等待事件过程失败
 *EVENT_OK 			有事件发生
 *EVENT_TIMEOUT 	等待事件超时
 *EVENT_ABANDONED 	事件对象非法使用
 */
enum EVENTS
{
    EVENT_FAILED = -1, EVENT_OK = 0, EVENT_TIMEOUT, EVENT_ABANDONED
};


/**
 *	注意：本事件为自动重置事件！！
 */
class API_EXPORT CEvent
{
public:
    /**
     *@param bInit: 事件的初始状态, true为已通知状态; false为未通知状态
     */
    CEvent(bool bInit = false);
    ~CEvent();
    
    ///	等待
    /**
     *@param dwMillsSecond  等待的时间，单位毫秒。默认为永远等待，直到有事件发生！
     *@return EVENT_OK 		表示成功等到该事件激活， EVENT_TIMEOUT 表示超时，EVENT_ABORT表示事件被取消，其他失败
     */
	EVENTS Wait(long dwMillSeconds = INFINITE);
	
    ///激发
    /**
     * @return 零表示成功，其他表示失败
     */
	int Notify(void);
	
    ///重置 
    /**
     * @return 零表示成功，其他表示失败
    */
    int Reset(void);
    
private:
#ifdef _WIN32
    HANDLE  m_hEvent;			//	事件对象句柄
#else
	//	注意：posix标准的条件变量必须和互斥子结合使用！！
    pthread_mutex_t	m_Mutex;	//	保护条件变量的互斥子
    pthread_cond_t  m_Cond;		//	条件变量句柄
    bool			m_bNotify;
#endif

};

END_LD_MIDDLEWARE_NAMESPACE

#endif

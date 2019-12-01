/**
* 一个简单的跨平台线程类：可以运行于_win32及支持POSIX标准的unix平台
* 使用方法：class myThread:public CThread{...}
* 注意重载Run函数来完成执行体，可以通过重载构造函数或者增加其他方法来传递参数
* 实例化对象后，如实例为Obj, 则调用Obj.Start()来启动线程
*/


#ifndef _THREAD_INC_
#define _THREAD_INC_

#include <OS_Independen/config_env.h>
#include <OS_Independen/thread_mutex.h>  
#include <OS_Independen/basetypes.h>

BEGIN_LD_MIDDLEWARE_NAMESPACE

class API_EXPORT CThread
{
public:
	///构造函数
	CThread();
	///析构函数，终止线程并释放资源
	virtual ~CThread();
	///启动线程
	int Start();
    ///创建并启动线程
    /**
     * @param iThreadStkSize(单位为kb) 线程栈大小
     * @return 0-成功		非0-失败
     * @note uThreadStkSize只对linux有效，uThreadStkSize > 0，则取uThreadStkSize，否则取环境变量FBASE_STACK_SIZE，否则为10M
     */
    int StartEx(size_t uThreadStkSize = 0);

	///取得线程内部句柄
	THREAD GetThreadHandle() const
	{
		return m_hThread;
	}
	///取得线程ID
	uint32 GetThreadID() const
	{
		return m_nThreadId;
	}
	///线程是否已经启动
	/**
		*如果状态为true则表示线程启动
	*/
	bool IsRunning()
	{
#ifdef _WIN32
		EnterCriticalSection(&m_hMutex);
		bool ret = m_bStarted;
		LeaveCriticalSection(&m_hMutex);
		return ret;
#else
		pthread_mutex_lock(&m_CondMutex);
		bool ret = m_bStarted;
		pthread_mutex_unlock(&m_CondMutex);
		return ret;
#endif
	};
	//设置线程状态
	void SetStatus(bool bStatus);
	///检查线程终止状态
	/**
		*如果状态为true则表示终止过程中，可以检测该值以结束线程运行体
	*/
	bool IsTerminated() const
	{
		return m_bTerminateRequest;
	}
	/// 增加线程体的循环执行次数
	void IncreaseLoops()
	{
		m_dwLoopTimes++;
		return;
	}
	/// 获得线程循环次数
	uint32 GetLoops()
	{
		return m_dwLoopTimes;
	}
	/// 检测线程是否工作正常(老的循环次数和当前的循环次数比较，两者不一致则说明线程工作
	/// 一切正常，检测的时间间隔必须足够长，否则就会得出错误的结论)
	bool IsActive()
	{
		bool bResult;
		bResult = (m_dwOldLoopTimes != m_dwLoopTimes);
		m_dwOldLoopTimes = m_dwLoopTimes;
		return bResult;
	}
    /// 等待一段超时时间
    int WaitCond(long iWait);
    // 线程终止, 在目前的实现中, 如果在线程函数中调用自身的Stop, 会造成死锁
	virtual void Stop(long dwWait = INFINITE);

#if defined(_WIN32)
	friend static unsigned WINAPI thread_function(void* pArg);
#else
    friend void OnThreadExit(void* pArg);
	friend void * thread_function(void *pArg);
#endif

protected:
	///线程执行体，使用者需重载该函数，加入线程执行体
	virtual long Run() = 0;
	///是否中止线程
	bool m_bTerminateRequest;
private:
	///禁止复制和赋值
	CThread( const CThread& );
	CThread& operator=(const CThread& );

	bool m_bStarted;///线程的启动状态
    THREAD  m_hThread;///线程句柄
	uint32 m_nThreadId;///线程Id
protected:
	//	线程经过的循环次数
	uint32			m_dwLoopTimes;
	uint32			m_dwOldLoopTimes;
#if defined(_WIN32)
	CRITICAL_SECTION	m_hMutex;
#else
    pthread_mutex_t		m_CondMutex;
    pthread_cond_t		m_Cond;
#endif
};

END_LD_MIDDLEWARE_NAMESPACE

#endif

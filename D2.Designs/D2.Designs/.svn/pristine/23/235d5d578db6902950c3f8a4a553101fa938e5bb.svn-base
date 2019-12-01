/**
进程级互斥量
* 对于UNIX/LINUX平台，进程锁是基于信号量来实现的。而由于POSIX的信号量
* 在进程异常退出时没有自动重新置位的功能，故为了保证程序逻辑正确性，推
* 荐使用SYSV信号量。此版本的进程锁及信号量默认使用SYSV信号量来实现。若
* 用户需要使用POSIX信号量，必须在编译时定义 USE_POSIX_SEMAPHORES 宏
**/

#ifndef _PROCESS_MUTEX_INC_
#define _PROCESS_MUTEX_INC_

#include <OS_Independen/config_env.h>
#include <OS_Independen/ld_semaphore.h>  //用于摸拟进程锁的信号量

BEGIN_LD_MIDDLEWARE_NAMESPACE

class API_EXPORT CProcessMutex
{
public:
	///构造函数
    CProcessMutex();
    
    ///构造函数
    /**
     *@param lpName, 锁名称，必须全局唯一
     */
    CProcessMutex(const char lpName[]);

	///初始化函数
	/**
	*@param lpName, 锁名称，必须全局唯一
	*@param lpMutexAtrubutes 属性值
	*@param bInitialOwner拥有者初始化标志
	*@return 返回非0表示失败
	*/
    int Init(const char name[]);
    
    ///析构函数
    ~CProcessMutex();

	///锁定
	/**
	*@param dwMillseconds 等待时间，默认永久等待
	*@return 0表示成功，
	*/
    int Acquire();

    ///尝试获得锁，如果得不到立即返回
    /**
     * @return 0表示成功得到锁，其实失败
     */
    int TryAcquire();

    ///释放
    /**
        *@return 0成功，其他失败
    */
    int Release();
private:
	///内部对象句柄，不同平台不一样
#ifdef _WIN32
    HANDLE     m_hMutex;   
#else
    CSemaphore * m_lpSem;
#endif
};

class CProcAutoLock
{
public:
    CProcAutoLock( CProcessMutex *pm )
    {
        lpMut = pm;
        lpMut->Acquire();
    }
    ~CProcAutoLock()
    {
        lpMut->Release();
    }
private:
    CProcessMutex *lpMut;
};


END_LD_MIDDLEWARE_NAMESPACE

#endif


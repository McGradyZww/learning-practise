/**
* 跨平台的线程互斥锁类
*/

#ifndef _THREAD_MUTEX_INC_
#define _THREAD_MUTEX_INC_

#include <OS_Independen/config_env.h>

#ifdef _WIN32	/// linux环境在config_posix.h中已包含
#include <OS_Independen/basetypes.h>     
#endif

BEGIN_LD_MIDDLEWARE_NAMESPACE

class API_EXPORT CThreadMutex
{
public:
	///构造函数，初始化临界区
	CThreadMutex();
	///析构函数， 清除临界区
	~CThreadMutex();
	///进入临界区
	void Acquire();
	///离开临界区
	void Release();

#if (defined (_WIN32_WINNT) && (_WIN32_WINNT > 0x0400)) || !defined(_WIN32)
	///尝试进入临界区，失败返回非零
	int TryAcquire();
#endif

private:
	///核心互斥量句柄
	THREADMUTEX  m_hMutex;
};

///自动锁类
/**定义一个局部包装类对象，定义是加读锁，超出范围时局部对象释放，读锁也自动释放；
 * 当一个函数内加锁后，确保此函数任何退出点锁都会释放，以避免死锁 
 * 注意：要防止有些编译器把未被引用的局部对象优化掉.
 */
class API_EXPORT CAutoMutex
{
public:
	CAutoMutex(CThreadMutex * pMutex)
	{
		m_pMutex=pMutex;
		pMutex->Acquire();
	};
	~CAutoMutex()
	{
		m_pMutex->Release();
	};
private:
	CThreadMutex * m_pMutex;
};

END_LD_MIDDLEWARE_NAMESPACE

#endif


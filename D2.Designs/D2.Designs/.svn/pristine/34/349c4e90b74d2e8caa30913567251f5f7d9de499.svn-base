class CLDManualLock
{
public:
	CLDManualLock()
	{
		InitializeCriticalSection(&cs);
		m_iLockCounts=0;
		m_iMaxLockedTick=0;
		//	加入锁池
	}
	inline void Lock()
	{
		EnterCriticalSection(&cs);
		if(m_iLockCounts==0)
		{
			m_iOwnerThreadid=getthreadid();
			m_dwLockTick=GetTickCount();
		}
		m_iLockCounts++;
	}
	inline void UnLock()
	{
		LeaveCriticalSection(&cs);
		m_iLockCounts--;
		if(m_iLockCounts==0)
		{
			m_iOwnerThreadid=0;
			uint32 dwLockTick=GetTickCount();
			int iDiff=dwLockTick-m_dwLockTick;
			if(iDiff>m_iMaxLockedTick)
				m_iMaxLockedTick=iDiff;
		}
	}
	~CLDManualLock()
	{
		DeleteCriticalSection(&cs);
		//	从池移除
	}
private:
	CRITICAL_SECTION cs;
	
	uint32 m_dwLockTick;		//	获得锁的时间戳，这样可以发现该锁被保持的时间，利于性能分析，死锁发现
	int m_iOwnerThreadid;
	int	m_iLockCounts;
	int m_iMaxLockedTick;		//	该锁被持有的最大tick数，可以评价代码合理性
};

class CThread
{
public:
	CThread();
	int  Start(TDFUNC lpfunc, int stacksize, void* lpvoid);
	void Join();
	BOOL IsRunning();
	UINT GetThreadID();

private:
	HANDLE m_hThread;
	UINT   m_uThreadID;
	TDFUNC m_tdfunc;
	void*  m_lpvoid;
	BOOL   m_isrunning;
	static unsigned int _stdcall Win32TdFunc(void *lpvoid);
	
private:
	int m_iThreadid;
	const char* m_lpCreateModules;
	char  m_szThreadInfo[128];	//	线程简要描述
	int		m_iLoops;							//	线程函数循环的次数
	//	所有已经获得的锁
	
};

//	所有创建的线程进入线程池，这样方便遍历所有线程，了解线程工作状态，并且获得拥有的锁
//	所有的锁，也同样进入锁池，以遍历当前所有锁的状态，这样可以检测死锁，并且获得造成死锁的原因
//	这两个池，必须有2个特殊的锁来保护？
//	读写锁没有这个机制？

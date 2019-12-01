/**	
	文件锁：排他锁(非阻塞、阻塞)、共享锁(非阻塞、阻塞)
**/

#ifndef __FILELOCK_INC__
#define __FILELOCK_INC__

#include <OS_Independen/config_env.h>
#ifndef _WIN32
#include <sys/file.h>
#endif

BEGIN_LD_MIDDLEWARE_NAMESPACE

/// 文件锁定义，可用于模拟进程锁
class API_EXPORT CFileLock
{
public:
    ///构造函数，建立或者打开文件，如果已经被创建，则打开
    /**
     * @param lpFileName 文件名
     */
    CFileLock(const char * lpFileName);

	///析构函数，释放占用的资源
	~CFileLock();

	///尝试加排他锁，非阻塞模式
	/**
     * @return 如果成功则true，否则返回false。
    */
	bool tryLockExclusive();

	///加排他锁，阻塞模式
	/**
     * @return 如果成功则true，否则返回false。
    */
	bool lockExclusive();
	
	///尝试加共享锁，非阻塞模式
	/**
     * @return 如果成功则true，否则返回false。
    */
	bool tryLockShare();

	///加共享锁，阻塞模式
	/**
     * @return 如果成功则true，否则返回false。
    */
	bool lockShare();

	///解共享锁或者排他锁
	/**
     * @return 如果成功则true，否则返回false。
    */
	bool unlock();

	///是否可用
	bool isAvailable();
	
private:
#ifdef _WIN32
	//文件锁句柄
	HANDLE 		m_pHandle;
	OVERLAPPED 	m_Oapped;
#else
	///内核对象的句柄
	int m_iLockfd;
#endif
};

END_LD_MIDDLEWARE_NAMESPACE

#endif

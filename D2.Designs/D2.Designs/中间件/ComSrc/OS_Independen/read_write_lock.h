/**
读写锁
**/

#ifndef READ_WRITE_LOCK_INC_
#define READ_WRITE_LOCK_INC_

#include <OS_Independen/config_env.h>

#ifdef _WIN32
#include <OS_Independen/event.h>
using LD_MIDDLEWARE_NAMESPACE::CEvent;
#endif

BEGIN_LD_MIDDLEWARE_NAMESPACE

class API_EXPORT CReadWriteLock
{
public:
	CReadWriteLock();
	~CReadWriteLock();

	///获得读锁
	/**
	 *@return 非零 表示失败，原因需检查系统错误， 0表示成功
	 */
	int ReadAcquire();

	///释放读锁
	/**
	 *@return 非零 表示失败，原因需检查系统错误， 0表示成功
	 */
	int ReadRelease();

	///获得写锁
	/**
	 *@return 非零 表示失败，原因需检查系统错误， 0表示成功
	 */
	int WriteAcquire();

	///释放写锁
	/**
	 *@return 非零 表示失败，原因需检查系统错误， 0表示成功
	 */
	int WriteRelease();
private:
#ifdef _WIN32
	///读线程数
	long				m_nReaderCount;
	///保护读者数的临界区
	CRITICAL_SECTION	m_Mutex;
	
    CRITICAL_SECTION	m_hDataLock;
#else			//for posix unix
	///读写锁对象
	pthread_rwlock_t	m_Lock;
#endif
	///封闭掉下面函数
	CReadWriteLock(CReadWriteLock &lock);
	CReadWriteLock & operator=(CReadWriteLock &lock);
};

END_LD_MIDDLEWARE_NAMESPACE

#endif

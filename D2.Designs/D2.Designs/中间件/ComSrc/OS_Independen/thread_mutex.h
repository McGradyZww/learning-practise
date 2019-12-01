/**
* ��ƽ̨���̻߳�������
*/

#ifndef _THREAD_MUTEX_INC_
#define _THREAD_MUTEX_INC_

#include <OS_Independen/config_env.h>

#ifdef _WIN32	/// linux������config_posix.h���Ѱ���
#include <OS_Independen/basetypes.h>     
#endif

BEGIN_LD_MIDDLEWARE_NAMESPACE

class API_EXPORT CThreadMutex
{
public:
	///���캯������ʼ���ٽ���
	CThreadMutex();
	///���������� ����ٽ���
	~CThreadMutex();
	///�����ٽ���
	void Acquire();
	///�뿪�ٽ���
	void Release();

#if (defined (_WIN32_WINNT) && (_WIN32_WINNT > 0x0400)) || !defined(_WIN32)
	///���Խ����ٽ�����ʧ�ܷ��ط���
	int TryAcquire();
#endif

private:
	///���Ļ��������
	THREADMUTEX  m_hMutex;
};

///�Զ�����
/**����һ���ֲ���װ����󣬶����ǼӶ�����������Χʱ�ֲ������ͷţ�����Ҳ�Զ��ͷţ�
 * ��һ�������ڼ�����ȷ���˺����κ��˳����������ͷţ��Ա������� 
 * ע�⣺Ҫ��ֹ��Щ��������δ�����õľֲ������Ż���.
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


/**
* һ���򵥵Ŀ�ƽ̨�߳��ࣺ����������_win32��֧��POSIX��׼��unixƽ̨
* ʹ�÷�����class myThread:public CThread{...}
* ע������Run���������ִ���壬����ͨ�����ع��캯�����������������������ݲ���
* ʵ�����������ʵ��ΪObj, �����Obj.Start()�������߳�
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
	///���캯��
	CThread();
	///������������ֹ�̲߳��ͷ���Դ
	virtual ~CThread();
	///�����߳�
	int Start();
    ///�����������߳�
    /**
     * @param iThreadStkSize(��λΪkb) �߳�ջ��С
     * @return 0-�ɹ�		��0-ʧ��
     * @note uThreadStkSizeֻ��linux��Ч��uThreadStkSize > 0����ȡuThreadStkSize������ȡ��������FBASE_STACK_SIZE������Ϊ10M
     */
    int StartEx(size_t uThreadStkSize = 0);

	///ȡ���߳��ڲ����
	THREAD GetThreadHandle() const
	{
		return m_hThread;
	}
	///ȡ���߳�ID
	uint32 GetThreadID() const
	{
		return m_nThreadId;
	}
	///�߳��Ƿ��Ѿ�����
	/**
		*���״̬Ϊtrue���ʾ�߳�����
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
	//�����߳�״̬
	void SetStatus(bool bStatus);
	///����߳���ֹ״̬
	/**
		*���״̬Ϊtrue���ʾ��ֹ�����У����Լ���ֵ�Խ����߳�������
	*/
	bool IsTerminated() const
	{
		return m_bTerminateRequest;
	}
	/// �����߳����ѭ��ִ�д���
	void IncreaseLoops()
	{
		m_dwLoopTimes++;
		return;
	}
	/// ����߳�ѭ������
	uint32 GetLoops()
	{
		return m_dwLoopTimes;
	}
	/// ����߳��Ƿ�������(�ϵ�ѭ�������͵�ǰ��ѭ�������Ƚϣ����߲�һ����˵���̹߳���
	/// һ������������ʱ���������㹻��������ͻ�ó�����Ľ���)
	bool IsActive()
	{
		bool bResult;
		bResult = (m_dwOldLoopTimes != m_dwLoopTimes);
		m_dwOldLoopTimes = m_dwLoopTimes;
		return bResult;
	}
    /// �ȴ�һ�γ�ʱʱ��
    int WaitCond(long iWait);
    // �߳���ֹ, ��Ŀǰ��ʵ����, ������̺߳����е��������Stop, ���������
	virtual void Stop(long dwWait = INFINITE);

#if defined(_WIN32)
	friend static unsigned WINAPI thread_function(void* pArg);
#else
    friend void OnThreadExit(void* pArg);
	friend void * thread_function(void *pArg);
#endif

protected:
	///�߳�ִ���壬ʹ���������ظú����������߳�ִ����
	virtual long Run() = 0;
	///�Ƿ���ֹ�߳�
	bool m_bTerminateRequest;
private:
	///��ֹ���ƺ͸�ֵ
	CThread( const CThread& );
	CThread& operator=(const CThread& );

	bool m_bStarted;///�̵߳�����״̬
    THREAD  m_hThread;///�߳̾��
	uint32 m_nThreadId;///�߳�Id
protected:
	//	�߳̾�����ѭ������
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

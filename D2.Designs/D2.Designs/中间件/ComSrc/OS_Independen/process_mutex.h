/**
���̼�������
* ����UNIX/LINUXƽ̨���������ǻ����ź�����ʵ�ֵġ�������POSIX���ź���
* �ڽ����쳣�˳�ʱû���Զ�������λ�Ĺ��ܣ���Ϊ�˱�֤�����߼���ȷ�ԣ���
* ��ʹ��SYSV�ź������˰汾�Ľ��������ź���Ĭ��ʹ��SYSV�ź�����ʵ�֡���
* �û���Ҫʹ��POSIX�ź����������ڱ���ʱ���� USE_POSIX_SEMAPHORES ��
**/

#ifndef _PROCESS_MUTEX_INC_
#define _PROCESS_MUTEX_INC_

#include <OS_Independen/config_env.h>
#include <OS_Independen/ld_semaphore.h>  //����������������ź���

BEGIN_LD_MIDDLEWARE_NAMESPACE

class API_EXPORT CProcessMutex
{
public:
	///���캯��
    CProcessMutex();
    
    ///���캯��
    /**
     *@param lpName, �����ƣ�����ȫ��Ψһ
     */
    CProcessMutex(const char lpName[]);

	///��ʼ������
	/**
	*@param lpName, �����ƣ�����ȫ��Ψһ
	*@param lpMutexAtrubutes ����ֵ
	*@param bInitialOwnerӵ���߳�ʼ����־
	*@return ���ط�0��ʾʧ��
	*/
    int Init(const char name[]);
    
    ///��������
    ~CProcessMutex();

	///����
	/**
	*@param dwMillseconds �ȴ�ʱ�䣬Ĭ�����õȴ�
	*@return 0��ʾ�ɹ���
	*/
    int Acquire();

    ///���Ի����������ò�����������
    /**
     * @return 0��ʾ�ɹ��õ�������ʵʧ��
     */
    int TryAcquire();

    ///�ͷ�
    /**
        *@return 0�ɹ�������ʧ��
    */
    int Release();
private:
	///�ڲ�����������ͬƽ̨��һ��
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


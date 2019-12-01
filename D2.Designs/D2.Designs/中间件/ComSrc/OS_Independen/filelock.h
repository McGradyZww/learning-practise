/**	
	�ļ�����������(������������)��������(������������)
**/

#ifndef __FILELOCK_INC__
#define __FILELOCK_INC__

#include <OS_Independen/config_env.h>
#ifndef _WIN32
#include <sys/file.h>
#endif

BEGIN_LD_MIDDLEWARE_NAMESPACE

/// �ļ������壬������ģ�������
class API_EXPORT CFileLock
{
public:
    ///���캯�����������ߴ��ļ�������Ѿ������������
    /**
     * @param lpFileName �ļ���
     */
    CFileLock(const char * lpFileName);

	///�����������ͷ�ռ�õ���Դ
	~CFileLock();

	///���Լ���������������ģʽ
	/**
     * @return ����ɹ���true�����򷵻�false��
    */
	bool tryLockExclusive();

	///��������������ģʽ
	/**
     * @return ����ɹ���true�����򷵻�false��
    */
	bool lockExclusive();
	
	///���Լӹ�������������ģʽ
	/**
     * @return ����ɹ���true�����򷵻�false��
    */
	bool tryLockShare();

	///�ӹ�����������ģʽ
	/**
     * @return ����ɹ���true�����򷵻�false��
    */
	bool lockShare();

	///�⹲��������������
	/**
     * @return ����ɹ���true�����򷵻�false��
    */
	bool unlock();

	///�Ƿ����
	bool isAvailable();
	
private:
#ifdef _WIN32
	//�ļ������
	HANDLE 		m_pHandle;
	OVERLAPPED 	m_Oapped;
#else
	///�ں˶���ľ��
	int m_iLockfd;
#endif
};

END_LD_MIDDLEWARE_NAMESPACE

#endif

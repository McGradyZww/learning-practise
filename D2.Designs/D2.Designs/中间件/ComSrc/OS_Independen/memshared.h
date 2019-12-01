/**
	�����ڴ涨��, ����ּ�ڽ��̼乲���ڴ棬����ʹ�þ������ڴ�ӳ�����.
	������WIN32��֧��posix��׼��unixƽ̨
**/
#ifndef _MEMSHARED_INC_
#define _MEMSHARED_INC_

#include <OS_Independen/config_env.h>

BEGIN_LD_MIDDLEWARE_NAMESPACE

class API_EXPORT CSharedMem
{
public:
    ///���캯������ʼ����Դ
    CSharedMem();
    
    ///���캯�����������ߴ�һ�������ڴ棬����Ѿ������������
    /**
     * @param filename �ļ���
     * @param size �����ڴ�Ĵ�С
     */
    CSharedMem(const char* filename, unsigned size = 1024 * 1024);
    
    ///�����������ͷ�ռ�õ���Դ
    ~CSharedMem();

    ///��ʼ��һ�ι����ڴ�
    /**
     * @param filename �ļ���
     * @param size �����ڴ�Ĵ�С
     * @return ����ɹ��򷵻ع����ڴ��׵�ַ��ʧ�ܷ���NULL
     */
    void* Create(const char* filename, unsigned size = 1024 * 1024);

	///��ʼ��һ�ι����ڴ�
	/**
	* @param filename �ļ���
	* @param size �����ڴ�Ĵ�С
	* @return ����ɹ��򷵻ع����ڴ��׵�ַ��ʧ�ܷ���NULL
	*/
	void* CreateEx(const char* filename, size_t size = 1024 * 1024);

    ///��һ�ι����ڴ�
    /**
     * @param filename �ļ���
     * @return ����ɹ��򷵻ع����ڴ��׵�ַ��ʧ�ܷ���NULL
     */
    void* Open(const char* filename);

    ///�رչ����ڴ���
    /**
     * @return ����0��ʾʧ�ܣ������ʾ�ɹ�
     */
    int Close();

    int UnLink();

    ///��ȡ�����ڴ���׵�ַ
    const void* operator*() const; 

    ///�ж��Ƿ���Ч
    bool operator!() const;

	///��ȡ�����ڴ�Ĵ�С
	const size_t Size() const;

    ///��չ�����ڴ�Ĵ�С����������������, ��չ�����ڴ��С�����ڶ�ռģʽ�²��ܳɹ�
    /**
     * @param appendsize ��չ�ĳ���
     * @return �����µ��׵�ַ�����ʧ�ܷ���NULL
     */
    const void* Resize(size_t appendsize);
private:
    ///ӳ����ļ���
    char  m_szName[255];
    ///�ڴ�����ַ
    void*  m_pStart;    
    ///����
    size_t  m_iSize;
    
#ifdef _WIN32
	///ӳ���ļ����
	HANDLE  m_hFile;
	///ӳ����
	HANDLE m_hMapHandle;
#else
	///�ں˶���ľ��
	int m_lFd;
#endif
};

END_LD_MIDDLEWARE_NAMESPACE

#endif

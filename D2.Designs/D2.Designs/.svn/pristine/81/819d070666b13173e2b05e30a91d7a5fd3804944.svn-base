/**
	共享内存定义, 该类旨在进程间共享内存，所以使用具名的内存映射机制.
	可用于WIN32和支持posix标准的unix平台
**/
#ifndef _MEMSHARED_INC_
#define _MEMSHARED_INC_

#include <OS_Independen/config_env.h>

BEGIN_LD_MIDDLEWARE_NAMESPACE

class API_EXPORT CSharedMem
{
public:
    ///构造函数，初始化资源
    CSharedMem();
    
    ///构造函数，建立或者打开一个共享内存，如果已经被创建，则打开
    /**
     * @param filename 文件名
     * @param size 共享内存的大小
     */
    CSharedMem(const char* filename, unsigned size = 1024 * 1024);
    
    ///析构函数，释放占用的资源
    ~CSharedMem();

    ///初始化一段共享内存
    /**
     * @param filename 文件名
     * @param size 共享内存的大小
     * @return 如果成功则返回共享内存首地址，失败返回NULL
     */
    void* Create(const char* filename, unsigned size = 1024 * 1024);

	///初始化一段共享内存
	/**
	* @param filename 文件名
	* @param size 共享内存的大小
	* @return 如果成功则返回共享内存首地址，失败返回NULL
	*/
	void* CreateEx(const char* filename, size_t size = 1024 * 1024);

    ///打开一段共享内存
    /**
     * @param filename 文件名
     * @return 如果成功则返回共享内存首地址，失败返回NULL
     */
    void* Open(const char* filename);

    ///关闭共享内存区
    /**
     * @return 返回0表示失败，非零表示成功
     */
    int Close();

    int UnLink();

    ///获取共享内存的首地址
    const void* operator*() const; 

    ///判断是否有效
    bool operator!() const;

	///获取共享内存的大小
	const size_t Size() const;

    ///扩展共享内存的大小，并搬移已有数据, 扩展共享内存大小必须在独占模式下才能成功
    /**
     * @param appendsize 扩展的长度
     * @return 返回新的首地址句柄，失败返回NULL
     */
    const void* Resize(size_t appendsize);
private:
    ///映射的文件名
    char  m_szName[255];
    ///内存区首址
    void*  m_pStart;    
    ///长度
    size_t  m_iSize;
    
#ifdef _WIN32
	///映射文件句柄
	HANDLE  m_hFile;
	///映射句柄
	HANDLE m_hMapHandle;
#else
	///内核对象的句柄
	int m_lFd;
#endif
};

END_LD_MIDDLEWARE_NAMESPACE

#endif

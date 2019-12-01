/**
	常用方法
**/
#ifndef _FUNCTIONAL_INC_
#define _FUNCTIONAL_INC_

#include <OS_Independen/config_env.h>
#include <OS_Independen/basetypes.h>
#ifdef _WIN32
#pragma comment(lib,"winmm.lib")
#endif

BEGIN_LD_MIDDLEWARE_NAMESPACE

#define	MAX_MATCHING_STR	32
///目录句柄的结构
typedef struct tag_DIR_HANDLE
{
#ifdef _WIN32
	WIN32_FIND_DATA FileAttr;
	HANDLE h;
	bool bIsFirst;
#else
	DIR		*dirbuf;
	char    sDir[MAX_PATH + 1];
	char	sPattern[MAX_MATCHING_STR + 1];	// 匹配串
#endif
} DIR_HANDLE;

///存放文件信息的结构
typedef struct tag_FileInfo
{
	char sFileName[MAX_PATH]; //文件名，不带路径
	int  iSize;               //文件大小
	int  iTime;               //文件修改时间(DOS时间戳)
	bool bIsDir;              //文件名是否为子目录名
} FILE_INFO;

///获取版本和初始化数据
extern "C" API_EXPORT const char* GetOSVersion();
extern "C" API_EXPORT const char* GetOSAdapterData();

///休眠参数指定的毫秒数
extern "C" API_EXPORT void SleepX(unsigned long dwMilliseconds);

//	获得当前线程号
extern "C" API_EXPORT uint32 GetCurrThreadID();

///将输入路径字符串的不合规的目录分隔符直接替换成相应平台的格式
/**直接在输入字符串上替换
 *@param char dir_[] 目录路径串，长度不能超过 MAX_PATH
 */
extern "C" API_EXPORT const char* ConvertDir(char dir_[]);

///判断所给的目录路径是否合法
extern "C" API_EXPORT bool IsDir(char pathname[]);

///创建多层目录，返回0成功 非0失败。注:在linux/unix下目录权限为最高的0x777
/**
 *@param char dir_[] 目录路径串，长度不能超过 MAX_PATH
 */
extern "C" API_EXPORT int CreateDir(char dir_[]);  

///打开目录,返回目录句柄
/**
 *@param char * dir 目录路径及文件名匹配串，如 "../appcom/lib*.so"; 也可只指定目录, 如"../appcom"
 *@return 返回的目录句柄，使用完毕必须调用CloseDir()释放相关资源;
 */
extern "C" API_EXPORT void* OpenDir(char* dir);

///取目录中的下一个文件信息，用于遍历目录，获取目录下的文件信息
/**遍历目录时循环调用本函数，直到返回false; 找到的文件信息放在lpFileInfo所指结构中。
 *@param void * handle 目录句柄,即OpenDir()返回的目录句柄
 *@param FILE_INFO lpFileInfo 存放找到的文件信息的结构（输出参数）
 *@return ture 找到一个匹配的文件，false 已没有匹配的文件
 */
extern "C" API_EXPORT bool   ReadDir(void* handle,FILE_INFO* lpFileInfo);

///释放目录句柄
extern "C" API_EXPORT void   CloseDir(void* handle);


///取随机数
extern "C" API_EXPORT int	GetRandNum(void);
///获取启动后到目前时间戳TickTime
extern "C" API_EXPORT uint32 GetTimeSinceStart(void);
///获取错误号
extern "C" API_EXPORT int32 GetErrorNo(void);

// 精度 > 2 微秒
extern "C" API_EXPORT uint64 GetTime(void);
extern "C" API_EXPORT int GetTimeStr(char* timestr);
//iType:1-返回完整时间YYYY-MM-DD HH:SS:MI:MIS，2-返回日期YYYY-MM-DD，3-返回时间HH:SS:MI，4-返回星期"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"
extern "C" API_EXPORT int GetTimeStrByType(char* timestr, int iType);
//	返回：  HHMMSS
extern "C" API_EXPORT int GetTimeStamp();

#ifndef _WIN32
///根据超时时间获取超时时刻，开机以来的单调递增时间，不是真实时间
/**
 * @param iTimeout 超时时间ms
 * @param ts [out] 返回超时时刻
 */
extern "C" API_EXPORT void GetTimespecMonotonic(long iTimeout, timespec & ts);

///根据超时时间获取超时时刻，真实时间
/**
 * @param iTimeout 超时时间ms
 * @param ts [out] 返回超时时刻
 */
extern "C" API_EXPORT void GetTimespecRealtime(long iTimeout, timespec & ts);
#endif

#ifdef _WIN32
///用于分割字符串，等同于linux下的strtok_r函数
/**
* @param str 要分解的字符串
* @param delim 分割符
* @param save_ptr 用于内部保存切分时的上下文
*/
extern "C" API_EXPORT char* strtok_r(char* str, const char* delim, char** save_ptr) ;

//获取本地时间，返回的tm结构中,没有tm_yday值
extern "C" API_EXPORT struct tm* localtime_r(const time_t* timer, struct tm* result);	
#endif


END_LD_MIDDLEWARE_NAMESPACE
#endif


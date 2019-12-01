#ifdef _WIN32
	#define SOCK_LEN	int
#else
	#define SOCKET int
	#define SOCK_LEN	sock_len_t
#endif


//	初始化sock环境
void StartupSockEnv();
//	摧毁sock环境
void CleanupSockEnv();

//	设置阻塞与否
int SetSockBlock(BOOL bBlock);

//	设置nagle延迟与否
int SetSockDelay(BOOL bDelay);

//	设置快速确认与否
int SetSockQuickAck(BOOL bQuick);

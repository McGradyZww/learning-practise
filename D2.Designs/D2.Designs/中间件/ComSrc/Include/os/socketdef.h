#ifdef _WIN32
	#define SOCK_LEN	int
#else
	#define SOCKET int
	#define SOCK_LEN	sock_len_t
#endif


//	��ʼ��sock����
void StartupSockEnv();
//	�ݻ�sock����
void CleanupSockEnv();

//	�����������
int SetSockBlock(BOOL bBlock);

//	����nagle�ӳ����
int SetSockDelay(BOOL bDelay);

//	���ÿ���ȷ�����
int SetSockQuickAck(BOOL bQuick);

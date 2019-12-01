#ifndef _ILDSDK_DEFINE_H_
#define _ILDSDK_DEFINE_H_

#include <stdio.h>
#include <stdlib.h>
#include <iostream>


#ifdef _WIN32
	#if !defined( FUNCTION_CALL_MODE )
		#define FUNCTION_CALL_MODE		__stdcall
	#endif
	#ifdef _LDSDK
		#define LDSDK_DLL __declspec(dllexport)
	#else
		#define LDSDK_DLL __declspec(dllimport)
	#endif
	#define DLLLOCAL
#else
	#define FUNCTION_CALL_MODE
	#define LDSDK_DLL __attribute__ ((visibility("default")))
	#define DLLLOCAL __attribute__ ((visibility("hidden")))
#endif

#ifdef _WIN32
	#pragma warning(disable : 4996)
	#pragma warning(disable : 4244)
	#pragma warning(disable : 4018)
#endif

typedef unsigned long long   UINT64;
#define SDK_REF_COUNT_BASE	 1000		//sdk中同步异步发送的返回结果从这个标示后开始计数，小于此值为订阅号
#define _WINSOCK_DEPRECATED_NO_WARNINGS
enum eLDDATATYPE
{
	LD_DATATYPE_STRING = 'S',	//参数类型为string C标准的字符串
	LD_DATATYPE_BIGDECIMAL = 'B',	//参数类型为bigdecimal，带有精度的数字字符串
	LD_DATATYPE_CHAR = 'C',		//参数类型为char
	LD_DATATYPE_INT = 'I',		//参数类型为int
	LD_DATATYPE_LONG = 'L',		//参数类型为long long
	LD_DATATYPE_DOUBLE = 'D',	//参数类型为DOUBLE
	LD_DATATYPE_BINARY = 'R',	//任意二进制数据 
};
enum ConnectionStatus
{
	Disconnected = 0x0000, /**< 未连接 */
	Connected = 0x0001, /**< socket已连接 */
	Registered = 0x0002, /**< 已注册 */
	IsClosing = 0x0004, /**< 正在关闭中 */
	Connecting = 0x0008 /**< 正在连接中 */
};

/********************************PackHeader class***************************************/
class PackHeaderI
{
public:
	/**
	功能：获取返回包的路由规则
	**/
	virtual const char* FUNCTION_CALL_MODE GetRoutingKey() = 0;
	virtual void FUNCTION_CALL_MODE SetRoutingKey(const char* sRoutingKey) = 0;
	/**
	功能：获取应答队列名称
	**/
	virtual const char* FUNCTION_CALL_MODE GetReplyTo() = 0;
	virtual void FUNCTION_CALL_MODE SetReplyTo(const char* sReplyTo) = 0;
	/**
	功能：获取应答包ID号
	**/
	virtual const char* FUNCTION_CALL_MODE GetCorrelationID() = 0;
	virtual void FUNCTION_CALL_MODE SetCorrelationID(const char* sCorrelationgID) = 0;
	/**
	功能：获取功能号
	**/
	virtual const char* FUNCTION_CALL_MODE GetFuncID() = 0;
	virtual void FUNCTION_CALL_MODE SetFuncID(const char* sFuncID) = 0;
	/**
	功能：释放包头
	**/
	virtual void FUNCTION_CALL_MODE Release() = 0;
};

/********************************LDPacker class***************************************/
class LDPacker
{
public:
	///复位，重新开始打另一个包(字段数与记录数置为0行0例)
	/**
	* 功能：开始打包，把包长度清零(重复使用已有的缓存区空间)
	*@return 无
	*/
	virtual void FUNCTION_CALL_MODE BeginPack() = 0;
	/**加入项
	* 功能：向包添加字段;BeginPack
	*
	*有执行次序要求:
	*
	*@param szFieldName：字段名
	*@param cFieldType ：字段类型:I整数，D浮点数，C字符，S字符串，R任意二进制数据
	*@return 负数表示失败，否则为目前包的长度
	*/
	virtual int	FUNCTION_CALL_MODE AddField(const char* lpszField, eLDDATATYPE cFieldType) = 0;
	/**
	* 功能：向包添加字符串数据
	* 有执行次序要求:必须在所有字段增加完之后,逐个字段按顺序添加;
	*@param       szValue：字符串数据
	*@return 负数表示失败，否则为目前包的长度
	*/
	virtual int FUNCTION_CALL_MODE AddStr(const char *szValue) = 0;
	/**
	* 功能：向包添加整数数据
	*@param       iValue：整数数据
	*@return 负数表示失败，否则为目前包的长度
	*/
	virtual int FUNCTION_CALL_MODE AddInt(int iValue) = 0;
	/**
	* 功能：向包添加整数数据
	*@param       iValue：64位整数数据
	*@return 负数表示失败，否则为目前包的长度
	*/
	virtual int FUNCTION_CALL_MODE AddInt64(UINT64 iValue) = 0;
	/**
	* 功能：向包添加浮点数据
	*@param       fValue：浮点数据
	*@return 负数表示失败，否则为目前包的长度
	*/
	virtual int FUNCTION_CALL_MODE AddDouble(double fValue) = 0;
	/**
	* 功能：向包添加一个字符
	*@param		 cValue：字符
	*@return 负数表示失败，否则为目前包的长度
	*/
	virtual int FUNCTION_CALL_MODE AddChar(char cValue) = 0;
	/**
	* 功能：向包添加一个二进制字段, 包格式版本0x21及以上时有效；
	*@param	void * lpBuff 数据区
	*@param	int iLen  数据长度
	*@return 负数表示失败，否则为目前包的长度
	*/
	virtual int FUNCTION_CALL_MODE AddRaw(void * lpBuff, int iLen) = 0;
	/**
	* 功能：更新指定列、行的字段值
	*@param	iValue/dValue-新值；column-指定列(以0为基数)；row-指定行(以0为基数)
	*@return 0表示失败，否则为原来的值
	*/
	virtual int	FUNCTION_CALL_MODE UpdateIntItem(int iValue, int column, int row) = 0;
	virtual UINT64 FUNCTION_CALL_MODE UpdateInt64Item(UINT64 iValue, int column, int row) = 0;
	virtual double FUNCTION_CALL_MODE UpdateDoubleItem(double dValue, int column, int row) = 0;
	/**
	* 功能：更新指定列、行的字段值
	*@param	cValue-新值；column-指定列(以0为基数)；row-指定行(以0为基数)
	*@return 空字符表示失败，否则为原来的值
	*/
	virtual char FUNCTION_CALL_MODE UpdateCharItem(char cValue, int column, int row) = 0;
	virtual const char* FUNCTION_CALL_MODE UpdateStrItem(const char* szValue, int column, int row) = 0;
	/**
	* 功能：结束打包
	*@return 负数表示失败，否则为目前包的长度
	*/
	virtual int FUNCTION_CALL_MODE EndPack() = 0;
	/**
	* 功能：取打包结果指针
	*@return 打包结果指针
	*/
	virtual void* FUNCTION_CALL_MODE GetPackBuf(void) = 0;
	/**
	* 功能：取打包结果长度
	*@return 打包结果长度
	*/
	virtual int FUNCTION_CALL_MODE GetPackLen(void) = 0;
	/**直接返回当前打包结果的解包接口,必须在EndPack()之后才能调用,在打包器释放时相应的解包器实例也释放
	*@return 解包器接口，此解包接口不能调用 destroy()来释放
	*/
	virtual int	FUNCTION_CALL_MODE UnPack(void * lpBuffer, unsigned int iLen) = 0;
	/**取解包数据记录条数,
	*@return 记录条数
	*/
	virtual int FUNCTION_CALL_MODE GetRowCount() = 0;
	///取字段数
	/**@return 返回字段数.
	*/
	virtual int FUNCTION_CALL_MODE GetColCount() = 0;
	///取字段名
	/** @param column:字段序号(以0为基数)
	* @return 返回字段名  下标越界 返回NULL
	*/
	virtual const char* FUNCTION_CALL_MODE GetColName(int column) = 0;
	//取字段数据类型
	/** @param column:字段序号(以0为基数)
	* @return:见上面常量定义;下标越界 返回-1
	*/
	virtual char FUNCTION_CALL_MODE GetColType(int column) = 0;
	///取字段名对应的字段序号
	/**@param columnName: 字段名
	*@return 返回字段序号. 不存在返回-1
	*/
	virtual int FUNCTION_CALL_MODE FindColIndex(const char * columnName) = 0;
	//按字段序号(以0为基数)，取字段值(字符串)
	/**@param column:字段序号(以0为基数)   nRow:行数（以0为基数）
	*@return 字符串型字段值,下标越界、类型不匹配，返回NULL
	*/
	virtual const char* FUNCTION_CALL_MODE GetStrByIndex(int column, int nRow) = 0;
	//按字段序号(以0为基数)，取字段值
	/**@param column:字段序号(以0为基数)   nRow:行数（以0为基数）
	*@return 字符型字段值,下标越界、类型不匹配，返回'\0'.
	*/
	virtual char FUNCTION_CALL_MODE GetCharByIndex(int column, int nRow) = 0;
	//按字段序号，取字段值
	/**@param column:字段序号(以0为基数)   nRow:行数（以0为基数）
	*@return double型字段值,下标越界、类型不匹配，返回-1
	*/
	virtual double FUNCTION_CALL_MODE GetDoubleByIndex(int column, int nRow) = 0;
	///按字段序号，取字段值
	/**@param column:字段序号(以0为基数)   nRow:行数（以0为基数）
	*@return int型字段值,下标越界、类型不匹配，返回-1
	*/
	virtual int FUNCTION_CALL_MODE GetIntByIndex(int column, int nRow) = 0;
	virtual UINT64 FUNCTION_CALL_MODE GetInt64ByIndex(int column, int nRow) = 0;
	///按字段序号获得字段值,二进制数据
	/**@param column: 字段序号(以0为基数)   nRow:行数（以0为基数）
	*@param   lpRawLen: [out]数据长度
	*@return : 数据首地址,下标越界、类型不匹配，返回NULL
	*/
	virtual void* FUNCTION_CALL_MODE GetRawByIndex(int column, int nRow, int* lpRawLen) = 0;
	///按字段名获得字段值(默认第一行)（适用于单记录集）
	/**@param szFieldName: 字段名
	*@return : 字符串型字段值,下标越界、类型不匹配，返回NULL
	*/
	virtual const char* FUNCTION_CALL_MODE GetStrbyName(const char * szFieldName, int nRow = 0) = 0;
	virtual char		FUNCTION_CALL_MODE GetCharbyName(const char * szFieldName, int nRow = 0) = 0;
	virtual double      FUNCTION_CALL_MODE GetDoublebyName(const char * szFieldName, int nRow = 0) = 0;
	virtual int         FUNCTION_CALL_MODE GetIntbyName(const char * szFieldName, int nRow = 0) = 0;
	virtual UINT64      FUNCTION_CALL_MODE GetInt64byName(const char * szFieldName, int nRow = 0) = 0;
	
	virtual void FUNCTION_CALL_MODE Release() = 0;
};


/********************************config class***************************************/
class CConfigI
{
public:
	/**
	功能：加载ini配置文件的内容到内存中
	@inputparams  
	szFileName：ini配置文件名（需要指明路径，本地直接是文件名即可）
	@Outparam；
	0--成功		非0--失败
	**/
	virtual int FUNCTION_CALL_MODE Load(const char *szFileName) = 0;
	/**
	功能：保存ini配置文件（不能保存空文件）
	@inputparams
	szFileName：ini配置文件名（需要指明路径，本地直接是文件名即可）
	@Outparam；
	0--成功		非0--失败
	**/
	virtual int FUNCTION_CALL_MODE Save(const char *szFileName) = 0;
	/**
	功能：获取指定section的键值
	@inputparams
	szSection：section名
	szEntry：键名（KeyName）
	szDefault：默认值。如果ini配置文件的键值为空，则返回默认值
	@Outparam；
	键值不为空，则返回键值；若为空，则返回默认值。
	**/
	virtual const char * FUNCTION_CALL_MODE GetString(const char *szSection, const char *szEntry, const char *szDefault) = 0;
	virtual int FUNCTION_CALL_MODE GetInt(const char *szSection, const char *szEntry, int iDefault) = 0;
	/**
	功能：增加或修改section的键值
	@inputparams
	szSection：section名
	szEntry：键名（KeyName）
	szValue：键值（KeyValue）
	@Outparam；
	0--成功		非0--失败
	**/
	virtual int FUNCTION_CALL_MODE SetString(const char *szSection, const char *szEntry, const char *szValue) = 0;
	virtual int FUNCTION_CALL_MODE SetInt(const char *szSection, const char *szEntry, int iValue) = 0;
	/**
	*  功能：释放配置对象
	*/
	virtual void FUNCTION_CALL_MODE Release() = 0;
};



/********************************callback class***************************************/
class CConnectionI;
class CCallbackI
{
public:
	/**
	功能：连接成功后就会回调该函数
	@Outparam
	lpConnection：当前回调产生的连接指针
	**/
	virtual void FUNCTION_CALL_MODE OnConnect(CConnectionI* lpConnection) = 0;
	/**
	功能：收到服务端注册应答之后就会回调该函数，在OnConnect函数之后
	@Outparam
	lpConnection：当前回调产生的连接指针
	**/
	virtual void FUNCTION_CALL_MODE OnRegister(CConnectionI* lpConnection) = 0;

	virtual void FUNCTION_CALL_MODE OnClose(CConnectionI* lpConnection, const char* msg) = 0;
	/**
	功能：连接上有数据发送成功之后，就会回调该函数。
	@Outparam
	lpConnection：当前回调产生的连接指针
	hSend：发送句柄
	**/
	virtual void FUNCTION_CALL_MODE OnSent(CConnectionI* lpConnection, int hSend, void* reserved1=NULL, void* reserved2=NULL) = 0;
	/**
	功能：收到消息回调。当连接上有应答数据接收成功后，就会回调该函数。
	@Outparam；
	lpConnection：当前回调产生的连接指针
	hSend：发送的句柄，这表示接收到的这个数据是针对哪个请求的应答，通过这个句柄进行匹配
	lpPackHeader：包头PackHeaderI的指针
	lpPacket：业务包指针
	iPacketLen：业务包大小
	nResult：0-请求应答返回，1-行情或成交回报，负数-返回packer包（失败）
	**/
	virtual void FUNCTION_CALL_MODE OnReceivedEx(CConnectionI* lpConnection, int hSend, PackHeaderI* lpPackHeader, const void* lpPacket, unsigned int iPacketLen, int nResult) = 0;
	
};


/********************************connect class***************************************/
class CConnectionI
{
public:
	/**
	*  功能：初始化连接
	*  @InParam
	lpCallback  回调接口实现类指针，lpCallback为NULL，则表示应用不需要任何回调
	*  @OutParam  return      0-成功，非0-失败
	*/
	virtual int FUNCTION_CALL_MODE Create(CCallbackI* lpCallback) = 0;
	/**
	*  功能：订阅监听的主题（必须在调用connect成功后才能订阅）
	*  @InParam
	sTopicKey  主题；sTopicValue 主题值；iTopicType 主题类型 1-topic，2-fanout
	*  @OutParam  return    0-成功，非0-失败
	*/
	virtual int FUNCTION_CALL_MODE SubTopic(const char* sTopicKey, const char* sTopicValue, int iTopicType = 1) = 0;
	/**
	*  功能：取消订阅
	*  @InParam
	sTopicKey  主题；sTopicValue 主题值；iTopicType 
	*  @OutParam  return    0-成功，非0-失败
	*/
	virtual int FUNCTION_CALL_MODE UnSubTopic(const char* sTopicKey, const char* sTopicValue) = 0;
	/**
	*  功能：开始连接,验证用户登录
	*  @InParam
	iTimeout  超时时间
	*  @OutParam  return   0-成功，非0-失败
	*/
	virtual int FUNCTION_CALL_MODE Connect(int iTimeout=5000) = 0;
	/**
	*  功能：关闭连接，释放内存
	*/
	virtual int FUNCTION_CALL_MODE Close() = 0;
	/**
	* 取服务器地址
	* @param lpPort 输出的服务器端口，可以为NULL
	* @return 返回服务器地址
	*/
	virtual const char* FUNCTION_CALL_MODE GetServerAddress(int* lpPort) = 0;
	/**
	*  功能：返回服务器的连接状态）
	*  @OutParam
	Disconnected=0x0000 未连接; Connected=0x0001 已连接; Registered=0x0002 已注册; Rejected=0x0004 被拒绝，将被关闭
	*/
	virtual int FUNCTION_CALL_MODE GetStatus() = 0;
	/**
	*  功能：同步发送业务数据
	*  @InParam
	iFunID -- 功能号
	lpPacketBuf -- 消息包
	iPacketLen -- 消息包的大小
	nSendFlag -- 发送标志：1-截取功能号前面字符作为exchange，功能号作为routingkey（客户端使用）；2-不使用exchange，功能号作为routingkey（报盘使用）
	iTimeout -- 超时时间（默认1000，单位毫秒）（暂时没用上）
	*  @OutParam
	return 返回发送句柄（正数），否则表示失败
	*/
	virtual unsigned int FUNCTION_CALL_MODE SyncSend(const char* szFunID, void* lpPacketBuf, unsigned int iPacketLen, int nSendFlag = 1, int iTimeout = 1000) = 0;
	/**
	*  功能：同步接收业务数据
	*  @InParam
	lpConnection -- 当前回调产生的连接指针
	hSend -- 发送的句柄，这表示接收到的这个数据是针对哪个请求的应答，通过这个句柄进行匹配
	lpPacketBuf -- 业务包，根据参数nResult的值而不同
	iPacketLen -- 业务包大小
	uiTimeout -- 等待时间，单位毫秒，默认1000毫秒；如果超过等待时间，则马上返回
	*  @OutParam
	0-返回packer包(成功)，1-返回string包（成功，暂未实现），负数-返回packer包（失败）
	*/
	virtual int FUNCTION_CALL_MODE SyncReceive(int hSend, void** lpPacketBuf, unsigned int* iPacketLen, unsigned int uiTimeout = 1000) = 0;
	/**
	*  功能：异步发送业务数据
	*  @InParam
	iFunID -- 功能号
	lpPacketBuf -- 消息包
	iPacketLen -- 消息包的大小
	nSendFlag -- 发送标志：1-截取功能号前面字符作为exchange，功能号作为routingkey（客户端使用）；2-不使用exchange，功能号作为routingkey（报盘使用）
	iTimeout -- 超时时间（默认1000，单位毫秒）（暂时没用上）
	*  @OutParam
	return 返回发送句柄（正数），否则表示失败
	*/
	virtual unsigned int FUNCTION_CALL_MODE AsyncSend(const char* szFunID, void* lpPacketBuf, unsigned int iPacketLen, int nSendFlag = 1, int iTimeout = 1000) = 0;
	/**
	*  功能：异步发送应答包
	*  @InParam
	lpPackHeader -- 应答包路由内容
	lpPacketBuf -- 消息包
	iPacketLen -- 消息包的大小
	*  @OutParam  返回发送句柄（正数），否则表示失败
	*/
	virtual unsigned int FUNCTION_CALL_MODE AsyncAns(PackHeaderI* lpPackHeader, void* lpPacketBuf, unsigned int iPacketLen, int iTimeOut = 1000) = 0;
	/**
	*  功能：在多网卡的机器上，返回当前连接使用的IP地址和端口信息
	*  @OutParam  返回IP地址和端口，格式如：192.168.18.44:37813
	*/
	virtual const char* FUNCTION_CALL_MODE GetSelfAddress() = 0;
	/**
	*  功能：在多网卡的机器上，获取当前连接使用的MAC地址
	*  @OutParam  返回MAC的地址字符串格式，类似“D067E5556D83”,中间没有分隔符
	*/
	virtual const char* FUNCTION_CALL_MODE GetSelfMac() = 0;
	/**
	*  功能：获取硬盘序列号
	*  @OutParam  
	*/
	virtual const char* FUNCTION_CALL_MODE GetHdSerialNo() = 0;
	/**
	*  功能：释放连接对象	
	*/
	virtual void FUNCTION_CALL_MODE Release() = 0;
};


#ifdef __cplusplus
extern "C"
{
#endif
		LDSDK_DLL char* FUNCTION_CALL_MODE GetLDSDKVersionInfo();

		LDSDK_DLL CConfigI* FUNCTION_CALL_MODE NewConfigI();

		LDSDK_DLL CConnectionI* FUNCTION_CALL_MODE NewCConnectionI(CConfigI *lpConfig);

		LDSDK_DLL LDPacker*	FUNCTION_CALL_MODE NewLDPacker();

		LDSDK_DLL PackHeaderI*	FUNCTION_CALL_MODE NewPackHeader();
#ifdef __cplusplus
}
#endif


#endif
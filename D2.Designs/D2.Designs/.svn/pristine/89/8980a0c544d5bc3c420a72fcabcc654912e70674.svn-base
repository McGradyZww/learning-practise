#ifndef _ILDSDK_DEFINE_NEW_H_
#define _ILDSDK_DEFINE_NEW_H_

#include <stdio.h>
#include <stdlib.h>

#ifdef BUILDING_DLL
	#include <OS_Independen/config_env.h>
	#include <Include/fastmsg_interface.h>
#else	//	对于使用dll的用户，将所有接口统一在一个文件
/////////////////////////////////////////////////////
#ifdef _WIN32
	#define _WINSOCKAPI_ // 禁止windows.h包含winsock.h
	#include <windows.h>
	#define LD_CALL_MODE		__stdcall
	#ifdef BUILDING_DLL
		#define API_EXPORT __declspec(dllexport)
	#else
		#define API_EXPORT __declspec(dllimport)
	#endif
	typedef char				int8;
	typedef short				int16;
	typedef int					int32;
	typedef __int64				int64;
	typedef unsigned char		uint8;
	typedef unsigned short		uint16;
	typedef unsigned int		uint32;
	typedef unsigned __int64	uint64;
#else
	#define LD_CALL_MODE
	#define API_EXPORT __attribute__ ((visibility("default")))
	#include <sys/types.h>
	#if defined(__linux__)
	#include <stdint.h>
	#endif
	typedef int8_t				int8;
	typedef int16_t				int16;
	typedef int32_t				int32;
	typedef int64_t				int64;
	typedef uint8_t				uint8;
	typedef uint16_t			uint16;
	typedef uint32_t			uint32;
	typedef uint64_t			uint64;
#endif
#define MODULE_SID  const char *
struct IUnKnown
{
	///接口查询
	/**查询与当前接口相关的其他接口
	*@param MODULE_SID  iid  		接口全局唯一标识
	*@param IUnKnown **lppObj 		返回iid对应的接口指针,没有相应接口，则置NULL
	*@return I_OK 成功，I_NONE 未查到iid 相应接口
	*/
	virtual unsigned long  LD_CALL_MODE QueryInterface( MODULE_SID iid, IUnKnown **lppObj ) = 0;
	///	引用，空实现，仅仅兼容com接口
	virtual unsigned long  LD_CALL_MODE AddRef() = 0;
	///	解引用，空实现，仅仅兼容com接口
	virtual unsigned long  LD_CALL_MODE Release() =  0;


	///	保留虚析构函数，为了在摧毁派生类时，可以释放基类资源
	virtual ~IUnKnown(){}
};
//	当前已经支持的内嵌数据类型定义
const uint8	TypeInt8 = 0;
const uint8	TypeuInt8 = 1;
const uint8	TypeInt16 = 2;
const uint8	TypeuInt16 = 3;
const uint8	TypeInt32 = 4;
const uint8	TypeuInt32 = 5;
const uint8	TypeInt64 = 6;
const uint8	TypeuInt64 = 7;
const uint8	TypeDouble = 8;			//	以上都可以看成是整数型

const uint8	TypeString = 9;
const uint8	TypeVector = 10;		//	以上都是字串型
const uint8	TypeSequence = 11;
const uint8	TypeRawData = 12;
const uint8	TypeUnKnown = 13;

struct  IGroup;
///	消息中的每条记录
struct IRecord : public IUnKnown
{
	/**
	*@param int	iFieldTag:检查是否存在iFieldTag(普通字段和sequence都检查)
	*@return	false: 不存在	true: 存在
	**/
	virtual bool	IsExist(int iFieldTag) const  = 0;

	///	普通字段的处理
	////////////////////////////////////	取值	////////////////////////////////////////
	///获得4字节整数形式的值
	/**
	*@param int	iFieldTag:	需要获得的字段
	*@return	域值
	**/
	virtual uint32	GetInt32(int iFieldTag) const=0;					//	0
	///获得64位整数形式的值
	/**
	*@param int	iFieldTag:	需要获得的字段
	*@return	域值
	**/
	virtual uint64	GetInt64(int iFieldTag) const=0;					//	0
	///获得字串形式的值:
	/**
	*@param int	iFieldTag:	需要获得的字段
	*@return	指向域值的指针
	**/
	virtual const char* GetString(int iFieldTag) const=0;				//	""
	///获得二进制形式的值:
	/**
	*@param int	iFieldTag:	需要获得的字段
	*@return	指向域值的指针
	**/
	virtual const void* GetRawData(int iFieldTag, int* ilpDataLen) const = 0;			//	""	
	///获得浮点形式的值
	/**
	*@param int	iFieldTag:	需要获得的字段
	*@return	域值
	*Double		由于网络传输时,内部都会将double转换成int64或者int32(根据模板中定义的小数点位数)
				所以,处理double类型一方面速度慢,另一方面,不可避免可能会有数据失真,所以
				该接口尽量不要用,只在进行计算时使用,否则尽量用GetInt类接口
	**/
	virtual double	GetDouble(int iFieldTag) const=0;					//	0.0

	////////////////////////////////////	设值	////////////////////////////////////////
	/**
	* 设置整数形式的值
	*@param int	iFieldTag:	需要设置的字段,如果该域还不存在,则创建
	*@param int iValue:	域值
	*@return	无
	**/
	virtual void SetInt32(int iFieldTag, uint32 dwValue)=0;
	/**
	* 设置64位整数形式的值
	*@param int	iFieldTag:	需要设置的字段,如果该域还不存在,则创建
	*@param int64 i64Value:	域值
	*@return	无
	**/
	virtual void SetInt64(int iFieldTag, uint64 ddwValue)=0;
	/**
	* 设置字串形式的值
	*@param int	iFieldTag:	需要设置的字段,如果该域还不存在,则创建
	*@param const char* lpValue:	域值
	*@return	无
	**/
	virtual void SetString(int iFieldTag, const char* lpValue)=0;
	/**
	* 设置二进制形式的值
	*@param int	iFieldTag:	需要设置的字段,如果该域还不存在,则创建
	*@param const char* lpValue:	待设置的域值
	*@param int iDataLen:			二进制数据长度
	*@return	无
	**/
	virtual void SetRawData(int iFieldTag, const void* lpValue, int iDataLen) = 0;
	/**
	* 设置浮点形式的值
	*@param int	iFieldTag:	需要设置的字段,如果该域还不存在,则创建
	*@param double dfValue:	域值
	*@return	无
	*Double接口尽量不要用
	**/
	virtual void SetDouble(int iFieldTag, double dfValue)=0;	


	///	重复组类型字段的处理
	/// 往记录中增加一个重复组，如该重复组已存，则返回的是已存在重复组接口。
	/**
	*@param int iGroupTag	重复组(计数域)Tag(计数域作为一个重复组的TAG处理)
							可以唯一的标志该GROUP
	*@return  IGroup 结构指针,在资源紧张时,会返回NULL
	行为：	生成一个空的Group结构，将该空Group结构插入到记录中，同时返回
			刚生成的该Group结构指针。开发人员可以在获得该指针后，接下去
			对Group结构进行操作，可以在Group中插入多条记录。
	*/
	virtual IGroup* SetGroup( int iGroupTag ) = 0;
	/// 取指定的重复组
	/**
	 *@param int iGroupTag 重复组Tag，FIX协议中为计算域Tag
	 *@return IGroup 结构指针; 如果该重复组不存在，返回NULL;
		用户可以在获得IGroup结构后,再获得IRecord结构进行操作
	 */
	virtual IGroup * GetGroup( int iGroupTag ) const = 0;

	//	遍历操作接口
	virtual int GetFieldCount() const = 0;
	virtual int GetFieldType(int iIndex) const = 0;
	//	获得
	virtual uint32	GetInt32byIndex(int iIndex) const = 0;					//	0
	virtual uint64	GetInt64byIndex(int iIndex) const = 0;					//	0
	virtual const char* GetStringbyIndex(int iIndex) const = 0;				//	""
	virtual const void* GetRawDatabyIndex(int iIndex, int* ilpDataLen) const = 0;			//	""	
	virtual double	GetDoublebyIndex(int iIndex) const = 0;					//	0.0
	virtual const char*	GetFieldNamebyIndex(int iIndex) const = 0;
	virtual bool	IsExistbyIndex(int iIndex) const = 0;


	//	设置
	virtual void SetInt32byIndex(int iIndex, uint32 dwValue) = 0;
	virtual void SetInt64byIndex(int iIndex, uint64 ddwValue) = 0;
	virtual void SetStringbyIndex(int iIndex, const char* lpValue) = 0;
	virtual void SetRawDatabyIndex(int iIndex, const void* lpValue, int iDataLen) = 0;
	virtual void SetDoublebyIndex(int iIndex, double dfValue) = 0;

	//	根据字段名操作（操作速度最慢）
	virtual int GetIndexByName(const char* lpFieldName) = 0;
};

///重复组对象接口，表示多条记录的一个集合(DataSet)
struct  IGroup : public IUnKnown
{
	/// 返回重复组内记录个数
	/**
	 *@param 无
	 *@return 重复组内记录条数，可以通过for循环来获得内部的各个记录
	 */
	virtual int GetRecordCount() const = 0;
	/// 取重复组中的某条记录
	/**
	 *@param int num 第几条记录(num从0开始)
	 *@return IRecord 结构指针,如果传入的num大于重复组内部的记录数,则返回NULL
	 */
	virtual IRecord * GetRecord(int num) const = 0;
	/// 在重复组中追加一条空白记录
	/**
	 * @return IRecord 追加的记录指针,如果资源紧张,可能会返回NULL
	行为:	调用一次AddRecord操作,创建一个空的 IRecord,并且将该 IRecord 插入
			重复组,返回刚创建的 IRecord 指针,开发人员获得该指针后,可以往 IRecord
			中插入字段(普通字段或者又是一个重复组字段)

	*/
	virtual IRecord * AddRecord() = 0;

	////////////////////////////////	20170706新增	/////////////////////////////////////////////
	//	20170706	增加对不同结果集的合并功能
	virtual void SortbyFields(int iIndexFieldCount, int iFieldsIDs[10]) = 0;
	virtual void JoinTwoResultByFields(const IGroup* lpMainResult, const IGroup* lpMinorResult, int iIndexFieldCount, int iFieldsIDs[10]) = 0;
	virtual void JoinWithAnotherResultByFields(const IGroup* lpMinorResult, int iIndexFieldCount, int iFieldsIDs[10]) = 0;

	//	20170706	增加对结果集字段的计算功能	公式仅支持  +   -   *   /  (  )
	virtual void InitCalculationSets(int iCalculations) = 0;
	virtual void AddCalculationFormula(int iDstFieldID, const char* lpCalculation) = 0;
	virtual void Calculation() = 0;
};
struct Iservice_interface;
struct IFastMessage : public IRecord
{
	///	根据报文生成消息对象内的各个域
	/**
	* 根据报文生成消息对象内的各个域
	*@param const void* lpMessageBuffer:	报文
	*@param int iMsgLen:					报文长度
	*@return 0:成功		其他:失败
	**/
	virtual int		SetBuffer(const void* lpMessageBuffer, int iMsgLen) = 0;
	/// 将消息结构序列化成一条二进制流消息，供发送
	/**
	* 将本对象内的各个域值对象最终封装成报文返回,(不封装协议内部的域值)
	*@param int* ilpMsgLen:	封装后报文的长度
	*@return 报文,如果失败,返回NULL
	*序列化后返回的二进制数据已经在前面预留了24字节！
	**/
	virtual void*	GetBuffer(int* ilpMsgLen) = 0;

	///	在打包解报失败时,可以获得为什么失败的原因
	/**
	* 详细指出在操作哪个字段时出现了什么错误
	*@param 无
	*@return 错误信息
	**/	
	virtual const char* GetLastErrInfo()=0;

	/// 将消息归还释放
	/**
	*@param 无
	*@return 无
	**/
	virtual void FreeMsg() = 0;

	/// 反转发送者和路由信息字段（一般是业务处理插件调用，其他插件不要调用）
	/**
	*@param 无
	*@return 无
	**/
	virtual void Reversal() = 0;

	//	设置和获得消息的创建者服务
	virtual void SetCreater(Iservice_interface* lpCreater) = 0;
	virtual Iservice_interface* GetCreater() = 0;

	//	设置和获得消息特定标志！（不参与序列化，具体含义由使用者自行协商决定，本接口仅仅提供一个额外的数据保存的地方）
	virtual void SetMsgIdentity(const char* lpMsgIdentity) = 0;	//	lpMsgIdentity的含义，消息模块不关心
	virtual const char* GetMsgIdentity() = 0;
	virtual void BuildAnsInfoByReq(IFastMessage* lpReq)=0;


	virtual IRecord* GetBizBodyRecord() = 0;
	virtual IRecord* GetHeadRecord() = 0;

	virtual int FillWithAnotherMsg(IFastMessage* lpAnother) = 0;
};
////////////////////////////////////////////////////
#endif	//	BUILDING_DLL



#ifdef _WIN32
	#pragma warning(disable : 4018)
#endif

#ifndef _WIN32
#define interface struct
#endif

enum ConnectionStatus
{
	Disconnected = 0x0000, /**< 未连接 */
	Connected = 0x0001, /**< socket已连接 */
	Registered = 0x0002, /**< 已注册 */
	IsClosing = 0x0004, /**< 正在关闭中 */
};

/********************************config interface***************************************/
//读取ini文件配置
interface CIniConfigI
{
public:
	/**
	功能：加载ini配置文件的内容到内存中
	@inputparams
	szFileName：ini配置文件名（需要指明路径，本地直接是文件名即可）
	@Outparam；
	0--成功		非0--失败
	**/
	virtual int LD_CALL_MODE Load(const char *szFileName) = 0;
	/**
	功能：保存ini配置文件（不能保存空文件）
	@inputparams
	szFileName：ini配置文件名（需要指明路径，本地直接是文件名即可）
	@Outparam；
	0--成功		非0--失败
	**/
	virtual int LD_CALL_MODE Save(const char *szFileName) = 0;
	/**
	功能：获取指定section的键值
	@inputparams
	szSection：section名
	szEntry：键名（KeyName）
	szDefault：默认值。如果ini配置文件的键值为空，则返回默认值
	@Outparam；
	键值不为空，则返回键值；若为空，则返回默认值。
	**/
	virtual const char * LD_CALL_MODE GetString(const char *szSection, const char *szEntry, const char *szDefault) = 0;
	virtual int LD_CALL_MODE GetInt(const char *szSection, const char *szEntry, int iDefault) = 0;
	/**
	功能：增加或修改section的键值
	@inputparams
	szSection：section名
	szEntry：键名（KeyName）
	szValue：键值（KeyValue）
	@Outparam；
	0--成功		非0--失败
	**/
	virtual int LD_CALL_MODE SetString(const char *szSection, const char *szEntry, const char *szValue) = 0;
	virtual int LD_CALL_MODE SetInt(const char *szSection, const char *szEntry, int iValue) = 0;
	/**
	*  功能：释放配置对象
	*/
	virtual void LD_CALL_MODE Release() = 0;
};

/********************************callback interface***************************************/
interface CConnectionI;
interface CCallbackI
{
public:
	/**
	功能：连接成功后就会回调该函数
	@Outparam
	lpConnection：当前回调产生的连接指针
	**/
	virtual void LD_CALL_MODE OnConnect(CConnectionI* lpConnection) = 0;
	/**
	功能：收到服务端注册应答之后就会回调该函数，在OnConnect函数之后
	@Outparam
	lpConnection：当前回调产生的连接指针
	**/
	virtual void LD_CALL_MODE OnRegister(CConnectionI* lpConnection) = 0;
	/**
	功能：收到服务端关闭之后就会回调该函数
	@Outparam
	lpConnection：当前回调产生的连接指针
	msg：关闭信息
	**/
	virtual void LD_CALL_MODE OnClose(CConnectionI* lpConnection, const char* msg) = 0;
	/**
	功能：连接上有数据发送成功之后，就会回调该函数。
	@Outparam
	lpConnection：当前回调产生的连接指针
	hSend：发送句柄
	**/
	virtual void LD_CALL_MODE OnSent(CConnectionI* lpConnection, int hSend, void* reserved1 = NULL, void* reserved2 = NULL) = 0;
	/**
	功能：收到消息回调。当连接上有应答数据接收成功后，就会回调该函数。
	@Outparam；
	lpConnection：当前回调产生的连接指针
	hSend：发送的句柄，这表示接收到的这个数据是针对哪个请求的应答，通过这个句柄进行匹配
	lpFastMsg：消息由使用者负责释放
	nResult：0-请求应答返回，1-行情，2-订单回报、成交回报，负数-返回packer包（失败）（暂时没用上）
	**/
	virtual void LD_CALL_MODE OnReceivedEx(CConnectionI* lpConnection, int hSend, IFastMessage* lpFastMsg, int nResult) = 0;
	/**
	功能：收到主推消息。
	@Outparam；
	lpConnection：	当前回调产生的连接指针
	lpTopicName：	主题名
	lpFastMsg：		主推的原始消息
	**/
	virtual void LD_CALL_MODE OnPublish(CConnectionI* lpConnection, const char* lpTopicName, IFastMessage* lpFastMsg) = 0;
};

/********************************connect interface***************************************/
// typedef struct tagSuberInfo
// {
// 	char szTopicName[20];
// 	int  iFilterFields;
// 	int  iFieldID[4];
// 	char szFieldValue[4][32];
// }SUBER_INFO, *LPSUBER_INFO;
interface CConnectionI
{
public:
	/**
	*  功能：初始化连接
	*  @InParam
	lpCallback  回调接口实现类指针，lpCallback为NULL，则表示应用不需要任何回调
	*  @OutParam  return      0-成功，非0-失败
	*/
	virtual int LD_CALL_MODE Create(CCallbackI* lpCallback) = 0;
	/**
	*  功能：开始连接,验证用户登录
	*  @InParam
	iTimeout  超时时间
	*  @OutParam  return   0-成功，非0-失败
	*/
	virtual int LD_CALL_MODE Connect(int iTimeout = 5000) = 0;
	/** （暂未实现）
	*  功能：订阅监听的主题（必须在调用connect成功后才能订阅）
	*  @InParam
	sTopicKey  主题；sTopicValue 主题值；iTopicType 主题类型 1-topic，2-fanout
	*  @OutParam  return    0-成功，非0-失败
	*/
	virtual int LD_CALL_MODE SubTopic(const char* sTopicKey, const char* sTopicValue, int iTopicType = 1) = 0;
	/**（暂未实现）
	*  功能：取消订阅
	*  @InParam
	sTopicKey  主题；sTopicValue 主题值；iTopicType
	*  @OutParam  return    0-成功，非0-失败
	*/
	virtual int LD_CALL_MODE UnSubTopic(const char* sTopicKey, const char* sTopicValue) = 0;
	/**
	* 取服务器地址
	* @param lpPort 输出的服务器端口，可以为NULL
	* @return 返回服务器地址
	*/
	virtual const char* LD_CALL_MODE GetServerAddress(int* lpPort) = 0;
	/**
	*  功能：返回服务器的连接状态
	*  @OutParam
	 参考枚举：ConnectionStatus
	*/
	virtual ConnectionStatus LD_CALL_MODE GetStatus() = 0;
	/**
	*  功能：同步发送和接收业务数据
	*  @InParam
	iFunID -- 功能号
	lpInFastMsg -- 发送报文
	lpOutFastMsg -- 接收报文，需要调用者来释放(lpOutFastMsg->FreeMsg)
	iTimeout -- 超时时间（默认1000，单位毫秒）
	*  @OutParam
	return 返回发送句柄（正数），否则表示失败
	*/
	virtual unsigned int LD_CALL_MODE SendAndReceive(const char* szFunID, IFastMessage* lpInFastMsg, IFastMessage** lpOutFastMsg, int iTimeout = 1000) = 0;
	/**
	*  功能：异步发送业务数据
	*  @InParam
	iFunID -- 功能号
	lpInFastMsg -- 发送报文
	iTimeout -- 超时时间（默认1000，单位毫秒）
	*  @OutParam
	return 返回发送句柄（正数），否则表示失败
	*/
	virtual unsigned int LD_CALL_MODE AsyncSend(const char* szFunID, IFastMessage* lpInFastMsg, int iTimeout = 1000) = 0;
	/**
	*  功能：异步发送应答包
	*  @InParam
	iFunID -- 功能号
	lpInFastMsg -- 发送报文
	iTimeOut -- 超时时间（默认1000，单位毫秒）
	*  @OutParam  返回发送句柄（正数），否则表示失败
	*/
	virtual unsigned int LD_CALL_MODE AsyncAns(const char* szFunID, IFastMessage* lpInFastMsg, int iTimeOut = 1000) = 0;
	/**
	*  功能：在多网卡的机器上，返回当前连接使用的IP地址和端口信息
	*  @OutParam  返回IP地址和端口，格式如：192.168.18.44:37813
	*/
	virtual const char* LD_CALL_MODE GetSelfAddress() = 0;
	/**
	*  功能：在多网卡的机器上，获取当前连接使用的MAC地址
	*  @OutParam  返回MAC的地址字符串格式，类似“D067E5556D83”,中间没有分隔符
	*/
	virtual const char* LD_CALL_MODE GetSelfMac() = 0;
	/**
	*  功能：获取硬盘序列号
	*  @OutParam
	*/
	virtual const char* LD_CALL_MODE GetHdSerialNo() = 0;
	/**
	*  功能：释放连接对象
	*/
	virtual void LD_CALL_MODE Release() = 0;

	//	订阅消息（全量，不支持增量）
	/*
		lpSubMsg：	按照LMWS.push.xml文档中的 LMWS.push.1 订阅请求组织订阅报文
	*/
 	virtual int LD_CALL_MODE SubTopics(const char* lpTopicName, IFastMessage* lpSubMsg) = 0;
	//	退订所有已经订阅的项目
	virtual int LD_CALL_MODE UnSubAllTopics() = 0;
	//	退订特定主题
	virtual int LD_CALL_MODE UnSubOneTopic(const char* lpTopicName) = 0;
	//	发布消息
	/*
	入参：	lpTopicName		主题名
			lpOrgFastMsg	待发布原始消息（由调用者负责释放）
	返回：	0： 成功	其他失败
	*/
 	virtual int LD_CALL_MODE PubTopics(const char* lpTopicName, IFastMessage* lpOrgFastMsg) = 0;
};


////导出接口
#ifdef __cplusplus
extern "C" {
#endif
	API_EXPORT const char* LD_CALL_MODE GetLDsdkVersion();

	API_EXPORT IFastMessage* LD_CALL_MODE NewFastMessage(const char* lpFunc, int iPacketType);//iPacketType：0-请求包，1-应答包

	API_EXPORT CIniConfigI* LD_CALL_MODE NewIniConfigI();

	API_EXPORT CConnectionI* LD_CALL_MODE NewConnectionI(CIniConfigI *lpIniConfig);
#ifdef __cplusplus
}
#endif


#endif
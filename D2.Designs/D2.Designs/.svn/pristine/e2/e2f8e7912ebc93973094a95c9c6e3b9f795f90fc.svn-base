/**
	消息操作接口
**/

#ifndef __FAST_MSG_INTERFACE_H__
#define __FAST_MSG_INTERFACE_H__
#include <OS_Independen/basetypes.h>
#include "module_interface.h"
//	当前已经支持的内嵌数据类型定义
const uint8	TypeInt8	= 0;
const uint8	TypeuInt8	= 1;
const uint8	TypeInt16	= 2;
const uint8	TypeuInt16	= 3;
const uint8	TypeInt32	= 4;
const uint8	TypeuInt32	= 5;
const uint8	TypeInt64	= 6;
const uint8	TypeuInt64	= 7;
const uint8	TypeDouble	= 8;		//	以上都可以看成是整数型

const uint8	TypeString	= 9;
const uint8	TypeVector	= 10;		//	以上都是字串型（TypeVector和TypeString的区别：TypeString中出现的任意字符，最高位均不能为1，一般来说就只是英文符号
									//	而TypeVector则可以出现中文字符，这2种类型不允许出现  '\0'

const uint8	TypeSequence = 11;		//	重复组
const uint8	TypeRawData  = 12;		//	原始二进制流（TypeString、TypeVector最大的区别在于，流中可能包含'\0'）
const uint8	TypeUnKnown  = 13;		//	不支持的类型
//////////////////////////////////////////////////////////////////////////
///	消息是个递归的定义
/*
	IFastMessage = Header(IRecord)+Body(IRecord)
	IRecord ={Field}
	Field ∈ {SimpleField， SquenceField}
	SquenceField = {IRecord}
*/
struct  IGroup;
///	消息中的每条记录
struct IRecord : public IUnKnown
{
	/**
	*@param int	iFieldTag:检查是否存在iFieldTag(普通字段和sequence都检查)
	*@return	false: 不存在	true: 存在
	**/
	virtual bool	IsExist(int iFieldTag) const  = 0;


	///	普通字段的处理	按 tagid 进行操作
	////////////////////////////////////	取值	////////////////////////////////////////
	//	所有取值操作，无论该字段是否存在，均不会返回NULL，当字段不存在会返回缺省值，返回缺省值的规则：
	//	int类型，缺省值为0	string类型，返回值为""  double类型，返回值为0.0
	///获得4字节整数形式的值（适用于操作int8 uint8 int16 uint16 int32 uint32）
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
	*@param int	iFieldTag:		需要获得的字段
	*@param int* ilpDataLen：	返回的rawdata的长度(不存在会设置成0)
	*@return	指向域值的指针
	**/
	virtual const void* GetRawData(int iFieldTag, int* ilpDataLen) const = 0;			// 0 	""	
	///获得浮点形式的值
	/**
	*@param int	iFieldTag:	需要获得的字段
	*@return	域值
	*Double		网络传输时,内部都会将double转换成int64或者int32(根据模板中定义的小数点位数)
	**/
	virtual double	GetDouble(int iFieldTag) const=0;					//	0.0

	////////////////////////////////////	设值	////////////////////////////////////////
	/**
	* 设置整数形式的值
	*@param int	iFieldTag:	需要设置的字段,如果该域还不存在,则创建
	*@param int iValue:		域值
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
	*@param int	iFieldTag:			需要设置的字段,如果该域还不存在,则创建
	*@param const char* lpValue:	域值
	*@return	无
	**/
	virtual void SetString(int iFieldTag, const char* lpValue)=0;
	/**
	* 设置二进制形式的值
	*@param int	iFieldTag:			需要设置的字段,如果该域还不存在,则创建
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
	*@return  IGroup 结构指针。
		注意：	当模板配置该记录中，没有相对应的Group,则本操作会返回NULL
				如果模板配置该记录中,允许出现该Group,则必定会返回一个非NULL指针！
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
		注意：	当模板配置该记录中，没有相对应的Group,则本操作会返回NULL
				如果模板配置该记录中,允许出现该Group，但是，实际数据中，该重复组内部没有任何数据，则肯定会返回一个
				记录数为0条的IGroup指针！！
	 */
	virtual IGroup * GetGroup( int iGroupTag ) const = 0;


	//	顺序遍历的操作接口，根据下标设置或者获得值，出参含义等同于上述按字段ID进行操作
	//////////////////////////////////////////////////////////////////////////
	/**
	* 获得记录内字段个数
	*@param		无
	*@return	记录内字段个数
	注意：		本接口返回的字段个数，仅指模板配置的字段个数，具体到某一特定的消息，无法返回记录内的字段个数
				（关键是无法实现按有效字段遍历）
				所以，使用者如果需要遍历获得记录内的实际字段，应该再结合IsExistbyIndex函数，按下标判断某一个TAG是否实际存在！
	**/
	virtual int GetFieldCount() const = 0;
	/**
	* 获得记录某个下标字段的数据类型
	*@param		int iIndex		字段的下标
	*@return	数据类型
	**/
	virtual int GetFieldTypebyIndex(int iIndex) const = 0;
	///		按下标获得值，和按TAGID一样的
	virtual uint32	GetInt32byIndex(int iIndex) const = 0;					//	0
	virtual uint64	GetInt64byIndex(int iIndex) const = 0;					//	0
	virtual const char* GetStringbyIndex(int iIndex) const = 0;				//	""
	virtual const void* GetRawDatabyIndex(int iIndex, int* ilpDataLen) const = 0;			//	""	
	virtual double	GetDoublebyIndex(int iIndex) const = 0;					//	0.0
	//	根据下标获得字段名称
	virtual const char*	GetFieldNamebyIndex(int iIndex) const = 0;
	//	判断某个下标的字段在记录中是否真实存在
	virtual bool	IsExistbyIndex(int iIndex) const = 0;

	//	设置
	virtual void SetInt32byIndex(int iIndex, uint32 dwValue) = 0;
	virtual void SetInt64byIndex(int iIndex, uint64 ddwValue) = 0;
	virtual void SetStringbyIndex(int iIndex, const char* lpValue) = 0;
	virtual void SetRawDatabyIndex(int iIndex, const void* lpValue, int iDataLen) = 0;
	virtual void SetDoublebyIndex(int iIndex, double dfValue) = 0;

	//	根据字段名操作（操作速度最慢）视情况，如果有需求可以实现
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
			在内部资源不足的情况下，会返回NULL

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

	/// 反转发送者和路由信息字段（一般是业务处理插件在将请求转应答时调用，其他插件不要调用）
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

	//	根据另一条消息组织自己的结果集
	virtual int FillWithAnotherMsg(IFastMessage* lpAnother) = 0;
};

#endif	//	__FAST_MSG_INTERFACE_H

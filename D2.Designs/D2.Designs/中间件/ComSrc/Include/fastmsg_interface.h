/**
	��Ϣ�����ӿ�
**/

#ifndef __FAST_MSG_INTERFACE_H__
#define __FAST_MSG_INTERFACE_H__
#include <OS_Independen/basetypes.h>
#include "module_interface.h"
//	��ǰ�Ѿ�֧�ֵ���Ƕ�������Ͷ���
const uint8	TypeInt8	= 0;
const uint8	TypeuInt8	= 1;
const uint8	TypeInt16	= 2;
const uint8	TypeuInt16	= 3;
const uint8	TypeInt32	= 4;
const uint8	TypeuInt32	= 5;
const uint8	TypeInt64	= 6;
const uint8	TypeuInt64	= 7;
const uint8	TypeDouble	= 8;		//	���϶����Կ�����������

const uint8	TypeString	= 9;
const uint8	TypeVector	= 10;		//	���϶����ִ��ͣ�TypeVector��TypeString������TypeString�г��ֵ������ַ������λ������Ϊ1��һ����˵��ֻ��Ӣ�ķ���
									//	��TypeVector����Գ��������ַ�����2�����Ͳ��������  '\0'

const uint8	TypeSequence = 11;		//	�ظ���
const uint8	TypeRawData  = 12;		//	ԭʼ����������TypeString��TypeVector�����������ڣ����п��ܰ���'\0'��
const uint8	TypeUnKnown  = 13;		//	��֧�ֵ�����
//////////////////////////////////////////////////////////////////////////
///	��Ϣ�Ǹ��ݹ�Ķ���
/*
	IFastMessage = Header(IRecord)+Body(IRecord)
	IRecord ={Field}
	Field �� {SimpleField�� SquenceField}
	SquenceField = {IRecord}
*/
struct  IGroup;
///	��Ϣ�е�ÿ����¼
struct IRecord : public IUnKnown
{
	/**
	*@param int	iFieldTag:����Ƿ����iFieldTag(��ͨ�ֶκ�sequence�����)
	*@return	false: ������	true: ����
	**/
	virtual bool	IsExist(int iFieldTag) const  = 0;


	///	��ͨ�ֶεĴ���	�� tagid ���в���
	////////////////////////////////////	ȡֵ	////////////////////////////////////////
	//	����ȡֵ���������۸��ֶ��Ƿ���ڣ������᷵��NULL�����ֶβ����ڻ᷵��ȱʡֵ������ȱʡֵ�Ĺ���
	//	int���ͣ�ȱʡֵΪ0	string���ͣ�����ֵΪ""  double���ͣ�����ֵΪ0.0
	///���4�ֽ�������ʽ��ֵ�������ڲ���int8 uint8 int16 uint16 int32 uint32��
	/**
	*@param int	iFieldTag:	��Ҫ��õ��ֶ�
	*@return	��ֵ
	**/
	virtual uint32	GetInt32(int iFieldTag) const=0;					//	0
	///���64λ������ʽ��ֵ
	/**
	*@param int	iFieldTag:	��Ҫ��õ��ֶ�
	*@return	��ֵ
	**/
	virtual uint64	GetInt64(int iFieldTag) const=0;					//	0
	///����ִ���ʽ��ֵ:
	/**
	*@param int	iFieldTag:	��Ҫ��õ��ֶ�
	*@return	ָ����ֵ��ָ��
	**/
	virtual const char* GetString(int iFieldTag) const=0;				//	""
	///��ö�������ʽ��ֵ:
	/**
	*@param int	iFieldTag:		��Ҫ��õ��ֶ�
	*@param int* ilpDataLen��	���ص�rawdata�ĳ���(�����ڻ����ó�0)
	*@return	ָ����ֵ��ָ��
	**/
	virtual const void* GetRawData(int iFieldTag, int* ilpDataLen) const = 0;			// 0 	""	
	///��ø�����ʽ��ֵ
	/**
	*@param int	iFieldTag:	��Ҫ��õ��ֶ�
	*@return	��ֵ
	*Double		���紫��ʱ,�ڲ����Ὣdoubleת����int64����int32(����ģ���ж����С����λ��)
	**/
	virtual double	GetDouble(int iFieldTag) const=0;					//	0.0

	////////////////////////////////////	��ֵ	////////////////////////////////////////
	/**
	* ����������ʽ��ֵ
	*@param int	iFieldTag:	��Ҫ���õ��ֶ�,������򻹲�����,�򴴽�
	*@param int iValue:		��ֵ
	*@return	��
	**/
	virtual void SetInt32(int iFieldTag, uint32 dwValue)=0;
	/**
	* ����64λ������ʽ��ֵ
	*@param int	iFieldTag:	��Ҫ���õ��ֶ�,������򻹲�����,�򴴽�
	*@param int64 i64Value:	��ֵ
	*@return	��
	**/
	virtual void SetInt64(int iFieldTag, uint64 ddwValue)=0;
	/**
	* �����ִ���ʽ��ֵ
	*@param int	iFieldTag:			��Ҫ���õ��ֶ�,������򻹲�����,�򴴽�
	*@param const char* lpValue:	��ֵ
	*@return	��
	**/
	virtual void SetString(int iFieldTag, const char* lpValue)=0;
	/**
	* ���ö�������ʽ��ֵ
	*@param int	iFieldTag:			��Ҫ���õ��ֶ�,������򻹲�����,�򴴽�
	*@param const char* lpValue:	�����õ���ֵ
	*@param int iDataLen:			���������ݳ���
	*@return	��
	**/
	virtual void SetRawData(int iFieldTag, const void* lpValue, int iDataLen) = 0;
	/**
	* ���ø�����ʽ��ֵ
	*@param int	iFieldTag:	��Ҫ���õ��ֶ�,������򻹲�����,�򴴽�
	*@param double dfValue:	��ֵ
	*@return	��
	*Double�ӿھ�����Ҫ��
	**/
	virtual void SetDouble(int iFieldTag, double dfValue)=0;	


	///	�ظ��������ֶεĴ���
	/// ����¼������һ���ظ��飬����ظ����Ѵ棬�򷵻ص����Ѵ����ظ���ӿڡ�
	/**
	*@param int iGroupTag	�ظ���(������)Tag(��������Ϊһ���ظ����TAG����)
							����Ψһ�ı�־��GROUP
	*@return  IGroup �ṹָ�롣
		ע�⣺	��ģ�����øü�¼�У�û�����Ӧ��Group,�򱾲����᷵��NULL
				���ģ�����øü�¼��,������ָ�Group,��ض��᷵��һ����NULLָ�룡
	��Ϊ��	����һ���յ�Group�ṹ�����ÿ�Group�ṹ���뵽��¼�У�ͬʱ����
			�����ɵĸ�Group�ṹָ�롣������Ա�����ڻ�ø�ָ��󣬽���ȥ
			��Group�ṹ���в�����������Group�в��������¼��
	*/
	virtual IGroup* SetGroup( int iGroupTag ) = 0;
	/// ȡָ�����ظ���
	/**
	 *@param int iGroupTag �ظ���Tag��FIXЭ����Ϊ������Tag
	 *@return IGroup �ṹָ��; ������ظ��鲻���ڣ�����NULL;
		�û������ڻ��IGroup�ṹ��,�ٻ��IRecord�ṹ���в���
		ע�⣺	��ģ�����øü�¼�У�û�����Ӧ��Group,�򱾲����᷵��NULL
				���ģ�����øü�¼��,������ָ�Group�����ǣ�ʵ�������У����ظ����ڲ�û���κ����ݣ���϶��᷵��һ��
				��¼��Ϊ0����IGroupָ�룡��
	 */
	virtual IGroup * GetGroup( int iGroupTag ) const = 0;


	//	˳������Ĳ����ӿڣ������±����û��߻��ֵ�����κ����ͬ���������ֶ�ID���в���
	//////////////////////////////////////////////////////////////////////////
	/**
	* ��ü�¼���ֶθ���
	*@param		��
	*@return	��¼���ֶθ���
	ע�⣺		���ӿڷ��ص��ֶθ�������ָģ�����õ��ֶθ��������嵽ĳһ�ض�����Ϣ���޷����ؼ�¼�ڵ��ֶθ���
				���ؼ����޷�ʵ�ְ���Ч�ֶα�����
				���ԣ�ʹ���������Ҫ������ü�¼�ڵ�ʵ���ֶΣ�Ӧ���ٽ��IsExistbyIndex���������±��ж�ĳһ��TAG�Ƿ�ʵ�ʴ��ڣ�
	**/
	virtual int GetFieldCount() const = 0;
	/**
	* ��ü�¼ĳ���±��ֶε���������
	*@param		int iIndex		�ֶε��±�
	*@return	��������
	**/
	virtual int GetFieldTypebyIndex(int iIndex) const = 0;
	///		���±���ֵ���Ͱ�TAGIDһ����
	virtual uint32	GetInt32byIndex(int iIndex) const = 0;					//	0
	virtual uint64	GetInt64byIndex(int iIndex) const = 0;					//	0
	virtual const char* GetStringbyIndex(int iIndex) const = 0;				//	""
	virtual const void* GetRawDatabyIndex(int iIndex, int* ilpDataLen) const = 0;			//	""	
	virtual double	GetDoublebyIndex(int iIndex) const = 0;					//	0.0
	//	�����±����ֶ�����
	virtual const char*	GetFieldNamebyIndex(int iIndex) const = 0;
	//	�ж�ĳ���±���ֶ��ڼ�¼���Ƿ���ʵ����
	virtual bool	IsExistbyIndex(int iIndex) const = 0;

	//	����
	virtual void SetInt32byIndex(int iIndex, uint32 dwValue) = 0;
	virtual void SetInt64byIndex(int iIndex, uint64 ddwValue) = 0;
	virtual void SetStringbyIndex(int iIndex, const char* lpValue) = 0;
	virtual void SetRawDatabyIndex(int iIndex, const void* lpValue, int iDataLen) = 0;
	virtual void SetDoublebyIndex(int iIndex, double dfValue) = 0;

	//	�����ֶ��������������ٶ��������������������������ʵ��
	virtual int GetIndexByName(const char* lpFieldName) = 0;
};

///�ظ������ӿڣ���ʾ������¼��һ������(DataSet)
struct  IGroup : public IUnKnown
{
	/// �����ظ����ڼ�¼����
	/**
	 *@param ��
	 *@return �ظ����ڼ�¼����������ͨ��forѭ��������ڲ��ĸ�����¼
	 */
	virtual int GetRecordCount() const = 0;
	/// ȡ�ظ����е�ĳ����¼
	/**
	 *@param int num �ڼ�����¼(num��0��ʼ)
	 *@return IRecord �ṹָ��,��������num�����ظ����ڲ��ļ�¼��,�򷵻�NULL
	 */
	virtual IRecord * GetRecord(int num) const = 0;
	/// ���ظ�����׷��һ���հ׼�¼
	/**
	 * @return IRecord ׷�ӵļ�¼ָ��,�����Դ����,���ܻ᷵��NULL
	��Ϊ:	����һ��AddRecord����,����һ���յ� IRecord,���ҽ��� IRecord ����
			�ظ���,���ظմ����� IRecord ָ��,������Ա��ø�ָ���,������ IRecord
			�в����ֶ�(��ͨ�ֶλ�������һ���ظ����ֶ�)
			���ڲ���Դ���������£��᷵��NULL

	*/
	virtual IRecord * AddRecord() = 0;

	////////////////////////////////	20170706����	/////////////////////////////////////////////
	//	20170706	���ӶԲ�ͬ������ĺϲ�����
	virtual void SortbyFields(int iIndexFieldCount, int iFieldsIDs[10]) = 0;
	virtual void JoinTwoResultByFields(const IGroup* lpMainResult, const IGroup* lpMinorResult, int iIndexFieldCount, int iFieldsIDs[10]) = 0;
	virtual void JoinWithAnotherResultByFields(const IGroup* lpMinorResult, int iIndexFieldCount, int iFieldsIDs[10]) = 0;

	//	20170706	���ӶԽ�����ֶεļ��㹦��	��ʽ��֧��  +   -   *   /  (  )
	virtual void InitCalculationSets(int iCalculations) = 0;
	virtual void AddCalculationFormula(int iDstFieldID, const char* lpCalculation) = 0;
	virtual void Calculation() = 0;
};
struct Iservice_interface;
struct IFastMessage : public IRecord
{
	///	���ݱ���������Ϣ�����ڵĸ�����
	/**
	* ���ݱ���������Ϣ�����ڵĸ�����
	*@param const void* lpMessageBuffer:	����
	*@param int iMsgLen:					���ĳ���
	*@return 0:�ɹ�		����:ʧ��
	**/
	virtual int		SetBuffer(const void* lpMessageBuffer, int iMsgLen) = 0;
	/// ����Ϣ�ṹ���л���һ������������Ϣ��������
	/**
	* ���������ڵĸ�����ֵ�������շ�װ�ɱ��ķ���,(����װЭ���ڲ�����ֵ)
	*@param int* ilpMsgLen:	��װ���ĵĳ���
	*@return ����,���ʧ��,����NULL
	*���л��󷵻صĶ����������Ѿ���ǰ��Ԥ����24�ֽڣ�
	**/
	virtual void*	GetBuffer(int* ilpMsgLen) = 0;

	///	�ڴ���ⱨʧ��ʱ,���Ի��Ϊʲôʧ�ܵ�ԭ��
	/**
	* ��ϸָ���ڲ����ĸ��ֶ�ʱ������ʲô����
	*@param ��
	*@return ������Ϣ
	**/	
	virtual const char* GetLastErrInfo()=0;

	/// ����Ϣ�黹�ͷ�
	/**
	*@param ��
	*@return ��
	**/
	virtual void FreeMsg() = 0;

	/// ��ת�����ߺ�·����Ϣ�ֶΣ�һ����ҵ�������ڽ�����תӦ��ʱ���ã����������Ҫ���ã�
	/**
	*@param ��
	*@return ��
	**/
	virtual void Reversal() = 0;

	//	���úͻ����Ϣ�Ĵ����߷���
	virtual void SetCreater(Iservice_interface* lpCreater) = 0;
	virtual Iservice_interface* GetCreater() = 0;

	//	���úͻ����Ϣ�ض���־�������������л������庬����ʹ��������Э�̾��������ӿڽ����ṩһ����������ݱ���ĵط���
	virtual void SetMsgIdentity(const char* lpMsgIdentity) = 0;	//	lpMsgIdentity�ĺ��壬��Ϣģ�鲻����
	virtual const char* GetMsgIdentity() = 0;
	virtual void BuildAnsInfoByReq(IFastMessage* lpReq)=0;


	virtual IRecord* GetBizBodyRecord() = 0;
	virtual IRecord* GetHeadRecord() = 0;

	//	������һ����Ϣ��֯�Լ��Ľ����
	virtual int FillWithAnotherMsg(IFastMessage* lpAnother) = 0;
};

#endif	//	__FAST_MSG_INTERFACE_H

#ifndef __LDPACKER_INTERFACE_H__
#define __LDPACKER_INTERFACE_H__

#include "module_interface.h"

typedef unsigned long long   UINT64;
//��������
enum eLDDATATYPE
{
	LD_DATATYPE_STRING = 'S',	//��������Ϊstring C��׼���ַ���
	LD_DATATYPE_BIGDECIMAL = 'B',	//��������Ϊbigdecimal�����о��ȵ������ַ���
	LD_DATATYPE_CHAR = 'C',		//��������Ϊchar
	LD_DATATYPE_INT = 'I',		//��������Ϊint
	LD_DATATYPE_LONG = 'L',		//��������Ϊlong long
	LD_DATATYPE_DOUBLE = 'D',	//��������ΪDOUBLE
	LD_DATATYPE_BINARY = 'R',	//������������� 
};


struct ILDPacker_interface
{
public:
	///��λ�����¿�ʼ����һ����(�ֶ������¼����Ϊ0��0��)
	/**
	* ���ܣ���ʼ������Ѱ���������(�ظ�ʹ�����еĻ������ռ�)
	*@return ��
	*/
	virtual void LD_CALL_MODE BeginPack() = 0;
	/**������
	* ���ܣ��������ֶ�;BeginPack
	*
	*��ִ�д���Ҫ��:
	*
	*@param szFieldName���ֶ���
	*@param cFieldType ���ֶ�����:I������D��������C�ַ���S�ַ�����R�������������
	*@return ������ʾʧ�ܣ�����ΪĿǰ���ĳ���
	*/
	virtual int	LD_CALL_MODE AddField(const char* lpszField, eLDDATATYPE cFieldType) = 0;
	/**
	* ���ܣ��������ַ�������
	* ��ִ�д���Ҫ��:�����������ֶ�������֮��,����ֶΰ�˳�����;
	*@param       szValue���ַ�������
	*@return ������ʾʧ�ܣ�����ΪĿǰ���ĳ���
	*/
	virtual int LD_CALL_MODE AddStr(const char *szValue) = 0;
	/**
	* ���ܣ���������������
	*@param       iValue����������
	*@return ������ʾʧ�ܣ�����ΪĿǰ���ĳ���
	*/
	virtual int LD_CALL_MODE AddInt(int iValue) = 0;
	/**
	* ���ܣ���������������
	*@param       iValue��64λ��������
	*@return ������ʾʧ�ܣ�����ΪĿǰ���ĳ���
	*/
	virtual int LD_CALL_MODE AddInt64(UINT64 iValue) = 0;
	/**
	* ���ܣ������Ӹ�������
	*@param       fValue����������
	*@return ������ʾʧ�ܣ�����ΪĿǰ���ĳ���
	*/
	virtual int LD_CALL_MODE AddDouble(double fValue) = 0;
	/**
	* ���ܣ�������һ���ַ�
	*@param		 cValue���ַ�
	*@return ������ʾʧ�ܣ�����ΪĿǰ���ĳ���
	*/
	virtual int LD_CALL_MODE AddChar(char cValue) = 0;
	/**
	* ���ܣ�������һ���������ֶ�, ����ʽ�汾0x21������ʱ��Ч��
	*@param	void * lpBuff ������
	*@param	int iLen  ���ݳ���
	*@return ������ʾʧ�ܣ�����ΪĿǰ���ĳ���
	*/
	virtual int LD_CALL_MODE AddRaw(void * lpBuff, int iLen) = 0;
	/**
	* ���ܣ�����ָ���С��е��ֶ�ֵ
	*@param	iValue/dValue-��ֵ��column-ָ����(��0Ϊ����)��row-ָ����(��0Ϊ����)
	*@return 0��ʾʧ�ܣ�����Ϊԭ����ֵ
	*/
	virtual int	LD_CALL_MODE UpdateIntItem(int iValue, int column, int row) = 0;
	virtual UINT64 LD_CALL_MODE UpdateInt64Item(UINT64 iValue, int column, int row) = 0;
	virtual double LD_CALL_MODE UpdateDoubleItem(double dValue, int column, int row) = 0;
	/**
	* ���ܣ�����ָ���С��е��ֶ�ֵ
	*@param	cValue-��ֵ��column-ָ����(��0Ϊ����)��row-ָ����(��0Ϊ����)
	*@return ���ַ���ʾʧ�ܣ�����Ϊԭ����ֵ
	*/
	virtual char LD_CALL_MODE UpdateCharItem(char cValue, int column, int row) = 0;
	virtual const char* LD_CALL_MODE UpdateStrItem(const char* szValue, int column, int row) = 0;
	/**
	* ���ܣ��������
	*@return ������ʾʧ�ܣ�����ΪĿǰ���ĳ���
	*/
	virtual int LD_CALL_MODE EndPack() = 0;
	/**
	* ���ܣ�ȡ������ָ��
	*@return ������ָ��
	*/
	virtual void* LD_CALL_MODE GetPackBuf(void) = 0;
	/**
	* ���ܣ�ȡ����������
	*@return ����������
	*/
	virtual int LD_CALL_MODE GetPackLen(void) = 0;
	/**ֱ�ӷ��ص�ǰ�������Ľ���ӿ�,������EndPack()֮����ܵ���,�ڴ�����ͷ�ʱ��Ӧ�Ľ����ʵ��Ҳ�ͷ�
	*@return ������ӿڣ��˽���ӿڲ��ܵ��� destroy()���ͷ�
	*/
	virtual int	LD_CALL_MODE UnPack(void * lpBuffer, unsigned int iLen) = 0;
	/**ȡ������ݼ�¼����,
	*@return ��¼����
	*/
	virtual int LD_CALL_MODE GetRowCount() = 0;
	///ȡ�ֶ���
	/**@return �����ֶ���.
	*/
	virtual int LD_CALL_MODE GetColCount() = 0;
	///ȡ�ֶ���
	/** @param column:�ֶ����(��0Ϊ����)
	* @return �����ֶ���  �±�Խ�� ����NULL
	*/
	virtual const char* LD_CALL_MODE GetColName(int column) = 0;
	//ȡ�ֶ���������
	/** @param column:�ֶ����(��0Ϊ����)
	* @return:�����泣������;�±�Խ�� ����-1
	*/
	virtual char LD_CALL_MODE GetColType(int column) = 0;
	///ȡ�ֶ�����Ӧ���ֶ����
	/**@param columnName: �ֶ���
	*@return �����ֶ����. �����ڷ���-1
	*/
	virtual int LD_CALL_MODE FindColIndex(const char * columnName) = 0;
	//���ֶ����(��0Ϊ����)��ȡ�ֶ�ֵ(�ַ���)
	/**@param column:�ֶ����(��0Ϊ����)   nRow:��������0Ϊ������
	*@return �ַ������ֶ�ֵ,�±�Խ�硢���Ͳ�ƥ�䣬����NULL
	*/
	virtual const char* LD_CALL_MODE GetStrByIndex(int column, int nRow) = 0;
	//���ֶ����(��0Ϊ����)��ȡ�ֶ�ֵ
	/**@param column:�ֶ����(��0Ϊ����)   nRow:��������0Ϊ������
	*@return �ַ����ֶ�ֵ,�±�Խ�硢���Ͳ�ƥ�䣬����'\0'.
	*/
	virtual char LD_CALL_MODE GetCharByIndex(int column, int nRow) = 0;
	//���ֶ���ţ�ȡ�ֶ�ֵ
	/**@param column:�ֶ����(��0Ϊ����)   nRow:��������0Ϊ������
	*@return double���ֶ�ֵ,�±�Խ�硢���Ͳ�ƥ�䣬����-1
	*/
	virtual double LD_CALL_MODE GetDoubleByIndex(int column, int nRow) = 0;
	///���ֶ���ţ�ȡ�ֶ�ֵ
	/**@param column:�ֶ����(��0Ϊ����)   nRow:��������0Ϊ������
	*@return int���ֶ�ֵ,�±�Խ�硢���Ͳ�ƥ�䣬����-1
	*/
	virtual int LD_CALL_MODE GetIntByIndex(int column, int nRow) = 0;
	virtual UINT64 LD_CALL_MODE GetInt64ByIndex(int column, int nRow) = 0;
	///���ֶ���Ż���ֶ�ֵ,����������
	/**@param column: �ֶ����(��0Ϊ����)   nRow:��������0Ϊ������
	*@param   lpRawLen: [out]���ݳ���
	*@return : �����׵�ַ,�±�Խ�硢���Ͳ�ƥ�䣬����NULL
	*/
	virtual void* LD_CALL_MODE GetRawByIndex(int column, int nRow, int* lpRawLen) = 0;
	///���ֶ�������ֶ�ֵ(Ĭ�ϵ�һ��)�������ڵ���¼����
	/**@param szFieldName: �ֶ���
	*@return : �ַ������ֶ�ֵ,�±�Խ�硢���Ͳ�ƥ�䣬����NULL
	*/
	virtual const char* LD_CALL_MODE GetStrbyName(const char * szFieldName, int nRow = 0) = 0;
	virtual char		LD_CALL_MODE GetCharbyName(const char * szFieldName, int nRow = 0) = 0;
	virtual double      LD_CALL_MODE GetDoublebyName(const char * szFieldName, int nRow = 0) = 0;
	virtual int         LD_CALL_MODE GetIntbyName(const char * szFieldName, int nRow = 0) = 0;
	virtual UINT64      LD_CALL_MODE GetInt64byName(const char * szFieldName, int nRow = 0) = 0;

	virtual void LD_CALL_MODE PackerRelease() = 0;
};

#endif
#ifndef __LDPACKER_INTERFACE_H__
#define __LDPACKER_INTERFACE_H__

#include "module_interface.h"

typedef unsigned long long   UINT64;
//数据类型
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


struct ILDPacker_interface
{
public:
	///复位，重新开始打另一个包(字段数与记录数置为0行0例)
	/**
	* 功能：开始打包，把包长度清零(重复使用已有的缓存区空间)
	*@return 无
	*/
	virtual void LD_CALL_MODE BeginPack() = 0;
	/**加入项
	* 功能：向包添加字段;BeginPack
	*
	*有执行次序要求:
	*
	*@param szFieldName：字段名
	*@param cFieldType ：字段类型:I整数，D浮点数，C字符，S字符串，R任意二进制数据
	*@return 负数表示失败，否则为目前包的长度
	*/
	virtual int	LD_CALL_MODE AddField(const char* lpszField, eLDDATATYPE cFieldType) = 0;
	/**
	* 功能：向包添加字符串数据
	* 有执行次序要求:必须在所有字段增加完之后,逐个字段按顺序添加;
	*@param       szValue：字符串数据
	*@return 负数表示失败，否则为目前包的长度
	*/
	virtual int LD_CALL_MODE AddStr(const char *szValue) = 0;
	/**
	* 功能：向包添加整数数据
	*@param       iValue：整数数据
	*@return 负数表示失败，否则为目前包的长度
	*/
	virtual int LD_CALL_MODE AddInt(int iValue) = 0;
	/**
	* 功能：向包添加整数数据
	*@param       iValue：64位整数数据
	*@return 负数表示失败，否则为目前包的长度
	*/
	virtual int LD_CALL_MODE AddInt64(UINT64 iValue) = 0;
	/**
	* 功能：向包添加浮点数据
	*@param       fValue：浮点数据
	*@return 负数表示失败，否则为目前包的长度
	*/
	virtual int LD_CALL_MODE AddDouble(double fValue) = 0;
	/**
	* 功能：向包添加一个字符
	*@param		 cValue：字符
	*@return 负数表示失败，否则为目前包的长度
	*/
	virtual int LD_CALL_MODE AddChar(char cValue) = 0;
	/**
	* 功能：向包添加一个二进制字段, 包格式版本0x21及以上时有效；
	*@param	void * lpBuff 数据区
	*@param	int iLen  数据长度
	*@return 负数表示失败，否则为目前包的长度
	*/
	virtual int LD_CALL_MODE AddRaw(void * lpBuff, int iLen) = 0;
	/**
	* 功能：更新指定列、行的字段值
	*@param	iValue/dValue-新值；column-指定列(以0为基数)；row-指定行(以0为基数)
	*@return 0表示失败，否则为原来的值
	*/
	virtual int	LD_CALL_MODE UpdateIntItem(int iValue, int column, int row) = 0;
	virtual UINT64 LD_CALL_MODE UpdateInt64Item(UINT64 iValue, int column, int row) = 0;
	virtual double LD_CALL_MODE UpdateDoubleItem(double dValue, int column, int row) = 0;
	/**
	* 功能：更新指定列、行的字段值
	*@param	cValue-新值；column-指定列(以0为基数)；row-指定行(以0为基数)
	*@return 空字符表示失败，否则为原来的值
	*/
	virtual char LD_CALL_MODE UpdateCharItem(char cValue, int column, int row) = 0;
	virtual const char* LD_CALL_MODE UpdateStrItem(const char* szValue, int column, int row) = 0;
	/**
	* 功能：结束打包
	*@return 负数表示失败，否则为目前包的长度
	*/
	virtual int LD_CALL_MODE EndPack() = 0;
	/**
	* 功能：取打包结果指针
	*@return 打包结果指针
	*/
	virtual void* LD_CALL_MODE GetPackBuf(void) = 0;
	/**
	* 功能：取打包结果长度
	*@return 打包结果长度
	*/
	virtual int LD_CALL_MODE GetPackLen(void) = 0;
	/**直接返回当前打包结果的解包接口,必须在EndPack()之后才能调用,在打包器释放时相应的解包器实例也释放
	*@return 解包器接口，此解包接口不能调用 destroy()来释放
	*/
	virtual int	LD_CALL_MODE UnPack(void * lpBuffer, unsigned int iLen) = 0;
	/**取解包数据记录条数,
	*@return 记录条数
	*/
	virtual int LD_CALL_MODE GetRowCount() = 0;
	///取字段数
	/**@return 返回字段数.
	*/
	virtual int LD_CALL_MODE GetColCount() = 0;
	///取字段名
	/** @param column:字段序号(以0为基数)
	* @return 返回字段名  下标越界 返回NULL
	*/
	virtual const char* LD_CALL_MODE GetColName(int column) = 0;
	//取字段数据类型
	/** @param column:字段序号(以0为基数)
	* @return:见上面常量定义;下标越界 返回-1
	*/
	virtual char LD_CALL_MODE GetColType(int column) = 0;
	///取字段名对应的字段序号
	/**@param columnName: 字段名
	*@return 返回字段序号. 不存在返回-1
	*/
	virtual int LD_CALL_MODE FindColIndex(const char * columnName) = 0;
	//按字段序号(以0为基数)，取字段值(字符串)
	/**@param column:字段序号(以0为基数)   nRow:行数（以0为基数）
	*@return 字符串型字段值,下标越界、类型不匹配，返回NULL
	*/
	virtual const char* LD_CALL_MODE GetStrByIndex(int column, int nRow) = 0;
	//按字段序号(以0为基数)，取字段值
	/**@param column:字段序号(以0为基数)   nRow:行数（以0为基数）
	*@return 字符型字段值,下标越界、类型不匹配，返回'\0'.
	*/
	virtual char LD_CALL_MODE GetCharByIndex(int column, int nRow) = 0;
	//按字段序号，取字段值
	/**@param column:字段序号(以0为基数)   nRow:行数（以0为基数）
	*@return double型字段值,下标越界、类型不匹配，返回-1
	*/
	virtual double LD_CALL_MODE GetDoubleByIndex(int column, int nRow) = 0;
	///按字段序号，取字段值
	/**@param column:字段序号(以0为基数)   nRow:行数（以0为基数）
	*@return int型字段值,下标越界、类型不匹配，返回-1
	*/
	virtual int LD_CALL_MODE GetIntByIndex(int column, int nRow) = 0;
	virtual UINT64 LD_CALL_MODE GetInt64ByIndex(int column, int nRow) = 0;
	///按字段序号获得字段值,二进制数据
	/**@param column: 字段序号(以0为基数)   nRow:行数（以0为基数）
	*@param   lpRawLen: [out]数据长度
	*@return : 数据首地址,下标越界、类型不匹配，返回NULL
	*/
	virtual void* LD_CALL_MODE GetRawByIndex(int column, int nRow, int* lpRawLen) = 0;
	///按字段名获得字段值(默认第一行)（适用于单记录集）
	/**@param szFieldName: 字段名
	*@return : 字符串型字段值,下标越界、类型不匹配，返回NULL
	*/
	virtual const char* LD_CALL_MODE GetStrbyName(const char * szFieldName, int nRow = 0) = 0;
	virtual char		LD_CALL_MODE GetCharbyName(const char * szFieldName, int nRow = 0) = 0;
	virtual double      LD_CALL_MODE GetDoublebyName(const char * szFieldName, int nRow = 0) = 0;
	virtual int         LD_CALL_MODE GetIntbyName(const char * szFieldName, int nRow = 0) = 0;
	virtual UINT64      LD_CALL_MODE GetInt64byName(const char * szFieldName, int nRow = 0) = 0;

	virtual void LD_CALL_MODE PackerRelease() = 0;
};

#endif
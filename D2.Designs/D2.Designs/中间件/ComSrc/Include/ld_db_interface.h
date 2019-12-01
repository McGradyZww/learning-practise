#ifndef __LD_DB_INTERFACE_H__
#define __LD_DB_INTERFACE_H__

#include "module_interface.h"
#include "fastmsg_interface.h"
const int LDDB_CONNECTION_STATUS_DISCONN 	= 0;		//	未连接
const int LDDB_CONNECTION_STATUS_FREE 	 	= 1;		//	已连接，空闲
const int LDDB_CONNECTION_STATUS_BUSY 		= 2;		//	已连接，忙碌
const int LDDB_CONNECTION_STATUS_BUSY_AND_DISCONN = 3;	//	忙碌，且被断开

//	数据库连接接口
struct IDB_Connection : public IUnKnown
{
	///	归还占用的连接
	/**	归还后的连接会被其他调用者复用，归还时会释放此连接上的语句句柄；
	*@return :返回NULL指针
	*/
	virtual void  LD_CALL_MODE Free() = 0;
	///	获得错误号
	/*@return 错误号:
	*/
	virtual int LD_CALL_MODE GetErrNo() = 0;
	///	获得错误信息
	/*@return 错误信息.
	*/
	virtual char * LD_CALL_MODE GetErrInfo() = 0;

	///	执行存储过程
	/*
	*@lpStoreProcedureName	存储过程名
	*@iParas		该存储过程需要的总参数个数
	*@IFastMessage	入参
	*@lpOutMsg		返回结果 0: 成功   其他：失败
	*/  
	virtual int LD_CALL_MODE Exec(const char* lpStoreProcedureName, int iParas, const IFastMessage* lpInMsg, IFastMessage* lpOutMsg) = 0;
};


//	数据库服务主接口,其实质是一个数据库连接池
struct ILDDB_interface : public Imodule_interface
{
	virtual IDB_Connection* LD_CALL_MODE GetConnect()=0;
	virtual void  LD_CALL_MODE FreeConnect(IDB_Connection* )=0;
};


#endif

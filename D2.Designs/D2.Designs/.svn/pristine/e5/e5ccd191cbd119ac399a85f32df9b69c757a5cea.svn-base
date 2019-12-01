#ifndef __BIZCOM_INTERFACE_H__
#define __BIZCOM_INTERFACE_H__

#include "fastmsg_interface.h"
#include "container_interface.h"
#include <Include/ld_db_interface.h>
#include <string>
/*
struct IReqContext : public IUnKnown
{
	virtual Icontainer_interface* LD_CALL_MODE GetContainer()=0;
	virtual IFastMessage*		  LD_CALL_MODE GetRouteMsg()=0;
};*/
//	业务处理函数
//	可以从 lpContext 获得路由层消息、容器（再从容器获得自己关心的模块）
typedef int  (LD_CALL_MODE *fnDeal)(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);

typedef struct tagBizFuncInfo
{
	char szFuncName[13];
	fnDeal	lpFunc;
}BIZ_FUNC_INFO, *LPBIZ_FUNC_INFO;


///功能组件dll加载初始化
typedef void  (LD_CALL_MODE *fnOnload)(char *, Icontainer_interface* lpContainer);

///功能组件dll释放
typedef void  (LD_CALL_MODE *fnOnunload)();

///服务器启动
typedef void  (LD_CALL_MODE *fnOnstart)();

///服务器停止事件响应函数
typedef void  (LD_CALL_MODE *fnOnstop)();

///功能组件接口查询
typedef int  (LD_CALL_MODE * fpQueryInterface)(int ,LPBIZ_FUNC_INFO  );

///功能组件版本查询接口
typedef const char *  (LD_CALL_MODE * fnGetLibVersion)();

#endif

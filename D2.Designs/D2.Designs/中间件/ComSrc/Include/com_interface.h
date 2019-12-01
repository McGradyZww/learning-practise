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
//	ҵ������
//	���Դ� lpContext ���·�ɲ���Ϣ���������ٴ���������Լ����ĵ�ģ�飩
typedef int  (LD_CALL_MODE *fnDeal)(const char* lpFuncID, IFastMessage* lpInBizMsg, IFastMessage* lpOutBizMsg, IDB_Connection* lpDBConnect);

typedef struct tagBizFuncInfo
{
	char szFuncName[13];
	fnDeal	lpFunc;
}BIZ_FUNC_INFO, *LPBIZ_FUNC_INFO;


///�������dll���س�ʼ��
typedef void  (LD_CALL_MODE *fnOnload)(char *, Icontainer_interface* lpContainer);

///�������dll�ͷ�
typedef void  (LD_CALL_MODE *fnOnunload)();

///����������
typedef void  (LD_CALL_MODE *fnOnstart)();

///������ֹͣ�¼���Ӧ����
typedef void  (LD_CALL_MODE *fnOnstop)();

///��������ӿڲ�ѯ
typedef int  (LD_CALL_MODE * fpQueryInterface)(int ,LPBIZ_FUNC_INFO  );

///��������汾��ѯ�ӿ�
typedef const char *  (LD_CALL_MODE * fnGetLibVersion)();

#endif

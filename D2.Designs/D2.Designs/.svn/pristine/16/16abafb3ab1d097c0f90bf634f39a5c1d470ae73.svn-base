/**
	除去 容器和配置继承自IUnKnown（os可以认为不是一个模块，仅仅是个动态库而已）
	
	所有其他的插件均继承于Imodule_interface！
	特别的，对于可对外提供服务，对于消息进行处理的插件，则继承自Iservice_interface
**/
#ifndef __MODULE_INTERFACE_H__
#define __MODULE_INTERFACE_H__

#include <OS_Independen/config_env.h>
#include <OS_Independen/basetypes.h>

#define MODULE_SID  const char *
#define I_OK	1
#define I_NONE 	0

//	前面三接口参照COM接口，为实现最大限度地组件化兼容！！	虚拟析构函数为便于摧毁派生类
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

//	所有插件的公共接口
struct IRCfgNode;
struct IFastMessage;
struct Imodule_interface : public IUnKnown
{
	//	返回I_OK：成功 I_NONE:失败
	virtual int  LD_CALL_MODE OnInit(void)=0;
	//	返回I_OK：成功 I_NONE:失败
	virtual void LD_CALL_MODE OnExit(void)=0;
	//	返回I_OK：成功 I_NONE:失败
	virtual int  LD_CALL_MODE OnStart(void)=0;
	//	返回I_OK：成功 I_NONE:失败
	virtual void LD_CALL_MODE OnStop(void)=0;
	virtual int  LD_CALL_MODE SetConfig(const char * lpPath, IRCfgNode * lpConfig)=0;
	virtual int  LD_CALL_MODE SetDependService(MODULE_SID iid, IUnKnown * lpService)=0;
	//	返回本插件依赖的其他插件的接口ID。所有ID串在一起，以一个空串""结束，示例如下：
	//  返回： "aaa\0bbb\0ccc\0\0"，表示依赖名为：aaa  bbb  ccc的三个插件
	virtual MODULE_SID  LD_CALL_MODE GetDependService()=0;
	virtual MODULE_SID  LD_CALL_MODE GetSID()=0;
	//	 获得启动和停止时的依赖关系	在启动或者停止本服务前，必须先启动或停止前置服务
	virtual MODULE_SID  LD_CALL_MODE GetPreStartService()=0;
	virtual MODULE_SID  LD_CALL_MODE GetPreStopService()=0;
	virtual void  LD_CALL_MODE OnManager(int iFunc, IFastMessage* lpInReq, IFastMessage* lpOutAns)=0;
};

//	所有模块统一的引出函数形式
typedef IUnKnown * (LD_CALL_MODE * GetObjInstance)( );


#endif

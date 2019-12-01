/**
	LD所有当前已开发或将开发模块的名称列表
**/

#ifndef __LD_MODULES_ID_H__
#define __LD_MODULES_ID_H__

//	特殊模块	继承自 IUnKnown
#define MODULE_CFG				"config"				//	配置处理
#define MODULE_CONTAINER		"container"				//	容器

//	基础模块	继承自 Imodule_interface(这些基础模块各自提供自己特有的接口供其他模块调用)
#define MODULE_LOG				"log"					//	基础日志
#define MODULE_FASTMSG			"fastmsg"				//	消息
#define MODULE_COMM				"comm"					//	通信
#define MODULE_TIMER			"timer"					//	定时
#define MODULE_SECURITY			"security"				//	安全	暂不实现
#define MODULE_T2SDKSERVICE		"t2sdkService"			//  t2sdk服务
#define MODULE_PACKER			"packer"				//  ld打包器、解包器
#define MODULE_LDDB				"lddbsvr"				//  


//	服务型模块	继承自 Iservice_interface	服务型模块的接口是一致的
#define MODULE_DISPATCHER		"dispatcher"			//	路由分发
#define MODULE_PROCESSOR		"processor"				//	业务处理
#define MODULE_OSPFSVR			"ospfsvr"				//	拓扑维护
#define MODULE_OSPFROUTE		"ospfroute"				//	拓扑维护
#define MODULE_MANAGER			"manager"				//	管理	暂不实现
#define MODULE_ACCESS_CHANNEL	"accsee_channel"		//	外部接入通道
#define MODULE_JAVA_CHANNEL		"java_channel"			//	MQ通道
#define MODULE_MQ_CHANNEL		"mq_channel"			//	MQ通道
#define MODULE_HS_CHANNEL		"hs_channel"			//	HS通道
#define MODULE_LD_CHANNEL		"ld_channel"			//	内部通讯通道
#define MODULE_FILTER			"ldfilter"				//  过滤拦截模块
#define MODULE_PUSHSVR			"ldpushsvr"				//  主推服务模块
#define MODULE_PUBSUBSVR		"ldpubsubsvr"			//  发布订阅服务模块
#define MODULE_PUBSUBINT		"ldpubsubint"			//  发布订阅服务模块中提供发布/订阅功能的接口


//	组件内部的接口名(有些组件会拥有多个接口)
#define INTERFACE_CHANNEL		"int_channel"
#define MAIN_INTERFACE			"int_main"
#define TIME_DEAL_INTERFACE		"int_time_dealer"
#define TS_SUBCALL_INTERFACE	"ts_subcall"

#endif	//	__LD_MODULES_ID_H__

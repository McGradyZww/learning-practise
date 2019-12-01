#ifndef __OSPF_INTERFACE_H__
#define __OSPF_INTERFACE_H__

#include "module_interface.h"
#define ENM_NF_DOWN		1	//	下级
#define ENM_NF_UP		2	//	上级
#define ERR_NONE		0
#define MAX_PATH_NUM	20
#define ENM_NF_UNKNOWN	0
#define ENM_CF_CONNECT	2		//	建
#define ENM_CF_DISCONNECT	1	//	断
typedef struct tagDestNode
{
	char	szNodeName[32 + 1];		// 节点名
	uint8	byFlag;					// Server/Client的标志。1：Client 2：Server
}DEST_NODE;

struct IOspf_Interface : public IUnKnown
{
	/// 获取下一跳路径,  DestArray 第一个存放的地址为负载均衡最佳地址, 之后存放所有等价路径
	/** 参数:	@char*			lpTargetName	目标地址
	 *			@DEST_NODE[20]	DestArray		路由计算后的下跳地址，最多20个
	 *			@uint16			*wPath			指下跳等价的所有地址个数
	 *	返回:	
	 */
	virtual void GetRoute(const char *lpTargetName, DEST_NODE DestArray[MAX_PATH_NUM], uint16 &wPath) = 0;
};

#endif

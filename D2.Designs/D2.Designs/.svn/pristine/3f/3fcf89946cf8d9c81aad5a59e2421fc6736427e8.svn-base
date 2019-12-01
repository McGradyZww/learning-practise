/**
	这里其实是处理通信回调
**/

#ifndef __COMM_CALLBACK_INTERFACE_H__
#define __COMM_CALLBACK_INTERFACE_H__

#include "module_interface.h"


#define RETURN_PACKET_ERROR		-1
#define RETURN_PACKET_DEALED	0
#define RETURN_PACKET_UNKNOWN	1
#define RETURN_PACKET_DETERMIN	2
struct ICallBack_interface : public IUnKnown
{
	/**
	**/
	//	回调必须严格按照如下返回值的含义返回：
	//	-1:		提示通信层，上层发生严重错误，需要关闭连接
	//	==0:	提示通信层，这是一个完整报文，上层已经成功处理，通信层可以丢弃该数据，且报文完整长度由lpFullLen给出
	//	1:		提示通信层, 目前的数据，还不是一个完整报文， 但是上层已经知道完整报文长度(由lpFullLen给出完整长度)
	//	2:		提示通信层, 目前的数据，还不是一个完整报文， 上层还无法判断长度
	virtual int LD_CALL_MODE onRecv(int iChannelID, uint32 dwConnectID, char* lpRecvData, int iRecvLen, int* lpFullLen) = 0;
	
	//	以下三个回调，一般来说，调用者无需关心，可以简单的空实现，返回0
	virtual int LD_CALL_MODE onDisconnected(int iChannelID, uint32 dwConnectID) = 0;
	virtual int LD_CALL_MODE onConnected(int iChannelID, uint32 dwConnectID) = 0;
	virtual int LD_CALL_MODE onSent(int iChannelID, uint32 dwConnectID, int iSentLen) = 0;
	
	virtual void LD_CALL_MODE NeedHeartbeat(int iChannelID, uint32 dwConnectID) = 0;
};

#endif

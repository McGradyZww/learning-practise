/**
	��������ʵ��
	//	������Լ����
		��������������ʱ�䣬�����Ӷ�ͨ��Э����ñ˴˵�����
**/

#ifndef __LD_COMM_INTERFACE__
#define __LD_COMM_INTERFACE__
#include <OS_Independen/basetypes.h>
#include "callback_interface.h"

//	ͨ�Žӿ�
//	���ͺͽ��յ�һ�����ĳ��Ȳ��ܳ���16M����
struct IComm_interface : public Imodule_interface
{
	/**
		�������������̲߳���ȫ�������е�ͨ������������֮ǰȫ������!
	**/
	//	����ͨ��ID�������߱����ס�Լ���ͨ��ID���ں�����������ʱ�õ�
	//	���أ� <0   ����ͨ��ʧ��  >=0:�����ͨ���ţ������߱����ס��ͨ����
	virtual int LD_CALL_MODE AddTcpPassiveChannel(char* lpLocalAddr, uint16 wPort, int iHBTime, int iMaxAllowedConnections, ICallBack_interface* lpChannel) = 0;
	virtual int LD_CALL_MODE AddTcpActiveChannel(char* lpPeerAddr, uint16 wPort, BOOL bReConnect, ICallBack_interface* lpChannel) = 0;
	virtual int LD_CALL_MODE AddUdpChannel(char* lpLocalAddr, uint16 wPort, ICallBack_interface* lpChannel) = 0;

	virtual int LD_CALL_MODE SetHBTime(int iChannelID, int iHBTime) = 0;
	/**
		����2���ͺ����е� iChannelID �����ڼ���ͨ��ʱ�ķ���ֵ
		��dwConnectID�������������ӽ���ʱ�Ļص�������ActiveChannel���͵�ͨ����dwConnectID����ȡ����ֵ
	**/
	//	����ͨ��ģ������ݷ��͹��ܣ����ݽ����ڻص���
	//	iDataLen ����ܳ���16M�����򣬵��ûᱨ��
	//	����ֵ���Ѿ��ɹ����͵��ֽ����� >=0  ������ <0: ����ʧ��
	virtual int LD_CALL_MODE SendData(int iChannelID, uint32 dwConnectID, char* lpData, int iDataLen) = 0;
	//	����udpͨ����Ч��δʵ�֣�
	virtual int LD_CALL_MODE SendUdpData(int iChannelID, char* lpData, int iDataLen, sockaddr_in* lpTo) = 0;
	//	һЩͳ�ƹ���
	
};



#endif

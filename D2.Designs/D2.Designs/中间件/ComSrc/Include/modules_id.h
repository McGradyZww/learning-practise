/**
	LD���е�ǰ�ѿ����򽫿���ģ��������б�
**/

#ifndef __LD_MODULES_ID_H__
#define __LD_MODULES_ID_H__

//	����ģ��	�̳��� IUnKnown
#define MODULE_CFG				"config"				//	���ô���
#define MODULE_CONTAINER		"container"				//	����

//	����ģ��	�̳��� Imodule_interface(��Щ����ģ������ṩ�Լ����еĽӿڹ�����ģ�����)
#define MODULE_LOG				"log"					//	������־
#define MODULE_FASTMSG			"fastmsg"				//	��Ϣ
#define MODULE_COMM				"comm"					//	ͨ��
#define MODULE_TIMER			"timer"					//	��ʱ
#define MODULE_SECURITY			"security"				//	��ȫ	�ݲ�ʵ��
#define MODULE_T2SDKSERVICE		"t2sdkService"			//  t2sdk����
#define MODULE_PACKER			"packer"				//  ld������������
#define MODULE_LDDB				"lddbsvr"				//  


//	������ģ��	�̳��� Iservice_interface	������ģ��Ľӿ���һ�µ�
#define MODULE_DISPATCHER		"dispatcher"			//	·�ɷַ�
#define MODULE_PROCESSOR		"processor"				//	ҵ����
#define MODULE_OSPFSVR			"ospfsvr"				//	����ά��
#define MODULE_OSPFROUTE		"ospfroute"				//	����ά��
#define MODULE_MANAGER			"manager"				//	����	�ݲ�ʵ��
#define MODULE_ACCESS_CHANNEL	"accsee_channel"		//	�ⲿ����ͨ��
#define MODULE_JAVA_CHANNEL		"java_channel"			//	MQͨ��
#define MODULE_MQ_CHANNEL		"mq_channel"			//	MQͨ��
#define MODULE_HS_CHANNEL		"hs_channel"			//	HSͨ��
#define MODULE_LD_CHANNEL		"ld_channel"			//	�ڲ�ͨѶͨ��
#define MODULE_FILTER			"ldfilter"				//  ��������ģ��
#define MODULE_PUSHSVR			"ldpushsvr"				//  ���Ʒ���ģ��
#define MODULE_PUBSUBSVR		"ldpubsubsvr"			//  �������ķ���ģ��
#define MODULE_PUBSUBINT		"ldpubsubint"			//  �������ķ���ģ�����ṩ����/���Ĺ��ܵĽӿ�


//	����ڲ��Ľӿ���(��Щ�����ӵ�ж���ӿ�)
#define INTERFACE_CHANNEL		"int_channel"
#define MAIN_INTERFACE			"int_main"
#define TIME_DEAL_INTERFACE		"int_time_dealer"
#define TS_SUBCALL_INTERFACE	"ts_subcall"

#endif	//	__LD_MODULES_ID_H__

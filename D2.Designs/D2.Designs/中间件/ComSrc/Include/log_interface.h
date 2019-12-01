/**
	����
**/
#ifndef __LD_LOG_INTERFACE__
#define __LD_LOG_INTERFACE__

#include "module_interface.h"



//	��־���¼��ȼ�   ��Ҫ��¼���¼��ȼ�>=LogLevel�Ż��¼�����򲻼�¼
enum LogLevelType
{
	LEVEL_DEBUG=0,
	LEVEL_INFO,
	LEVEL_WARNING,
	LEVEL_ERROR,
	LEVEL_FAULT,
	LEVEL_SYS
};

struct ILog_interface : public IUnKnown
{
	//	����I_OK���ɹ� I_NONE:ʧ��
	virtual int  LD_CALL_MODE SetDependService(MODULE_SID iid, IUnKnown * lpService) = 0;
	virtual int  LD_CALL_MODE SetConfig(const char * lpPath, IRCfgNode * lpConfig) = 0;
	virtual int  LD_CALL_MODE OnInit(void) = 0;
	/*
	iLogID-��־ID���������ld_log.xml��
	��������������iLogID��Ӧformat
	return��-1 ��iLogIDû�ж�Ӧ����־ģ��
			0 �¼�����ͣ������ӡ
			1 ��logID�Ĵ�������Ѿ����ڵ�λʱ���ڵĲ�����������������ӡ
			>0 ��ӡ����־����
	*/
	virtual int LD_CALL_MODE Write(int iLogID, ...) = 0;
};

#endif

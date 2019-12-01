/**
	单例
**/
#ifndef __LD_LOG_INTERFACE__
#define __LD_LOG_INTERFACE__

#include "module_interface.h"



//	日志的事件等级   需要记录的事件等级>=LogLevel才会记录，否则不记录
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
	//	返回I_OK：成功 I_NONE:失败
	virtual int  LD_CALL_MODE SetDependService(MODULE_SID iid, IUnKnown * lpService) = 0;
	virtual int  LD_CALL_MODE SetConfig(const char * lpPath, IRCfgNode * lpConfig) = 0;
	virtual int  LD_CALL_MODE OnInit(void) = 0;
	/*
	iLogID-日志ID，必须存在ld_log.xml中
	参数不定，根据iLogID对应format
	return：-1 该iLogID没有对应的日志模板
			0 事件级别低，无需打印
			1 该logID的错误次数已经大于单位时间内的产生的最大次数，不打印
			>0 打印的日志长度
	*/
	virtual int LD_CALL_MODE Write(int iLogID, ...) = 0;
};

#endif


#ifndef __TIMER_INTERFACE_H__
#define __TIMER_INTERFACE_H__

#include "module_interface.h"

//	注册进定时事件中的回调接口
struct ITimeEvent_interface : public IUnKnown
{
	virtual int LD_CALL_MODE onTimeEvent(int iEventID) = 0;
};
struct ITime_interface : public Imodule_interface
{
	/** 注册固定间隔循环触发事件	每隔 iTimes ms，即调用 lpTimerEvent 接口的 onTimeEvent 事件，
	*@param int iTimes  							间隔时间，单位：ms
	*@param ITimeEvent_interface* lpTimerEvent 		间隔时间到达时，调用的回调指针
	*@return >0 成功，注册的事件ID，在后续的事件回调中，会以该ID作为调用参数，调用者也可以以该ID来注销定时事件
	*	其他：失败
	*/
	virtual int LD_CALL_MODE RegisterTimeIntervalEvent(int iTimes, ITimeEvent_interface* lpTimerEvent) = 0;
	/** 注册固定时间的触发事件(一天触发一次)，
	*@param int iTimes  							固定时间，格式：HHMMSS
	*@param ITimeEvent_interface* lpTimerEvent 		固定时间到达时，调用的回调指针
	*@return >0 成功，注册的事件ID，在后续的事件回调中，会以该ID作为调用参数，调用者也可以以该ID来注销定时事件
	*	其他：失败
	*/
	virtual int LD_CALL_MODE RegisterFixedTimeEvent(int iTime, ITimeEvent_interface* lpTimerEvent) = 0;
	/** 注销已注册的事件
	*@param int iEventID  	注册时返回的ID
	*@return 0 成功，	其他：失败
	*/
	virtual int LD_CALL_MODE UnRegisterEvent(int iEventID) = 0;


	/** 注册固定间隔循环触发事件	每隔 iTimes ms，即调用 lpTimerEvent 接口的 onTimeEvent 事件，
	*@param int iTimes  							间隔时间，单位：ms
	*@param ITimeEvent_interface* lpTimerEvent 		间隔时间到达时，调用的回调指针
	*@return >0 成功，注册的事件ID，在后续的事件回调中，会以该ID作为调用参数，调用者也可以以该ID来注销定时事件
	*	其他：失败
	*	只允许中间件内部关键模块使用，其他模块绝对不允许使用!!!!!
	*/
	virtual int LD_CALL_MODE RegisterInternalEvent(int iTimes, ITimeEvent_interface* lpTimerEvent) = 0;
};

#endif

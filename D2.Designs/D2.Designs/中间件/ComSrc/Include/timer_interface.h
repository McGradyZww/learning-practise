
#ifndef __TIMER_INTERFACE_H__
#define __TIMER_INTERFACE_H__

#include "module_interface.h"

//	ע�����ʱ�¼��еĻص��ӿ�
struct ITimeEvent_interface : public IUnKnown
{
	virtual int LD_CALL_MODE onTimeEvent(int iEventID) = 0;
};
struct ITime_interface : public Imodule_interface
{
	/** ע��̶����ѭ�������¼�	ÿ�� iTimes ms�������� lpTimerEvent �ӿڵ� onTimeEvent �¼���
	*@param int iTimes  							���ʱ�䣬��λ��ms
	*@param ITimeEvent_interface* lpTimerEvent 		���ʱ�䵽��ʱ�����õĻص�ָ��
	*@return >0 �ɹ���ע����¼�ID���ں������¼��ص��У����Ը�ID��Ϊ���ò�����������Ҳ�����Ը�ID��ע����ʱ�¼�
	*	������ʧ��
	*/
	virtual int LD_CALL_MODE RegisterTimeIntervalEvent(int iTimes, ITimeEvent_interface* lpTimerEvent) = 0;
	/** ע��̶�ʱ��Ĵ����¼�(һ�촥��һ��)��
	*@param int iTimes  							�̶�ʱ�䣬��ʽ��HHMMSS
	*@param ITimeEvent_interface* lpTimerEvent 		�̶�ʱ�䵽��ʱ�����õĻص�ָ��
	*@return >0 �ɹ���ע����¼�ID���ں������¼��ص��У����Ը�ID��Ϊ���ò�����������Ҳ�����Ը�ID��ע����ʱ�¼�
	*	������ʧ��
	*/
	virtual int LD_CALL_MODE RegisterFixedTimeEvent(int iTime, ITimeEvent_interface* lpTimerEvent) = 0;
	/** ע����ע����¼�
	*@param int iEventID  	ע��ʱ���ص�ID
	*@return 0 �ɹ���	������ʧ��
	*/
	virtual int LD_CALL_MODE UnRegisterEvent(int iEventID) = 0;


	/** ע��̶����ѭ�������¼�	ÿ�� iTimes ms�������� lpTimerEvent �ӿڵ� onTimeEvent �¼���
	*@param int iTimes  							���ʱ�䣬��λ��ms
	*@param ITimeEvent_interface* lpTimerEvent 		���ʱ�䵽��ʱ�����õĻص�ָ��
	*@return >0 �ɹ���ע����¼�ID���ں������¼��ص��У����Ը�ID��Ϊ���ò�����������Ҳ�����Ը�ID��ע����ʱ�¼�
	*	������ʧ��
	*	ֻ�����м���ڲ��ؼ�ģ��ʹ�ã�����ģ����Բ�����ʹ��!!!!!
	*/
	virtual int LD_CALL_MODE RegisterInternalEvent(int iTimes, ITimeEvent_interface* lpTimerEvent) = 0;
};

#endif

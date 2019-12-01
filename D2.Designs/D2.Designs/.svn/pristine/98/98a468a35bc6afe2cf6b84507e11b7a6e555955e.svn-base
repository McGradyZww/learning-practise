/**

**/

#ifndef __TS_SUBPUB_INTERFACE_H__
#define __TS_SUBPUB_INTERFACE_H__

#include "module_interface.h"

struct IPubSub_interface : public IUnKnown
{
	virtual int LD_CALL_MODE SubTopics(void* lpSvr, const char* lpTopicName, IFastMessage* lpSubMsg) = 0;
	//	退订所有已经订阅的项目
	virtual int LD_CALL_MODE UnSubAllTopics() = 0;
	//	退订特定主题
	virtual int LD_CALL_MODE UnSubOneTopic(const char* lpTopicName) = 0;
	//	发布消息
	virtual int LD_CALL_MODE PubTopics(const char* lpTopicName, IFastMessage* lpOrgFastMsg) = 0;
};

#endif

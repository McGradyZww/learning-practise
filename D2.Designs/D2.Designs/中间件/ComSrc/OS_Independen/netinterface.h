/**
网络接口：可以获取IP地址信息和MAC信息
**/
#if !defined(AFX_NETINTERFACE_H__222C2493_7EBB_440C_9DBA_0E77042930D7__INCLUDED_)
#define AFX_NETINTERFACE_H__222C2493_7EBB_440C_9DBA_0E77042930D7__INCLUDED_

#include <OS_Independen/config_env.h>
#include <OS_Independen/basetypes.h>

#ifdef WIN32
	#if _MSC_VER > 1000
	#pragma once
	#endif // _MSC_VER > 1000

	#include <IPHlpApi.h>
#else
	#include <netinet/in.h>
	#include <net/if.h>

	#if defined(__linux__)	//	LINUX
		#include <linux/sockios.h>
	#endif
#endif

BEGIN_LD_MIDDLEWARE_NAMESPACE

typedef struct tagIPAddress
{
	char	szIP[32];
	uint32	dwMask;
	tagIPAddress()
	{
		memset(this, 0, sizeof(tagIPAddress));
	}
}IP_ADDRESS, *LPIP_ADDRESS;

typedef struct tagMacAddress
{
	uint8	szNet[4];
	uint8	szNode[6];
	tagMacAddress()
	{
		memset(this, 0, sizeof(tagMacAddress));
	}
}MAC_ADDRESS, *LPMAC_ADDRESS;

class API_EXPORT CNetInterface
{
public:
	CNetInterface();
	virtual ~CNetInterface();
	
	bool GetIpAddress (LPIP_ADDRESS  lpAddress, int &iIPs);//取IP地址
	bool GetMacAddress(LPMAC_ADDRESS lpAddress, int &iMacss);//取MAC地址
};

END_LD_MIDDLEWARE_NAMESPACE

#endif
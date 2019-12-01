/*

*/
#ifndef __LD_STRING_H__
#define __LD_STRING_H__

#include <OS_Independen/config_env.h>
#include <OS_Independen/basetypes.h>

size_t myStrLen(const char *pStr);
void GetMaxRowIDFun(const char *v_row_id_str_str,int *pRowCount, int64 *pMaxRowId);
class LDStringResult
{
public:
	LDStringResult(const char* lpResultStr, char cDelma);
	~LDStringResult();
	int 	GetCounts();
	int64 	GetIntByIndex(int iIndex);
	double 	GetDoubleByIndex(int iIndex);
	char*	GetStrByIndex(int iIndex);

	BOOL CmpIntByIndex(int iIndex, int64 ddwCmpValue);
	BOOL CmpDoubleByIndex(int iIndex, double dfCmpValue);
	BOOL CmpStrByIndex(int iIndex, const char* lpCmpValue);
	
private:
	LDStringResult();
	char* m_lpBuffer;
	int   m_iCounts;
	int*  m_lpiPos;
};

#endif

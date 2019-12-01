#include "ldstring.h"

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#ifdef _WIN32
#pragma warning(disable: 4996)
#endif
const double dfMindfValue = 0.000000001;

size_t myStrLen(const char *pStr)
{

	if ('\0' != *pStr)
	{
		return 1 + myStrLen(++pStr);
	}
	else
	{
		return 0;
	}
}

void GetMaxRowIDFun(const char *v_row_id_str_str,int *pRowCount, int64 *pMaxRowId)
{
	char v_max_row_id_str[10];
	strcpy(v_max_row_id_str, " ");
	int iRowCount = 0;
	for (int i = myStrLen(v_row_id_str_str) - 1; i >= 0; i--)
	{
		if (v_row_id_str_str[i] == ',')
		{
			if (iRowCount == 0)
			{
				strcpy(v_max_row_id_str, v_row_id_str_str + i + 1);
			}
			iRowCount++;
		}
	}
	*pRowCount = iRowCount;
	*pMaxRowId = atol(v_max_row_id_str);
}

LDStringResult::LDStringResult(const char* lpResultStr, char cDelma)
{
	m_iCounts = 0;
	m_lpBuffer=NULL;
	m_lpiPos=NULL;

	//	进行报文合法性校验
	int iStrLen = strlen(lpResultStr);
	if (lpResultStr[iStrLen - 1] != cDelma)		//	末尾必须以分隔符结束
		return;

	//	一次扫描获得记录数，并进行合法性校验
	int iCount = 0;
	int i = 0;
	int iPrevPos = -1;
	for (i = 0; i < iStrLen; i++)
	{
		if (lpResultStr[i] == cDelma)
		{
			if (i == iPrevPos+1)				//	分隔符之间必须存在其他字符
				return;
			iPrevPos = i;
			iCount++;
		}
	}
	if (iCount == 0)	//	没有合法数据项
		return;

	m_lpBuffer = (char*)malloc(iStrLen+1);
	m_lpiPos = (int*)malloc(sizeof(int)*iCount);
	if (!m_lpBuffer || !m_lpiPos )
	{
		free(m_lpBuffer);
		free(m_lpiPos);
		m_lpBuffer=NULL;
		m_lpiPos=NULL;
		return;
	}
	strcpy(m_lpBuffer, lpResultStr);
	m_lpiPos[0] = 0;
	for (i = 0; i < iStrLen; i++)
	{
		if (m_lpBuffer[i] == cDelma)
		{
			m_lpBuffer[i] = '\0';
			m_iCounts++;
			if (m_iCounts < iCount)
			{
				m_lpiPos[m_iCounts] = i + 1;
			}
			i++;
		}
	}
}
int LDStringResult::GetCounts()
{
	return m_iCounts;
}
int64 LDStringResult::GetIntByIndex(int iIndex)
{
	if(iIndex>=m_iCounts)
		return 0;
	return atoll(m_lpBuffer + m_lpiPos[iIndex]);
}
double LDStringResult::GetDoubleByIndex(int iIndex)
{
	if(iIndex>=m_iCounts)
		return 0.0;
	return atof(m_lpBuffer + m_lpiPos[iIndex]);
}
char* LDStringResult::GetStrByIndex(int iIndex)
{
	if(iIndex>=m_iCounts)
		return "";
	return m_lpBuffer + m_lpiPos[iIndex];
}

BOOL LDStringResult::CmpIntByIndex(int iIndex, int64 ddwCmpValue)
{
	if(iIndex>=m_iCounts)
		return FALSE;
	return atoll(m_lpBuffer + m_lpiPos[iIndex]) == ddwCmpValue;
}
BOOL LDStringResult::CmpDoubleByIndex(int iIndex, double dfCmpValue)
{
	if(iIndex>=m_iCounts)
		return FALSE;
	BOOL iRet = FALSE;
	double dfValue = atof(m_lpBuffer + m_lpiPos[iIndex]);
	if ((dfValue<dfCmpValue + dfMindfValue) && (dfValue>dfCmpValue - dfMindfValue))
		iRet = TRUE;
	return iRet;
}
BOOL LDStringResult::CmpStrByIndex(int iIndex, const char* lpCmpValue)
{
	if(iIndex>=m_iCounts)
		return FALSE;
	return strcmp(m_lpBuffer + m_lpiPos[iIndex], lpCmpValue) == 0;
}

LDStringResult::~LDStringResult()
{
	free(m_lpBuffer);
	free(m_lpiPos);
}
/*

*/

#include "lddate.h"
const int PrimeMonth[13] = { 0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };		//	����
const int NotPrimeMonth[13] = { 0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };	//	������
const int DaysInPrimeYear = 366;
const int DaysInNonPrimeYear = 365;

/************************************************************************/
/*    �ж����꺯��(4��һ��,100�겻��,400������)                         */
/************************************************************************/
int isPrime(int year)
{
	if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0))
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

/* �ж�ĳ�����ڴ����(y��1��1��)������(y��m��d��)������ */
int Days(int y, int m, int d)
{
	const int *lpDays = NotPrimeMonth;
	int sum = 0;  /* �������� */
	if (isPrime(y))
		lpDays = PrimeMonth;
	for (int i = 0; i<m; i++)
		sum = sum + lpDays[i];
	sum += (d - 1);
	return sum;
}
/*
�ж���������֮�������.
����һ:YYYYMMDD
���ڶ�:YYYYMMDD
*/
int DiffDays(uint32 dwDate1, uint32 dwDate2)
{
	int y1 = dwDate1 / 10000;
	int iTmp = dwDate1 % 10000;
	int m1 = iTmp / 100;
	int d1 = iTmp % 100;

	int y2 = dwDate2 / 10000;
	iTmp = dwDate2 % 10000;
	int m2 = iTmp / 100;
	int d2 = iTmp % 100;


	int iDayDiffs = 0;
	int s1, s2; /* �����������ڴ�����������ڵ����� */
	int count; /* �����������֮��Ĳ�ֵ */
	int sum = 0; /*                        */
	int t, t1, t2;
	if (y1 == y2)	//	ͬһ��
	{
		s1 = Days(y1, m1, d1);
		s2 = Days(y2, m2, d2);
		iDayDiffs = s2 - s1;
	}
	else if (y2>y1)
	{
		count = y2 - y1;
		if (count == 1)
		{
			t2 = Days(y2, m2, d2);
			t1 = Days(y1, 12, 31) - Days(y1, m1, d1);
			iDayDiffs = (t1 + t2 + count);
		}
		else
		{
			for (t = y1 + 1; t<y2; t++)
				sum = sum + Days(t, 12, 31);
			t2 = Days(y2, m2, d2);
			t1 = Days(y1, 12, 31) - Days(y1, m1, d1);
			iDayDiffs = (sum + t1 + t2 + count);
		}
	}
	else
	{
		iDayDiffs = DiffDays(dwDate2, dwDate1);
		iDayDiffs *= -1;
	}
	return iDayDiffs;
}

struct Date
{
	Date(uint32 dwDate)
	{
		year = dwDate / 10000;
		int iTmp = dwDate % 10000;
		month = iTmp / 100;
		day = iTmp % 100;
	}
	int year;
	int month;
	int day;
};


uint32 GetNewDate(uint32 dwDate, int diffDays)
{
	Date reDate(dwDate);

	//	�����
	int daysAyear = 365;
	if (isPrime(reDate.year))
	{
		daysAyear = 366;
	}
	if (diffDays>0)
	{
		while (diffDays / daysAyear)
		{
			diffDays = diffDays - daysAyear;
			reDate.year++;
			daysAyear = 365;
			if (isPrime(reDate.year))
			{
				daysAyear = 366;
			}
		}

		//2.getmonths(days<366or365)
		const int* normalMonthDays = NotPrimeMonth;
		if (isPrime(reDate.year))
		{
			normalMonthDays = PrimeMonth;
		}
		while (diffDays / normalMonthDays[reDate.month])
		{
			diffDays = diffDays - normalMonthDays[reDate.month];
			reDate.month++;
			if (reDate.month >= 13)
			{
				reDate.year++;
				normalMonthDays = NotPrimeMonth;
				if (isPrime(reDate.year))
				{
					normalMonthDays = PrimeMonth;
				}
				reDate.month = reDate.month % 12;
			}
		}

		//3.getdays
		normalMonthDays = NotPrimeMonth;
		if (isPrime(reDate.year))
		{
			normalMonthDays = PrimeMonth;
		}
		if (diffDays + reDate.day <= normalMonthDays[reDate.month])
			reDate.day = diffDays + reDate.day;
		else
		{
			reDate.day = diffDays + reDate.day - normalMonthDays[reDate.month];
			reDate.month++;
			if (reDate.month>12)
			{
				reDate.year++;
				reDate.month = reDate.month % 12;
			}
		}
	}
	else
	{
	}
	return reDate.year * 10000 + reDate.month * 100 + reDate.day;
}


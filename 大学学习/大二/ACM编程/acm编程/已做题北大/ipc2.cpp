#include <windows.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <malloc.h>
#define  MAX_PERSON   100
#define  READER       0 //读者
#define  WRITER       1 //写者
#define  END         -1
#define  R            READER
#define  W            WRITER
 typedef struct _Person
{
HANDLE m_hThread;//定义处理线程的句柄
int    m_nType;//进程类型（读写）
int    m_nStartTime;//开始时间
int    m_nWorkTime;//运行时间
int    m_nID;//进程号
}Person;
 Person g_Persons[MAX_PERSON];
int    g_NumPerson = 0;
long   g_CurrentTime= 0;//基本时间片数
 int    g_PersonLists[] = {//进程队列
1, W, 4, 5,  2, W, 16, 4,  3, R, 5, 2,
4, W, 6, 5,  5, R, 4, 3, 
END,
};
int    g_NumOfReading = 0;
int    g_NumOfWriteRequest = 0;//申请写进程的个数
HANDLE g_hReadSemaphore;//读者信号
HANDLE g_hWriteSemaphore;//写者信号
bool finished = false; //所有的读完成
//bool wfinished = false; //所有的写完成
void  CreatePersonList(int *pPersonList);
bool  CreateReader(int StartTime,int WorkTime,int ID);
bool  CreateWriter(int StartTime,int WorkTime,int ID);
DWORD  WINAPI    ReaderProc(LPVOID lpParam);
DWORD  WINAPI    WriterProc(LPVOID lpParam);
int main()
{
g_hReadSemaphore  = CreateSemaphore(NULL,1,100,NULL); //创建信号灯，当前可用的资源数为，最大为
g_hWriteSemaphore = CreateSemaphore(NULL,1,100,NULL); //创建信号灯，当前可用的资源数为，最大为
CreatePersonList(g_PersonLists); // Create All the reader and writers
printf("Created all the reader and writer\n...\n");
g_CurrentTime = 0;
while(true)
{
g_CurrentTime++;
Sleep(300); // 300 ms
printf("CurrentTime = %d\n",g_CurrentTime);
if(finished) return 0;
system ("pause");
} // return 0;
}
void CreatePersonList(int *pPersonLists)
{
int  i=0;
int  *pList = pPersonLists;
bool Ret;
while(pList[0] != END)
{
switch(pList[1])
{
case R:
Ret = CreateReader(pList[2],pList[3],pList[0]);//351,w452,523,654
break; case W:
Ret = CreateWriter(pList[2],pList[3],pList[0]);
break;
}
if(!Ret)
printf("Create Person %d is wrong\n",pList[0]);
 pList += 4; // move to next person list
}
}
DWORD  WINAPI ReaderProc(LPVOID lpParam)//读过程
{
Person *pPerson = (Person*)lpParam;
// wait for the start time
while(g_CurrentTime != pPerson->m_nStartTime)
{ }
printf("Reader %d is Requesting ...\n",pPerson->m_nID);
printf("\n\n************************************************\n");
// wait for the write request
WaitForSingleObject(g_hReadSemaphore,INFINITE); if(g_NumOfReading ==0)
{
WaitForSingleObject(g_hWriteSemaphore,INFINITE); }
g_NumOfReading++;
ReleaseSemaphore(g_hReadSemaphore,1,NULL);
pPerson->m_nStartTime = g_CurrentTime;
printf("Reader %d is Reading the Shared Buffer...\n",pPerson->m_nID);
printf("\n\n************************************************\n");
while(g_CurrentTime <= pPerson->m_nStartTime + pPerson->m_nWorkTime)
{}
printf("Reader %d is Exit...\n",pPerson->m_nID);
printf("\n\n************************************************\n");
WaitForSingleObject(g_hReadSemaphore,INFINITE);
g_NumOfReading--;
if(g_NumOfReading == 0)
{ReleaseSemaphore(g_hWriteSemaphore,1,NULL);//此时没有读者，可以写
}
ReleaseSemaphore(g_hReadSemaphore,1,NULL);
if(pPerson->m_nID == 4) finished = true; //所有的读写完成
ExitThread(0);
return 0;
}
DWORD  WINAPI WriterProc(LPVOID lpParam)
{
Person *pPerson = (Person*)lpParam;
// wait for the start time
while(g_CurrentTime != pPerson->m_nStartTime)
{}
printf("Writer %d is Requesting ...\n",pPerson->m_nID);
printf("\n\n************************************************\n");
WaitForSingleObject(g_hWriteSemaphore,INFINITE);
// modify the writer's real start time
pPerson->m_nStartTime = g_CurrentTime;
printf("Writer %d is Writting the Shared Buffer...\n",pPerson->m_nID);
while(g_CurrentTime <= pPerson->m_nStartTime + pPerson->m_nWorkTime)
{}
printf("Writer %d is Exit...\n",pPerson->m_nID);
printf("\n\n************************************************\n");
//g_NumOfWriteRequest--;
ReleaseSemaphore(g_hWriteSemaphore,1,NULL);
if(pPerson->m_nID == 4) finished = true;//所有的读写完成
ExitThread(0);
return 0;
}
bool CreateReader(int StartTime,int WorkTime,int ID)
{
DWORD dwThreadID;
if(g_NumPerson >= MAX_PERSON)
return false;
Person *pPerson = &g_Persons[g_NumPerson];
pPerson->m_nID = ID;
pPerson->m_nStartTime = StartTime;
pPerson->m_nWorkTime = WorkTime;
pPerson->m_nType = READER;
g_NumPerson++;
// Create an New Thread
pPerson->m_hThread= CreateThread(NULL,0,ReaderProc,(LPVOID)pPerson,0,&dwThreadID);
if(pPerson->m_hThread == NULL)
return false;
return true;
}
bool CreateWriter(int StartTime,int WorkTime,int ID)
{
DWORD dwThreadID;
if(g_NumPerson >= MAX_PERSON) 
return false;
Person *pPerson  = &g_Persons[g_NumPerson];
pPerson->m_nID  = ID;
pPerson->m_nStartTime = StartTime;
pPerson->m_nWorkTime  = WorkTime;
pPerson->m_nType   = WRITER;
g_NumPerson++;
// Create an New Thread
pPerson->m_hThread= CreateThread(NULL,0,WriterProc,(LPVOID)pPerson,0,&dwThreadID);
if(pPerson->m_hThread == NULL)
return false;
return true;
}  

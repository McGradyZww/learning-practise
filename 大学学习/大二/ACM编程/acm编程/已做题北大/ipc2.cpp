#include <windows.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <malloc.h>
#define  MAX_PERSON   100
#define  READER       0 //����
#define  WRITER       1 //д��
#define  END         -1
#define  R            READER
#define  W            WRITER
 typedef struct _Person
{
HANDLE m_hThread;//���崦���̵߳ľ��
int    m_nType;//�������ͣ���д��
int    m_nStartTime;//��ʼʱ��
int    m_nWorkTime;//����ʱ��
int    m_nID;//���̺�
}Person;
 Person g_Persons[MAX_PERSON];
int    g_NumPerson = 0;
long   g_CurrentTime= 0;//����ʱ��Ƭ��
 int    g_PersonLists[] = {//���̶���
1, W, 4, 5,  2, W, 16, 4,  3, R, 5, 2,
4, W, 6, 5,  5, R, 4, 3, 
END,
};
int    g_NumOfReading = 0;
int    g_NumOfWriteRequest = 0;//����д���̵ĸ���
HANDLE g_hReadSemaphore;//�����ź�
HANDLE g_hWriteSemaphore;//д���ź�
bool finished = false; //���еĶ����
//bool wfinished = false; //���е�д���
void  CreatePersonList(int *pPersonList);
bool  CreateReader(int StartTime,int WorkTime,int ID);
bool  CreateWriter(int StartTime,int WorkTime,int ID);
DWORD  WINAPI    ReaderProc(LPVOID lpParam);
DWORD  WINAPI    WriterProc(LPVOID lpParam);
int main()
{
g_hReadSemaphore  = CreateSemaphore(NULL,1,100,NULL); //�����źŵƣ���ǰ���õ���Դ��Ϊ�����Ϊ
g_hWriteSemaphore = CreateSemaphore(NULL,1,100,NULL); //�����źŵƣ���ǰ���õ���Դ��Ϊ�����Ϊ
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
DWORD  WINAPI ReaderProc(LPVOID lpParam)//������
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
{ReleaseSemaphore(g_hWriteSemaphore,1,NULL);//��ʱû�ж��ߣ�����д
}
ReleaseSemaphore(g_hReadSemaphore,1,NULL);
if(pPerson->m_nID == 4) finished = true; //���еĶ�д���
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
if(pPerson->m_nID == 4) finished = true;//���еĶ�д���
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

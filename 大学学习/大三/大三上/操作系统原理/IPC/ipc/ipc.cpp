// ipc.cpp : 定义控制台应用程序的入口点。
//

#include "stdafx.h"
#include<stdio.h>
#include<stdlib.h>
#include"E:\Dev C++\DEV-CPP\Include\unistd.h"
#include<sys/types.h>
#include<sys/ipc.h>
#include<sys/sem.h>
#include<sys/shm.h>
#define WRITER_NUM 10 //the number of writers
#define READER_NUM 9 //the number of readers
#define WRITER_LOOP 3 //the time every writer writes
#define READER_LOOP 4 //the time every reader readers
//the union
union semun
{
	int val;
	struct semid_ds *buf;
	unsigned short *array;
};
//the struct which the share memory uses
struct shared_db
{
	int data;
	int rc;
	int count;
};
//the declarations of functions
static int set_semvalue(int sem_id);
static void del_semvalue(int sem_id);
static int semaphore_p(int sem_id);
static int semaphore_v(int sem_id);
void writer();
void reader();

int _tmain(int argc, _TCHAR* argv[])
{
	//File Name:IPC.c
	//Author:TJU,Null
	//Description:This program is used to solve the problem of writers and readers.
	//Last Modify Time:2007-11-15
	//the head file

	//the macro

	//the global variables
	int mutex;
	int db;
	int shmid;
	struct shared_db *my_db;
	int delay[WRITER_NUM+READER_NUM];//sleep time in seconds
	//the main function

		int i,id;
		void *shared_memory=(void *)0;
		mutex=semget((key_t)1234,1,0666|IPC_CREAT);//create a new semaphore
		db=semget((key_t)5678,1,0666|IPC_CREAT);
		if(mutex==-1||db==-1) //error happened
		{
			fprintf(stderr,"semget function failed!\n");
			exit(EXIT_FAILURE);
		}
		if(!set_semvalue(mutex)||!set_semvalue(db)) //set the semaphore 
		{
			fprintf(stderr,"Failed to initialize semaphore!\n"); 
			exit(EXIT_FAILURE); 
		}
		//create shared memory
		shmid=shmget((key_t)1234,sizeof(struct shared_db),0666|IPC_CREAT); if(shmid==-1) //error happened
		{
			fprintf(stderr,"shmget function failed!\n");
			exit(EXIT_FAILURE);
		}
		//attach the shared memory to the address of process
		shared_memory=shmat(shmid,(void*)0,0);
		if(shared_memory==(void *)-1)
		{
			fprintf(stderr,"shmat function failed!\n");
			exit(EXIT_FAILURE);
		}
		my_db=(struct shared_db *)shared_memory;
		my_db->data=0;
		my_db->rc=0;
		my_db->count=0;
		for(i=0;i<WRITER_NUM+READER_NUM;i++)//initialize the delay array
		{
			delay[i]=rand()%10;
		}//end for
		for(i=0;i<WRITER_NUM+READER_NUM;i++)//create the sub-processes
		{
			id = fork();
			if (id < 0) { //error
				printf("fork function failed\n");
				exit(EXIT_FAILURE);
			}
			else if (id == 0) { //sub-processes
				if (i <WRITER_NUM) { //writers
					writer();
				}
				else { //readers
					reader();
				}
				break;
			}
		}//end for
		for(i=0;i<WRITER_NUM+READER_NUM;i++) //wait sub-processes
		{
			wait((int *) 0);
		}//end for
		if (shmdt(shared_memory) == -1) //detach the shared memory from the current process
		{
			fprintf(stderr, "shmdt function failed\n");
			exit(EXIT_FAILURE);
		}
		if (shmctl(shmid, IPC_RMID, 0) == -1){//the control function for shared memory
			fprintf(stderr, "shmctl(IPC_RMID) failed\n");
			exit(EXIT_FAILURE);
		}
		del_semvalue(mutex);//delete the semaphore
		del_semvalue(db);
		exit(0);
	//end main function


}


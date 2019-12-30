#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>
//#include<time.h>
#include<sys/time.h>

void *ThreadFunc(void *);
double sum=0;
int averageNum;
pthread_mutex_t mutex=PTHREAD_MUTEX_INITIALIZER;

int main(int agc,char *argv[])
{
    int N=atoi(argv[1]);
    int NUM_THREAD=atoi(argv[2]); 
    averageNum=N/NUM_THREAD;
    int threadID[NUM_THREAD];
    pthread_t thread[NUM_THREAD];
    int ret,i;
    //clock_t start,finish;
    
    //start=clock();
   // timeval start,finish;
    struct timeval start,end;
    gettimeofday(&start,NULL);   
    //ettimeofday(&start,NULL);
    for(i=0;i<NUM_THREAD;i++)
    {
        threadID[i]=i;
        ret=pthread_create(&thread[i],NULL,ThreadFunc,(void *)&threadID[i]);
        if(ret!=0)
        {
            printf("Thread created failed!");
            return -1;
        }
        //pthread_join(thread[i],NULL);
    }
    
    for(i=0;i<NUM_THREAD;i++)
    {
        pthread_join(thread[i],NULL);
    }
    //finish=clock();
    if(N%2==0)
    {
       sum+=1.0/(2*N+1);
    }
    else
    sum+=-1.0/(2*N+1);
    gettimeofday(&end,NULL);
    printf("the pi is %12.10f\n",sum);
	//printf("the time to calculate pi was %lfms\n",(double)(finish-start)*1000.0/CLOCKS_PER_SEC);
	printf("the time to calculate pi was %lfms\n",(end.tv_sec -start.tv_sec)*1000.0 +(end.tv_usec -start.tv_usec)/1000.0);

   return 0; 
}

void * ThreadFunc(void* threadID)
{
    int threadNum=*((int*)threadID);
    double partsum=0,factor;
    long int i;
    i=threadNum*averageNum;
    
       while(i<(threadNum+1)*averageNum)
       {
            if(i%2==0) factor=1.0;
            else if(i%2==1) factor=-1.0;
            partsum+=4*factor/(2*i+1);
            i++;
       }
    
    
    
   
    pthread_mutex_lock(&mutex);
    sum+=partsum;
    pthread_mutex_unlock(&mutex);

    return NULL;
}

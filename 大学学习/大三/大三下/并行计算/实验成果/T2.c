#include<pthread.h>
#include<iostream>
#include<sys/time.h>
#include<cstdlib>
#include<sstream>

#include<fstream>
using namespace std;
double kernel[5][5]={
0.0 ,  0.0 ,  0.02,  0.0 ,  0.0 ,
0.0 ,  0.08,  0.1 ,  0.08,  0.0 ,
0.02,  0.1 ,  0.2 ,  0.1 ,  0.02,
0.0 ,  0.08,  0.1 ,  0.08,  0.0 ,
0.0 ,  0.0 ,  0.02,  0.0 ,  0.0
};
double a[260][260];
double b[260][260];
int T_NUM=8;
string PREFIX="data_pthread_kernel";
bool init()
{
  for(int y=0; y<260; y++){
    for(int x=0; x<260; x++){
       a[y][x]=0;
       b[y][x]=0;
    }
  }


ifstream in("sample.matrix.txt");
if(!in){
cout<<"no matrix file..."<<endl;
return false;
}
 
for(int y=2; y<258; y++){
for(int x=2; x<258; x++){
in>>a[y][x];
}
}
return true;
}


void* thread_function(void *id){
int tid=*(int*)id;
//   cout<<">>>>thread start"<<", tid="<<tid<<endl;
int each=256/T_NUM;

int f=tid*each+2;
int t=f+each;
for(int y=f; y<t; y++){
int col=y-2;
for(int x=2; x<258; x++){
int line=x-2;
for(int k=0; k<5; k++){
b[y][x]+=kernel[k][0]*a[col+k][line]+kernel[k][1]*a[col+k][line+1]
+kernel[k][2]*a[col+k][line+2]+kernel[k][3]*a[col+k][line+3]
+kernel[k][4]*a[col+k][line+4];
}
}
}
}
bool save(int time, string prefix){
string fname=prefix;
stringstream ss;
ss<<time;
string st;
ss>>st;
fname.append(st);
ofstream out(fname.data());
if(!out) return false;
for(int y=2; y<258; y++){
for(int x=2; x<258; x++){
out<<a[y][x]<<"\t";
}
out<<endl;
}
out.close();
return true;
}

int main(int argc, char* argv[]){
if(argc>2){
int t=atoi(argv[2]);
if(t!=0) T_NUM=t;
}

if(!init()) return 0;
pthread_t tids[T_NUM];
long total_time=0;
struct timeval start;
struct timeval end;
int error;
for(int count=0; count<20; count++){
for(int p=0; p<5; p++){
gettimeofday(&start,NULL);

int ids[T_NUM];
for(int i=0; i<T_NUM; i++){
ids[i]=i;
pthread_create(&tids[i], NULL, thread_function, &ids[i]);
}
for(int i=0; i<T_NUM; i++){
error=pthread_join(tids[i], NULL);
if(error){
cout<<"thread "<<i<<" error"<<endl;
exit(0);
}
}

gettimeofday(&end,NULL);
total_time+=1000000*(end.tv_sec-start.tv_sec)+(end.tv_usec-start.tv_usec);
 
for(int i=2; i<258; i++){
for(int j=2; j<258; j++){
a[i][j]=b[i][j];
b[i][j]=0;
}
}
}
save(count, PREFIX);
}
cout<<"this time use \t"<<T_NUM<<"\t threads, and use \t"<<total_time<<"\t microseconds"<<endl;
return 0;
}

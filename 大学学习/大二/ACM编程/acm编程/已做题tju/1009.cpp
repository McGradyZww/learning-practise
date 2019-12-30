#include<iostream>
#include<stdlib.h>//qsort
using namespace std;
int sticks[100],isused[100];
int len,n;
int comp(const void * e1,const void *e2)
{
    return *((int *)e2)-*((int *)e1);
}
int montage(int unusedSticks,int left)
{
    int i;
    if(unusedSticks==0&&left==0) return 1;
    if(left==0) left=len;
    for(i=0;i<n;i++)
    {
       if(isused[i]) continue;
       if(sticks[i]>left) continue;
       isused[i]=1;
       if(montage(unusedSticks-1,left-sticks[i])) return 1;
       isused[i]=0;
       if(left==len||sticks[i]==left) break;
    }
    return 0;
}
int main()
{
    int i,nmax,sum;
    while(cin>>n&&n)
    {
        nmax=0;
        sum=0;
        for(i=0;i<n;i++)
        {
           cin>>sticks[i];
           if(sticks[i]>50) {i--;n--;continue;}
           isused[i]=0;
           if(sticks[i]>nmax) nmax=sticks[i];
           sum+=sticks[i];        
           
        }
        if(n==0) {cout<<0<<endl;continue;}
        if(n==1) {cout<<sticks[0]<<endl;continue;}
        qsort(sticks,n,sizeof(int),comp);
        for(len=nmax;len<=sum;len++)
        {
           if(sum%len!=0) continue;
           
           
              if(montage(n,len))
              {
                 cout<<len<<endl;
                 break;
              }
        }
        
        
        
    }
    system("pause");
    return 0;
}

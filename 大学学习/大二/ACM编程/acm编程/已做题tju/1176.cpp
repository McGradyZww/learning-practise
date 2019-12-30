#include<stdio.h>
#include<iostream>
using namespace std;
int b[2600000]={0};
int a[500001];
int main()
{ 
    int i,k;
     a[0]=0;b[0]=1;
for(i=1;i<500001;i++)
{ a[i]=a[i-1]-i;
if(a[i]<0||b[a[i]]==1)
   a[i]=a[i-1]+i;
   b[a[i]]=1;
}
while( scanf("%d",&k)&&k!=-1)
{   printf("%d\n",a[k]);
}
return 0;
}

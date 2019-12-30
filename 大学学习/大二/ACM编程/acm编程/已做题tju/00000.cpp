#include<iostream>
#include<string.h>
#include<algorithm>
#include<stdio.h>
using namespace std;
int main()
{
    char a[1001];
    int num[150],count[150],t=0;
    int m,i,j,k;
    while(gets(a))
    {
       m=strlen(a);
       memset(num,0,sizeof(num));
       memset(count,0,sizeof(count));
       for(i=0;i<m;i++)
       num[a[i]]++;       
       j=0;
       for(i=32;i<150;i++)
       if(num[i]) count[j++]=num[i];
       sort(count,count+j);
       if(t) cout<<endl;
       for(i=0;i<j;i++)
       {
          for(k=149;k>=32;k--)
          {
              
              if(num[k]&&num[k]==count[i])
              {
                 cout<<k<<" "<<count[i]<<endl;
                 num[k]=0;
              }
          }
       }
       t=1;
    }
    system("pause");
    return 0;
}

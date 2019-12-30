#include<iostream>        //此题求的是最少赢的局数！ 然后我觉得就没啥问题了 
#include<algorithm>
#include<memory.h>
using namespace std;
int main()
{
    int m,n,count=1,a[50],i,j,num,b[1001];
    while(cin>>m>>n)
    {
       if(m==0&&n==0) break;
       memset(b,1,sizeof(b));
       for(i=0;i<n;i++) {cin>>a[i];b[a[i]]=0;}
       sort(a,a+n);
       num=0;
       for(i=n-1;i>=0;i--)
       {
           for(j=m*n;j>a[i];j--)
           if(b[j]) {b[j]=0;break;}
           if(j==a[i]) num++;
       }
       cout<<"Case "<<count<<": "<<num<<endl;      
       count++;
    }
    system("pause");
    return 0;
}

#include<iostream>
#include<memory.h>       //1229个质数在10000以内，开始没想到办法，看了别人的- -！ 
using namespace std;
int main()
{  
    int n,num,i,j,a[1229],s,sum;                    
    a[0]=2; 
    a[1]=3; 
    s=2; 
    for(i=5;i<10000;i+=2)                      //找出所有10000以内质数 
    {
        for(j=1;j<s;j++)
        if(i%a[j]==0) break;
        if(j==s) a[s++]=i; 
    } 
    while(cin>>n&&n!=0)
    {
       num=0;
       sum=0; 
       for(i=0;sum<n;i++) ////////// sum>n时i照样执行+1！！！！！！！！！！！ 此步给n定位 
       sum+=a[i]; 
       j=0; 
       while(sum>n) sum-=a[j++];                     //若大于n则依次减小的 
       if(sum==n) num++;
       
       for(;a[i]<=n&&i<1229;i++)                     //加大的减小的 
       {
          sum+=a[i];
          while(sum>n) sum-=a[j++];
          if(sum==n) num++; 
       } 
       cout<<num<<endl;
    }
    system("pause");
    return 0;
}

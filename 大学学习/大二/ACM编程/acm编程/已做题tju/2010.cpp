#include<iostream>
#include<memory.h>       //1229��������10000���ڣ���ʼû�뵽�취�����˱��˵�- -�� 
using namespace std;
int main()
{  
    int n,num,i,j,a[1229],s,sum;                    
    a[0]=2; 
    a[1]=3; 
    s=2; 
    for(i=5;i<10000;i+=2)                      //�ҳ�����10000�������� 
    {
        for(j=1;j<s;j++)
        if(i%a[j]==0) break;
        if(j==s) a[s++]=i; 
    } 
    while(cin>>n&&n!=0)
    {
       num=0;
       sum=0; 
       for(i=0;sum<n;i++) ////////// sum>nʱi����ִ��+1���������������������� �˲���n��λ 
       sum+=a[i]; 
       j=0; 
       while(sum>n) sum-=a[j++];                     //������n�����μ�С�� 
       if(sum==n) num++;
       
       for(;a[i]<=n&&i<1229;i++)                     //�Ӵ�ļ�С�� 
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

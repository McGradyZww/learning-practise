//��������5���ܸ�����Ϊβ��0�ĸ��� 
#include<iostream>
using namespace std;
int main()
{
    int t,n,i,sum;
    cin>>t;
    while(t>0)
    {
              sum=0; 
              cin>>n; 
              for(i=5;i<=n;i=i*5)// 5�ı�������5��������һ��5,2��5.���������� 
              sum=sum+n/i;
              cout<<sum<<endl; 
              t--; 
    } 
    system("pause");
    return 0; 
} 

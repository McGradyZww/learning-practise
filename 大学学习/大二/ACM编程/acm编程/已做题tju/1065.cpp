//计算因子5的总个数即为尾数0的个数 
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
              for(i=5;i<=n;i=i*5)// 5的倍数因子5个数，含一个5,2个5.。。。。。 
              sum=sum+n/i;
              cout<<sum<<endl; 
              t--; 
    } 
    system("pause");
    return 0; 
} 

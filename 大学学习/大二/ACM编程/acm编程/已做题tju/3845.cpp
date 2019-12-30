#include<iostream>///列表法 ，1 1 2 3 5 8 13.... 这是木棍的长度，还要个数组记录总长度 
using namespace std;
int main()
{
    int n,i,a[25],sum[25],num;
    a[0]=1;a[1]=1;
    for(i=2;i<25;i++) a[i]=a[i-1]+a[i-2];
    sum[0]=1;
    for(i=1;i<24;i++) sum[i]=sum[i-1]+a[i];
    while(cin>>n)
    {
       for(i=0;i<25;i++) 
       if(sum[i]>n) 
       {
           num=i;
           break;
       }
       cout<<num<<endl;
    }
    system("pause");
    return 0;
}

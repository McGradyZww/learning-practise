#include<iostream>
using namespace std;
int main()
{
    int ca,num;
    long m,n,min,max,temp1,temp2,temp,i;
    cin>>ca;
    while(ca--)
    {
       cin>>m>>n;
       min=m>n?n:m;
       max=m>n?m:n;
       temp1=min;temp2=max;
       while(temp1!=0)
       {
           temp=temp2%temp1;
           temp2=temp1;
           temp1=temp;
       }
       temp=temp2;//最大公约数 
       num=0; 
       for(i=1;i<=temp2;i++)
       {
           if(i<=temp2&&min%i==0&&max%i==0) num++; 
       } 
       cout<<num<<endl; 
    }
    system("pause");
    return 0;
}

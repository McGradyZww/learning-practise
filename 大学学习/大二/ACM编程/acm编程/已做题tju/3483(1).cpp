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
       temp=temp2;//���Լ�� 
       num=1;
       //cout<<temp<<endl;
       for(i=2;i<=temp;i++) 
       { 
          temp1=0;
          while(temp!=1) //���ѭ���ܺã���i�������ܳ�Ϊֹ
          { 
            if(temp%i==0) 
            { 
              temp1++; 
              temp/=i; 
            } 
            else break; 
          } 
          num*=(temp1+1);
       } 
       cout<<num<<endl;
    }
    system("pause");
    return 0;
}

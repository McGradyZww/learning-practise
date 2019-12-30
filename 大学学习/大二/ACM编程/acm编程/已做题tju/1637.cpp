#include<iostream>
using namespace std;
int f(int n,int m)//mÎª»ùÊı 
{
    int temp,sum;
    sum=0;
    while(n!=0)
    {
       temp=n%m;
       sum+=temp;
       n=n/m;
    }
    return sum; 
}
int main()
{ 
   int i; 
   for(i=2992;i<10000;i++)
   {
      if((f(i,10)==f(i,16))&&(f(i,10)==f(i,12))) cout<<i<<endl; 
   }                
   system("pause");
   return 0;
}

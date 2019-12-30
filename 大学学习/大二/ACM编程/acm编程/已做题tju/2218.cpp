#include<iostream>
using namespace std;
int main()
{
    int n,m,i,binary[32],temp; 
    while(cin>>n)
    {
       if(n==0) break; 
       i=0; 
       temp=n; 
       while(temp!=0)                 //binary[]存n的二进制表示 
       {
          binary[i++]=temp%2; 
          temp=temp/2; 
       } 
       i--; 
       m=1; 
       while(i>=0)                 //模幂运算，看别人的算法 
       {
         m=(m*m)%2006; 
         if(binary[i]) 
         m=(m*n)%2006; 
         i--; 
       }
       cout<<m<<endl; 
    } 
    system("pause");
    return 0; 
} 

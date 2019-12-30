#include<iostream>
using namespace std;
int main()
{
    long long m,n,b,i,t;
    while(cin>>m>>n&&(m!=0||n!=0)) 
    {
       b=m%10;
       n=n%4; 
       t=1; 
       if(n==0) 
       for(i=0;i<4;i++) t=t*b; 
       else for(i=0;i<n;i++) t=t*b;
       t=t%10;       
       cout<<t<<endl; 
    } 
    system("pause");
    return 0; 
} 

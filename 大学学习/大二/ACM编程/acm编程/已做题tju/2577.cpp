#include<iostream>
using namespace std;
int main()
{
    int n,m,i,t;
    cin>>n;
    while(n--)
    {
       cin>>m;
       for(i=0,t=10;i<7;i++,t*=10) 
       if(m>t) m=(m+t/2)/t*t;
       cout<<m<<endl; 
    } 
    system("pause");
    return 0; 
} 

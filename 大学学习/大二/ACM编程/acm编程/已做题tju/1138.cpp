#include<iostream>
using namespace std;
int main()
{
    
    int a,b,i;
    while( cin>>a>>b)
    {
             if(a==0&&b==0) 
             break; 
             
               if(b>a/2) 
               b=a-b; 
               double t=1.0; 
              
               for(i=1;i<=b;i++)  t=t*( a - b + i ) / i ; 
               cout<<(long)t<<endl; 
             
    } 
    system("pause");
    return 0;
}

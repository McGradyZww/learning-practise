#include<iostream>
#include<string> 
using namespace std;
int main()
{
    string a,b;
    int m,b1,t,b2,i; 
    while(cin>>a>>b) 
    { 
      if(a=="0"&&b=="0") break; 
      m=a.size();
      b1=a[m-1]-'0';
      m=b.size();
      if(m>=2) 
      b2=(b[m-2]-'0')*10+(b[m-1]-'0');
      else b2=b[0]-'0'; 
      b2=b2%4;
       t=1; 
       if(b2==0) 
       for(i=0;i<4;i++) t=t*b1; 
       else for(i=0;i<b2;i++) t=t*b1; 
       t=t%10;
       cout<<t<<endl; 
   }  
    system("pause");
    return 0; 
} 

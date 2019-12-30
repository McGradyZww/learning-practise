#include<iostream>
using namespace std;
int main()
{
    double a;
    int b,c;
    int m,n,p; 
    while(cin>>a>>b>>c)
    {
       m=0;
       n=0;
       p=0; 
       if(a==0&&b==0&&c==0) break;
       if(a<=4.5&&b>=150&&c>=200) m=1;
       if(a<=6.0&&b>=300&&c>=500) n=1;
       if(a<=5.0&&b>=200&&c>=300) p=1;
       if(m==1)  cout<<"Wide Receiver "; 
       if(n==1)  cout<<"Lineman ";
       if(p==1) cout<<"Quarterback "; 
       if(m==0&&n==0&&p==0) {cout<<"No positions"<<endl; continue;}
       cout<<endl; 
    } 
    system("pause");
    return 0; 
} 

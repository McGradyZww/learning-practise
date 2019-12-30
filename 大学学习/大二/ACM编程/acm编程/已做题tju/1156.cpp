#include<iostream>
#include<string>
using namespace std;
int main()
{
    int b,m,i,sum1,sum2,base[100];
    string s;
    while(cin>>b)
    {
       if(b==0) break;
       cin>>s;
       base[0]=1;
       for(i=1;i<100;i++) base[i]=b*base[i-1];
       m=s.size();
       sum1=0;
       for(i=0;i<m;i++) sum1+=s[i]-'0';
       sum2=0;
       for(i=0;i<m;i++) 
       {
          sum2+=(s[i]-'0')*base[m-1-i];
          sum2=sum2%sum1;
       } 
       if(sum2==0)  
       cout<<"yes"<<endl;                 
       else cout<<"no"<<endl;
    }
    system("pause");
    return 0;
}

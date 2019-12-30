#include<iostream>
#include<string>
#include<memory.h>
using namespace std;
int main()
{
    int n,count=1,len,m1,m2,i,j;
    bool b[50];
    string s1,s2,def;
    cin>>n;
    getline(cin,def);
    while(n--)
    {
       len=0;
       getline(cin,s1);
       getline(cin,s2);
       memset(b,0,sizeof(b));
       m1=s1.size();
       m2=s2.size();
       for(i=0;i<m1;i++)
       {
          for(j=0;j<m2;j++)
          {
           if(!b[j]&&s1[i]==s2[j]) {b[j]=1;break;}
          }
          if(j!=m2) len++;
       }
       cout<<"Case #"<<count<<":  "<<m1+m2-2*len<<endl;
       count++; 
    }
    system("pause");
    return 0;
}

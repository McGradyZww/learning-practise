#include<iostream>
#include<memory.h>
#include<string>
using namespace std;
int ch[500];
int main()
{
    int i,j,m,max,num,num2,temp,a[3]={1,10,100};
    string s,n;
    while(getline(cin,n))
    {
       if(n=="0") break;
       max=0;
       for(i=0;i<n.size();i++) max+=(n[i]-'0')*a[n.size()-1-i];
       getline(cin,s);
       m=s.size();
       num=0;
       for(i=0;i<m;i++)
       {
          memset(ch,0,sizeof(ch));
          ch[s[i]]=1;
          j=i+1;
          temp=1;
          num2=1;
          while(j<m&&temp<=max)
          {
             if(!ch[s[j]]) temp++;
             ch[s[j]]=1;
             j++;
             num2++;
          }
          if(num2>num) num=num2;
          
       }
       cout<<num-1<<endl;
    }
    system("pause");
    return 0;
}

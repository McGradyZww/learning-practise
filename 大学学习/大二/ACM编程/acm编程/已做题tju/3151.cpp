#include <iostream>
#include<string>
#include<stdio.h>//getchar()ÎÄ¼þÍ· 
using namespace std;
int main()
{
    int n,m1,count=1,i,k;
    char s[500];
    string a,b;
    cin>>n;
    getchar();
    while(n--)
    {
       
       getline(cin,a);
       getline(cin,b);
       m1=a.size();
       k=0;
       for(i=0;i<m1;i++)
       {
          if(a[i]==' ') s[k++]=a[i];
          else {
               s[k++]=b[a[i]-'A'];
               }
       }
       s[k]='\0';
       cout<<count<<" ";
       cout<<s<<endl;
       count++;
    }
    system("pause");
    return 0;
}

#include<iostream>
#include<string.h>             //strlen()的文件头 
using namespace std;
char a[80];
int m;
int f(char *b,int s,int t)
{
    int i,j;
    for(i=s+1,j=i+t-s;i+t-s<m&&j<m;i++,j++)              //i和j同时向右移一位 
        if(b[0]==a[i]&&b[1]==a[j]) return 0;
    return 1;
}
int main()
{
    int i,j;
    char b[3];
    while(cin>>a)
    {
       if(a[0]=='*') break;
       m=strlen(a);
       for(i=0;i<m-1;i++)
       {
          for(j=0;j+i+1<m;j++)
          {
             b[0]=a[j];
             b[1]=a[j+i+1];
             b[2]='\0';
             if(!f(b,j,j+i+1)) {cout<<a<<" is NOT surprising."<<endl;break;}
          }
          if(j+i+1<m) break;
       }
       if(i==(m-1)) cout<<a<<" is surprising."<<endl;
    }
    system("pause");
    return 0;
}

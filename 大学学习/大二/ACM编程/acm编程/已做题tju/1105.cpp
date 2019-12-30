#include<iostream>
#include<string>
#include<memory.h>     //对内存操作需要 
using namespace std;
long f[26][6];
long g[5];
void INIT()
{
     memset(f,0,sizeof(f));
     memset(g,0,sizeof(g));
     int i,j,k;
     for(i=0;i<26;i++)
         f[i][1]=1;
     g[1]=26;
     for(k=2;k<6;k++)
     for(i=0;i<26;i++)
     {
                      for(j=i+1;j<26;j++)
                       f[i][k]+=f[j][k-1];
                       }
     for(i=2;i<5;i++)
     for(j=0;j<26;j++)
     g[i]+=f[j][i];
}
bool check(string data)
{
     int len=data.size();
     int i,j;
     for(i=0;i<len;i++)
     {
                       for(j=i+1;j<len;j++)
                       if(data[i]>=data[j])return false;
                       }
     return true;
}
int b(string data)
{
    int len=data.size();
    int i,j;
    int sum=0;
    int p;
    for(i=1;i<len;i++)
    sum+=g[i];
    sum++;
    for(i=0;i<len;i++)
    {
                      p=len-i;
                      if(i==0)
                      {
                             for(j=0;j<data[i]-'a';j++)
                             sum+=f[j][p];
                              }
                      else
                      {
                         for(j=data[i-1]-'a'+1;j<data[i]-'a';j++)
                         sum+=f[j][p];
                          }
                          }
    return sum;
}
int main()
{
    string data;
    INIT();
    while(cin>>data)
    {
                                 if(!check(data))
                                 cout<<"0"<<endl;
                                 else
                                 {
                                     cout<<b(data)<<endl;
                                     }
                                     }
                                     system("pause");
    return 0;
    
}

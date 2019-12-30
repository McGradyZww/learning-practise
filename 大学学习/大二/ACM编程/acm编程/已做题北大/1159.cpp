#include<iostream>
#include<string.h>
#include<memory.h>
using namespace std;
int mi[5001][5001];//这里超内存,改为short mi[5001][5001]可以水过 
char s[5001];
int nMin(int a,int b)
{
    return a<b?a:b;
}
int main()
{
    int n,i,j;
    cin>>n;
    cin>>s;
    memset(mi,0,sizeof(mi));
    for(i=n-1;i>0;i--)
    {
        for(j=i+1;j<=n;j++)
        {
           if(s[i-1]==s[j-1]) mi[i][j]=mi[i+1][j-1];
           else{
                mi[i][j]=1+nMin(mi[i+1][j],mi[i][j-1]);
                
           }
        }
    }
    cout<<mi[1][n]<<endl;
    system("pasue");
    return 0;
}

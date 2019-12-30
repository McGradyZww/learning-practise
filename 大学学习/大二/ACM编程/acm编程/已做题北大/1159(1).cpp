#include<iostream>
#include<string.h>
#include<memory.h>
using namespace std;
int mi[2][5001];//太牛了，内存从5w减到300kb!!! 
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
           if(s[i-1]==s[j-1]) mi[i%2][j]=mi[(i+1)%2][j-1];
           else{
                mi[i%2][j]=1+nMin(mi[(i+1)%2][j],mi[i%2][j-1]);
                
           }
        }
    }
    cout<<mi[1][n]<<endl;
    system("pasue");
    return 0;
}

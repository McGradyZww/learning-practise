#include<iostream>
#include<string> 
using namespace std;
string a,b;
int main()
{
    int m,n,i,j;
    string a,b;
    while(cin>>a>>b)
    {
       m=a.size();
       n=b.size();
       int c[m+1][n+1];
       for(i=0;i<=m;i++) c[i][0]=0;
       for(i=1;i<=n;i++) c[0][i]=0;
       for(i=1;i<=m;i++)
       for(j=1;j<=n;j++)
       {
         if(a[i-1]==b[j-1]) c[i][j]=c[i-1][j-1]+1;
         else if(c[i-1][j]>=c[i][j-1])    c[i][j]=c[i-1][j];
         else c[i][j]=c[i][j-1];            
       }
       cout<<c[m][n]<<endl;
    }
    system("pause");
    return 0;
} 

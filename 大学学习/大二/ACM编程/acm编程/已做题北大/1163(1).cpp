#include<iostream>
//#include<algorithm>
//#include<memory.h>
using namespace std;
//int f[100][100];
//int ans[100];
int max(int a,int b)
{
    return a>b?a:b;
}
int main()
{
    int a[101][101]={0};
    int n,i,j,ans;
    cin>>n;
    //memset(a,0,sizeof(a));
    for(i=1;i<=n;i++)
    {
       for(j=1;j<=i;j++)
       {
          cin>>a[i][j];
          a[i][j]+=max(a[i-1][j],a[i-1][j-1]);
       }
    }
    //memset(f,-1,sizeof(f));
    //f[0][0]=a[0][0];
    ans=0;
    for(i=1;i<=n;i++) if(a[n][i]>ans)  ans=a[n][i];
   // sort(ans,ans+n);
    cout<<ans<<endl;
    system("pause");
    return 0;
}

#include<iostream>
#include<memory.h>
#include<algorithm>
using namespace std;
int a[100][100];
int f[100][100];
int ans[100];
int main()
{
    int n,i,j;
    cin>>n;
    for(i=0;i<n;i++)
    {
       for(j=0;j<=i;j++)
       cin>>a[i][j];
    }
    memset(f,-1,sizeof(f));
    f[0][0]=a[0][0];
    for(i=0;i<n-1;i++)
    {
        for(j=0;j<=i;j++)
        {
            if(f[i][j]+a[i+1][j]>f[i+1][j]) f[i+1][j]=f[i][j]+a[i+1][j];
            if(f[i][j]+a[i+1][j+1]>f[i+1][j+1]) f[i+1][j+1]=f[i][j]+a[i+1][j+1];
        }
    }
    for(i=0;i<n;i++) ans[i]=f[n-1][i];
    sort(ans,ans+n);
    cout<<ans[n-1]<<endl;
    system("pause");
    return 0;
}

#include<iostream>
#include<memory.h>
using namespace std;
int main()
{
    int n,m,a[501],p,q,r,i,ans;
    cin>>n>>m;
    memset(a,0,sizeof(a));
    while(m--)
    {
       cin>>p>>q>>r;
       if(p==0) 
       {
          for(i=q;i<=r;i++) a[i]=1-a[i];
       }
       else if(p==1)
       {
          ans=0;
          for(i=q;i<=r;i++)
          if(a[i]) ans++;
          cout<<ans<<endl;
       }
    }
    system("pause");
    return 0;
}

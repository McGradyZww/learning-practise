#include <iostream>
#include <algorithm>
using namespace std;
int a[110];
int main()
{
    int t,i,j,k,ans=0;
    while(cin>>t)
    {
        ans=0;
        for(i=0;i<t;i++)
        {
            scanf("%d",a+i);
        }
        sort(a,a+t);
        if(t<=3)
        {
            if(t==3)ans=a[0]+a[1]+a[2];
            else if(t==2) ans=a[1];
            else ans=a[0];
        }
        else
        {
            int A=a[0],B=a[1],C,D;
            for(i=t-1;i>2;i-=2)
            {
                C=a[i-1],D=a[i];
                if((B+B)<(A+C))ans+=(A+B+B+D);
                else ans+=(A+A+C+D);
            }
            if(t%2==1)ans+=(A+B+a[2]);
            else ans+=B;
        }
        printf("%d\n",ans);
    }
            return 0;
}

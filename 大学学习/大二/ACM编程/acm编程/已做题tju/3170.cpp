#include<iostream>
using namespace std;
int main()
{
    int m,n,i,j,a[100],q,sum,ans;
    cin>>m>>n;
    for(i=0;i<m;i++) cin>>a[i];
    for(i=0;i<n;i++) 
    {
        cin>>q;
        sum=0;
        for(j=0;j<m;j++)
        {
            sum+=a[j];
            if(q<sum) {ans=j+1;break;}
        }
        cout<<ans<<endl;
    }
   
    system("pause");
    return 0;
}

#include <iostream>
using namespace std;
int main()
{
    int m,n,i,j,a[500],b[2],sum;
    cin>>m>>n;
    for(i=0;i<m;i++) cin>>a[i];
    for(i=0;i<n;i++) 
    {
       cin>>b[0]>>b[1];
       sum=0;
       for(j=b[0]-1;j<=b[1]-1;j++) 
       sum+=a[j];
       cout<<sum<<endl;
    }
    system("pause");
    return 0;
}

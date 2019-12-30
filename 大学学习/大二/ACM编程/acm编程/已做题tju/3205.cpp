#include<iostream>
#include<algorithm> 
using namespace std;
int main()
{
   int n,a[100][100],i,j,b[100],k;
   cin>>n;
   for(i=0;i<n;i++)
    for(j=0;j<n;j++)
      cin>>a[i][j];
      k=0;
    for(i=0;i<n;i++)
      {sort(a[i],a[i]+n); b[k++]=a[i][n/2];}
    sort(b,b+n);
    cout<<b[n/2]<<endl;
   system("pause");
   return 0;
}

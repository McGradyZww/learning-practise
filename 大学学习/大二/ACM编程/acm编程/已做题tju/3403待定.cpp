#include<iostream>
#include<cmath>
using namespace std;
int main()
{
    int n,i,differ,sum,k;
    int a[30];
    while(cin>>n)
    {
                 sum=0;
                 k=0;
                 for (i=0;i<n;i++) {cin>>a[i];sum=sum+a[i];}
                 sort(a,a+n);
                
                 k=a[n-1];
                 for (i=0;i<n/2-1;i++) k=k+a[i];
                 differ=abs(sum-2*k);       
                 cout<<differ<<endl;
    }
    system("pause");
    return 0;
}

#include<iostream>
using namespace std;
int main()
{
    int n,m,i,sum;
    cin>>n;
    while(n--)
    {
       sum=0;
       cin>>m;
       int *a=new int[m];
       for(i=0;i<m;i++) {cin>>a[i];sum+=a[i];}
       cout<<sum-m+1<<endl;
       delete []a;
    }
    system("pause");
    return 0;
} 

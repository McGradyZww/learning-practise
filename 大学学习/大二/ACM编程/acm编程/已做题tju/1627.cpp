#include<iostream>
#include<memory.h>
using namespace std;
int main()
{
    int n,a[31],b[30],i,j,sum,p1;
    bool p;
    while(cin>>n&&n!=0)
    {
        sum=0;
        for(i=0;i<n;i++) {cin>>a[i];sum+=a[i];}
        memset(b,0,sizeof(b));
        for(i=0;i<n;i++)
        {
           for(j=0;j<=i;j++) b[i]+=a[j];
        }
        p=0;
        for(i=0;i<n;i++)
           if(b[i]==sum-b[i]) {p=1;p1=i+1;break;}
        if(!p) cout<<"No equal partitioning."<<endl;
        else cout<<"Sam stops at position "<<p1<<" and Ella stops at position "<<p1+1<<"."<<endl;
    }
    system("pause");
    return 0;
}

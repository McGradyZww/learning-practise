#include<iostream>
#include<algorithm>
using namespace std;
int main()
{
    int n,i,a[101];
    while(cin>>n&&n!=0)
    {
        for(i=0;i<n;i++) cin>>a[i];
        sort(a,a+n);
        for(i=n-2;i>=0;i--)
        if(a[i]<a[i+1]) {cout<<a[i]<<endl;break;}
        
    }
    system("pause");
    return 0;
}

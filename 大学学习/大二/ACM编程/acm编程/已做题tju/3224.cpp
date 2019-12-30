#include<iostream>
using namespace std;
int main()
{
    int ca;
    long long n,m;
    long long ans;
    cin>>ca;
    while(ca--)
    {
       cin>>n>>m;
       ans=n*m-1;
       cout<<ans<<endl;
    }
    system("pause");
    return 0;
}

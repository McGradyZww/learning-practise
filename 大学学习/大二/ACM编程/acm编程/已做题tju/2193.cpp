#include<iostream>
using namespace std;
int main()
{
    int n,m,ans;
    while(cin>>n)
    {
       if(n==0) break;
       cin>>m;
       ans=n%(m+1);
       if(ans==0) cout<<"Think About It."<<endl;
       else cout<<"Just Do It."<<endl;
    }
    system("pause");
    return 0;
}

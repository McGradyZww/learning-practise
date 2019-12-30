#include<iostream>
using namespace std;
int main()
{
    int ca,n,p;
    cin>>ca;
    while(ca--)
    {
       cin>>n;
       if(n%2==1) cout<<n<<" "<<0<<endl;
       else{
            p=0;
            while(n%2==0)
            {
               n/=2;
               p++;
            }
            cout<<n<<" "<<p<<endl;
       }
    }
    return 0;
}

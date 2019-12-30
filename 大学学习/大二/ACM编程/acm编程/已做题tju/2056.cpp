#include<iostream>
using namespace std;
int main()
{
    int x,y,z,m,n,p;
    while(cin>>x>>y>>z){
         m=9*(x+z-2*y)/2+3*(4*y-3*x-z)/2+x;
         n=16*(x+z-2*y)/2+4*(4*y-3*x-z)/2+x;
         p=25*(x+z-2*y)/2+5*(4*y-3*x-z)/2+x;
         cout<<m<<" "<<n<<" "<<p<<endl;
    }
    system("pause");
    return 0;
}

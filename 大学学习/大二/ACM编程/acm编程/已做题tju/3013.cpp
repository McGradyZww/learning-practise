#include<iostream>
#include<math.h>
using namespace std;
int main()
{
    int m,n,count=1;
    double sum,a,b,r;
    while(cin>>r)
    {
       if(r==0) break;
       cin>>m>>n;
       a=m/2.0;
       b=sqrt(r*r-a*a);
       b=b*2;
       if(b>=n) cout<<"Pizza "<<count<<" fits on the table."<<endl;
       else cout<<"Pizza "<<count<<" does not fit on the table."<<endl;
       count++;
    }
    system("pause");
    return 0;
}

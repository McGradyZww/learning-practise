#include <iostream>
using namespace std;
int main()
{
    int n,p,q,r;
    
    cin >>n;
    while (n>0)
    {
          cin >>p>>q>>r;
          if (p>q-r) cout <<"do not advertise"<<endl;
          if (p==q-r) cout <<"does not matter"<<endl;
          if (p<q-r) cout <<"advertise"<<endl;
          n--;
    }
    system("pause");
    return 0;
}

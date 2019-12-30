#include<iostream>
using namespace std;
int main()
{
    int n,x,y;
    cin >>n;
    while (n>0)
    {
          cin >>x>>y;
          if (y%2==0)
          {
                     if (x==y) cout <<2*y<<endl;
                     else if (x==y+2) cout <<2*(y+1)<<endl;
                     else cout <<"No Number"<<endl;
          }
          else 
          {
               if (x==y) cout <<2*y-1<<endl;
               else if (x==(y+2)) cout <<2*y+1<<endl;
               else cout <<"No Number"<<endl;
          }
          n--;
    }
    system("pause");
    return 0;
}

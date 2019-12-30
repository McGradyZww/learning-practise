#include<iostream>
using namespace std;
int main()
{
    int n,a,b;
    cin >>n;
    while (n>0)
    {
          cin >>a>>b;
          if (a<b) cout <<"impossible"<<endl;
          else if (((a+b)%2==0)&&((a-b)%2==0))
          {
              cout <<(a+b)/2<<" "<<(a-b)/2<<endl;
          }
          else cout <<"impossible"<<endl;
          n--;
    }
    system("pause");
    return 0;
}

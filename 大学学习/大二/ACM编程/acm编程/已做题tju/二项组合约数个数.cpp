#include<iostream>
using namespace std;
int main()
{
    int n,m,i,a,b;
    float k,k1,k2,j;
    while (cin >>n>>m)
    {
          if (n==m) cout <<"1"<<endl;
          if (n!=m)
          {
          b=0;
          k1=1.0;
          k2=1.0;
          for (i=0;i<m;i++) k1=k1*(n-i);
          for (i=0;i<m;i++) k2=k2*(m-i);
          k=k1/k2;
         
          cout <<k<<endl;
          }
    }
    system("pause");
    return 0;
}

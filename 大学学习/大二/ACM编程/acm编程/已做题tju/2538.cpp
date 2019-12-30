#include<iostream>
using namespace std;
int main()
{
    int n,m,i,d;
    long k;
    cin >>n;
    d=1;
    while (n>0)
    {
          k=0;
          cin >>m;
          for (i=1;i<=m;i++) k=k+i*(i+1)*(i+2)/2;
          cout <<d<<" "<<m<<" "<<k<<endl;
          n--;
          d++;
    }
    system("pause");
    return 0;
}

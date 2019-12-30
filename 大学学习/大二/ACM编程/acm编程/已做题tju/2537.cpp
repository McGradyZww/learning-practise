#include<iostream>
using namespace std;
int main()
{
    int n,m,a=1;
    int q,d,s,p;
    cin >>n;
    while (n>0)
    {
          
          cin >>m;
          q=m/25;
          d=(m%25)/10;
          s=(m-25*q-10*d)/5;
          p=m-25*q-10*d-5*s;
          cout <<a<<" "<<q<<" "<<"QUARTER(S)"<<","<<" "<<d<<" "<<"DIME(S)"<<","<<" "<<s<<" "<<"NICKEL(S)"<<","<<" "<<p<<" "<<"PENNY(S)"<<endl;
          a++;
          n--;
    }
    system("pause");
    return 0;
}

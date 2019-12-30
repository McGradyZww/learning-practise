#include<iostream>
using namespace std;
int f(long);
int G(long);
int main()
{
    long n,m,k;
    cin >>n;
    while (n>0)
    {
          cin >>m;
          k=G(m);
          cout <<k<<endl;
          n--;
    } 
    system("pause");
    return 0;
}
int f(long n)
{
    long i,b,d=0;
    for (i=1;i<=n;i++)
    {
        b=n%i;
        if (b==0) d++;
    }
    return d;
}
int G(long n)
{
    if (n==1) return 1;
    else return (f(n)+G(n-1)); 
}

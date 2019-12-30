#include<iostream>
using namespace std;
int f(int);
int main()
{
    int n,m,i,j,k,d;
    int a[100],b[100];
    cin >>n;
    while(n!=0)
    {
      i=0;
      while (n!=0)
      {
         m=n%2;
         n=n/2;
         a[i]=m;
         i++; 
      }
      for (j=0;j<i;j++)
      {
          b[j]=a[i-1-j];
      }
      k=b[0]*f(0);
      d=1;
      for (j=1;j<i;j++)
      {
          k=k+b[j]*f(d);
          d++;
      }
      cout <<k<<endl;
      cin >>n;
    }
    system("pause");
    return 0;
}
int f(int q)
{
    int k,i;
    k=1;
    for (i=0;i<q;i++) k=2*k;
    return k;
}

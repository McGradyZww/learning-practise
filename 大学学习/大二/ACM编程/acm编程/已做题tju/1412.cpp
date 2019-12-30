#include<iostream>
using namespace std;
int main()
{
    int n,m,i,average,k,d;
    cin >>n;
    float b;
    int a[1001];
    while (n>0)
    {
          d=0;
          cin >>m;
          for (i=0;i<m;i++) cin >>a[i];
          k=0;
          for (i=0;i<m;i++) k=k+a[i];
          average=k/m;
          for (i=0;i<m;i++)
          {
              if (a[i]>average) d++;
          }
          b=(d*100.0)/m;
          printf("%.3f",b);
          cout <<"%"<<endl;
          n--;
    }
    system("pause");
    return 0;
}

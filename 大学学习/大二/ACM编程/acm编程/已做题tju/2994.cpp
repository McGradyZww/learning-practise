#include<iostream>
using namespace std;
int main()
{
    int n,m,i,k;
    int a[10],b[10];
    cin >>n;
    while (n>0)
    {
          cin >>m;
          for (i=0;i<m;i++) cin >>a[i];
          for (i=0;i<m;i++) cin >>b[i];
          k=0;
          for (i=0;i<m;i++) k=a[i]*b[i]+k;
          cout <<k<<endl;
          n--;
    }
    system("pause");
    return 0;
}

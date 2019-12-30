#include<iostream>
#include<string>
#include <algorithm>
using namespace std;
int main()
{
    int n,ca,i;
    double a[1000],max,min,k;
    cin>>ca;
    while (ca>0)
    {
          cin>>n;
          cin>>a[0];
          min=a[0];max=a[0];
          for(i=1;i<n;i++) 
          {
                           cin>>a[i];
                           if (a[i]>max) max=a[i];
                           else if (a[i]<min) min=a[i];
          }
          k=max-min;
          cout<<k<<endl;
         
          ca--;
    }
    system("pause");
    return 0;
}

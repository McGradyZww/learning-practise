#include<iostream>
using namespace std;
#include<cmath>
int main()
{
    int a[1000];
    int n,p,i,s1,s2;
    float m,z1,z2;
    cin >>n;
    while (n>0)
    {
          
          cin >>m>>p;
          i=0;
          cin >>a[0];
         
              z1=fabs(a[0]-m/2);s2=0;
              z2=fabs(a[0]-m/2);s1=0;
              if (p>=2)
              {
              for (i=1;i<p;i++)
              {cin >>a[i];
                  
              if (fabs(a[i]-m/2)>=z2) {z2=fabs(a[i]-m/2);s2=i;}
              if (fabs(a[i]-m/2)<=z1) {z1=fabs(a[i]-m/2);s1=i;}
              }
              }
          
          if (a[s1]>=m/2) cout <<m-a[s1]<<" ";
          if (a[s1]<m/2)  cout <<a[s1]<<" ";
          if (a[s2]>=m/2) cout <<a[s2]<<endl;
          if (a[s2]<m/2)  cout <<m-a[s2]<<endl;
          n--;
     }
    system("pause");
    return 0;
}

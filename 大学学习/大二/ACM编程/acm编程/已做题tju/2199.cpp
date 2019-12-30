#include<iostream>
#include<math.h>
#include<algorithm>
using namespace std;
double a[1001];
int n;
int satisfy(int t,double m)
{
    int i,j,p;
    double half;
    half=m/2.0;
    for(i=0;i<t;i++)
    {
       if(a[i]>=half) 
       {
          if(fabs(a[i]-half)<0.000000001&&fabs(a[i+1]-half)<0.000000001) return 1;
          p=i;
          break; 
       }
    }
    for(i=p-1;i>=0;i--)
     for(j=p;j<t;j++)
     {
        if(fabs(a[i]+a[j]-m)<0.000000001) return 1;
        else if((a[i]+a[j])>m) break;
     }
     return 0;
}
int main()
{
    int i,j;
    while(cin>>n)
    {
        if(n==0) break;
        for(i=0;i<n;i++) cin>>a[i];
        if(n<=2) {cout<<-1<<endl;continue;}
        sort(a,a+n);    
        for(i=n-1;i>=0;i--)
        if(satisfy(i,a[i])) 
        {cout<<a[i]<<endl;break;}
        if(i==-1) cout<<"-1"<<endl;
    }
    system("pause");
    return 0;
}

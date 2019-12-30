#include<iostream>
#include<stdio.h>
using namespace std;
int main()
{
    double a[5][5],m,temp1,temp2,temp;
    int n,i,j,b[12];
    for(i=0;i<5;i++)
     for(j=0;j<5;j++)
       cin>>a[i][j];  
    while(cin>>n)
    {
       if(n==0) break;
       for(i=1;i<=n;i++) cin>>b[i];
       b[0]=1;
       b[n+1]=1;
       cin>>m;
       temp2=m;
       for(i=0;i<=n;i++)
       {
          temp1=temp2;
          temp2=a[b[i]-1][b[i+1]-1]*temp1;
          temp2=(int)(temp2*100+0.5);
          temp2/=100;
       }
       printf("%.2f\n",temp2);
    }
    return 0;
}

#include<iostream>
using namespace std;
int main()
{
    int i,n,k=0; 
    cin >>n;
    while (n!=0)
    {
    int a[101][101];
    int x[201];
    for (k=0;k<201;k++)
    x[k]=0;
    for (i=0;i<n;i++)
    {
        k=0;
        for (int j=0;j<n;j++)
        {
            cin >>a[i][j];
            if (a[i][j]==1) k++;    
        }
        x[i]=k;
    }
       int s=1;
    
        for (int t=0;t<n;t++)
        {
            for (k=0;k<n;k++)
            {
                x[n-1+s]=a[k][t]+x[n-1+s];
            }
            s++;
        } 
        int h,d,p,y,z=0;
        for (h=0;h<n;h++)
        {
            y=x[h]%2;
            if (y!=0) {z++;p=h+1;}
            if (z>=2) 
            {cout <<"Corrupt"<<endl;break;}
             
        }
        if (z==0) 
        {
                  for (h=n;h<2*n;h++)
                  {
                      y=x[h]%2;
                     if (y!=0) z++;
                     if (z>=2) {cout <<"Corrupt"<<endl;break;}
                  }
        
        if (z==0) cout <<"OK"<<endl;
        }
        
        if (z==1)
        {
                 for (d=n;d<2*n;d++)
         
                 {
                     y=x[d]%2;
                     if (y!=0) {cout <<"Change bit ("<<p<<","<<d-n+1<<")"<<endl;break;}
                 }
        }
        cin >>n;
    }             
    system("pause");
    return 0;
}

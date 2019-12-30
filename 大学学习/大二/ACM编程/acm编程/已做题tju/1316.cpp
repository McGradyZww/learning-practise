#include<iostream>
#include<memory.h>
using namespace std;
int a[3000][3000];
int main()
{
    int ca,m,n,t,i,j,k,a1,b1,ans;
    cin>>ca;
    while(ca--)
    {
       cin>>m>>n>>t;
       //int a[n+1][m+1];
       memset(a,0,sizeof(a));
       for(i=0;i<t;i++)
       {
           cin>>a1>>b1;
           a[a1-1][b1-1]=1;
       }
       ans=0;
       for(i=0;i<m;i++)  
       {
          k=0;
          j=k; 
          while(j<n)         //这行和预想的不一样，本想让j跳到k,但是这行直接跳出循环了如果j<k; 
          {
              k=j+1;
              if(!a[i][j])
              {
                 
                 while(k<n&&!a[i][k])
                 {
                    k++;
                 }
                 if(k>j+1) ans++;
              }
              j=k; 
          }
                          
       } 
       for(i=0;i<n;i++)  
       {
          k=0;
          j=k; 
          while(j<m) 
          {
              k=j+1;
              if(!a[j][i])
              {
                 
                 while(k<m&&!a[k][i])
                 {
                    k++;
                 }
                 if(k>j+1) ans++;
              }
              j=k; 
          }
                          
       } 
       cout<<ans<<endl;
    }
    system("pause");
    return 0;
}

#include<iostream>
#include<memory.h>
using namespace std;
int a[3000][3000];
int main()
{
    int ca,m,n,t,i,j,k,a1,b1,ans,row,column,p;
    cin>>ca;
    while(ca--)
    {
       cin>>m>>n>>t;
       memset(a,0,sizeof(a));
       for(i=0;i<t;i++)
       {
           cin>>a1>>b1;
           a[a1-1][b1-1]=1;
       }
       ans=0;
       row=m;column=n;
       for(p=0;p<2;p++)
       {
       for(i=0;i<row;i++)  
       {         
          j=0; 
          while(j<column)         //���к�Ԥ��Ĳ�һ����������j����k,��������ֱ������ѭ�������j<k; 
          {
              k=j+1;
              if(p==0){
              if(!a[i][j])
              {                 
                 while(k<column&&!a[i][k])
                 {
                    k++;
                 }
                 if(k>j+1) ans++;
              }
              }
              else {
              if(!a[j][i])
              {
                 while(k<m&&!a[k][i])
                 {
                    k++;
                 }
                 if(k>j+1) ans++;
              }
              }
              j=k; 
          }                                
       } 
       row=n;column=m;  
       } 
       cout<<ans<<endl;
    }
    system("pause");
    return 0;
}

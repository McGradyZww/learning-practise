#include<iostream>
#include<memory.h>
#include<algorithm> 
//#include<stdio.h> 
using namespace std;
//f(j,k) 选j个人使其辩控差为k的且辩控和最大的那个方案的辩控和  -20*m<=k<=20*m
//f(j,k)从上一层f(j-1,x)再加一个人而来，使得加完这人后辩控差为k且辩控和最大的那个作为f(j,k)，需要保存路径
//path(j,k)保存方案f(j,k)最后选的那个人的编号 ,如果f(j,k)不存在则置为-1 
//我们只知道f(0,0)=0，由此一层一层往下推  最后我们要求f(m,k)中绝对值最小且和最大的那个f(m,k) 
int f[21][801];
int path[21][801];
int p[201],d[201];
int ans[21]; 
int comp(const void *s1,const void *s2)
{
    return *((int *)s1)-*((int *)s2); 
} 
int main()
{
    int i,j,k;
    int t1,t2;
    int n,m;
    int nMinP_D;//因为辩控差有负数，因此要加上m*20,记为nMinP_D,保证数组下标都>=0,
    int CaseNo=0; 
    while(cin>>n>>m)
    {
       if(n==0&&m==0) break;
       CaseNo++;
       for(i=1;i<=n;i++)
       cin>>p[i]>>d[i];
       memset(f,-1,sizeof(f));
       memset(path,0,sizeof(path));
       nMinP_D=m*20;
       f[0][nMinP_D]=0;
       for(j=0;j<m;j++)
       {
           for(k=0;k<=nMinP_D*2;k++)
           {
               if(f[j][k]>=0) 
               {
                   for(i=1;i<=n;i++)
                   {
                       if(f[j][k]+p[i]+d[i]>f[j+1][k+p[i]-d[i]]) 
                       {
                           t1=j;t2=k;
                           while(t1>0&&path[t1][t2]!=i) 
                           {
                               
                               t2-=p[path[t1][t2]]-d[path[t1][t2]]; 
                               t1--;
                           } 
                           if(t1==0)
                           {
                              f[j+1][k+p[i]-d[i]]=f[j][k]+p[i]+d[i];
                              path[j+1][k+p[i]-d[i]]=i; 
                           } 
                       } 
                   } 
               }
                
           } 
       } 
       i=nMinP_D;//求f[m][k]中k的最小绝对值,nMinP_D对应着差为0,以此为起点向两边搜索 
       j=0;
       
       while(f[m][i+j]<0&&f[m][i-j]<0)
       {
          j++; 
       } 
       if(f[m][i+j]>f[m][i-j]) k=i+j;
       else k=i-j;
       cout<<"Jury #"<<CaseNo<<endl;
       cout<<"Best jury has value "<<(k-nMinP_D+f[m][k])/2<<" for prosecution and value "<<(f[m][k]-k+nMinP_D)/2<<" for defence:"; 
       cout<<endl;
       for(i=0;i<m;i++)
       {
           ans[i]=path[m-i][k];
           k-=p[ans[i]]-d[ans[i]]; 
       }
       sort(ans,ans+m); 
       for(i=0;i<m;i++)
       cout<<" "<<ans[i];
       cout<<endl<<endl; 
    } 
    system("pause");
    return 0;
}

#include<iostream>
using namespace std;
int main()
{
    int n,m,aLoop[150],i,nCount,nPtr;
    while(cin>>n)
    {
       if(n==0) break;
       
       m=2;
       while(m)
       {
          if(m%(n-1)==1) {m++;continue;}
          for(i=0;i<n;i++) aLoop[i]=i+1;
          aLoop[0]=0;
          nPtr=1;
          for(i=1;i<n;i++)
          {
             nCount=0;
             while(nCount<m)
             {
                while(aLoop[nPtr]==0)
                nPtr=(nPtr+1)%n;
                nCount++;
                nPtr=(nPtr+1)%n;
             }
             nPtr--;
             if(nPtr<0) nPtr=n-1;
             if(nPtr==1&&i<n-1) break; 
             else if(i==n-1) {cout<<m<<endl;}
             aLoop[nPtr]=0;
          }
          if(i==n) break;
          m++;
       }
    }
    system("pause");
    return 0;
}

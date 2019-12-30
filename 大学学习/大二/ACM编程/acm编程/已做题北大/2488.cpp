#include<iostream>
#include<memory.h>
using namespace std;
int m,n,isfound;
int dir[8][2]={{-2,-1},{-2,1},{-1,-2},{-1,2},{1,-2},{1,2},{2,-1},{2,1}};
int isvisted[26][26],ans[26][2],countans;
void DFS(int a,int b)
{
     
         int t,tx,ty; 
         isvisted[a][b]=1;
         ans[countans][0]=a;
         ans[countans++][1]=b;
         if(countans==m*n) {isfound=1;return;} 
         //if(isfound) return; 
         for(t=0;t<8;t++)
         {
             if(isfound) return; 
             tx=a+dir[t][0];
             ty=b+dir[t][1];
             if(tx>=0&&tx<n&&ty>=0&&ty<m&&!isvisted[tx][ty])
             {
                DFS(tx,ty);
                isvisted[tx][ty]=0;//»ØËİ 
                if(!isfound) countans--; 
             } 
             
         }
     
}
int main()
{
    int ca,count=1,i,j,k1,k2;
    char ch;
    cin>>ca;
    while(ca--)
    {
        cin>>m>>n;
        isfound=0;
        cout<<"Scenario #"<<count<<":"<<endl;
        for(i=0;i<n;i++)
        {
          for(j=0;j<m;j++)
          {
             memset(isvisted,0,sizeof(isvisted)); 
             countans=0; 
             DFS(i,j);           
             if(isfound) 
             {
                for(k1=0;k1<m*n;k1++)
                 {ch=ans[k1][0]+'A'; cout<<ch<<ans[k1][1]+1;} 
                  cout<<endl<<endl;
                break;
             }
          }
          if(j!=m) break;
        }
        if(!isfound) cout<<"impossible"<<endl<<endl; 
        count++;
    }
    system("pause");
    return 0;
}

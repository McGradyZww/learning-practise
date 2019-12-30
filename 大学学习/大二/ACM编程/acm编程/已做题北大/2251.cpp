#include<iostream>
#include<string.h>
#include<memory.h>
using namespace std;
int dir[6][3]={{0,-1,0},{0,1,0},{0,0,-1},{0,0,1},{-1,0,0},{1,0,0}};
struct pos{
       int x,y,z;
       int len;
}node[30000];
char maze[30][30][31];
int isvisted[30][30][30];
int t,m,n;
int BFS(int a,int b,int c)
{
     int i,j,nodesize=0,tx,ty,tz;
     node[0].x=a;node[0].y=b;node[0].z=c;node[0].len=0;
     nodesize++;
     isvisted[a][b][c]=1;
     for(i=0;i<nodesize;i++)
     {
        if(maze[node[i].x][node[i].y][node[i].z]=='E') return node[i].len;
        for(j=0;j<6;j++)
        {
           tx=node[i].x+dir[j][0];
           ty=node[i].y+dir[j][1];
           tz=node[i].z+dir[j][2];
           if(tx>=0&&tx<t&&ty>=0&&ty<m&&tz>=0&&tz<n&&!isvisted[tx][ty][tz]&&maze[tx][ty][tz]!='#')
           {
              node[nodesize].x=tx;
              node[nodesize].y=ty;
              node[nodesize].z=tz;
              node[nodesize].len=node[i].len+1;
              isvisted[tx][ty][tz]=1;
              nodesize++;
           }
        }
     }
     return 0;
}
int main()
{
    while(cin>>t>>m>>n)
    {
       if(t==0&&m==0&&n==0) break;
       int i,j,k,a=-1,b,c,ans;
       for(i=0;i<t;i++)
         for(j=0;j<m;j++)
         {
            cin>>maze[i][j];
            if(a<0)
            for(k=0;k<n;k++)
              if(maze[i][j][k]=='S') {a=i;b=j;c=k;break;}
         }
       //isfound=0;
       ans=0;
       memset(isvisted,0,sizeof(isvisted));
       ans=BFS(a,b,c);
       if(ans) cout<<"Escaped in "<<ans<<" minute(s)."<<endl;
       else cout<<"Trapped!"<<endl;
           
           
    }
    
    system("pause");
    return 0;
}

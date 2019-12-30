#include<iostream>
#include<string.h>
using namespace std;
int dir1[4]={0,2,1,3};//靠左策略 左上右下  值对应移动方向的值，即dir3里的一个
int dir2[4]={1,2,0,3};//靠右策略是右上左下 ，下标对应右上左下，值对应移动方向的值，即dir3里的一个 
int dir3[4][2]={{0,-1},{0,1},{-1,0},{1,0}};//每一步的移动方向 左右上下 
int m,n,ans1,ans2,ans3,isfound;
char maze[40][41];
int visited[40][40];
int curdir[40][40];//记录每一位置当前行走方向 
struct pos{
       int x,y;
       int len;
}node[1600];
void lDFS(int i,int j)
{
     //visited[i][j]=1;
     int tx,ty,t1,t2,t;
     for(t=0;t<4;t++)//行走方向变换次数最多4次 
     {
         t1=((curdir[i][j]+2)%4+t+1)%4;//下一步往哪走 记录为dir2[t1] 方向的值是dir3[dir2[t1]] 
         //若上一步是下，则当前方向为上，则搜索顺序左上右下 经总结出这个规律+3取模 
         //curdir[i][j]=t1; //同步更新此位置的当前方向 
         t2=dir1[t1];
         tx=i+dir3[t2][0];
         ty=j+dir3[t2][1];
         if(tx>=0&&tx<n&&ty>=0&&ty<m&&maze[tx][ty]!='#') 
         {
             
             ans1++; 
             curdir[tx][ty]=t1; 
             if(maze[tx][ty]=='E') {isfound=1;return;}  
             lDFS(tx,ty); 
            // visited[tx][ty]=0; 
             if(isfound) return; 
             
             //curdir[i][j]=(t1+2)%4;//上一个位置行走方向和返回的点方向相反 
             //ans1++; 
         } 
     } 
     
} 
void rDFS(int i,int j)//处理ans2 
{
    //visited[i][j]=1;
    int tx,ty,t1,t2,t;
    for(t=0;t<4;t++)//行走方向变换次数最多4次 
    {
         t1=((curdir[i][j]+2)%4+t+1)%4;//下一步往哪走 记录为dir2[t1] 方向的值是dir3[dir2[t1]] 
         t2=dir2[t1];
         tx=i+dir3[t2][0];
         ty=j+dir3[t2][1];
         if(tx>=0&&tx<n&&ty>=0&&ty<m&&maze[tx][ty]!='#') 
         {
             
             ans2++; 
             curdir[tx][ty]=t1; 
             if(maze[tx][ty]=='E') {isfound=1;return;}  
             rDFS(tx,ty); 
             //visited[tx][ty]=0; 
             if(isfound) return; 
             
             //curdir[i][j]=(t1+2)%4;//上一个位置行走方向和返回的点方向相反 
             //ans2++; 
         } 
    } 
        
}
int BFS(int i,int j)
{
    int t,tx,ty,sizecount=0;
    visited[i][j]=1;
    node[0].x=i;node[0].y=j;
    node[0].len=1;sizecount++;
    for(int k=0;k<sizecount;k++)
    {
       
       for(t=0;t<4;t++)
       {
          tx=dir3[t][0]+node[k].x;
          ty=dir3[t][1]+node[k].y;
          if(tx>=0&&tx<n&&ty>=0&&ty<m&&maze[tx][ty]!='#'&&!visited[tx][ty])
          {
              node[sizecount].x=tx;node[sizecount].y=ty;
              node[sizecount].len=node[k].len+1;
              visited[tx][ty]=1;
              if(maze[tx][ty]=='E') return node[sizecount].len;
              sizecount++;
          }
       }
    }
}
int main()
{
    int ca,i,j,ii,jj;
    cin>>ca;
    while(ca--)
    {
        cin>>m>>n;
        for(i=0;i<n;i++)
        cin>>maze[i];
        ii=-1;jj=-1; 
        for(j=0;j<m;j++)
        {
           if(maze[0][j]=='S') {ii=0;jj=j;break;} 
           if(maze[n-1][j]=='S') {ii=n-1;jj=j;break;} 
        } 
        if(ii<0) 
        for(i=0;i<n;i++)
        {
           if(maze[i][0]=='S') {ii=i;jj=0;break;} 
           if(maze[i][m-1]=='S') {ii=i;jj=m-1;break;} 
        } 
        
        memset(curdir,-1,sizeof(curdir));
        if(ii==0) curdir[ii][jj]=3; 
        else if(ii==n-1) curdir[ii][jj]=1;
        if(jj==0) curdir[ii][jj]=2;
        else if(jj==m-1) curdir[ii][jj]=0; 
        //memset(visited,0,sizeof(visited)); 
        ans1=1;
        isfound=0; 
        lDFS(ii,jj); 
        cout<<ans1;  
        
        memset(curdir,-1,sizeof(curdir));
        if(ii==0) curdir[ii][jj]=3; 
        else if(ii==n-1) curdir[ii][jj]=1;
        if(jj==0) curdir[ii][jj]=0;
        else if(jj==m-1) curdir[ii][jj]=2;
        //memset(visited,0,sizeof(visited)); 
        ans2=1;
        isfound=0; 
        rDFS(ii,jj); 
        cout<<" "<<ans2;  
               
        memset(visited,0,sizeof(visited));
        ans3=BFS(ii,jj);
        cout<<" "<<ans3<<endl;
        
        
        
    }
    system("pause");
    return 0;
}

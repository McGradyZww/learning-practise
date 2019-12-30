#include<iostream>
#include<string.h>
using namespace std;
int housenum[64],d[64],house,housecount,D;
char maze[8][9];
int visited[8][8];
int dir[8][2]={{0,-1},{0,1},{-1,0},{1,0},{-1,-1},{-1,1},{1,-1},{1,1}};
//左右上下  左上 右上 左下 右下 
int m,n;
void DFS(int i,int j)
{
     visited[i][j]=1; 
     int t,tx,ty;
     for(t=0;t<8;t++)
     {
        tx=i+dir[t][0];
        ty=j+dir[t][1];
        if(tx>=0&&tx<m&&ty>=0&&ty<n&&maze[tx][ty]=='X'&&!visited[tx][ty]) 
        {
            D+=4;//先加总的后面再减,看他的上下左右是否都是'X' 
            if(visited[tx][ty-1]) D-=2;
            if(visited[tx][ty+1]) D-=2;
            if(visited[tx-1][ty]) D-=2; 
            if(visited[tx+1][ty]) D-=2; 
            housecount++;
            DFS(tx,ty); 
        } 
     } 
}
int main()
{
    int i,j;
    while(cin>>m>>n) 
    {
        if(m==0&&n==0) break;
        for(i=0;i<m;i++)
        {
           cin>>maze[i];
        }
        house=0;
        memset(visited,0,sizeof(visited)); 
        for(i=0;i<m;i++)
        {
           for(j=0;j<n;j++)
           {
               if(!visited[i][j]&&maze[i][j]=='X')
               {
                   housecount=1;
                   D=4;//周长 
                   DFS(i,j);
                   housenum[house]=housecount;//第0个house的单元格个数 
                   d[house]=D; //第0个house的周长 
                   house++;
               }
           }
        }
        double ans=0; 
        for(i=0;i<house;i++)
        {
           ans+=(double)d[i]/housenum[i]; 
        } 
        double k=m*n/4.0;
        if(ans>k) cout<<"NO"<<endl;
        else cout<<"YES"<<endl; 
    }
    system("pause");
    return 0;
}

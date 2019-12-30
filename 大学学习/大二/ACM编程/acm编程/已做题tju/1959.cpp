#include<iostream>
#include<string>
#include<memory.h> 
using namespace std;                        //注意，判断时有8个方向！！！所以这题开始我完全错了！！学习别人的深搜！！很实用的。
int move_x[8]={-1,0,1,1,1,0,-1,-1};      // x,y的八个方向 
int move_y[8]={-1,-1,-1,0,1,1,1,0};      //  
int b[100][100];                      //标记搜索过的坐标 
string s[100];
int m,n; 
void Dfs(int x,int y)                
{
    int i;
    if(s[x][y]=='@'&&!b[x][y])            //完整执行完一个坐标，把相连的所有'@'坐标都标记了 
    { 
       b[x][y]=1;            
       for(i=0;i<8;i++)
       {
          int tx=x+move_x[i];               //变换为8个方向的坐标 
          int ty=y+move_y[i];
          if(ty>=0&&tx>=0&&ty<n&&tx<m)       
          Dfs(tx,ty);                        //递归 
       }  
    } 
} 
int main()
{
    int i,j,sum;
    
    while(cin>>m>>n)
    {
       memset(b,0,sizeof(b)); 
       if(m==0&&n==0) break;
       sum=0; 
       for(i=0;i<m;i++) cin>>s[i];
       for(i=0;i<m;i++)
        for(j=0;j<n;j++)
        {
           if(s[i][j]=='@'&&!b[i][j]) 
           {
               Dfs(i,j);                       //第一个'@'链 
               sum++; 
           } 
        } 
       cout<<sum<<endl; 
    }
    system("pause"); 
    return 0;
}

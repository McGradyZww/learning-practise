#include<iostream>
#include<string.h>
#include<stdio.h>//gets 和 getchar()文件头 
using namespace std;
struct pos{
       int row,column;
       int dir;
}curpos;
char maze[60][61];
char Dir[4]={'N','E','S','W'};
int main()
{
    int m,n,i,r,c,len;
    cin>>m>>n;
    getchar();
    for(i=0;i<m;i++)
    gets(maze[i]);
    cin>>r>>c;
    curpos.row=r-1;
    curpos.column=c-1;
    curpos.dir=0;
    string s;
    getchar();
    int tx,ty;
    while(getline(cin,s))
    {
       len=s.size();
       for(i=0;i<len;i++)
       {
          if(s[i]=='R') 
          {
             curpos.dir=(curpos.dir+1)%4;
          }
          else if(s[i]=='L')
          {
             curpos.dir=(curpos.dir+3)%4;
          }
          else if(s[i]=='F')
          {
             if(curpos.dir==0)
             {
                tx=curpos.row-1;
                ty=curpos.column;
             }
             else if(curpos.dir==1)
             {
                 tx=curpos.row;
                 ty=curpos.column+1;
             }
             else if(curpos.dir==2)
             {
                 tx=curpos.row+1;
                 ty=curpos.column;
             }
             else if(curpos.dir==3)
             {
                 tx=curpos.row;
                 ty=curpos.column-1;
             }
             if(tx>=0&&tx<m&&ty>=0&&ty<n&&maze[tx][ty]!='*')
             {
                 curpos.row=tx;
                 curpos.column=ty;
             }
          }
          else if(s[i]=='Q')
          {
             cout<<curpos.row+1<<" "<<curpos.column+1<<" "; 
             cout<<Dir[curpos.dir]<<endl;
          }
       }
    }
    system("pause");
    return 0;
}

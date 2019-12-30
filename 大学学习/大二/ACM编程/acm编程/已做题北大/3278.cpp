#include<iostream>
using namespace std;
int visited[100001],m,n;
struct arra{
       int pos,len;
}node[100001];
int dir[3]={-1,1,2};
int BFS(int i)
{
    if(i==n) return 0;
    visited[i]=1;
    node[0].pos=i;
    node[0].len=0;
    int count=1,tx,t,j;
    for(j=0;j<count;j++)
    {
        for(t=0;t<3;t++)
        {
           if(t==2) tx=2*node[j].pos;
           else tx=node[j].pos+dir[t];
           if(tx>=0&&tx<=100000&&!visited[tx])
           {
               node[count].len=node[j].len+1;
               node[count].pos=tx;
               visited[tx]=1;
               if(tx==n) return node[count].len;
               count++;
           }
        }
    }
    
}
int main()
{
    cin>>m>>n;
    memset(visited,0,sizeof(visited));
    cout<<BFS(m)<<endl;
    system("pause");
    return 0;
}

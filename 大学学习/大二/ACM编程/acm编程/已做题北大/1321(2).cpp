#include<iostream>
using namespace std;
int ans,n;
char maze[8][9];
int vistedcolumn[8];
void select(int i,int k)  //从第i行开始选，共要选取k行 
{
     int row,column;
     //if(k==0) {ans++;return;} 
     for(row=i;row<=n-k;row++)//第i行未必有满足条件的'#' 
     {
         for(column=0;column<n;column++)
         {
             if(maze[row][column]=='#'&&!vistedcolumn[column])
             {
                if(k>1)
                { 
                 vistedcolumn[column]=1;
                 select(row+1,k-1);
                 vistedcolumn[column]=0; 
                }
                else {
                     ans++; 
                     } 
             } 
         } 
     } 
}
int main()
{
    int k; 
    while(cin>>n>>k)
    {
        if(n==-1) break;
        for(int i=0;i<n;i++)
        cin>>maze[i]; 
        ans=0;
        memset(vistedcolumn,0,sizeof(vistedcolumn)); 
        select(0,k);
        cout<<ans<<endl; 
    } 
    system("pause");
    return 0;
}

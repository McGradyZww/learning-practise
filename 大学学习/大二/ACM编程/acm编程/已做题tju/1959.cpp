#include<iostream>
#include<string>
#include<memory.h> 
using namespace std;                        //ע�⣬�ж�ʱ��8�����򣡣����������⿪ʼ����ȫ���ˣ���ѧϰ���˵����ѣ�����ʵ�õġ�
int move_x[8]={-1,0,1,1,1,0,-1,-1};      // x,y�İ˸����� 
int move_y[8]={-1,-1,-1,0,1,1,1,0};      //  
int b[100][100];                      //��������������� 
string s[100];
int m,n; 
void Dfs(int x,int y)                
{
    int i;
    if(s[x][y]=='@'&&!b[x][y])            //����ִ����һ�����꣬������������'@'���궼����� 
    { 
       b[x][y]=1;            
       for(i=0;i<8;i++)
       {
          int tx=x+move_x[i];               //�任Ϊ8����������� 
          int ty=y+move_y[i];
          if(ty>=0&&tx>=0&&ty<n&&tx<m)       
          Dfs(tx,ty);                        //�ݹ� 
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
               Dfs(i,j);                       //��һ��'@'�� 
               sum++; 
           } 
        } 
       cout<<sum<<endl; 
    }
    system("pause"); 
    return 0;
}

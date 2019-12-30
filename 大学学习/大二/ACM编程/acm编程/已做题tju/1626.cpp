#include<iostream>
using namespace std;
int m[21][21][21]; 
void init()
{
     int i,j,k; 
     for(i=0;i<=20;i++)
     for(j=0;j<=20;j++)
     {
        m[0][i][j]=1; 
        m[i][0][j]=1;
        m[i][j][0]=1;
     } 
     for(i=1;i<=20;i++)
      for(j=1;j<=20;j++)
        for(k=1;k<=20;k++)
        {
           if(i<j&&j<k) m[i][j][k]=m[i][j][k-1]+m[i][j-1][k-1]-m[i][j-1][k];
           else m[i][j][k]=m[i-1][j][k]+m[i-1][j-1][k]+m[i-1][j][k-1]-m[i-1][j-1][k-1]; 
        } 
                     
     
} 
int main()
{
    int a,b,c;
    init(); 
    while(cin>>a>>b>>c&&(a!=-1||b!=-1||c!=-1))
    {
       cout<<"w("<<a<<", "<<b<<", "<<c<<") = "; 
       if(a<=0||b<=0||c<=0)  cout<<1<<endl;
       else if(a>20||b>20||c>20)  cout<<m[20][20][20]<<endl;
       else cout<<m[a][b][c]<<endl; 
    } 
    system("pause");
    return 0; 
} 

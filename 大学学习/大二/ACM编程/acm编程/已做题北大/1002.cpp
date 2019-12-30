#include<iostream>
#include<string>
#include<algorithm>
using namespace std;
int d(int);
int main()
{
    string a[10001],b[10001];
    int n,m,i=0,j,p;
    int l[10001],r[10001];
    cin>>n;
    m=n;
    while(n>0)
    {
              cin>>a[i++];
              l[i]=a[i].size();
              n--;
    }
    for(i=0;i<m;i++)
    {p=0;
         for(j=0;j<l[i];j++)
         {
                            if(a[i][j]=='-') continue;
                            else if(a[i][j]=='A'||a[i][j]=='B'||a[i][j]=='C') b[i][p++]='2';
                            else if(a[i][j]=='D'||a[i][j]=='E'||a[i][j]=='F') b[i][p++]='3';
                            else if(a[i][j]=='G'||a[i][j]=='H'||a[i][j]=='I')  b[i][p++]='4';
                            else if(a[i][j]=='J'||a[i][j]=='K'||a[i][j]=='L')  b[i][p++]='5';
                            else if(a[i][j]=='M'||a[i][j]=='N'||a[i][j]=='O') b[i][p++]='6';
                            else if(a[i][j]=='P'||a[i][j]=='R'||a[i][j]=='S') b[i][p++]='7';
                            else if(a[i][j]=='T'||a[i][j]=='U'||a[i][j]=='V') b[i][p++]='8';
                            else if(a[i][j]=='W'||a[i][j]=='X'||a[i][j]=='Y') b[i][p++]='9';
                            else b[i][p++]=a[i][j];
         }  
                   
    }
    for(i=0;i<7;i++)
    {
                    r[i]=(b[i][0]-'0')*d(6)+(b[i][1]-'0')*d(5)+(b[i][2]-'0')*d(4)+(b[i][3]-'0')*d(3)
                          +(b[i][4]-'0')*d(2)+(b[i][5]-'0')*d(1)=(b[i][6]-'0')*d(0);}
    sort(r,r+m);
    for()
    system("pause");
    return 0;
}
int d(int n)
{
    int r=1;
    for(int i=0;i<n) r*=10;
    return r;
}

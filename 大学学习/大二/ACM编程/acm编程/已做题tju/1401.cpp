#include<iostream>
#include<string>
using namespace std;
int main()
{
    string a,b;
    int i,j,m,n,x;
    while (cin>>a>>b)
    {
          x=0;
          m=a.size();
          n=b.size();
          for (i=0;i<m;i++)
          {
             for (j=x;j<n;j++)
             if (b[j]==a[i]) {x=j+1;break;}   
             if (j==n) {cout <<"No"<<endl;break;}          
          }
          if (i==m) cout <<"Yes"<<endl;
    }
    system("pause");
    return 0;
}

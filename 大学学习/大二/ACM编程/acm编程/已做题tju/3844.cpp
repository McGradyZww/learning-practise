#include<iostream>
#include<string>
using namespace std;
int q(int);
int main()
{
    int n,i,m,j,k,s;
    int b,temp;
    string a[101];
    string p;
    long r;
    while(cin>>n)
    {
             for(i=0;i<n;i++)    cin>>a[i];
             for(i=0;i<n;i++){
                  m=a[i].size();
                  r=0;
                  for(j=0;j<m;j++)
                  {
                      r+=(a[i][j]-'0')*q(m-1-j);
                  }
             k=0;
             b=1;
             while(b!=0)
             {
                        b=r/8;
                        temp=r%8;
                        p[k++]=(char)(temp+'0');
                        r=b;
             }
             for(s=k-1;s>=0;s--)
             cout<<p[s];
             cout<<endl;
             }
    }
    system("pause");
    return 0;
}
int q(int n)
{
    int m1=1;
    for(int i=0;i<n;i++)
    m1*=2;
    return m1;
}

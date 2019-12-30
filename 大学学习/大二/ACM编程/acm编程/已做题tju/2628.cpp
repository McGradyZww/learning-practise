#include<iostream>
#include<string>
using namespace std;
int main()
{
    string a,b,c;
    int n,a1,b1,i,j1,j2,k1,k2;
    int x1[100],x2[100];
    bool p,q;
    cin >>n;
    while (n>0)
    {
          p=true;
          q=true;
          cin >>a>>b;
          a1=a.size();
          b1=b.size();
          for (i=0;i<b1;i++) c[i]=b[b1-1-i];
          for (i=0;i<b1;i++)
          {
              if (p)
              {
              if (i==0) k1=0;
              else k1=x1[i-1]+1;
              for (j1=k1;j1<a1;j1++)
              {
                  if (a[j1]==b[i]) {x1[i]=j1;break;}
              }
              if (j1==a1) p=false;
              }
              if (q)
              {
              if (i==0) k2=0;
              else k2=x2[i-1]+1;
              for (j2=k2;j2<a1;j2++)
              {
                  if (a[j2]==c[i]) {x2[i]=j2;break;}
              }
              if (j2==a1) q=false;
              }
              if ((!p)&&(!q))  {cout <<"NO"<<endl;break;}
          }
          if (i==b1) cout <<"YES"<<endl;
          n--;
    }
    system("pause");
    return 0;
}

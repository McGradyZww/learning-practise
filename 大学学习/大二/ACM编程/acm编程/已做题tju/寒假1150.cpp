#include<iostream>
int const t=409113;
using namespace std;
int f(int);
int main()
{
    int i,a,j,k,d; 
    bool inch[1000001];
    for (i=0;i<=1000000;i++) inch[i]=0;
    inch[t]=1;
    inch[0]=1;
    for (i=1;i<=9;i++) 
    {
       a=f(i);
       inch[a]=1;
       inch[t-a]=1;
    }
    for (i=1;i<=8;i++)
    {
        for (j=i+1;j<=9;j++)
        {
            a=f(i)+f(j);
            inch[a]=1;
            inch[t-a]=1;
        }
    }
    for (i=1;i<=7;i++)
    {
        for (j=i+1;j<=8;j++)
        {
            for (k=j+1;k<=9;k++)
            {
                a=f(i)+f(j)+f(k);
                inch[a]=1;
                inch[t-a]=1;
            }
        }
    }
    for (i=1;i<=6;i++)
    {
        for (j=i+1;j<=7;j++)
        {
            for (k=j+1;k<=8;k++)
            {
                for (d=k+1;d<=9;d++)
                {
                    a=f(i)+f(j)+f(k)+f(d);
                    inch[a]=1;
                    inch[t-a]=1;
                }
            }
        }
    }
    int n;
    cin >>n;
    while (n!=-1)
    {
          if (inch[n]==1) cout <<"YES"<<endl;
          else cout <<"NO"<<endl;
          cin >>n;
    }
    system("pause");
    return 0;
}
int f(int n)
{
    if (n==1) return 1;
    if (n>1) return n*f(n-1);
}

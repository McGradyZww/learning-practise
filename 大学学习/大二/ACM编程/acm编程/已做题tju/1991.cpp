#include<iostream>
#include<string>
#include<memory.h>
using namespace std;
string s[5];
int n;
int dec(string str,int base)
{
    int b[5],sum,i,m;
    m=str.size();
    b[0]=1;
    for(i=1;i<5;i++) b[i]=base*b[i-1];
    sum=0;
    for(i=0;i<m;i++)
    sum+=(str[i]-'0')*b[m-i-1];
    return sum;
}
int satisfy(int m)
{
    int a[5],i,j,ca;
    for(i=0;i<n;i++)
    {
       for(j=0;j<s[i].size();j++)
       if(s[i][j]-'0'>=m) return 0;
    }
    memset(a,0,sizeof(a));
    for(i=0;i<n;i++)
    {
       a[i]=dec(s[i],m);
    }
    ca=a[1]-a[0];
    for(i=1;i<n-1;i++)
    {
       if(ca!=a[i+1]-a[i]) return 0;
    }
    return 1;
}
int main()
{
    int i,p;
    while(cin>>n&&n!=0)
    {
        for(i=0;i<n;i++) cin>>s[i];
        p=0;
        for(i=2;i<=10;i++)
        {
           if(satisfy(i)) {p=1;cout<<"Minimum base = "<<i<<"."<<endl;break;}
        }
        if(!p) cout<<"No base <= 10 can be found."<<endl;
    }
    system("pause");
    return 0;
}

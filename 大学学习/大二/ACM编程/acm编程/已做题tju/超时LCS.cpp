#include<iostream>
#include<string> 
using namespace std;
string a,b;
int max(int m,int n)
{
    if(m>n) return m;
    return n;
}
int c(int m,int n)
{
    if (m==0||n==0) return 0;
    else if(a[m-1]==b[n-1]) 
    return c(m-1,n-1)+1;
    else return max(c(m,n-1),c(m-1,n));
}
int main()
{
    int m,n;
    while(cin>>a>>b)
    {
       m=a.size();
       n=b.size();
       cout<<c(m,n)<<endl;
    }
    system("pause");
    return 0;
} 

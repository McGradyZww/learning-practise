#include<iostream>
int fb(int n);
using namespace std;
int main()
{
    int m;
    while(cin>>m)
    cout<<"fb("<<m<<")="<<fb(m)<<endl; 
    system("pause");
    return 0;   
}
int fb(int n)//斐波那契数列非递归算法 
{
    int a,b,i;
    a=1;b=1;
    if (n==0||n==1) return 1;
    else {for(i=2;i<=n-1;i++)
    {b=a+b;a=b-a;}
    return (a+b) ;}
}

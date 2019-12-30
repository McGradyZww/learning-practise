#include<iostream>
using namespace std;
int fb(int n);
int main()
{
    int m;
    while (cin>>m)
    cout<<"fb("<<m<<")="<<fb(m)<<endl;
    system("pause");
    return 0;   
}
int fb(int n)//斐波那契数列递归算法 
{
    if (n==0||n==1) return 1;
    else return (fb(n-1)+fb(n-2));
}

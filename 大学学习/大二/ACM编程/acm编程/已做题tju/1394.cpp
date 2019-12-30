#include <iostream>
#include <string>
using namespace std;
string input;
bool check(int x,int l)
{
    for(int i=x;i<l;i+=x)                 //////字符串里每x个都跟第一个长x字符比较 
    {
        for(int j=0;j<x;j++)                ////x是右移标度 
            if(input[i+j] != input[j])
                return false;
    }
    return true;
}

void solve()
{
    int l = input.size();
    for(int i=1;i<=l;i++)
        if(l%i == 0)
        {
            if(check(i,l))
            {
                cout<<l/i<<endl; 
                return;
            }
        }
}

int main()
{
    while(cin>>input&&input!=".")
        solve();
    system("pause"); 
    return 0;
}

#include <iostream>
#include <string>
using namespace std;
string input;
bool check(int x,int l)
{
    for(int i=x;i<l;i+=x)                 //////�ַ�����ÿx��������һ����x�ַ��Ƚ� 
    {
        for(int j=0;j<x;j++)                ////x�����Ʊ�� 
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

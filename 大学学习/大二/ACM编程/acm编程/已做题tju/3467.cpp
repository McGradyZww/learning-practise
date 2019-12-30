#include<iostream>
#include<string>
using namespace std;
int main()
{
    string s;
    int n,m,i,sum;
    cin>>n;
    while(n--)
    {
        sum=0;
        cin>>s;
        m=s.size();
        for(i=0;i<m;i++) sum+=s[i]-'0';   
        cout<<sum<<endl;   
    }
    system("pause");
    return 0;
}

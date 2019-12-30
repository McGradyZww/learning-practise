#include<iostream>
#include<string> 
using namespace std;
int main()
{
    string s;
    int i,sum,m; 
    int base[31];
    base[0]=1; 
    for(i=1;i<31;i++) base[i]=2*base[i-1]+1; 
    while(cin>>s&&s!="0")
    {
       sum=0; 
       m=s.size(); 
       for(i=0;i<m;i++)  sum+=(s[i]-'0')*base[m-1-i]; 
       cout<<sum<<endl; 
    } 
    system("pause");
    return 0; 
} 

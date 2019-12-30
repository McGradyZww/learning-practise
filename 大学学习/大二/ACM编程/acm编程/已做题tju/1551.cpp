#include<iostream>
#include<string>
using namespace std;
int main()
{
    string a;
    int m,i,sum;
    while(cin>>a)
    {
       if(a=="0") break;
       m=a.size();
       sum=0;
       for(i=0;i<m;i++) sum+=a[i]-'0';
       int n;
       while(sum>=10)
       {
         n=0;
         while(sum)
         {n+=sum%10;sum/=10;}
         sum=n;
       }
       cout<<sum<<endl;
    }
    return 0;
}


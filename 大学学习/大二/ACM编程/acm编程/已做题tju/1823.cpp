#include<iostream>
#include<string>
using namespace std;
int f(int n)
{
    int i,m=1;
    for(i=0;i<n;i++) m=m*3;
    return m;
}
int main()
{
    int n,i,j;
    string a[13];
    a[0]="-";
    a[1]="- -";
    for(i=2;i<13;i++)
    {
       a[i]=a[i-1];
       for(j=0;j<f(i-1);j++) a[i]+=" ";
       a[i]+=a[i-1];
    }
    while(cin>>n)
    cout<<a[n]<<endl;
    system("pause");
    return 0;
}

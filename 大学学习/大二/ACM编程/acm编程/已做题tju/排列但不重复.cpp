#include<iostream>
using namespace std;
int main()
{
    bool a[2000];
    for (int p=0;p<1000;p++)
    {
        a[p]=false;
    }
    int m,n;
    cin >>n;
    for (int i=0;i<n;i++)
    {
        cin>>m;
        a[m]=true;
    }
    for (int p=0;p<1000;p++)
    {
        if (a[p])
        cout <<p<<" ";
    }
    system("pause");
    return 0;
}

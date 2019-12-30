#include<iostream>
using namespace std;
int main()
{
    int x;
    cin >>x;
    while (x>0)
    {
    bool a[2000],b[2000];
    for (int p=0;p<1000;p++)
    {
        a[p]=false;
        b[p]=false;
    }
    int m,n,j,k;
    cin >>m>>n;
    for (int i=0;i<m;i++)
    {
        cin>>j;
        a[j]=true;
    }
    for (int h=0;h<n;h++)
    {
        cin >>k;
        b[k]=true;
    }
    bool q=true;
    for (int p=0;p<1000;p++)
    {
        if (a[p]&&b[p])
        {
                       if (q)
                       cout <<p;
                       else
                       cout <<" "<<p;
                       q=false;
        }
    }
    cout <<endl;
    x--;
    }
    system("pause");     
    return 0;
}

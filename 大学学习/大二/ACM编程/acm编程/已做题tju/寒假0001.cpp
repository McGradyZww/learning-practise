#include<iostream>
using namespace std;
int f(int);
int main()
{
    int i;
    int sum=0;
    for (i=1;i<=9;i++)
    {
        sum=sum+f(i);  
    }
    cout <<sum<<endl;
    system("pause");
    return 0;
}
int f(int n)
{
    if (n==1) return 1;
    else if (n>1) return n*f(n-1);
}

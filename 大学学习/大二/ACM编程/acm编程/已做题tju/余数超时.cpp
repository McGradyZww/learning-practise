#include<iostream>
using namespace std;
int f(int);
int main()
{
    int n,a;
    cin >>n;
    while (n!=0)
    {
        a=f(n)%2006;
        cout <<a<<endl; 
        cin >>n;       
    }
    system("pause");
    return 0;
}
int f(int n)
{
    int i,k;
    k=n;
    for (i=1;i<n;i++) k=k*n;
    return k;
}

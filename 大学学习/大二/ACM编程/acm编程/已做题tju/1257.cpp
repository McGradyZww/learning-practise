#include<iostream>
using namespace std;
int f91(int);
int main()
{
    int n;
    cin >>n;
    while (n!=0)
    {
          cout <<"f91("<<n<<")"<<" "<<"="<<" "<<f91(n)<<endl;
          cin >>n;
    }
    system("pause");
    return 0;
}
int f91(int n)
{
    if (n>=101) return (n-10);
    else return (f91(f91(n+11)));
}

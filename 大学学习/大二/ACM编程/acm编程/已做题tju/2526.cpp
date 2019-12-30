#include<iostream>
#include<cmath>
using namespace std;
int f(int,int);
int main()
{
    int B,N,i,k1,a,b;
    cin>>B>>N;
    while (B!=0||N!=0)
    {
        for (i=0;i<=B;i++) 
        if (f(i,N)>=B) {k1=i;break;}
        a=f(i-1,N)-B;
        b=f(i,N)-B;
        if (abs(a)<abs(b))  cout <<i-1<<endl;
        if (abs(a)>abs(b)) cout <<k1<<endl;
        cin >>B>>N; 
    }
    system("pause");
    return 0;
}
int f(int A,int N)
{
    int i,k;
    if (A==0) return 0;
    else
    {
    k=1;
    for (i=0;i<N;i++) k=k*A;
    return k;
    }
}

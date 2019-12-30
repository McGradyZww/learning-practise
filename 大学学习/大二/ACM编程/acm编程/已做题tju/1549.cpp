#include <iostream>
#include<stdio.h>
using namespace std;
double g(int);
double f(int);
int main()
{
    int i;
    cout<<"n e"<<endl;
    cout<<"- ";
    for(i=0;i<11;i++) cout<<"-";
    cout<<endl;
    for(i=0;i<3;i++) cout<<i<<" "<<f(i)<<endl;
    for(i=3;i<=9;i++) printf("%d %.9f\n",i,f(i));
    system("pause"); 
    return 0;
}
double g(int n)
{
    int m=1;
    for(int i=1;i<=n;i++) m=m*i;
    return 1.0/m;
}
double f(int n)
{
    if(n==0) return 1;
    double sum=1.0;
    for(int i=1;i<=n;i++)
    sum=sum+g(i);
    return sum;
}

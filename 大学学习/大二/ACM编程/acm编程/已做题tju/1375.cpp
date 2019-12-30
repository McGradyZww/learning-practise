#include<iostream>  //1，11,111,1111.。。被n整除的最小者1的个数 
using namespace std;
int main()
{ 
    int n;            //有些数的倍数可能较大，一个一个除容易超时 
    int a,count;                  //后一个数除以n的余数是（前一个余数*10+1）/n; 
    while(cin>>n)
    {
        count=1;
        a=1; 
        a=a%n;
        while(a!=0)
        {
           count++;
           a=a*10+1; 
           a=a%n; 
        } 
        cout<<count<<endl; 
    } 
    system("pause"); 
    return 0;
}


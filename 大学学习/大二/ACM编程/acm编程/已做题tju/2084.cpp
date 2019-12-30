#include<iostream>
#include<stdio.h>
using namespace std;
int main()
{
    double a,c,dis,speed;
    int b,count=1;
    while(cin>>a>>b>>c){
    if(b==0) break;
    dis=b*a*3.1415927/5280/12;
    speed=dis*3600/c;
    cout<<"Trip #"<<count<<": ";
    printf("%.2f ",dis);
    printf("%.2f\n",speed);
    count++;
    }
    system("pause");
    return 0;
}

#include<iostream>
using namespace std;
int main()
{
    int n,a,b,c,d,e,f,y,x;         /////////y为2*2箱子数，x为1*1箱子数
    int u[4]={0,5,3,1};
    while(1)
    {
       cin>>a>>b>>c>>d>>e>>f;
       if(a==0&&b==0&&c==0&&d==0&&e==0&&f==0) break;
       n=f+e+d+(c+3)/4; ///////c+3/4为3*3箱子数即c除以4向上取整
       y=5*d+u[c%4];
       if(b>y) n+=(b-y+8)/9;
       x=36*n-36*f-25*e-16*d-9*c-4*b;
       if(a>x) n+=(a-x+35)/36;
       cout<<n<<endl; 
    } 
    return 0;
    
}

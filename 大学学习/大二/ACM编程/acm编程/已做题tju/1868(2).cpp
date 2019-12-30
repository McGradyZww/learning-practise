#include<iostream>
#include<math.h> 
using namespace std;
int prim(int a)                          //判断质数 
{ 
        int i; 
        if(a==1) return 0; 
        if(a==2) return 1; 
        if(a%2==0) return 0; 
        for(i=3;i<=sqrt(a);i+=2) 
        { 
            if(a%i==0)return 0; 
        } 
        return 1; 
} 
 
int main()
{
    int n,num,i,m;                  //num质因子数目                    // 
    while(cin>>n)
    { 
       num=0; 
       if(n==0) break;
       for(i=1;i<=sqrt(n);i++)         //sqrt(n)是位于两边因子的中间值,有可能等于,这里考虑其中一半因子 
       {
          if(n%i==0) {                   //能整除i 
          if(prim(i)) num++;             //判断质数 
          m=n/i;                           //判断另一个对应因子是不是质数  
          if(m!=i&&prim(m)) num++;            // 像9这样的，3和3是同一个，得排除 
          } 
          
       } 
       cout<<n<<" : "<<num<<endl; 
    }
    system("pause");
    return 0;
}

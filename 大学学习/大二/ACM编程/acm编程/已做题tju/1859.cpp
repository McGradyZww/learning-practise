#include<iostream>
#include<math.h>
#include<memory.h> 
using namespace std;
/*int prim(int a) /////判断素数的有效快速算法  但是这题还是超时 于是我先找出所有再一一判断！ 
{ 
    int i;   
    if(a%2==0) return 0; 
    for(i=3;i <=sqrt(doublea);i+=2) 
    { 
       if(a%i==0)return 0; 
    } 
    return 1; 
} */
bool b[35000];
 
void init() //找出35000内所有质数 
{
     int i,j; 
     memset(b,1,sizeof(b)); 
     for(i=2;i<35000;i++) 
     if(b[i]) for(j=2;i*j<35000;j++)  b[i*j]=0; 
} 

int main()
{
    init(); 
    int n,i,count;
    while(cin>>n&&n!=0)
    { 
       count=0;
       if(n==4)  cout<<1<<endl; 
       else {
            for(i=3;i<=n/2;i+=2)
            {
               if(b[i]&&b[n-i]) count++;
            }
            cout<<count<<endl;
            } 
    }
    system("pause");
    return 0;
}

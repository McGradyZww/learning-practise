#include<iostream>
using namespace std;
int a[45]; 
void init()
{
     a[1]=2;
     a[2]=3;
     for(int i=3;i<45;i++)
     a[i]=a[i-1]+a[i-2]; 
} 
int main()
{
    init(); 
    int n,m,count=1;
    cin>>n;
    while(n--)
    {
      cin>>m; 
      cout<<"Scenario #"<<count<<":"<<endl;
      cout<<a[m]<<endl<<endl; 
      count++; 
    } 
    system("pause");
    return 0; 
} 

////典型的DP打表输出水题。。。不过用递归却会超时，ORZ

//对于这样一个0,1序列,a1,a2,a3,...a(i-2),a(i-1),a(i)...
//设f(i)为输入的数对应的结果
//用DP做的话,假设f(i-2),f(i-1)已经知道了,那么求f(i)应该如下:
//当取a(i)=0,那么结果肯定和f(i-1)是一样的,因为在后面追加的是0,肯定不会导致存在相邻;
//当取a(i)=1,那么此时只要知道a(i-2)就可以了,因为我们可以使a(i-1)为0,这样就不会导致相邻的1了;
//所以a[i]=a[i-1]+a[i-2]; 

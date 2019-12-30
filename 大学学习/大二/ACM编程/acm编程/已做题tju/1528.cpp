#include<iostream>
using namespace std;
int gcd(int a,int b)
{
    int temp;
    temp=a%b;
    while(temp!=0)
    {
       a=b;
       b=temp;
       temp=a%b;
    }
    return b;
}    
int main()
{
    int n,m,i,a,b;
    int sum;
    cin>>n;
    while(n>0)
    {
        cin>>m;
        a=1;
        for(i=0;i<m;i++)
        {
            cin>>b;
            sum=a/gcd(a,b)*b;//换一下，先除后乘，免得数据溢出 
            a=sum;
        } 
        cout<<sum<<endl;  
        n--; 
    } 
    system("pause");   
    return 0;
}    

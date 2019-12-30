#include<iostream>           
#include<memory.h> 
using namespace std;
int main()
{
    int n,num,i,j,k=0;                   //num质因子数目 
    bool b[1000000];
    int a[100000]; 
    memset(b,1,sizeof(b));
    for(i=2;i<1000000;i++) 
    if(b[i])  {a[k++]=i;for(j=2;i*j<1000000;j++) b[i*j]=0;} 
    
    while(cin>>n)
    {
       num=0; 
       if(n==0) break;
       for(i=0;i<k;i++){ 
       if(a[i]>n) break;
       else if(n%a[i]==0) num++; 
       } 
       cout<<n<<" : "<<num<<endl; 
    }
    system("pause");
    return 0;
}

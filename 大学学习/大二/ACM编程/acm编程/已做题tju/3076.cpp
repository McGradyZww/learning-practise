#include<iostream>
#include<memory.h>
#include<math.h>
using namespace std;
int isprime(int n)
{
    if(n==2) return 1;
    else if(n%2==0) return 0;
    for(int i=3;i<=sqrt(n);i+=2)
    if(n%i==0) return 0;
    return 1;
}
int b[1299710],prime[1299710];
int main()
{
    int n,m,k=0,i,j;
    memset(b,0,sizeof(b));
    for(i=2;i<1299710;i++)
    {
       if(!b[i]) 
       {
          prime[k++]=i;
          for(j=2;i*j<1299710;j++) b[i*j]=1;
       }
    }
    while(cin>>n)
    {
       if(n==0) break;
       if(isprime(n)) cout<<0<<endl;
       else{
            for(i=0;i<k;i++) 
            if(prime[i]>n) break;
            m=prime[i]-prime[i-1];
            cout<<m<<endl;
       }
      
    }
    system("pause");
    return 0;
}

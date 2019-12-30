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
int main()
{
    int n,m,i;
    while(cin>>n)
    {
       if(n==0) break;
       if(isprime(n)) cout<<0<<endl;
       else{
            i=n+1;
            m=0;
            while(!isprime(i))
            {
               m++;
               i++;
            }
            i=n-1;
            while(!isprime(i))
            {
                m++;
                i--;
            }
            m+=2;
            cout<<m<<endl;
       }
      
    }
    system("pause");
    return 0;
}

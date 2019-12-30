#include<iostream>
#include<math.h>
using namespace std;
int isprime(int n)
{
    int i;
    for(i=3;i<=sqrt(n);i+=2)
     if(n%i==0) return 0;
     return 1;
}
int main()
{
   int n,m,prime[1000],i,k=1;
   prime[0]=2;
   for(i=3;i<1000;i++) 
   if(isprime(i)) prime[k++]=i;
   cin>>n;
   while(n--)
   {
      cin>>m;
      if(m<=2) cout<<"no"<<endl;
      else if(m%2==0) cout<<"no"<<endl;
      else{
           if(!isprime(m)) cout<<"no"<<endl;
           else{
               for(i=1;i<k;i++){
               if(m>(prime[0]*prime[0]+prime[k-1]*prime[k-1])) {cout<<"no"<<endl;break;}
               if(m==(prime[0]*prime[0]+prime[i]*prime[i])) 
               {cout<<"yes"<<endl;break;}
               else if(m<(prime[0]*prime[0]+prime[i]*prime[i])) {cout<<"no"<<endl;break;}
               }
               //if(i==k) cout<<"no"<<endl;
                
           }
           
      }
   }
   system("pause");
   return 0;
}

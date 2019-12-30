#include <iostream>
#include <cmath>
using namespace std;
long work(int n)
{
long i,sum=1;
for(i=1;i<=n;i++)
{
   sum*=i;
   while(sum%10==0)
    sum/=10;
  while(sum/10000>0)
    sum%=10000;
}
return sum%10;
//cout<<sum%10<<endl;
}
int main()
{
int n;
while(cin>>n)
   printf("%5d -> %d\n",n,work(n));


return 0;
}

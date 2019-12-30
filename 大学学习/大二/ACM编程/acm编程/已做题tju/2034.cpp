#include <iostream>
#include <iomanip>                    //据说有公式，根据别人的公式做的- -  
using namespace std;

int main()
{
 long a[10001]={0,1,2,6,4,2},b[5]={0,2,4,8,6},i,m,n;
 for(i=6;i<=10000;i++)
 {
  m=i%5;
  n=i/5;
  if(m!=0)
   a[i]=a[i-1]*i%10;
  else
   a[i]=b[(n-1)%4+1]*a[n]%10;
 }
 while(cin>>n)
 {
  if(n==0) cout<<setw(5)<<0<<" -> "<<1<<endl;
  else cout<<setw(5)<<n<<" -> "<<a[n]<<endl;
 }
 return 0;
}


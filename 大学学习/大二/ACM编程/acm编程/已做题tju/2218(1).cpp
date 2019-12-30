#include<iostream>
using namespace std;
int main()
{
int n,m,i,j,k=1; 
while(cin>>n)
{
if(n==0) break; 
m=n;
j=n;
for(i=1;i<=n;i=i+k)
{
j=j*m;
m=j%2006;
if(m<j)
{
j=m;
k=i;
}
}
if(i<n)
{
while(i<n)
{
m=m*n;
i++;
}
m=m%2006;
} 
cout<<m<<endl; 
} 
return 0; 
}


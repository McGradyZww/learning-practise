#include<iostream>
using namespace std;
int main()
{
    int c,n,m,count=1,a[1001],i,j,temp,p,q;
    a[1]=3;
    for(i=2;i<=1000;i++)
    {
       m=0;
       for(j=2;j<=i-1;j++)           //若(i,j)无公约数，则m+1 
       {
           p=i;
           q=j;
           while(q!=0)
           {
              temp=p%q;
              p=q;
              q=temp;
           }
           if(p==1) m++;
       }
       a[i]=a[i-1]+2*(m+1);
    }
    cin>>c;
    while(c--)
    {
       cin>>n;
       cout<<count<<" "<<n<<" "<<a[n]<<endl;
       count++;
    }
    system("pause");
    return 0;
}

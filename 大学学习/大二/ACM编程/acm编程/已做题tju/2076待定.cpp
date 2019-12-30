#include<iostream>
using namespace std;
int main()
{
    int ca,n,i,a,k;
    cin >>ca;
    while (ca>0)
    {
          k=0;
          cin >>n;
          a=n%3;
          if (a==0)
          {
                   for (i=1;i<=n;i++)
                   {
                       if ((i%2==1)&&(i%3!=0)) k++;
                       if ((i%2==0)&&(i%3==0)) k++;
                   }
                   cout <<k<<endl;
          }
          if (a==1) cout <<n<<endl;
          if (a==2) 
          {
                    if (n%2==0) cout <<n/2<<endl;
                    if (n%2==1) cout <<(n+1)/2<<endl;
          }
          ca--;
    }
    system("pause");
    return 0;
}

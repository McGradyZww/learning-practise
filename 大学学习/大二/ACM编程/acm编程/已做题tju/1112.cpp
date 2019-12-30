#include<iostream>
#include<string>
using namespace std;
int main()
{
    string numb;
    int inch[200],sum[200],x[200];
    int m,n,i;
    for (i=0;i<200;i++)
    {
        inch[i]=0;
        sum[i]=0;
    }
    cin >> numb;
    while (numb!="0")
    {
          n=numb.size();
          for (m=n-1;m>=0;m--)
          {
              inch[n-1-m]=numb[m]-'0';
          }
          x[0]=sum[0]+inch[0];
          if (x[0]>=10) sum[0]=x[0]-10;
          else sum[0]=x[0];
          for (i=1;i<200;i++)
          {
              if (x[i-1]>=10) x[i]=sum[i]+inch[i]+1;
              else x[i]=sum[i]+inch[i];
              if (x[i]>=10) sum[i]=x[i]-10;
              else sum[i]=x[i];
          }
          cin >>numb;
    }
    for (m=199;m>=0;m--)
    {
        if (sum[m]!=0) break;
    }
    for (i=m;i>=0;i--)
    { 
        cout <<sum[i];
    }
        cout<<endl;      
    system("pause");
    return 0;
}

#include<iostream>
#include<algorithm>
#include<math.h>
#include<stdio.h>
using namespace std;

int main()
{
    int n,i,j,a,b,temp,count;
    int num[51];
    double result;
    cin>>n;
    while(n!=0)
    {       
               count=0;
               for(i=0;i<n;i++) cin>>num[i];
               sort(num,num+n);
               for(i=n-1;i>=0;i--)
                  for(j=i-1;j>=0;j--)
                  {
                       a=num[i];
                       b=num[j];
                       while(b!=0)
                       {
                          temp=a%b;
                          a=b;
                          b=temp;
                       }
                       if(a==1) count++;
                  }
               result=1.0*3*n*(n-1)/count;
               result=sqrt(result);
               if(count==0) cout<<"No estimate for this data set."<<endl;
               else printf("%.6f\n",result);
               cin>>n;
    }
    system("pause");
    return 0;
}

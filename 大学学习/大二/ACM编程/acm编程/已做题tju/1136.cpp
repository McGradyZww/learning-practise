/*����˼·��������2��3��5��7ѭ�������i��f[i],
��i��f[i]�ض�����ǰi-1����������һ�������2��3��5��7��������һ���ĳ˻���
���Ǵ𰸾ͳ�����*/
#include<iostream>
using namespace std;
int main()
{
    int n,i,j,k;
    long long a[5843];
    a[1]=1;
    int b[4]={2,3,5,7};
    for(i=2;i<=5842;i++)
    {
        a[i]=2000000001;
        for(j=0;j<4;j++)
        {
          for(k=i-1;k>=1;k--)
          {
              if(b[j]*a[k]<=a[i-1]) break;
              if(b[j]*a[k]<a[i]) a[i]=b[j]*a[k];
          }
           }
    }
    while(cin>>n)
    {
       if(n==0) break;
       if(n%10==1&&n%100!=11) cout<<"The "<<n<<"st humble number is "<<a[n]<<"."<<endl;
       else if(n%10==2&&n%100!=12) cout<<"The "<<n<<"nd humble number is "<<a[n]<<"."<<endl;
       else if(n%10==3&&n%100!=13) cout<<"The "<<n<<"rd humble number is "<<a[n]<<"."<<endl;
       else cout<<"The "<<n<<"th humble number is "<<a[n]<<"."<<endl;
    }
    system("pause");
    return 0;
} 

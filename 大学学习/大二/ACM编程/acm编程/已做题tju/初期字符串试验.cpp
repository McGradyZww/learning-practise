#include<iostream>
#include<string>
using namespace std;
int main()
{
    string data,numb,sum,yes;
    cin >>data>>numb;
    while ((data!="0")&&(numb!="0"))
    {
    int m=data.size();
    int n=numb.size();
    int x,p;
    if (m>n)
    {
            sum=numb;
            for (int i=0;i<(m-n);i++)
            {
                sum="0"+sum;
            }
           x=data[m-1]-'0'+sum[m-1]-'0';
           if (x>=10) yes[m-1]=x-10;
           else yes[m-1]=x;
           for (p=m-2;p>=0;p--)
           {
               if ((data[p+1]-'0'+sum[p+1]-'0')>=10) x=data[p]-'0'+sum[p]-'0'+1;
               else x=data[p]-'0'+sum[p]-'0';
               if (x>=10) 
               {
                   yes[p]=x-10;
               }
               else 
               {
                    yes[p]=x;
               }
           }
               if ((data[0]-'0'+sum[0]-'0')>=10) data="1"+yes;
               else data=yes;
               
    }     
    if (m<=n)
    {
             sum=data;
             for (int i=0;i<(n-m);i++)
             {
                 sum="0"+sum;
             }
             x=sum[n-1]-'0'+numb[n-1]-'0';
             if (x>=10) yes[n-1]=x-10;
             else yes[n-1]=x;
             for (p=n-2;p>=0;p--)
             {
                 if ((sum[p+1]-'0'+numb[p+1]-'0')>=10) x=sum[p]-'0'+numb[p]-'0'+1;
                 else x=sum[p]-'0'+numb[p]-'0';
                 if (x>=10) yes[p]=x-10;
                 else yes[p]=x;
             }
             if ((sum[0]-'0'+numb[0]-'0')>=10) data="1"+yes;
             else data=yes;
    }
    cin >>numb;
    }
    for (int q=0;q<data.size();q++)
    cout <<data[q]; 
    system("pause");
    return 0;
}

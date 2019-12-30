#include<iostream>
using namespace std;
int main()
{
    int i,n,m,a,k,c;
    bool b[10000];
    for (i=1;i<10000;i++) b[i]=1;
    for (i=1;i<10000;i++)
    {
        if (b[i]) 
        {
               cout <<i<<endl;
               c=i;
               while (c<10000)
               {
                     k=c;
                     m=0;
                     while (k>=10)
                     { 
                        a=k%10;
                        m=m+a;
                        k=k/10;      
                     }
                     m=m+k;
                     n=m+c;
                     b[n]=0;
                     c=n;
               }
        }
    }
    system("pause");
    return 0;
}

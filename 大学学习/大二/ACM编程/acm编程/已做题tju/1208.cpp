#include<iostream>
using namespace std;
int main()
{
    int n,s;
    cin >>n;
    if (n<=2) cout <<"1";
    if (n==3) cout <<"2";
    int a[1001],b[1001],x[1001];
    a[0]=1;
    b[0]=2;
    x[0]=0;  
    for (int i=1;i<1000;i++)
    {
        a[i]=0;
        b[i]=0;
        x[i]=0;
    }
    if (n>=4)
    {
    for (int m=0;m<n-3;m++)
    {
          for (int p=0;p<1000;p++)
          {
              if (b[p]>=a[p]) a[p]=b[p]-a[p];
              if (b[p]<a[p]) 
              {
                             a[p]=10+b[p]-a[p];
                             a[p+1]=a[p+1]+1;
              }
          }
          x[0]=a[0]+b[0];
          if (x[0]>=10) b[0]=x[0]-10;
          if (x[0]<10) b[0]=x[0];
          for (int q=1;q<1000;q++)
          {
              if (x[q-1]>=10) x[q]=1+a[q]+b[q];
              if (x[q-1]<10) x[q]=a[q]+b[q];
              if (x[q]>=10) b[q]=x[q]-10;
              if (x[q]<10)  b[q]=x[q];
          }
    }
    for (s=1000;s>=0;s--)
    {
        if (b[s]!=0) break;
    }
    while (s>=0)
    {
          cout <<b[s];
          s--;
    } 
    }
    cout<<endl;      
    system("pause");
    return 0; 
}

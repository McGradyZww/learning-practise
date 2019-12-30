#include<iostream>
using namespace std;
int main()
{
    int ca,n,m,i,j,k,max,s,d=1,num;
    int a[1001],b[1001];
    bool c[1001];
    cin >>ca;
    while (ca>0)
    {
          cin >>n>>m;
          k=0;
          num=0;
          for (i=0;i<1001;i++) c[i]=0;
          for (i=0;i<m;i++) {cin >>a[i];k=k+a[i];c[i]=1;}
          if (k<n) cout <<"Scenario #"<<d<<":"<<endl<<"impossible"<<endl<<endl;
          if (k>=n)
          {
             
                while (1)
                {
                      max=0;
                      for (i=0;i<m;i++) if ((a[i]>max)&&(c[i]==1)) {max=a[i];s=i;}
                      c[s]=0;  
                      if (n<=a[s]) {num++;cout <<"Scenario #"<<d<<":"<<endl<<num<<endl<<endl;break;}
                      if (n>a[s]) {n=n-a[s];num++;}
                }
          }
          ca--;
          d++;
    }
    system("pause");
    return 0;
}

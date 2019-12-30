#include<iostream>
using namespace std;
int main()
{
    char a[10],b[10];
    int i,j,k,m,n;
    int x[11],x1[11],x2[11];
    cin >>a>>b;
    while (a[0]!='0'||b[0]!='0')
    {
          k=0;
          for (i=0;i<10;i++) {x1[i]=0;x2[i]=0;}
          m=strlen(a);
          n=strlen(b);
          for (i=m-1;i>=0;i--) x1[m-1-i]=a[i]-'0';
          for (i=n-1;i>=0;i--) x2[n-1-i]=b[i]-'0';
          x[0]=x1[0]+x2[0];
          if (x[0]>=10) k++;
          for (i=1;i<10;i++)
          {
              if (x[i-1]>=10) x[i]=1+x1[i]+x2[i];
              if (x[i-1]<10) x[i]=x1[i]+x2[i];
              if (x[i]>=10) k++;
              
          }
          if (k==0) cout <<"No carry operation."<<endl;
          else if (k==1) cout <<k<<" "<<"carry operation."<<endl;
          else cout <<k<<" "<<"carry operations."<<endl;
          cin >>a>>b;
    }
    system("pause");
    return 0;
}

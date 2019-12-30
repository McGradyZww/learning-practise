#include<iostream>
#include<string>
#include<cmath>
using namespace std;
int main()
{
    string a;
    int i,j,k;
    char b[81],c[81];
    getline(cin,a);
    while (a!="THE END.")
    {
          k=a.size();
          j=0;
          for (i=0;i<k;i++)
          {
              if (('a'<=a[i]&&a[i]<='z')||('A'<=a[i]&&a[i]<='Z')) {b[j]=a[i];j++;}
              
          }
          k=j;
          for (i=0;i<k;i++) c[i]=b[k-1-i];
          for (j=0;j<k;j++)
          {
              if (b[j]==c[j]) continue;
              else 
              if (abs(b[j]-c[j])==32) continue;
              else {cout<<"No"<<endl;break;}
          }
          if (j==k) cout<<"Yes"<<endl;
          getline(cin,a);
    }
    system("pause");
    return 0;
}

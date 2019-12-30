#include<iostream>
#include<string>
using namespace std;
int main()
{
    int n,m,i,j,d,k;
    cin >>n;
    string a;
    int x[100];
    while (n>0)
    {
          cin >>a;
          m=a.size();
          for (i=0;i<81;i++) x[i]=0;
          if (a[0]=='O') x[0]=1;
          for (i=1;i<m;i++)
          {
              if (a[i]=='O') 
              {
                  d=1;
                  for (j=i-1;j>=0;j--)
                  {
                      if (a[j]=='X') break;  
                      d++;         
                  } 
                  x[i]=d;
              }
          }
          k=0;
          for (i=0;i<m;i++) k=k+x[i];
          cout <<k<<endl; 
          n--;
    }
    system("pause");
    return 0;
}

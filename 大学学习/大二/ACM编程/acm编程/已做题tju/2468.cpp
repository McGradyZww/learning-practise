#include<iostream>
#include<string>
using namespace std;
int main()
{
    int n,i,m;
    cin>>n;
    string a;
    char j;
    bool inch[101];
    int x[123];
    while (n>0)
    {
          cin>>a;
          m=a.size();
          for (i=97;i<123;i++) x[i]=0;
          for (i=0;i<101;i++) inch[i]=false;
          for (i=0;i<m;i++)
          {
             x[a[i]]=x[a[i]]+1;
             inch[x[a[i]]]=true;
          }
          for (i=100;i>0;i--)
          {
              if (inch[i])
              {
                          for (j='a';j<'z';j++)
                          if (x[j]==i) cout <<j;
                          break;
              }
          }
          cout <<endl;
          n--;
    }
    system("pause");
    return 0;
}

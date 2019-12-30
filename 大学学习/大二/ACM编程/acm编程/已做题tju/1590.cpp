#include<iostream>
#include<string>
using namespace std;
int main()
{
    int n,i,j,m,d=1;
    string a,b;
    cin >>n;
    while (n>0)
    {
          cin >>a;
          m=a.size();
          for (i=0;i<m;i++)
          {
              if (a[i]!='Z') b[i]=char(a[i]+1);
              else b[i]='A';
          }
          cout <<"String #"<<d<<endl;
          for (i=0;i<m;i++) cout <<b[i];
          cout <<endl<<endl;
          n--;
          d++;
    }
    system("pause");
    return 0;
}

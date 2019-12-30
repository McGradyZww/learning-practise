#include<iostream>
#include<string>
using namespace std;
int main()
{
    int n,d,i,k;
    string a;
    char b[100];
    cin>>n;
    while(n>0)
    {
              cin>>a>>d;
              k=a.size();
              for (i=0;i<k;i++)
              {
                  if (a[i]+d>'z') b[i]=(char)('a'+a[i]+d-'z'-1);
                  else b[i]=(char)(a[i]+d);
              }
              for (i=0;i<k;i++) cout<<b[i];
              cout<<endl;
              n--;
    }
    system("pause");
    return 0;
}

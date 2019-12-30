#include<iostream>
#include<string>
using namespace std;
int main()
{
    int n,i,m;
    cin >>n;
    char ch;
    string a;
    while (n>0)
    {
          cin >>a;
          m=a.size();
          for (i=m-1;i>=0;i--) cout <<a[i];
          cin.get(ch);
          while (ch!='\n')
          {
                cin >>a;
                m=a.size();
                cout <<" ";
                for (i=m-1;i>=0;i--) cout <<a[i];
                cin.get(ch);
          }
          cout<<endl; 
          n--;
    }
    system("pause");
    return 0;
}

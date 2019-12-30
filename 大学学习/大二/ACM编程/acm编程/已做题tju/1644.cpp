#include<iostream>
using namespace std;
int main()
{
    int n,i,j,d=0;
    cin >>n;
    char ch;
    char a[71];
    while (n>0)
    {
          i=0;
          if (!d) cin.get();
          cin.get(ch);
          while (ch!='\n')
          {
                a[i]=ch;
                i++;
                cin.get(ch);
          }
          for (j=i-1;j>=0;j--) cout <<a[j];
          cout <<endl;
          d++;
          n--;
    }
    system("pause");
    return 0;
}

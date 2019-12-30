#include<iostream>
using namespace std;
int main()
{
    int n,m,i,p,q,j;
    cin >>n;
    j=1;
    while (n>0)
    {
          cin >>p>>q;
          cout <<j<<" ";
          m=(p>=q)?p:q;
          for (i=0;i>=0;i++)
          {
              if (((m+i)%p==0)&&((m+i)%q==0)) {cout <<m+i<<" ";break;}
          }
          m=(p<=q)?p:q;
          for (i=0;i>=0;i++)
          {
              if ((p%(m-i)==0)&&(q%(m-i)==0)) {cout <<m-i;break;}
          }
          cout <<endl;
          j++;
          n--;
    }
    system("Pause");
    return 0;
}

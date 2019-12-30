#include<iostream>
using namespace std;
int main()
{
    int a;
    cin >>a;
    while (a!=0)
    {
    bool b=true;
    bool c=true;
    bool d=true;
    int p,q,j,k;
    

          for (int n=2;n<=(a/4.0+0.5);n++)
          {
              b=1;
              c=1;
               int i=2*n-1;
               int m=a-i;
                 for (j=2;j<i;j++)
                 {
                      p=i%j;
                      if (p==0)
                      b=false;
                 }
                 for (q=2;q<m;q++)
                 {
                     k=m%q;
                     if (k==0)
                     c=false;
                 } 
                if (b&&c&&d)
                { 
                    cout <<a<<" "<<"="<<" "<<i<<" "<<"+"<<" "<<m<<endl;
                    d=false;
                }
          }
    
    cin >>a;
    }
    return 0;
}

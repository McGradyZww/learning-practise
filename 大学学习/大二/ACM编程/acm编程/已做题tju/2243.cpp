#include<iostream>
using namespace std;
int main()
{
    int n,a,b,d;
    cin >>n;
    while (n!=0)
    {
          d=0;
          while (n!=1)
          {
              while (((n%2)==0)&&(n!=1))
              {
                n=n/2;
                d++;
              }
              while (((n%2)!=0)&&(n!=1))
              {
                    n=n*3+1;
                    d++;
              }
          }
          cout <<d+1<<endl;
          cin >>n;
    } 
    system("pause");
    return 0;
}

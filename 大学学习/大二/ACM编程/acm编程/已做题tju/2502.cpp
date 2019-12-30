#include<iostream>
using namespace std;
int main()
{
    int n,m,j,k,i,a,num;
    char ch[10];
    cin >>n;
    while (n>0)
    {
          cin >>m;
          for (i=1;i<m;i++)
          {
              if (i<10) k=i;
              else 
              {
                   k=0;
                   num=i;
                   while (num>9)
                   {
                         a=num%10;
                         k=k+a;
                         num=(num-a)/10;
                   }
                   k=k+num;
              }
              if (k==m-i) {cout <<i<<endl;break;}
          }
          if (i==m) cout <<"0"<<endl;
        
          n--;
    }
    system("pause");
    return 0;
}

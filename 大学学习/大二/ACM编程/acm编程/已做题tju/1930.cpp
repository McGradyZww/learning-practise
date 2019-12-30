#include<iostream>
using namespace std;
int main()
{
    int a[15];
    int i,j,b,d;
    cin >>b;
    bool c[200];
    
    while (b!=-1)
    {
         for (i=1;i<200;i++) c[i]=0;
         d=0;
         if (b!=0)   
         { 
          a[0]=b;
          i=1;
          cin >>b;
          while (b!=0)
          {
                a[i]=b;
                i++;
                cin >>b;
          }
          for (j=0;j<i;j++) c[a[j]]=1;
          for (j=0;j<i;j++) {if (c[2*a[j]]) d++;}
          cout <<d<<endl;
         }
        cin >>b;
    }
    system("pause");
    return 0;
}

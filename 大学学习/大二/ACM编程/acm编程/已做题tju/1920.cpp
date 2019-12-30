#include<iostream>
#include<stdio.h>
using namespace std;
int main()
{
    float c,sum;
    scanf("%f",&c);
    while (c!=0.00)
    {
          for (int i=1;i<278;i++)
          {
              sum=0.00;
              for (int j=2;j<=i+1;j++)
              {
                  sum=sum+1.0/j;
                  
              }
            if(sum>=c)  {printf("%d card(s)\n",i);break;}
          }
          scanf("%f",&c);
    }
    system("pause");
    return 0;
}

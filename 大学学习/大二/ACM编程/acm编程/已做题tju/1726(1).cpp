#include <iostream>
#include <string>
using namespace std;

int fabi[50];
void init()
{
    fabi[1]=2;
    fabi[2]=3;
    for (int j=3;j<=45;j++)
    {
        fabi[j]=fabi[j-1]+fabi[j-2];
    }
}

int main()
{
     int n,i=1,num;
     init();
     cin>>n;
     while (n>0)
     {
         cin>>num;
         printf("Scenario #%d:\n",i++);
         printf("%d\n\n",fabi[num]);
         n--;
     }
}

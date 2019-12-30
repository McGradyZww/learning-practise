#include<iostream>
using namespace std;
int main()
{
    int ca,n,i,a,k;
    cin >>ca;
    while (ca>0)
    {
          k=0;
          cin >>n;
          
         
                   for (i=1;i<=n;i++)
                   {
                       if ((i%2==1)&&(i%3!=0)) k++;
                       if ((i%2==0)&&(i%3==0)) k++;
                   }
                   cout <<k<<endl;
         
         
          ca--;
    }
    system("pause");
    return 0;
}

#include<iostream>
using namespace std;
int main()
{
    int num,n,m,k,i=1;
    float b;
    cin >>num;
    while (num>0)
    {
          cin >>n>>m;
          k=2*(m+n)-4+(m-2)*(n-2);
          b=1.0*k;
          cout <<"Scenario #"<<i<<":"<<endl;
          printf("%.2f\n\n",b);
          num--;
          i++;
    }
    system("pause");
    return 0;
}

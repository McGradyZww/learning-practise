#include<iostream>
using namespace std;
int main()
{
   double a[6];
  double *pw=a;
         
    cout <<sizeof(a)<<" "<<sizeof(a[0])<<" "<<sizeof(pw);
    system("pause");
    return 0;
}

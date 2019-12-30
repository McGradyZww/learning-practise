#include<iostream>
using namespace std;
int main()
{
    float a[2];
    int i=0;
    float b;
    cin >>a[1];
    while (a[1]!=999)
    {
          if (i) {b=a[1]-a[0];printf("%.2f\n",b);}
          a[0]=a[1];
          i++;
          cin >>a[1];
        
    }
    cout <<"End of Output"<<endl;
    system("pause");
    return 0;
}

#include<iostream>
using namespace std;
int main()
{
    int i;
    float k,b;
    float a[12];
    for (i=0;i<12;i++) cin >>a[i];
    k=0.0;
    for (i=0;i<12;i++) k=k+a[i];
    b=k/12;
    cout <<"$";
    printf("%.2f\n",b);
    system("pause");
    return 0;
}

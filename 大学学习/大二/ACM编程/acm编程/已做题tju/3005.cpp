#include<iostream>
using namespace std;
int main()
{
    int n,j;
    float m,sum;
    cin >>n;
    string b;
    j=1;
    while (n>0)
    {
          cin >>m>>b;
          cout <<j<<" ";
          if (b=="kg") {sum=m*2.2046;printf("%.4f",sum);cout <<" "<<"lb"<<endl;}
          if (b=="lb") {sum=m*0.4536;printf("%.4f",sum);cout <<" "<<"kg"<<endl;}
          if (b=="l") {sum=m*0.2642;printf("%.4f",sum);cout <<" "<<"g"<<endl;}
          if (b=="g") {sum=m*3.7854;printf("%.4f",sum);cout <<" "<<"l"<<endl;}
          n--;
          j++;
    }
    system("pause");
    return 0;
}
    

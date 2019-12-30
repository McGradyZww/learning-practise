#include<iostream>
#include<cmath>
using namespace std;
int main()
{
    int n;
    float a,b,c,m,k1,k2;
    cin >>n;
    while (n>0)
    {
          cin >>a>>b>>c;
          if (b*b<4*a*c) cout <<"No solution!"<<endl;
          else 
          {
            m=b*b-4*a*c;
            if ((a>0)&&(m>0)) {k1=((-b)-sqrt(m))/(2*a);k2=((-b)+sqrt(m))/(2*a);printf("%.3f",k1);cout<<" ";printf("%.3f",k2);cout<<endl;}
            if ((a<0)&&(m>0)) {k1=((-b)+sqrt(m))/(2*a);k2=((-b)-sqrt(m))/(2*a);cout<<" ";printf("%.3f",k1);printf("%.3f",k2);cout<<endl;}
            if (m==0) {k1=(-b)/(2*a);printf("%.3f",k1);cout<<endl;} 
          }
          n--;
    } 
    system("pause");
    return 0;
} 

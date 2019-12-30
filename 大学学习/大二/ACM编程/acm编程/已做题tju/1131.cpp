#include<iostream>
#include<stdio.h>
#include<math.h>
using namespace std;
int main()
{
    double x1,y1,x2,y2,x3,y3,a,b,c,p,S;
    double sum;   
    while(cin>>x1>>y1>>x2>>y2>>x3>>y3)
    {
              a=sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)); 
              b=sqrt((x2-x3)*(x2-x3)+(y2-y3)*(y2-y3));
              c=sqrt((x3-x1)*(x3-x1)+(y3-y1)*(y3-y1));
              p=(a+b+c)/2;
              S=sqrt(p*(p-a)*(p-b)*(p-c));  
              sum=a*b*c/2/S; 
              sum=3.141592653589793*sum;
              printf("%.2f\n",sum);
    }
   /*先求出3边长,由海伦公式得出面积
S=sqrt(p*(p-a)*(p-b)*(p-c))    p=(a+b+c)/2;
由三角形面积公式S=1/2*a*b*sin(C)
和正弦定理a/sin(A)=b/sin(B)=c/sin(C)=直径
可得直径=a*b*c/2/S;   (a,b,c为三边长)
所以周长即为直径*PI*/ 
     
    system("pause");
    return 0;
}

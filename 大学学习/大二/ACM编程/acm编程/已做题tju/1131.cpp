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
   /*�����3�߳�,�ɺ��׹�ʽ�ó����
S=sqrt(p*(p-a)*(p-b)*(p-c))    p=(a+b+c)/2;
�������������ʽS=1/2*a*b*sin(C)
�����Ҷ���a/sin(A)=b/sin(B)=c/sin(C)=ֱ��
�ɵ�ֱ��=a*b*c/2/S;   (a,b,cΪ���߳�)
�����ܳ���Ϊֱ��*PI*/ 
     
    system("pause");
    return 0;
}

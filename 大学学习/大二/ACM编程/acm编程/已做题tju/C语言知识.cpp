#include<iostream>
#include<stdio.h>//可不加如果只用其中输入和输出的话 
using namespace std;
int main()
{
    float a;//一个浮点数 
    scanf("%f",&a);//等效于cin>>a; 
    printf("a=%f\n",a);//等效于 cout<<a(但受编译器输出位数限制一般是7位)
    cout<<"a="<<a<<endl;//和上面等效
    printf("%f\n",a);  //等效于 cout<<a(但受编译器输出位数限制一般是7位)
    printf("%.f\n",a);//等效于输出整数 
    printf("%.nf\n",a);//等效于输出n位小数
    printf("%n1.n2f\n",a);//等效于保留n1位（包括小数点）有效位，输出n2位小数 
    system("pause");
    return 0;
}

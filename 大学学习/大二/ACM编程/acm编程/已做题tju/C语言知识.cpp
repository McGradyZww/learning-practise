#include<iostream>
#include<stdio.h>//�ɲ������ֻ���������������Ļ� 
using namespace std;
int main()
{
    float a;//һ�������� 
    scanf("%f",&a);//��Ч��cin>>a; 
    printf("a=%f\n",a);//��Ч�� cout<<a(���ܱ��������λ������һ����7λ)
    cout<<"a="<<a<<endl;//�������Ч
    printf("%f\n",a);  //��Ч�� cout<<a(���ܱ��������λ������һ����7λ)
    printf("%.f\n",a);//��Ч��������� 
    printf("%.nf\n",a);//��Ч�����nλС��
    printf("%n1.n2f\n",a);//��Ч�ڱ���n1λ������С���㣩��Чλ�����n2λС�� 
    system("pause");
    return 0;
}

#include<iostream>
using namespace std;
typedef struct{ //˫ջ���� 
        int *top0;//ջ��ָ�� 
        int *top1;//ջ��ָ�� 
        int size;//˫ջ���� 
}DoubStack;
int main()
{
    int size,m,n,num,i,*temp;
    cout<<"ջ�ĳ���:";
    cin>> size;
    int array[size];
    DoubStack a;
    a.top0=array-1;//��ʼ��ջ��ָ�� 
    a.top1=array+size;//��ʼ��ջ��ָ��
    if(a.top0==array-1&&a.top1==array+size) //��ջ�� 
    cout<<"˫ջ��!"<<endl; 
    cout<<"�������:"<<endl;
    cin>>num;
    while(num>0){
    cout<<"����������Ԫ�غͲ���ջ�ı��:" <<endl;//ջ�Ĳ��� 
    cin>>m>>n;
    if (n==0)//����0ջ 
    {
             if (a.top1==a.top0+1) {cout<<"ջ��������ʧ��!"<<endl;break;}
             else {
                  a.top0++;
                  *a.top0=m;
                  } 
    } 
    if (n==1)//����1ջ 
    {
             if (a.top1==a.top0+1) {cout<<"ջ��������ʧ��!"<<endl;break;}
             else{
                  *a.top1--;
                  *a.top1=m;
                  }
    }
    num--;
    }
    cout<<"������˫ջ:"<<endl;
    for (temp=array;temp<=a.top0;temp++)
    cout<<*temp<<" ";
    for (temp=a.top1;temp<=array+size-1;temp++)
    cout<<*temp<<" ";
    cout<<endl;
    if(a.top1==a.top0+1) //��ջ�� 
    cout<<"˫ջ��!"<<endl;
    cout<<"ɾ������:"<<endl;
    cin>>num;
    while(num>0)//ɾ������ 
    {
     cout<<"ɾ��ջ�ı��:"<<endl;
     cin>>m;
     if (m==0) a.top0--;  //ɾ��ջ0ջ��Ԫ�� 
     if(m==1) a.top1++;//ɾ��1ջԪ�� 
     
     
     num--;           
    }
    cout<<"ɾ�����˫ջ:"<<endl;
    for (temp=array;temp<=a.top0;temp++)
    cout<<*temp<<" ";
    for (temp=a.top1;temp<=array+size-1;temp++)
    cout<<*temp<<" ";
    cout<<endl;
    system("pause");
    return 0;
    
}

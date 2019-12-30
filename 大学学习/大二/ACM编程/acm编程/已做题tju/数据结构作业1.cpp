#include<iostream>
using namespace std;
typedef struct{ //双栈定义 
        int *top0;//栈顶指针 
        int *top1;//栈顶指针 
        int size;//双栈长度 
}DoubStack;
int main()
{
    int size,m,n,num,i,*temp;
    cout<<"栈的长度:";
    cin>> size;
    int array[size];
    DoubStack a;
    a.top0=array-1;//初始化栈顶指针 
    a.top1=array+size;//初始化栈顶指针
    if(a.top0==array-1&&a.top1==array+size) //判栈空 
    cout<<"双栈空!"<<endl; 
    cout<<"插入次数:"<<endl;
    cin>>num;
    while(num>0){
    cout<<"请输入插入的元素和插入栈的编号:" <<endl;//栈的插入 
    cin>>m>>n;
    if (n==0)//插入0栈 
    {
             if (a.top1==a.top0+1) {cout<<"栈满，插入失败!"<<endl;break;}
             else {
                  a.top0++;
                  *a.top0=m;
                  } 
    } 
    if (n==1)//插入1栈 
    {
             if (a.top1==a.top0+1) {cout<<"栈满，插入失败!"<<endl;break;}
             else{
                  *a.top1--;
                  *a.top1=m;
                  }
    }
    num--;
    }
    cout<<"插入后的双栈:"<<endl;
    for (temp=array;temp<=a.top0;temp++)
    cout<<*temp<<" ";
    for (temp=a.top1;temp<=array+size-1;temp++)
    cout<<*temp<<" ";
    cout<<endl;
    if(a.top1==a.top0+1) //判栈满 
    cout<<"双栈满!"<<endl;
    cout<<"删除次数:"<<endl;
    cin>>num;
    while(num>0)//删除操作 
    {
     cout<<"删除栈的编号:"<<endl;
     cin>>m;
     if (m==0) a.top0--;  //删除栈0栈顶元素 
     if(m==1) a.top1++;//删除1栈元素 
     
     
     num--;           
    }
    cout<<"删除后的双栈:"<<endl;
    for (temp=array;temp<=a.top0;temp++)
    cout<<*temp<<" ";
    for (temp=a.top1;temp<=array+size-1;temp++)
    cout<<*temp<<" ";
    cout<<endl;
    system("pause");
    return 0;
    
}

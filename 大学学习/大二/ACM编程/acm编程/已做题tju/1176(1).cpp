#include<iostream>
using namespace std;
int b[2600000]={0};//大的数组一定要写在main()外面，否则时会出错的！第一，弹出的对话框一闪就没了 
int a[500001];//第二，交程序的时候会提示Runtime Error 
int main()
{
    int n,temp,i;
    a[0]=0;
    b[0]=1;
    for(i=1;i<=500000;i++)
    {
       temp=a[i-1]-i;
       if(temp>0&&!b[temp]) 
       {
           a[i]=temp;
           b[a[i]]=1;
       }
       else {a[i]=a[i-1]+i;b[a[i]]=1;}
    }
    while(cin>>n)
    {
       if(n==-1) break;  
       cout<<a[n]<<endl;
    }
    system("pause");
    return 0;
}

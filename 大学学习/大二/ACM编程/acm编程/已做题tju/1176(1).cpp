#include<iostream>
using namespace std;
int b[2600000]={0};//�������һ��Ҫд��main()���棬����ʱ�����ģ���һ�������ĶԻ���һ����û�� 
int a[500001];//�ڶ����������ʱ�����ʾRuntime Error 
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

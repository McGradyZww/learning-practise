#include<iostream>
using namespace std;
int a[45]; 
void init()
{
     a[1]=2;
     a[2]=3;
     for(int i=3;i<45;i++)
     a[i]=a[i-1]+a[i-2]; 
} 
int main()
{
    init(); 
    int n,m,count=1;
    cin>>n;
    while(n--)
    {
      cin>>m; 
      cout<<"Scenario #"<<count<<":"<<endl;
      cout<<a[m]<<endl<<endl; 
      count++; 
    } 
    system("pause");
    return 0; 
} 

////���͵�DP������ˮ�⡣���������õݹ�ȴ�ᳬʱ��ORZ

//��������һ��0,1����,a1,a2,a3,...a(i-2),a(i-1),a(i)...
//��f(i)Ϊ���������Ӧ�Ľ��
//��DP���Ļ�,����f(i-2),f(i-1)�Ѿ�֪����,��ô��f(i)Ӧ������:
//��ȡa(i)=0,��ô����϶���f(i-1)��һ����,��Ϊ�ں���׷�ӵ���0,�϶����ᵼ�´�������;
//��ȡa(i)=1,��ô��ʱֻҪ֪��a(i-2)�Ϳ�����,��Ϊ���ǿ���ʹa(i-1)Ϊ0,�����Ͳ��ᵼ�����ڵ�1��;
//����a[i]=a[i-1]+a[i-2]; 

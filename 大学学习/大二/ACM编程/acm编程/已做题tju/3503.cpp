#include<iostream>
#include<string>
using namespace std;
int main()
{
    int n,m,i;
    int a[10002],b[10002];
    bool c[10002];
    cin >>n; 
    while (n>0)
    {
          for (i=0;i<10002;i++)//0֮ǰ���Ǵ�����Ϊϵͳû����������˴�i��0��ʼ����������i��1��ʼ�������� 
          {
              b[i]=0;
              c[i]=0;
          }
          cin >>m;
          for (i=0;i<m;i++) cin >>a[i];
          for (i=0;i<m;i++)
          {
              b[a[i]]=b[a[i]]+1;
              c[b[a[i]]]=1;
          }
          for (i=10000;i>0;i--)
          {
              if (c[i]) {cout <<i<<endl;break;}
          }
          
          n--;
    }
    
    system("pause");
    return 0;
}

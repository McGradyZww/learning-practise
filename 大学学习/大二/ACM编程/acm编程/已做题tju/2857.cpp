#include<iostream>
#include<string>
using namespace std;
int f(int);
int main()
{
    string a[100];//��Ϊ���� 
    int n,i,m,d,j,k,end;
    int x[100];//���㳤�� 
    bool inch[11];//��ǳ��ֹ������� 
    int num[11];//������� 
    int sum[50];//������������֮ǰд��10����Ӧ��50���߸��� 
    cin >>n;
    while (n!=0)
    {
              
          for (i=0;i<n;i++) {cin >>a[i];x[i]=a[i].size();}
          for (i=0;i<n;i++)
          {
              for (j=0;j<10;j++) {num[j]=0;inch[j]=0;}
              for (j=0;j<x[i];j++) 
              {
                  m=a[i][j]-'0';
                  if (m!=0) {inch[m]=1;num[m]=num[m]+1;}
              }
              sum[i]=0;
              d=0;
              for (j=9;j>0;j--)
              {
                  if (inch[j]) 
                  {
                     for (k=0;k<num[j];k++)   
                     {sum[i]=sum[i]+j*f(d);d++;}
                  }
              }
          }
          end=sum[0];
          for (j=1;j<n;j++) {if (end<sum[j])  end=sum[j];}
          cout <<end<<endl;
          cin >>n;
    } 
    system("pause");
    return 0;
}
int f(int q)
{
    int i,k=1;
    for (i=0;i<q;i++) k=10*k;
    return k;
}

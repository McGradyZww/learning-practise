#include<iostream>
using namespace std;
int main()
{
    int m,n,i,j,sum,a1,b1,p,n1;              
    int a[50],b[50];
    while(cin>>m)
    {
       if(m==0) break;
       n=1;
       i=1;
       while(m>4*i)       //����mֵ��Ӧ������ n,4��һ���ֻ�,1-4,5-8,9-12....... 
       {
           n++;
           i++;
       }
       if(m==1) {cout<<"Printing order for "<<1<<" pages:"<<endl;
                 cout<<"Sheet "<<1<<", front: Blank, "<<1<<endl;
                 continue;
       }
       sum=4*n+1;            //�������Ϊ��ʱ�ĺ� 
       a1=0;                 
       b1=0;
       p=0;
       n1=0;
       for(i=2*n;i>=1;i--)          //a[n],b[n]�洢������������ʱ������ֵ 
       {
           if(sum-i<=m)             //����һ��ʱ��������������һ����m 
           {
              if(p==0)              //��Ϊ�����Ĵ洢��p��Ϊ��� 
              {
                 a[a1++]=i;            
                 b[b1++]=sum-i;
                 p=1;
              }
              else{
                 p=0;
                 a[a1++]=sum-i;
                 b[b1++]=i;
              }
            if(sum-i<=m)  n1++;              //n1Ϊ���漸������� 
            else break;
           }
       }
       cout<<"Printing order for "<<m<<" pages:"<<endl;
       p=0;
       for(i=0;i<2*n-n1;i++)             // �����漸���⣬ǰ����о�ֻ��һ������,������������ 
       {
           if(p==0)
           {
              cout<<"Sheet "<<i/2+1<<", front: Blank, "<<i+1<<endl;
              p=1;
           }
           else{
              cout<<"Sheet "<<i/2+1<<", back : "<<i+1<<", Blank"<<endl;
              p=0;
           }
       }
       
       
        if(n1%2==0)  p=0;
        else p=1;
          for(i=2*n-n1;i<2*n;i++)            //������漸��,a[i]��b[i]�������ֵ� 
          {
            if(p==1){
                 cout<<"Sheet "<<i/2+1<<", back : "<<a[--a1]<<", "<<b[--b1]<<endl;
                 p=0;
              }
              else{
                   cout<<"Sheet "<<i/2+1<<", front: "<<a[--a1]<<", "<<b[--b1]<<endl;
                   p=1;
              }
          }          
    }
    system("pause");
    return 0;
}

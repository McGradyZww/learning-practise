#include<iostream>
#include<memory.h>
#define MAX 999999
using namespace std;
int a[201],b[201],ans[21],num[21],di[21],pi[21];
int m,n1,result=MAX,result1,result2,d,p,d1,p1;
void zuhe(int k,int min)//��m��Ԫ����ȡ��k��Ԫ�ص����,��min��ʼȡ
{
    int i,j;
    for(i=min;i<=m-k+1;i++)  //���һ��λ�õ�Ԫ��num[k]����ȡ1.2...m-k+1; 
    {
        num[n1-k]=i;//��ȡ�����±�
        di[n1-k+1]=di[n1-k]+a[i-1];
        pi[n1-k+1]=pi[n1-k]+b[i-1];
        if(k>1) zuhe(k-1,i+1);//�ݹ����,�����i+1��ʼȡ
        else
        {
            //int count=0; 
            //result1=0;
            
            result1=di[n1]-pi[n1];
            if(result1<0) result1=0-result1;
            if(result1<result) 
            {
               for(j=0;j<n1;j++)
               {
                  ans[j]=num[j];
               }
               result=result1;
               
               d=di[n1];p=pi[n1];
            }
            else if(result1==result)
            {
                 
                 if((di[n1]+pi[n1])>(d+p))
                 {
                    for(j=0;j<n1;j++)
                    {
                      ans[j]=num[j];
                    }
                    d=di[n1];p=pi[n1];
                 }
            }
                
        }
    }
}
int main()
{
    int n,count=1,i;
    while(cin>>n>>n1)
    {
       if(n==0&&n1==0) break;
       for(i=0;i<n;i++)
       cin>>a[i]>>b[i];
       cout<<"Jury #"<<count<<endl;
       count++;
       m=n;
       memset(di,0,sizeof(di));
       memset(pi,0,sizeof(pi));
       result=MAX;
       zuhe(n1,1);
       cout<<"Best jury has value "<<d<<" for prosecution and value "<<p<<" for defence:"<<endl;
       for(i=0;i<n1;i++)
       {
           cout<<" "<<ans[i];
       }
       cout<<endl<<endl;
    }
    system("pause");
    return 0;
}

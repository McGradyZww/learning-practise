#include<iostream>
using namespace std;
int num[7],end,t,a[12],m;//m��Ϊȫ�ֱ��� 
void zuhe(int k,int min)//��m��Ԫ����ȡ��k��Ԫ�ص����,��min��ʼȡ 
{
    int i,j;
    for(i=min;i<=m-k+1;i++)  //���һ��λ�õ�Ԫ��num[k]����ȡ1.2...m-k+1; 
    {
        num[k]=i;//��ȡ�����±� 
        if(k>1) zuhe(k-1,i+1);//�ݹ����
        else
        {
            int count=0; 
            for(j=end;j>=1;j--)
            {if(count!=0) cout<<" "; cout<<a[num[j]-1];count=1;} 
                cout<<endl;
        }
    }
}
int main()
{
    int n,i,count=0;
    while(cin>>n)
    {
       if(n==0) break;
       for(i=0;i<n;i++) cin>>a[i]; 
       end=6; 
       m=n;     
       if(count!=0) cout<<endl;
       zuhe(6,1); 
       count=1;
    }
    system("pause");
    return 0;
}

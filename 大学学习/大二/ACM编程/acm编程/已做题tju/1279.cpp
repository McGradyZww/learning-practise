#include<iostream>  
#include<algorithm> 
using namespace std;
int main()
{ 
    int n,m,i,sum[1001],a[1001];
    cin>>n;
    while(n>0)//��ÿ����Сֵ����������������Ա�������ܸ��� 
    {
              cin>>m;
              for(i=0;i<m;i++) cin>>a[i]; 
              sort(a,a+m); 
              for(i=0;i<m;i++)
              {
                  sum[i]=a[i]*(m-i); 
              }
              sort(sum,sum+m);
              cout<<sum[m-1]<<endl; 
              n--; 
    } 
    system("pause"); 
    return 0;
}


#include<iostream>
#include<algorithm>
#include<math.h>
using namespace std;
int f(int m)               //����2^m�η�,��Ȼ��pow����,���ǲ�����,��һ�ḡ�����Ƚ�ʱ���� 
{
    int sum=1,i;
    for(i=0;i<m;i++) sum*=2;
    return sum;
}
int main()
{
    int n,i,j,m,temp,p;
    float s,a[20],sum;
    while(cin>>n>>s)
    {
      if(n==0&&s==0) break;
      for(i=0;i<n;i++) cin>>a[i];
      sort(a,a+n);                  
      for(i=0;i<n;i++){ 
        if(a[i]>s) {m=i;break;}        //�ҵ�����s�ĵ�һ��λ�ã�����û�� 
      }
      if(m>n) m=n;
      sum=0.0;
      for(i=1;i<=f(m);i++)           //һ����2^m�������ÿ�������Ӧ��һ�ּӺ� 
      {
         j=0;
         p=i;
         while(p!=0)
         {
            temp=p%2;
            sum+=1.0*temp*a[j++];
            if(fabs(sum-s)<0.000001) {cout<<"Yes"<<endl;break;}   //���ҵ��Ӻ͵���s����� 
            p=p/2;
         }
         if(p!=0) break;
      }
      if(i>f(m)) cout<<"No"<<endl;
    }
    system("pause");
    return 0;
}

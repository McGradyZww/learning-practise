#include<iostream>//�ö���������ʽ���� 
using namespace std;
struct{
       double x;
       double y;
}point[100];
int main()
{
    int n,area,i;
    double s;
    while(cin>>n)
    {
       if(n==0) break;
       for(i=0;i<n;i++)
       cin>>point[i].x>>point[i].y;
       s=0.0;
       for(i=0;i<n-1;i++)
       {
          s+=point[i].x * point[i+1].y - point[i+1].x*point[i].y;//S=0.5*��Xk*Yk+1-Xk+1*Yk +0.5xn*y1-x1*yn;  
       }
       s+=point[n-1].x*point[0].y-point[0].x*point[n-1].y;
       s*=0.5;
       if(s<0) s=0-s;                          //���s<0����Ӿ���ֵ���У�������Ϊ���˳ʱ�����ʱ������ 
       area=(int)(s+0.5);
       cout<<area<<endl;
    }
    system("pause");
    return 0;
}

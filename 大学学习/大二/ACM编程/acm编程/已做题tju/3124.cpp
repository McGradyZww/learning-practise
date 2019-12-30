#include<iostream>//用多边形面积公式解题 
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
          s+=point[i].x * point[i+1].y - point[i+1].x*point[i].y;//S=0.5*∑Xk*Yk+1-Xk+1*Yk +0.5xn*y1-x1*yn;  
       }
       s+=point[n-1].x*point[0].y-point[0].x*point[n-1].y;
       s*=0.5;
       if(s<0) s=0-s;                          //如果s<0，则加绝对值就行，这是因为点的顺时针或逆时针问题 
       area=(int)(s+0.5);
       cout<<area<<endl;
    }
    system("pause");
    return 0;
}

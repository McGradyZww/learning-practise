#include<stdio.h>//////////////���� ����֡������ϵĵ�Ϊʲô��������ֱʱΪʲô����Ϊ0�������� 
int main()
{
   int t;
   double x1,y1,x2,y2,xs,ys,xe,ye;
   double k1,k2,x3,y3,a,b;
   scanf("%d",&t);
   while(t--)
   {
       scanf("%lf%lf%lf%lf%lf%lf%lf%lf",&x1,&y1,&x2,&y2,&xs,&ys,&xe,&ye);
       if(x1==x2)
       {
           y3=ys;
           x3=(-1)*xs;
           k2=(ye-y3)/(xe-x3);
           a=0;///////////?
           b=ye-k2*xe;
       }
       else
       {
           k1=(y1-y2)/(x1-x2);
           y3=(k1*k1*ys-ys+2*xs*k1+2*y2-2*k1*x2)/(1+k1*k1);
           x3=xs-k1*y3+k1*ys;
           if(xe==x3)
           {
               a=0;//////////////////??
               b=y2-k1*x2;
           }
           else
           {
               k2=(ye-y3)/(xe-x3);
               a=(ye-y2+k1*x2-k2*xe)/(k1-k2);
               b=k1*a-k1*x2+y2;
           }
       }
       printf("%.3f %.3f\n",a,b);
   }
   return 0;
}

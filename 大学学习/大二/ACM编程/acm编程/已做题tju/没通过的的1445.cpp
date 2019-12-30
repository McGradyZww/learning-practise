#include<iostream>
using namespace std;
int main()
{
   long a[100000];
   long n,m,p,i,x,y,z,w,b2;
   cin >>n;
   bool b[1000000];
  
   
   bool left,b1;
   bool right;
   
   while (n>0)
   { 
         for (i=0;i<1000000;i++)
         b[i]=0;
         left=false;
         b1=false;
         right=false;
         x=0;y=0;z=0;w=0;
         cin >>m>>p;
         b2=m;
         for (i=0;i<p;i++)
         {
             cin >>a[i];
             b[a[i]]=true; 
             if (a[i]<=m/2) left=true;
             if (a[i]>m/2) right=true;
             if (a[i]>b2) b2=a[i];
         }
         if (left)
         {
                  for (i=0;i<=m/2;i++) 
                  {
                      if (b[i]) {x=i;
                      if (i==0) b1=true;
                       break;}
                  } 
                  for (i=m/2;i>=0;i--)
                  {
                      if (b[i]) {y=i;break;}
                  }      
         }
         if (right)
         {
                   
                   for (i=m/2+1;i<=b2;i++)
                   {
                       if (b[i]) {z=i;break;}
                   }
                   for (i=b2;i>m/2;i--)
                   {
                       if (b[i]) {w=i;break;}
                   }
         }
         if ((x!=0)||((x==0)&&(b1)))
         {
                   if (z==0)
                   cout <<y<<" "<<m-x<<endl;
                   if (z!=0) 
                   {
                              if (y>=(m-z)) cout <<y<<" ";
                              if (y<(m-z)) cout <<m-z<<" ";
                              if ((m-x)>=w) cout <<m-x<<endl;
                              if ((m-x)<w)     cout <<w<<endl;
                   }
         }
         if ((x==0)&&(!b1))
         {
                   cout <<"0"<<" "<<w<<endl;
         }
           
         n--;
   }
    system("pause");
    return 0;
}

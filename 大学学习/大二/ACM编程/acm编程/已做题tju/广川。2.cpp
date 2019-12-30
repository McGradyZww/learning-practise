#include <iostream>
#include <iostream>
using namespace std;
int main()
{
  int i,t,m,n,x,y,p,q,e;
  string a;
   while(cin>>n)
   {
           if(n==0)
           break;
           cin>>a;
           m=a.size();
           for(t=1;t<=2n+3;t++)
           {
               if(t==1)
               for(i=0;i<=m-1;i++)
               {
          if(a[i]=='1'||a[i]=='4')
          for(e=1;e<=n+3;e++)
          {
           cout<<" ";
             }
        else
       {
         cout<<" ";
          for(e=1;e<=n;e++)
          {
             cout<<"-";
          }   
                         cout<<" "<<" ";
          }
                }
                else if(t>1&&t<=n+1)
                 for(i=0;i<=m-1;i++)
                 {     
        if(a[i]=='1'||a[i]=='2'||a[i]=='3'||a[i]=='7')
                     { 
               for(e=1;e<=n+1;e++)
              {
             cout<<" ";
                 }
                 cout<<"|";
                 cout<<" ";
      }
           else if(a[i]=='5'||a[i]=='6')
          {  
              cout<<"|";
            for(e=1;e<=n+2;e++)
            {
                cout<<" ";
            }   
             }
             else
             {
           cout<<"|";
           for(e=1;e<=n;e++)
           {
                  cout<<" ";
              }
              cout<<"|";
              cout<<" ";
          }  
                 }
                 else if(t==n+2)
                 for(i=0;i<=m-1;i++)
                 {     
        if(a[i]=='1'||a[i]=='7'||a[i]=='0')
                     { 
               for(e=1;e<=n+3;e++)
              {
             cout<<" ";
                 }
      }
             else
             {
           cout<<" ";
           for(e=1;e<=n;e++)
           {
                  cout<<"-";
              }
              cout<<" "<<" ";
          }  
                 }
        else if(t>n+2&&t<2*n+3)
        for(i=0;i<=m-1;i++)
                 {     
        if(a[i]=='1'||a[i]=='3'||a[i]=='4'||a[i]=='5'||a[i]=='7'||a[i]=='9')
                     { 
               for(e=1;e<=n+1;e++)
              {
             cout<<" ";
                 }
                 cout<<"|";
                 cout<<" ";
      }
           else if(a[i]=='2')
          {  
              cout<<"|";
            for(e=1;e<=n+2;e++)
            {
                cout<<" ";
            }   
             }
             else
             {
           cout<<"|";
           for(e=1;e<=n;e++)
           {
                  cout<<" ";
              }
              cout<<"|";
              cout<<" ";
          }  
                 }
                 else
                 for(i=0;i<=m-1;i++)
                 {
            if(a[i]=='1'||a[i]=='4'||a[i]=='7')
            for(e=1;e<=n+3;e++)
            {
              cout<<" ";
               }
          else
         {
         cout<<" ";
          for(e=1;e<=n;e++)
          {
             cout<<"-";
          }   
                         cout<<" "<<" ";
            }
                 }
   }
  }
   system("pause");
   return 0;
}

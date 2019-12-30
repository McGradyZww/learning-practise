#include <iostream>
using namespace std;
int main()
{
    int n,i,t;
    int a[1000];
    while(cin>>n)
    {
         if(n==0)
         break;
         if(n==1)
         {
       while(cin>>a[0])
       {
              if(a[0]==0)
              break;
             cout<<"Yes"<<endl;
     }
     if(a[0]==0)
     {
            cout<<endl;
            continue;
           }
         }
         while(1)
         {
            cin>>a[0];
            if (a[0]==0)
            {
                   cout<<endl;
                   break;
            }
            for(i=1;i<=n-1;i++)
            {
                 cin>>a[i];
            }
            for(i=1;i<=n-2;i++)
            {
                 if(a[i]>a[i-1])
                 continue;
                 for(t=i+1;t<=n-1;t++)
                 {
                      if(a[t]>a[i]&&a[t]<a[i-1])
                      {
                          cout<<"No"<<endl;
                          break;
                      }
                 }
                  if(a[t]>a[i]&&a[t]<a[i-1])
                  break;
            }
            if(i==(n-1))
            cout<<"Yes"<<endl;
         }  
     } 
     system("pause");
     return 0;
}


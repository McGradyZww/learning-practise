#include<iostream>
using namespace std;
int main()
{
    int n,i,j,b,k,d;
    cin >>n;
    bool c[1000];
    bool m=false;
    while (n!=0)
    {
          int a[n];
          d=0;
          if (n==1) 
          { 
           cin >>a[0];
          while (a[0]!=0)
          {
          
          
                  
                    if (d==0)
                    {
                    if (m) 
                    cout <<endl<<"Yes"<<endl;
                    if (!m) cout <<"Yes"<<endl;
                    }
                    if (d!=0) cout <<"Yes"<<endl;
                    d++;m=true;
          
          cin >>a[0];
          }
          }
          if (n>1)
          {
         
         
          cin >>a[0];
          while (a[0]!=0)
          {
               for (i=0;i<1001;i++) c[i]=false;//(1)
              
               for (k=1;k<n;k++)  
               cin >>a[k];
               
               for (i=0;i<(n-2);i++) 
               {
                   c[a[i]]=true;
                   if (a[i]>a[i+1]) 
                   {
                       b=a[i]-a[i+1];
                       if (b==1) continue;
                       for (j=1;j<b;j++)
                       {
                           if (!c[a[i+1]+j])
                           {
                             if (d==0)
                             {
                                if (m)
                                {
                                     cout <<endl;
                                     cout <<"No"<<endl;
                                }
                               if (!m) cout <<"No"<<endl; 
                               }
                               if (d!=0) cout <<"No"<<endl;
                               break;
                           }
                       }
                       if (j==b) continue;
                       if (j!=b) break;             
                   }
                   if (a[i]<a[i+1]) continue;
               }
               if (i==(n-2)) 
               {
                    if (d==0)
                    {if (m)
                    {
                        cout <<endl<<"Yes"<<endl;
                        if (d!=0) cout <<"Yes"<<endl;
                    } 
                    if (!m) cout <<"Yes"<<endl; 
                    }
                    if (d!=0) cout <<"Yes"<<endl;
               }
               cin >>a[0]; 
               m=true;d++;
                
          }
          }
          cin >>n; 
         
         
    }
    
    system("pause");
    return 0;
}

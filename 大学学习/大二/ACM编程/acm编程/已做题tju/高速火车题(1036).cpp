#include<iostream>
using namespace std;
int main()
{
    int n,i,j,k;
    cin >>n;
    
    int a[1001];
    bool inch[1001];
    while (n!=0)
    {
          cin >>a[0];
          while (a[0]!=0)
          {   
              for (i=1;i<1001;i++) inch[i]=true;
              if (n==1)
              {
                
                 
                     cout <<"Yes"<<endl;
                    
                 
                 
                 
                
                 
              }
              if (n>1)
              {
                 for (i=1;i<n;i++) cin >>a[i];
                 for (j=0;j<(n-1);j++)
                 {
                   inch[a[j]]=false;
                   if (a[j+1]>a[j]) continue;
                   if (a[j+1]<a[j]) 
                   {
                      for (k=1;k<a[j];k++)
                      {
                        if ((a[j]-k)==a[j+1]) break;
                        if ((a[j]-k)>a[j+1]) 
                        {
                          if (!inch[(a[j]-k)]) continue;
                          if (inch[(a[j]-k)]) 
                          {
                             
                             
                             cout <<"No"<<endl; 
                             break;
                          }
                        }
                      }
                      if ((a[j]-k)==a[j+1]) continue;
                      if (inch[(a[j]-k)]) break;                        
                   }
                   }
                   if (j==(n-1)) 
                   {
                     
                     
                       cout <<"Yes"<<endl;
                     
                     
                   }
                 
               
              
                        
              }
              cin >>a[0];
          }
          cout <<endl;
    cin >>n;
    }
    system("pause");
    return 0;
}

#include<iostream>
using namespace std;
int main()
{
    int n,i,j=0;
    int a[20],b[20],c[20],d[20]; 
    int sum1,sum2; 
    while(cin>>n&&n!=0)
    {
          
          for(i=0;i<n;i++) cin>>a[i];
          for(i=0;i<n;i++) cin>>b[i];
          for(i=0;i<n;i++)
          {
              if(a[i]==1&&b[i]==2) 
              {c[i]=6; d[i]=0;}
              else if(a[i]==2&&b[i]==1)    
               {c[i]=0; d[i]=6;} 
               else if(a[i]-b[i]==1)   {d[i]=a[i]+b[i];c[i]=0;} 
               else if(b[i]-a[i]==1)   {c[i]=a[i]+b[i];d[i]=0;}  
               else if(a[i]>b[i]) {c[i]=a[i];d[i]=0;} 
               else if(b[i]>a[i]) {d[i]=b[i];c[i]=0;} 
               else {c[i]=0;d[i]=0;} 
          }
          sum1=0;
          sum2=0; 
          for(i=0;i<n;i++)
          {
               sum1+=c[i];
               sum2+=d[i]; 
          }
          if(j==0)  cout<< "A has "<<sum1<<" points. B has "<<sum2<<" points."<<endl;
          else cout<<endl<< "A has "<<sum1<<" points. B has "<<sum2<<" points."<<endl; 
        
          j=1;           
    } 
    system("pause");
    return 0; 
}

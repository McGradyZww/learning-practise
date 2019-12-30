#include<iostream>
using namespace std;
int main()
{
    int n,u,d,a,b,c,i;
    cin>>n>>u>>d;
    while ((n!=0)&&(u!=0)&&(d!=0))
    {
    if ((n<=u)&&(u>d)) cout<<"1"<<endl;
    else if ((n>u)&&(u>d))
    {      
    if (u==2*d)
    {
              a=n%(u-d);
              b=n/(u-d);
              c=b-1;
              if (a==0) 
              {
                        
                        cout <<2*c-1<<endl;
              }
              if (a!=0) 
              {
                        
                        cout <<2*c+1<<endl;
              }
    }
    if (u>(2*d))
    {
             a=n%(u-d);
             b=n/(u-d);  
             c=b-1;
             if (a==0)
             {
                     
                      cout <<c*2+1<<endl;
             }
             if (a!=0)
             {
                     
                      if ((c*(u-d)+u)<n) cout <<b*2+1<<endl;
                      if ((c*(u-d)+u)>=n) cout <<c*2+1<<endl;
             }
    }
    if (u<(2*d))
    
    {
             for (i=0;i>=0;i++)
             {
                 if ((n-(u-d)*i)<u) break;
             }  
             cout <<2*(i-1)+1<<endl;
    }
    }
    cin >>n>>u>>d; 
    }                       
    system("pause");
    return 0;
}

#include <iostream>
#include <string>
using namespace std;
int main()
{
    int n,m,p,i,j,t;
    int q;
    string a;
    char b[100][100];
    while(cin>>n&&n!=0)
    {
        t=0;
        q=1;
        cin>>a;
        m=a.size();
        p=m/n;
        for(i=0;i<m;i=i+n)
        {
          if(q==1){   
                          
            for(j=0;j<n;j++)       
              b[t][j]=a[i+j];           
            }
          if(q==0){
        
           for(j=0;j<n;j++)
           b[t][n-j-1]=a[i+j];
          }
        q=1-q;
        t++;
        }
        for(j=0;j<n;j++)
        for(i=0;i<p;i++)
           
             cout<<b[i][j];
             cout<<endl;
        
    }       
    system("pause"); 
    return 0;
}

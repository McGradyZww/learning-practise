#include<iostream>
using namespace std;
int main()
{
    int n,m,i,count;
    int a[20];
    cin>>n;
    while(n>0)
    {
              cin>>m;
              count=0;
              for(i=0;i<m;i++) cin>>a[i];
              
              while(count<m-1)
              {for(i=0;i<m-1-count;i++)
                  a[i]=a[i+1]-a[i];
                  
                  count++;
              }
              cout<<a[0]<<endl;
              n--;
    }
    system("pause");
    
    return 0;
}

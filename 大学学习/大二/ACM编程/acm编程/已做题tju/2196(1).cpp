#include<iostream>
#include<algorithm>
using namespace std;
int main()
{
    int n,i,j,m,a[100001];
    char ch;
    while(cin>>n&&n!=0)
    {
       j=0;
       m=0;
       for(i=0;i<n;i++)
       {
          cin>>ch;
          if(ch=='B') 
          {
             cin>>a[m++];
          }
          else if(ch=='G')
          {
              sort(a,a+m);
              for(j=0;j<m;j++)
              if(a[j]!=0)
              {cout<<a[j]<<endl;a[j]=0;break;}
          }
          
       }
    }
    system("pause");
    return 0;
}

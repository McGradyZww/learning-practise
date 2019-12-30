#include<iostream>
using namespace std;
int main()
{
    int n,m,i,j,count1,count2;
    float k;
    cin>>n>>m;
    count2=1;
    while (n!=0)
    {
          count1=0;
          
          for (i=1;i<n-1;i++)
          {
              for (j=i+1;j<n;j++)
              {
                  k=(i*i+j*j+m+0.0)/(i*j);
                  if((int)k==k) {count1++;}
              }
          }
          cout <<"Case "<<count2<<": "<<count1<<endl;
          count2++;
          cin>>n>>m;
    }
    system("pause");
    return 0;
}

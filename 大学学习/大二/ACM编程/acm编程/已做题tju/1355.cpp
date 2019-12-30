#include<iostream>
using namespace std;
int main()
{
    int n;
    cin >>n;
    while (cin)
    {
          int a[3000]; 
          for (int i=0;i<n;i++)
          {
              cin >>a[i];
          }
          if (n==1) cout <<"Jolly"<<endl;
          if (n>1)
          {
          bool c[n];
          
          for (int p=1;p<n;p++) 
          c[p]=false;
         
          for (int m=1;m<n;m++)
          {
              int b=a[m]-a[m-1];
              if (b>=0) b=b;
              if (b<0) b=0-b;
              if (1<=b<=(n-1))  c[b]=true;
              if ((b==0)||(b>(n-1)))  break;
          }
          int q;
          for (q=1;q<n;q++)
          {
              if (!c[q]) 
              {
                         cout <<"Not jolly"<<endl;
                         break;
              }
          }
          if (q==n) cout <<"Jolly"<<endl;
          }      
          cin >>n;
    }
    system("pause");
    return 0;
}

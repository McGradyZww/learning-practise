#include<iostream>
#include<cstdio>
using namespace std;
int main()
{
    int m,n,k,count=1;
    cin>>k;
    while (k>0)
    {
          cin>>m>>n;
          if ((m*n%2)==0)
          {printf("Scenario #%d:\n",count++);cout<<m*n<<".00";
          printf("\n\n");}
          else {printf("Scenario #%d:\n",count++);cout<<m*n<<".41";
          printf("\n\n");}
          k--;
    }
    system("pause");
    return 0;
} 


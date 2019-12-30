#include<iostream>
#include<memory.h>//函数memset()文件头 
using namespace std;
int main() 
{
    int n,i,j;
    int sum;
    int a[100000][4];
    while(cin>>n)
    {
               bool *b=new bool[n];
               memset(b,0,n);
               sum=0;
               for(i=0;i<n;i++)
               cin>>a[i][0]>>a[i][1]>>a[i][2]>>a[i][3];
               for(i=0;i<n;i++)
               {
                   for(j=i+1;j<n;j++)
                   {
                       if(b[j]!=1){
                       if(a[i][0]<=a[j][0]&&a[i][1]>=a[j][1]&&a[i][2]<=a[j][2]&&a[i][3]>=a[j][3])
                       b[j]=1; 
                       }
                       if(b[i]!=1){  
                       if(a[i][0]>=a[j][0]&&a[i][1]<=a[j][1]&&a[i][2]>=a[j][2]&&a[i][3]<=a[j][3])
                       b[i]=1; 
                       }                        
                   }
               }
               for(i=0;i<n;i++)
               if(b[i]==1) sum++;
               cout<<sum<<endl;
               delete []b;  
    }
    system("pause");
    return 0; 
}

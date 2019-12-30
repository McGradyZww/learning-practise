#include<iostream>
using namespace std;
int main()
{
    int i,j,t,sum,temp1,temp2;
    cout<<1<<endl; 
    for(i=2;i<10000;i++)
    {
       t=0; 
       for(j=1;j<i;j++) 
       {
         sum=0;
         temp1=j; 
         while(temp1!=0)
         {
            temp2=temp1%10;
            sum+=temp2;
            temp1=temp1/10; 
         } 
         sum+=j;
         if(sum==i) {t=1;break;} 
       } 
       if(t==0) cout<<i<<endl;        
    } 
    system("pause");
    return 0; 
} 

#include<iostream>
using namespace std;
int main()
{
    int m,n,i,j,sum,a1,b1,p,n1;              
    int a[50],b[50];
    while(cin>>m)
    {
       if(m==0) break;
       n=1;
       i=1;
       while(m>4*i)       //计算m值对应的张数 n,4是一个轮回,1-4,5-8,9-12....... 
       {
           n++;
           i++;
       }
       if(m==1) {cout<<"Printing order for "<<1<<" pages:"<<endl;
                 cout<<"Sheet "<<1<<", front: Blank, "<<1<<endl;
                 continue;
       }
       sum=4*n+1;            //其中两项不为空时的和 
       a1=0;                 
       b1=0;
       p=0;
       n1=0;
       for(i=2*n;i>=1;i--)          //a[n],b[n]存储输出后几项都有数字时的两个值 
       {
           if(sum-i<=m)             //总有一个时刻这两个数字有一个是m 
           {
              if(p==0)              //因为是相间的存储，p作为标记 
              {
                 a[a1++]=i;            
                 b[b1++]=sum-i;
                 p=1;
              }
              else{
                 p=0;
                 a[a1++]=sum-i;
                 b[b1++]=i;
              }
            if(sum-i<=m)  n1++;              //n1为后面几项的行数 
            else break;
           }
       }
       cout<<"Printing order for "<<m<<" pages:"<<endl;
       p=0;
       for(i=0;i<2*n-n1;i++)             // 出后面几行外，前面的行均只有一个数字,而且是相间出现 
       {
           if(p==0)
           {
              cout<<"Sheet "<<i/2+1<<", front: Blank, "<<i+1<<endl;
              p=1;
           }
           else{
              cout<<"Sheet "<<i/2+1<<", back : "<<i+1<<", Blank"<<endl;
              p=0;
           }
       }
       
       
        if(n1%2==0)  p=0;
        else p=1;
          for(i=2*n-n1;i<2*n;i++)            //输出后面几行,a[i]和b[i]是相间出现的 
          {
            if(p==1){
                 cout<<"Sheet "<<i/2+1<<", back : "<<a[--a1]<<", "<<b[--b1]<<endl;
                 p=0;
              }
              else{
                   cout<<"Sheet "<<i/2+1<<", front: "<<a[--a1]<<", "<<b[--b1]<<endl;
                   p=1;
              }
          }          
    }
    system("pause");
    return 0;
}

#include<iostream>
using namespace std;
int main()
{
    int n,i,sum1,sum2,count,m;
    while(cin>>n)
    {
       sum1=0;
       count=0;
       for(i=1;i>=1;i++){
       sum1+=i;
       if(sum1>=n) {count++;break;}
       count++;
       }
       sum2=0;
       m=count;
       for(i=1;i<count;i++) sum2+=i;
       if(count%2==0) 
       {                    
          for(i=1;i<(n-sum2);i++) m-=1;
          cout<<"TERM "<<n<<" IS "<<n-sum2<<"/"<<m<<endl;
       }
       else 
       {
          for(i=1;i<(n-sum2);i++) m-=1;
          cout<<"TERM "<<n<<" IS "<<m<<"/"<<n-sum2<<endl;
       }        
        
    }
    system("pause");
    return 0;
}

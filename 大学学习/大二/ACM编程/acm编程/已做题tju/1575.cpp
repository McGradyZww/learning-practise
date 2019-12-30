#include<iostream>
using namespace std;
int main()
{
    int n,count,i;
    double a,b,sum;
    cin>>n;
    for(i=0;i<n;i++)
    {
       cin>>a>>b;
       cout<<"Property "<<i+1<<": This property will begin eroding in year ";
       count=1;
       while(count)
       {
          sum=count*100.0/3.1415926;
          if(sum>(a*a+b*b)) {cout<<count<<"."<<endl;break;}
          count++;
       } 
    }
    cout<<"END OF OUTPUT."<<endl;
    system("pause");
    return 0;
}

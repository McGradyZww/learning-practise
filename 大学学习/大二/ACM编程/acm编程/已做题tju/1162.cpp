#include<iostream>
using namespace std;
int main()
{
    int a,b,c,d,sum,i,count=1;
    while(cin>>a>>b>>c>>d)
    {
       if(a==-1) break;
       i=-12;
       while(1)
       {
          sum=33*i+c;
          if((sum-a)%23==0&&(sum-b)%28==0&&sum>d)
           {cout<<"Case "<<count<<": the next triple peak occurs in "<<sum-d<<" days."<<endl;break;}
           i++;
       }
       count++;
    }
    system("pause");
    return 0;
}

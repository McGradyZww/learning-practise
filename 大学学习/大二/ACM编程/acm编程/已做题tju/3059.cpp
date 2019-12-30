#include<iostream>
using namespace std;
int main()
{
    int n,ca,sum1,sum2,i;
    char ch1,ch2;
    cin>>ca;
    while(ca--)
    {
       cin>>n;
       sum1=0;sum2=0;
       for(i=0;i<n;i++)
       {
          cin>>ch1>>ch2;
          if((ch1=='P'&&ch2=='R')||(ch1=='R'&&ch2=='S')||(ch1=='S'&&ch2=='P')) sum1++;
          else if((ch1=='P'&&ch2=='S')||(ch1=='R'&&ch2=='P')||(ch1=='S'&&ch2=='R')) sum2++;
       }
       if(sum1>sum2) cout<<"Player 1"<<endl;
       else if(sum1<sum2) cout<<"Player 2"<<endl;
       else cout<<"TIE"<<endl;
    }
    system("pause");
    return 0;
}

#include<iostream>
using namespace std;
int main()
{
    int month[12]={31,28,31,30,31,30,31,31,30,31,30,31};
    int m,n,len=0,i;
    cin>>n>>m;
    for(i=0;i<m-1;i++) len+=month[i];
    len--;
    len+=n;
    if(len%7==0) cout<<"Thursday"<<endl;
    else if(len%7==1) cout<<"Friday"<<endl;
    else if(len%7==2) cout<<"Saturday"<<endl;
    else if(len%7==3) cout<<"Sunday"<<endl;
    else if(len%7==4) cout<<"Monday"<<endl;
    else if(len%7==5) cout<<"Tuesday"<<endl;
    else if(len%7==6) cout<<"Wednesday"<<endl;
    system("pause");
    return 0;
}

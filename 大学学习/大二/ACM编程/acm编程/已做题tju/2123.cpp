#include<iostream>
using namespace std;
int main()
{
    int n,count,a[10001];
    cin>>n;
   
    while(n!=0)
    {       count=0;  
               for(int i=0;i<n;i++) {
                       cin>>a[i];
                       if(a[i]==0) count++;
                       }
                       cout<<"Mary won "<<count<<" times and John won "<<n-count<<" times"<<endl;
               cin>>n;
    } 
    system("pause");
    return 0;
}

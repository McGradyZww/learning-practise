#include<iostream>
#include<iomanip>
using namespace std;
int sat(int m,int n)
{
    int mod[n+1],i;
    mod[0]=0;
    for(i=1;i<n+1;i++) 
    {
       mod[i]=(mod[i-1]+m)%n;
       if(mod[i]==0) return i;
    }
}
int main()
{
    int m,n;
    while(cin>>m>>n)
    {       
        cout<<setw(10)<<m<<setw(10)<<n<<"    ";
        if(sat(m,n)==n) cout<<"Good Choice"<<endl;
        else cout<<"Bad Choice"<<endl;
        cout<<endl;
        
    }
    return 0;
}

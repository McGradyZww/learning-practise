#include<iostream>
using namespace std;
int main()
{
    int n,i;
    double num[1001];
    double average,m;
    cin>>n;
    while(cin){
    average=0.0;
    for(i=0;i<n;i++){
    cin>>num[i];
    
    average+=num[i]/100;
    }
    m=average*100.0;
    cout<<int(m/n)<<endl;
    cin>>n;
    }
    system("pause");
    return 0;
}

#include<iostream>
using namespace std;
int main()
{
    int n,m;
    int i,j,k;
    cin >>m;
    for (j=0;j<m;j++) {
    cin >>n;
   
    
    k=1;
    for (i=n;i>=1;i--)
    {   
        k=k*i;
    }
    cout <<k;
}
    system("pause");
    return 0;
}

#include<iostream>
using namespace std;
int main()
{
    int n,i,j,k;
    cin >>n;
    bool inch[50000];
    for (i=0;i<50000;i++) inch[i]=true;
    while (n!=0)
    {
        k=0;
        for (i=2;i<50000;i++)
        {
            for (j=2;j<50000/i;j++) inch[i*j]=false;
        }  
        for (i=3;i<=n/2;i+=2)
        {
            if ((inch[i])&&(inch[n-i])) {k++;}
        }
        cout <<k<<endl;
        cin >>n;
    }
    system("pause");
    return 0;
}

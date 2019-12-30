#include<iostream>
using namespace std;
int main()
{
    int n,m,i,j,k;
    cin >>n;
    while (n>0)
    {
        cin >>m;
        for (i=1;i>0;i+=2)
        {
            k=m*i+m*(m-1);
           
            if (k==(m*m*m)) {cout <<i<<" "<<i+(m-1)*2<<endl;break;}
            
        }
        n--;  
    }
    system("pause");
    return 0;
}

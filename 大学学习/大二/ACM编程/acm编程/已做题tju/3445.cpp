#include<iostream>
using namespace std;
int main()
{
    int e,f,c,count,sum;
    cin>>e>>f>>c;
    count=0;
    sum=e+f;
    while(sum>=c)
    {
                 sum=sum-c+1;
                 count++;
    }
    cout<<count<<endl;
    system("pause");
    return 0;
}

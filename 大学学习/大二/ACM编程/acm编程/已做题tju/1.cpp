#include<iostream>
using namespace std;
int main()
{
    for(int i=2010;i<=2200;i++)
    if((i%4==0&&i%100!=0)||i%400==0) cout<<i<<endl;
            

    system("pause");
    return 0;
}

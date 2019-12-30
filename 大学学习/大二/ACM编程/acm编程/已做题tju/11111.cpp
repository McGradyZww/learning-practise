#include<iostream>
using namespace std;
int m(int x);
int main()
{
    int x;
    cin>>x;
    while (x!=0)
    {cout <<m(x)<<endl;cin >>x;}
    system("pause");
    return 0;
}
 int m(int x)

{

int y;

if(x>100) return(x-10);

 else

{

y=m(x+11);

return(m(y));

}

}


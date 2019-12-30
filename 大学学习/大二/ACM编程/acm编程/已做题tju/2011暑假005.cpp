#include<string>
#include<iostream>
using namespace std;
int main()
{
    string str="123456789";
    string::size_type len;
    len=str.find("79");
    cout<<len;
    system("pause");          
    return 0;
}

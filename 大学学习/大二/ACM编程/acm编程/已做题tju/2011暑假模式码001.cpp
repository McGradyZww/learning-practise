#include<iostream>
#include<fstream>
using namespace std;
int main()
{ 
ifstream inData;
int n;    
inData>>n;
while(inData)
{
             cout<<n<<endl;
             inData>>n;
}
return 0;
}
//其中的“inData”可换成“cin”。 

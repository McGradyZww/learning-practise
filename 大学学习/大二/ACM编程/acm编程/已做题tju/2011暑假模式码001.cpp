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
//���еġ�inData���ɻ��ɡ�cin���� 

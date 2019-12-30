#include<iostream>
using namespace std;
int add(int a);
int add(int a)
{
	int i,s=0;
		for(i=1;i<=a;i++)
		{
			s=s+i;
		}
		return s;
}
int main()
{
int n;
cin>>n;
cout<<"1+2+бнбн+"<<n<<endl<<"=";
cout<<add(n)<<endl;
system("pause");
return 0;
}

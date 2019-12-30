#include<iostream>
#include<memory.h> 
using namespace std;
bool  s[1000001];

void work()
{
	memset(s,false,sizeof(s));
	int i,j,t,temp[10],sum;
	temp[0]=1;
	for(i=1;i<=9;i++)
		temp[i]=i*temp[i-1];
	for(i=1;i<1024;i++)
	{
		sum=0;
		t=i;
		for(j=0;j<10;j++)
		{
			sum+=temp[9-j]*(t%2);
			t=t/2;
		}
		s[sum]=true;
	}
}

int main()
{
	int n;
	work();
	while(cin>>n&&n>=0)
	{
		if(s[n])
			cout<<"YES"<<endl;
		else
			cout<<"NO"<<endl;
	}
	return 0;
}

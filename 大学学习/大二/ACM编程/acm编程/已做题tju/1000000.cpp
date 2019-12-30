#include <iostream>
#include <algorithm>
#include<cstring>
using namespace std;
char a[27][27];
int b[26];

int main()
{
	
	int n,i,j,p,q,min;
	while(cin>>n&&n!=0)
	{
		memset(a,0,sizeof(a));
		for(i=0;i<n;i++)
			cin>>a[i];
		for(i=0;i<26;i++)
			b[i]=1;
		for(i=0;i<n;i++)
		{
			for(j=2;j<=n&&a[i][j]!=0;j++)
			{
				p=a[i][j]-65;
				q=a[0][j]-65;
				if(a[i][j]<a[i][0])
					continue;
				if(b[p]==b[q])
					b[p]++;
			}
		}

		min=*max_element(b,b+sizeof(b)/sizeof(b[0]));
		if(min==1)
			cout<<min<<" channel needed"<<endl;
		else
			cout<<min<<" channels needed"<<endl;
	}
	return 0;
}


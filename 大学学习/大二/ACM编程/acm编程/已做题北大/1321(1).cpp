#include <iostream>
using namespace std;

char hl[9],maze[9][9];
int n,ii;

void search(const int k,const int bian)
{
	int i,j;
	for (i=bian-1;i>k-2;i--)
	{
		for (j=0;j<n;j++)
			if (maze[i][j]=='#' && hl[j]==0)
				if (i && k>1)
				{
					hl[j]=1;
					search(k-1,i);
					hl[j]=0;
				}
				else
					ii++;
	}
}

int main()
{
	int k,i;
	while(1)
	{
		cin>>n>>k;
		if (n==-1)
			break;
		else
		{
			memset(hl,0,sizeof(hl));
			for (i=0;i<n;i++)
				scanf("%s",maze[i]);
			ii=0;
			search(k,n);
			cout<<ii<<endl;
		}
	}
	return 0;
}

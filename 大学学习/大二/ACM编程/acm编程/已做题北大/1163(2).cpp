#include <stdio.h>
int main()
{
	int n,i,j;
	int a[101][101];
	scanf("%d",&n);
	for (i=0;i<n;i++)
	{
		for (j=0;j<i+1;j++)
		{
			scanf("%d",&a[i][j]);
		}
	}

	for (i=n-2;i>=0;i--)
	{
		for (j=0;j<=i;j++)
		{
			a[i][j]+=(a[i+1][j]>a[i+1][j+1])?a[i+1][j]:a[i+1][j+1];
		}
	}
	printf("%d\n",a[0][0]);
	return 0;
}

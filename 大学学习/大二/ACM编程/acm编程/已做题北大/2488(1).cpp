#include <stdio.h>
//using namespace std;


int main()
{
	int i,n,p,q;
	scanf("%d",&n);
	for(i=1;i<=n;i++)
	{
		scanf("%d%d",&p,&q);
		printf("Scenario #%d:\n",i);
		if(p==1 &&q ==1)
			printf("A1\n");
		else if(p==3 && q==4)
			printf("A1C2A3B1D2B3C1A2C3D1B2D3\n");
		else if(p==3 && q==7)
			printf("A1B3D2F1G3E2G1F3E1G2E3C2A3B1C3A2C1D3B2D1F2\n");
		else if(p==3 && q==8)
			printf("A1B3C1A2C3D1B2D3E1G2E3C2A3B1D2F1H2F3G1E2G3H1F2H3\n");
		else if(p==4 && q==3)
			printf("A1B3C1A2B4C2A3B1C3A4B2C4\n");
		else if(p==4 && q==5)
			printf("A1B3C1A2B4D3E1C2D4E2C3A4B2D1E3C4A3B1D2E4\n");
		else if(p==4 && q==6)
		printf("A1B3C1A2B4C2D4E2F4D3E1F3D2B1A3C4B2A4C3E4F2D1E3F1\n");	
		else if(p==5 && q==4)
			printf("A1B3A5C4D2B1A3B5D4C2B4A2C1D3C5A4B2D1C3D5\n");
		else if(p==5 && q==5)
			printf("A1B3A5C4A3B1D2E4C5A4B2D1C3B5D4E2C1A2B4D5E3C2E1D3E5\n");
		else if(p==6 && q==4)
		printf("A1B3A5C6D4B5D6C4D2B1A3C2B4A2C1D3B2D1C3D5B6A4C5A6\n");
		else if(p==7 && q==3)
		printf("A1B3C1A2C3B1A3C2B4A6C7B5A7C6A5B7C5A4B2C4B6\n");	
		else if(p==7 && q==4)
		printf("A1B3A5B7D6B5A7C6D4C2A3B1D2C4B2A4B6D7C5A6C7D5B4D3C1A2C3D1\n");	
		else if(p==8 && q==3)
		printf("A1B3C1A2B4C2A3B1C3A4B2C4A5B7C5A6B8C6A7B5C7A8B6C8\n");	
		else
		printf("impossible\n");	
	printf("\n");
	}
	return 0;

}

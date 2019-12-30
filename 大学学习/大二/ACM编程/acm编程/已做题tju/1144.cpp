#include<stdio.h>
#include<string.h>
#include<iostream> 
using namespace std; 
void build(int n,char*s1,char*s2)
{
	if(n<=0)return ;
	int p=strchr(s2,s1[0])-s2;// 
	build(p,s1+1,s2);         // 
	build(n-p-1,s1+p+1,s2+p+1);// 
	printf("%c",s1[0]);
}
int main()
{
	char s1[30],s2[30],ans[30];
	memset(s1,0,sizeof(s1));
	memset(s2,0,sizeof(s2));
	while(scanf("%s%s",s1,s2)!=EOF)
	{
		int n=strlen(s1);
		build(n,s1,s2);
		ans[n]='\0';
		printf("\n");
	}
	system("pause"); 
	return 0;
}

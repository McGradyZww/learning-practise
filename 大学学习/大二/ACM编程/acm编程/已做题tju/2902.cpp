#include<iostream>////����,AC����Ϊ����������ʵ����û����ȫ�档SHASKIL Ӧ����� 1 6 ��ΪS��S���ظ��ġ������� 
#include<string.h>
using namespace std;
int f(char *s1)
{
    int m=strlen(s1);
    char b[100];
    int i;
    for(i=0;i<m;i++) b[i]=s1[m-1-i];
    b[m]='\0';
    if(strcmp(s1,b)==0) return 1;
    else return 0;
}
int main()
{
    char s[100],a[100];
    int m,i,n,j,k,len,num;
    while(cin>>s)
    {
       m=strlen(s);
       for(n=m;n>=1;n--)
       {
          num=0;
          for(i=0;i<=m-n;i++)
          {
             //char b[81][81];
             j=i;
             k=0;
             while(k<n)
             {
                a[k++]=s[j];
                j++;
             }
             a[n]='\0';
             if(f(a)) 
             {
                len=n;
                num++;
             }
          }
          if(num) break;
       }
       cout<<len<<" "<<num<<endl;
    }
    system("pause");
    return 0;
}

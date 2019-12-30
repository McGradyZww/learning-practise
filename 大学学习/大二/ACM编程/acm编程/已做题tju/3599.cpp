#include <iostream>
#include<string.h>
using namespace std;
char a[100001],b[400010],c[150000];
char s1[10][5]={"0000","0001","0010","0011","0100","0101","0110","0111","1000","1001"}; 
char s2[6][5]={"1010","1011","1100","1101","1110","1111"};            
int main()
{
    int m,n,i,j,k,temp;
    while(cin>>a)
    {
       
       if(strcmp(a,"0")==0) {cout<<0<<endl;continue;}
       m=strlen(a);
       k=0;
       for(i=m-1;i>=0;i--)
       {
          if(a[i]>='0'&&a[i]<='9')
          {
              for(j=3;j>=0;j--) b[k++]=s1[a[i]-'0'][j];
          }
          else{
               for(j=3;j>=0;j--) b[k++]=s2[a[i]-'A'][j];
          }
       }
       if(k%3==1) {b[k++]='0';b[k++]='0';b[k]='\0';}
       else if(k%3==2) {b[k++]='0';b[k]='\0';}
       j=0;
       for(i=0;i<k;i+=3)
       {
           temp=b[i]-'0'+(b[i+1]-'0')*2+(b[i+2]-'0')*4;
           c[j++]=temp+'0';
       }
       for(i=j-1;i>=0;i--)
       {
          if(c[i]>'0') {k=i;break;}
       }
       for(i=k;i>=0;i--) cout<<c[i];
       cout<<endl;
    }
    system("pause");
    return 0;
}

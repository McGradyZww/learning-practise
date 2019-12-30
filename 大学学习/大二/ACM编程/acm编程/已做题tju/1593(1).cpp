#include<stdio.h>
#include<stdlib.h>
#include<string.h>
char url[70];
int main()
{ int n,i,j,k,pos,len;
  scanf("%d",&n); 
  for(i=1;i<=n;i++)
  { 
                   scanf("%s",url); 
                   len=strlen(url); 
                   pos=0; 
                   printf("URL #%d\n",i); 
                   printf("Protocol = "); 
                   while(url[pos]!=':'){
                        printf("%c",url[pos]); pos++; 
                        }
                   printf("\n"); 
                   printf("Host     = "); 
                   pos+=3; 
                   while(url[pos]!=':'&&url[pos]!='/'&&pos<len)
                   { printf("%c",url[pos]); pos++; } 
                   printf("\n"); printf("Port     = "); 
                   if(pos<len){ 
                     if(url[pos]==':')
                     { pos++; 
                       while(url[pos]!='/'&&pos<len)
                       { printf("%c",url[pos]); pos++; } 
                       }
                       else printf("<default>"); 
                       }
                       else{ printf("<default>"); } 
                       printf("\n"); 
                       printf("Path     = "); 
                       if(pos<len)
                       { 
                       if(url[pos]='/')
                       { pos++; 
                       while(pos<len)
                       { printf("%c",url[pos]); pos++; } 
                       } 
                       }
                       else{ printf("<default>"); } 
                       printf("\n\n"); 
   } 
   system("pause");
   return 0;
}

#include<iostream>
#include<string.h>
using namespace std;
char c[]="index"; 
char * toString(char *a)
{
     char b[100];
     int m=strlen(a),i; 
     if((int)(strstr(a,c)-a)==(m-9)) return a;
      
     for(i=0;i<m-4;i++) b[i]=a[i];
     b[m-4]='\0';
     return b; 
     /*if(m>=9) {
               if(b[m-5]=='x'&&b[m-6]=='e'&&b[m-7]=='d'&&b[m-8]=='n'&&b[m-9]=='i') 
               {b[m-4]='.';b[m-3]='h';b[m-2]='t';b[m-1]='m';b[m]='\0';} 
     }    
     cout<<b<<endl; */ 
     //return b;
}
int main()
{
    char a[100];
    while(gets(a))
    cout<<toString(a)<<endl;
    system("pause");
    return 0;
    
}

#include<iostream>
#include<string.h>
using namespace std;
int main()
{
    string a;
    char *b,*c,*d;
    b="QWERTYUIOP";
    c="ASDFGHJKL";
    d="ZXCVBNM";
    int m,i;
    char ch;
    while(getline(cin,a))
    {
                        m=a.size();
                        for(i=0;i<m;i++){
              ch=a[i];
              if(ch>='2'&&ch<='9') a[i]=ch-1;
              else if(ch=='0') a[i]='9';
              else if(ch=='1') a[i]='`';
              else if(ch=='-') a[i]='0';
              else if(ch=='=') a[i]='-';
             else if(ch=='\\') 
              a[i]=']';
              else if(ch=='\'') 
              a[i]=';';
              else if(ch=='[') a[i]='P';
             else if(ch==']') 
             a[i]='[';
              else if(ch=='/') a[i]='.';
              else if(ch==',') a[i]='M';
              else if(ch==';') a[i]='L';
              else if(ch=='.') a[i]=',';
              else if(strchr(b,ch)) a[i]=b[strchr(b,ch)-b-1];
              else if(strchr(c,ch)) a[i]=c[strchr(c,ch)-c-1];
              else if(strchr(d,ch)) a[i]=d[strchr(d,ch)-d-1];
         }
         
         for(i=0;i<m;i++) cout<<a[i];
         cout<<endl;
    }
    system("pause");
    return 0;
}

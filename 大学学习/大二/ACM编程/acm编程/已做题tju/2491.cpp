#include<iostream>
#include<string.h>
using namespace std;
int main()
{
    char a[100],s[1000];
    int n,i,j,k,m1;
    while(cin>>a&&a[0]!='.') 
    {
       cin>>n;
       m1=strlen(a); 
       k=0; 
       for(i=0;i<n;i++)
       for(j=0;j<m1;j++) 
       s[k++]=a[j]; 
       s[k]='\0';  
       cout<<s<<endl; 
       for(i=1;i<m1;i++)
       {
          s[k++]=a[i-1]; 
          for(j=i;j<k;j++) cout<<s[j];
          cout<<endl; 
       } 
    } 
    system("pause"); 
    return 0; 
} 

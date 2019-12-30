#include<iostream>
#include<string.h> 
using namespace std;; 
bool isHeavy(char);
bool isLight(char); 
char a[3][7],b[3][7],c[3][5];
int main()
{
    int n,i;
    char ch;
    cin>>n;
    while(n--)
    {
       for(i=0;i<3;i++)
       cin>>a[i]>>b[i]>>c[i];
       for(ch='A';ch<='L';ch++)
       {
          if(isLight(ch)) 
          {
             cout<<ch<<" is the counterfeit coin and it is light."<<endl;
             break; 
          } 
          if(isHeavy(ch))
          {
              cout<<ch<<" is the counterfeit coin and it is heavy."<<endl;
              break; 
          } 
       } 
    } 
    system("pause");
    return 0; 
} 
bool isLight(char ch)
{
     int i;
     for(i=0;i<3;i++)
     {
        switch(c[i][0]) 
        {
           case 'u': if(strchr(b[i],ch)==NULL)  return 0;
                     break;
           case 'e': if(strchr(a[i],ch)!=NULL||strchr(b[i],ch)!=NULL) return 0;
                     break;
           case 'd': if(strchr(a[i],ch)==NULL) return 0;
                     break; 
        } 
        
     } 
     return 1; 
} 
bool isHeavy(char ch)
{
     int i;
     for(i=0;i<3;i++)
     {
        switch(c[i][0]) 
        {
           case 'u': if(strchr(a[i],ch)==NULL)  return 0;
                     break;
           case 'e': if(strchr(a[i],ch)!=NULL||strchr(b[i],ch)!=NULL) return 0;
                     break;
           case 'd': if(strchr(b[i],ch)==NULL) return 0;
                     break; 
        } 
     } 
     return 1; 
} 

#include<iostream>
#include<string.h>
using namespace std;
int main()
{
    char s2[101];
    string s1; 
    int m,i,j,temp,sum,k,t,p,num;
    while(cin>>s1)
    {
       if(s1=="#") break;
       m=s1.size();
       k=0; 
       for(i=0;i<m;i++)
       { 
          if((s1[i]>='a'&&s1[i]<='c')||(s1[i]>='A'&&s1[i]<='C')) 
          {            
             if(s1[i]>='a'&&s1[i]<='c') p=s1[i]-'a'; 
             else p=s1[i]-'A';
             t=(i+1)%3;
             if(t==0) s2[k++]=s1[i]; 
             else if(p-t>=0)  s2[k++]=s1[i]-t;
             else s2[k++]=s1[i]+3-t; 
          }
          else if((s1[i]>='d'&&s1[i]<='f')||(s1[i]>='D'&&s1[i]<='F')) 
          {
             if(s1[i]>='d'&&s1[i]<='f') p=s1[i]-'d'; 
             else p=s1[i]-'D';
             t=(i+1)%3;
             if(t==0) s2[k++]=s1[i]; 
             else if(p-t>=0)  s2[k++]=s1[i]-t;
             else s2[k++]=s1[i]+3-t; 
          } 
          else if((s1[i]>='g'&&s1[i]<='i')||(s1[i]>='G'&&s1[i]<='I')) 
          {
             if(s1[i]>='g'&&s1[i]<='i') p=s1[i]-'g'; 
             else p=s1[i]-'G';
             t=(i+1)%3;
             if(t==0) s2[k++]=s1[i]; 
             else if(p-t>=0)  s2[k++]=s1[i]-t;
             else s2[k++]=s1[i]+3-t; 
          } 
          else if((s1[i]>='j'&&s1[i]<='l')||(s1[i]>='J'&&s1[i]<='L')) 
          {
             if(s1[i]>='j'&&s1[i]<='l') p=s1[i]-'j'; 
             else p=s1[i]-'J';
             t=(i+1)%3;
             if(t==0) s2[k++]=s1[i]; 
             else if(p-t>=0)  s2[k++]=s1[i]-t;
             else s2[k++]=s1[i]+3-t; 
          } 
          else if((s1[i]>='m'&&s1[i]<='o')||(s1[i]>='M'&&s1[i]<='O')) 
          {
             if(s1[i]>='m'&&s1[i]<='o') p=s1[i]-'m'; 
             else p=s1[i]-'M';
             t=(i+1)%3;
             if(t==0) s2[k++]=s1[i]; 
             else if(p-t>=0)  s2[k++]=s1[i]-t;
             else s2[k++]=s1[i]+3-t; 
          } 
          else if((s1[i]>='t'&&s1[i]<='v')||(s1[i]>='T'&&s1[i]<='V')) 
          {
             if(s1[i]>='t'&&s1[i]<='v') p=s1[i]-'t'; 
             else p=s1[i]-'T';
             t=(i+1)%3;
             if(t==0) s2[k++]=s1[i]; 
             else if(p-t>=0)  s2[k++]=s1[i]-t;
             else s2[k++]=s1[i]+3-t; 
          } 
          else if((s1[i]>='p'&&s1[i]<='s')||(s1[i]>='P'&&s1[i]<='S')) 
          {
             if(s1[i]>='p'&&s1[i]<='s') p=s1[i]-'p'; 
             else p=s1[i]-'P';
             t=(i+1)%4;
             if(t==0) s2[k++]=s1[i]; 
             else if(p-t>=0)  s2[k++]=s1[i]-t;
             else s2[k++]=s1[i]+4-t; 
          } 
          else if((s1[i]>='w'&&s1[i]<='z')||(s1[i]>='W'&&s1[i]<='Z')) 
          {
             if(s1[i]>='w'&&s1[i]<='z') p=s1[i]-'w'; 
             else p=s1[i]-'W';
             t=(i+1)%4;
             if(t==0) s2[k++]=s1[i]; 
             else if(p-t>=0)  s2[k++]=s1[i]-t;
             else s2[k++]=s1[i]+4-t; 
          } 
      }
       s2[k]='\0'; 
       cout<<s2<<endl; 
    } 
    system("pause");
    return 0;
}

#include<iostream>
#include<string.h>                
using namespace std;
int pos[26]={0,0,0,1,1,1,2,2,2,3,3,3,4,4,4,5,5,5,5,6,6,6,7,7,7,7};
int num1[8]={3,3,3,3,3,4,3,4};
int num2[8]={0,3,6,9,12,15,19,22}; 
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
          if(s1[i]>='a'&&s1[i]<='z')
          {
             temp=s1[i]-'a';//�ڼ�����ĸ��0��ʼ 
             num=pos[temp];//�ڼ��� 
             sum=num1[num];//�����Ԫ�ظ��� 
             p=num2[num]+num1[num]-1-temp; 
             p=sum-1-p; 
             
             
             t=(i+1)%sum;
             if(t==0) s2[k++]=s1[i]; 
             else if(p-t>=0) s2[k++]=s1[i]-t; 
             else s2[k++]=s1[i]+sum-t; 
          }
          else {
               temp=s1[i]-'A';//�ڼ�����ĸ��0��ʼ 
               num=pos[temp];//�ڼ��� 
               sum=num1[num];//�����Ԫ�ظ��� 
               p=num2[num]+num1[num]-1-temp; 
               p=sum-1-p;  
              t=(i+1)%sum;
             if(t==0) s2[k++]=s1[i]; 
             else if(p-t>=0) s2[k++]=s1[i]-t; 
             else s2[k++]=s1[i]+sum-t; 
               }
          } 
       s2[k]='\0'; 
       cout<<s2<<endl; 
    }
    system("pause");
    return 0;
}

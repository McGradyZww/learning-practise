#include<iostream>
#include<string.h>
#include<stdio.h> 
using namespace std; 
int main()
{ 
    string text1;
    char s1[128],s2[128];//键盘上128字符 
    gets(s1);//'\n'不在输入流中 
    gets(s2); //'\n'不在输入流中 
    int m,i,t;
    char ch; 
     cout<<s2<<endl<<s1<<endl;
     
    while(getline(cin,text1)!=NULL) 
    {

        m=text1.size();
        
        for(i=0;i<m;i++){
                          ch=text1[i];
        if(strchr(s1,ch)!=NULL) {t=int(strchr(s1,ch)-s1);cout<<s2[t];} 
        else cout<<ch;
        }
       
        cout<<endl; 
      
        
    }
    
    return 0;
}

#include<iostream>
#include<string> 
#include<algorithm> 
#include<memory.h> 
using namespace std;
int compare(const void * ele1,const void * ele2)       //char*�ıȽ� 
{
    return strcmp((char *)ele1,(char *)ele2); 
} 
int equal(int *a,int *b)             //������ıȽ�,�ֱ������ĸa-z�ĳ��ִ��� 
{
    for(int i=0;i<26;i++)
    {
       if(a[i]!=b[i]) return 0; 
    } 
    return 1; 
} 
int main()
{
    char s[100][7];   // һ�����6����ĸ ���100�� 
    string str;
    int n=0,i,j,p;
    int a[100][26]; 
    while(cin>>str&&str!="XXXXXX")           //  
    {
        j=0;
        for(i=0;i<str.size();i++) 
        s[n][j++]=str[i];
        s[n][j]='\0'; 
        n++; 
    } 
    qsort(s,n,sizeof(s[0]),compare);              //  sizeof(s[0])����Ҫ������ 
    memset(a,0,sizeof(a)); 
    for(i=0;i<n;i++)
    {
        for(j=0;j<strlen(s[i]);j++) a[i][s[i][j]-'a']++;        // ��¼��ĸ���ִ��� 
    } 
    int b[26];                        // 
    while(cin>>str&&str!="XXXXXX") 
    { 
        memset(b,0,sizeof(b));
        for(i=0;i<str.size();i++) b[str[i]-'a']++;         //��¼�����word��ĸ���ִ��� 
        p=0;
        for(i=0;i<n;i++)
        {
           if(equal(a[i],b))                                  //���ֵ��������Ƚϣ�����ȫ��ͬ��Ҫ�����Ӧ�ĵ��� 
           {
               p=1;
               cout<<s[i]<<endl; 
           }        
        } 
        if(!p)  cout<<"NOT A VALID WORD"<<endl;
        cout<<"******"<<endl; 
    } 
    system("pause");
    return 0; 
} 

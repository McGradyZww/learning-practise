#include<iostream>
#include<string>
using namespace std;
char str[]="aeiou";
int a(string s)                       //�ж��ַ����Ƿ���Ԫ�� 
{
    int m=s.size(),i,j;
    for(i=0;i<m;i++)
    {
       for(j=0;j<5;j++)
       if(s[i]==str[j]) return 1;
    }
    return 0;
}
int b(string s)                         //�κ����������Ƿ��� ��e��o����� 
{
    int m,i;
    m=s.size();
    for(i=0;i<m-1;i++)
    if(s[i]==s[i+1])
    {
        if(s[i]!='e'&&s[i]!='o') return 0;
    }
    return 1;
}
int d(char ch)                     //�жϵ����ַ��Ƿ�Ԫ�� 
{
    for(int i=0;i<5;i++) 
    if(str[i]==ch) return 1;
    return 0;
} 
int c(string s)                  //�Ƿ�����3�������Ƿ��������� 
{
    int m,i;
    m=s.size();
    for(i=0;i<m-2;i++){
    if(d(s[i])&&d(s[i+1])&&d(s[i+2])) return 0;
    else if(!d(s[i])&&!d(s[i+1])&&!d(s[i+2])) return 0;
    }
    return 1;
}
int main()
{
    string input;
    while(cin>>input)
    {
       if(input=="end") break;
       if(a(input)&&b(input)&&c(input)) 
       cout<<"<"<<input<<">"<<" is acceptable."<<endl;
       else cout<<"<"<<input<<">"<<" is not acceptable."<<endl;
    }
    system("pause");
    return 0;
}

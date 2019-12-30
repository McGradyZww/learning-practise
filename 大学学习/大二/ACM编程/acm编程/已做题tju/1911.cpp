#include<iostream>
#include<string>
using namespace std;
char str[]="aeiou";
int a(string s)                       //判断字符串是否含有元音 
{
    int m=s.size(),i,j;
    for(i=0;i<m;i++)
    {
       for(j=0;j<5;j++)
       if(s[i]==str[j]) return 1;
    }
    return 0;
}
int b(string s)                         //任何两个相邻是否是 除e和o以外的 
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
int d(char ch)                     //判断单个字符是否元音 
{
    for(int i=0;i<5;i++) 
    if(str[i]==ch) return 1;
    return 0;
} 
int c(string s)                  //是否任意3个相邻是否满足条件 
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

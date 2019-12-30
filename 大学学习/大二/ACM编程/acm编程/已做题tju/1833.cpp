#include<iostream>
#include<string>
using namespace std;
char f(char ch)
{
     if(ch=='A') return 'V';
     else if(ch=='B') return 'W';
     else if(ch=='C') return 'X';
     else if(ch=='D') return 'Y';
     else if(ch=='E') return 'Z';
     else return (char)(ch-5);
}

int main()
{
    string a,b,data;
    int m,i;
    while(getline(cin,a)&&a!="ENDOFINPUT")
    {
        getline(cin,data);
        getline(cin,b);
        m=data.size();
        for(i=0;i<m;i++) 
        if(data[i]>='A'&&data[i]<='Z') data[i]=f(data[i]);
        cout<<data<<endl;       
    }
    system("pause");
    return 0;
}

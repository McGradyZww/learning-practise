#include<iostream>
#include<memory.h>
using namespace std;
int main()
{
    bool ch[27];
    int n,i,count1=1,count2;
    char a,b,c;
    while(cin>>n&&n!=0)
    {
        memset(ch,0,sizeof(ch));
        ch[0]=1;
        for(i=0;i<n;i++)
        {
            cin>>a>>b>>c;
            if(ch[c-'a']) ch[a-'a']=1;
            else {ch[a-'a']=0;ch[c-'a']=0;}
        }
        cout<<"Program #"<<count1<<endl;
        count2=0;
        for(i=0;i<26;i++)
        {
           if(ch[i]) {count2=1;cout<<(char)(i+'a')<<" ";}
        }
        if(count2==0) cout<<"none";
        cout<<endl<<endl;
        count1++;
    }
    system("pause");
    return 0;
}

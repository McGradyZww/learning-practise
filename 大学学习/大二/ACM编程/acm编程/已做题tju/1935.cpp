#include<iostream>
#include<string>
using namespace std;
int main()
{
    int n,count=1,i,m,j;
    string s[15],str[15]; 
    while(cin>>n&&n!=0)
    {
        for(i=0;i<n;i++) cin>>s[i];
        cout<<"SET "<<count<<endl;
        j=0;
        if(n%2==0) 
        {
           for(i=0;i<n;i+=2)
           str[j++]=s[i];
           for(i=i-1;i>0;i-=2) 
           str[j++]=s[i];
        }
        else{
           for(i=0;i<n;i+=2)
           str[j++]=s[i];
           for(i=i-3;i>0;i-=2)
           str[j++]=s[i];
        }
        for(i=0;i<n;i++)
        cout<<str[i]<<endl;
        count++;
    }
    system("pause");
    return 0;
}

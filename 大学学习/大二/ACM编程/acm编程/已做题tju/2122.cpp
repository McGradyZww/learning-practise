#include<iostream>
#include<string>
using namespace std;
int main()
{
    int n,i,m[301],count,t,j;
    char ch[301];
    cin>>n;
    string str[301];
    while(n>0)
    {
       count=0;
       t=0;
       for(i=0;i<n;i++) {cin>>ch[i]>>m[i]>>str[i];}
       for(i=0;i<n;i++) {
          if(str[i]=="correct") {
          count++;
          t+=m[i];
          for(j=0;j<i;j++){
          if(ch[j]==ch[i]) t+=20;
          }
       }
       }
       if(count==0) cout<<"0 0"<<endl;
       else cout<<count<<" "<<t<<endl;
       cin>>n;
    }
    system("pause");
    return 0;
}

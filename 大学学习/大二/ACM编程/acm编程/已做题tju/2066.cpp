#include<iostream>
#include<string>
using namespace std;
int main()
{
    int n,s1,s2,i=0,j,m;
    int c[21];
    string a,b;
    cin>>n;
    m=n;
    while(n>0)
    {
              cin>>a>>b;
              s1=a.size();
              s2=b.size();
              if(s1==s2)
              {
                     for(j=0;j<s1;j++){
                     if(a[j]>b[j]) {c[i++]=1;break;}
                     if(a[j]<b[j]) {c[i++]=0;break;}   
                     }
                     if(j==s1) c[i++]=1;
              }
              else if(s1>s2) c[i++]=1;
              else c[i++]=0;
              n--;
    }
    for(j=0;j<m;j++)
    {
                    if(c[j]==0) cout<<"NO BRAINS"<<endl;
                    else cout<<"MMM BRAINS"<<endl;
    }
    system("pause");
    return 0;
}

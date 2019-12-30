#include<iostream>
#include<string>
using namespace std;
int main()
{
    int n,count=1,m,i,sum,j,t;
    cin>>n;
    string s;
    while(n--)
    {
        sum=0;
        cin>>s;
        m=s.size();
        for(i=m-1;i>=0;i--)
        {
           if(s[i]!='?'){
           if((m-i)%3==1) sum+=9*(s[i]-'0');
           else if((m-i)%3==2) sum+=3*(s[i]-'0');
           else if((m-i)%3==0)  sum+=7*(s[i]-'0');
           }
           else j=i;
        }
        for(i=0;i<=9;i++)
        {
           if((m-j)%3==1) 
           {sum+=9*i;
           if(sum%10==0) {t=i;break;}
           else sum-=9*i;
           }
           else if((m-j)%3==2) 
           {sum+=3*i;
           if(sum%10==0) {t=i;break;}
           else sum-=3*i;
           }
           else if((m-j)%3==0)  {
                sum+=7*i;
                if(sum%10==0) {t=i;break;}
                else sum-=7*i;
                }
        }
        cout<<"Scenario #"<<count<<":"<<endl;
        for(i=0;i<m;i++)
        {if(i==j) cout<<t;
         else cout<<s[i];
        }
        cout<<endl<<endl;
        count++;
    }
    system("pause");
    return 0;
}

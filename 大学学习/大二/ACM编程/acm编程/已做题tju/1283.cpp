#include<iostream>//这题第一次错在：对double取下界时,光取整是错的，负数时要另外考虑 
#include<string>
using namespace std;
int main()
{
    int n,m,i,j,k,t,y,a[4]={1,10,100,1000},e,temp;
    string s;
    cin>>n;
    while(n--)
    {
        cin>>s;
        m=s.size();
        for(i=0;i<m;i++) 
        if(s[i]=='=') {e=i;break;}
        t=0;
        y=0;
        for(i=0;i<=e;i++)
        {
           if(s[i]=='x') 
           {
              j=i-1;
              if(i==0) {t+=1;continue;}
              else if(s[j]=='-') {t-=1;continue;}
              temp=0;
              while(j>=0&&s[j]>='0'&&s[j]<='9')
              {
                 temp+=(s[j]-'0')*a[i-j-1];
                 j--;
              }
              if(i-j==1&&j>0&&s[j]=='+') temp+=1;
              else if(i-j==1&&j>0&&s[j]=='-') temp-=1;
              else if(j>=0&&s[j]=='-') temp=0-temp;
              t+=temp;
           }
           else if(s[i]=='-'||s[i]=='+'||s[i]=='=')
           {
               if(i==0) continue;
               if(s[i-1]=='x') continue;
               else{
                   temp=0;
                   k=i-1;
                   while(k>=0&&s[k]>='0'&&s[k]<='9')
                   {
                       temp+=(s[k]-'0')*a[i-k-1];
                       k--;
                   }
                   if(k<0) y+=temp;
                   else if(s[k]=='-') y-=temp;
                   else if(s[k]=='+') y+=temp;
                   
                 }
               
           }
        }
        for(i=e+1;i<m;i++)
        {
            if(s[i]=='x') 
            {
                j=i-1;
                if(i==e+1) {t-=1;continue;}
                else if(s[j]=='-') {t+=1;continue;}
                temp=0;
                while(j>=0&&s[j]>='0'&&s[j]<='9')
                {
                   temp+=(s[j]-'0')*a[i-j-1];
                   j--;
                }
                if(i-j==1&&j>e&&s[j]=='+') temp+=1;
                else if(i-j==1&&j>e&&s[j]=='-') temp-=1;
                else if(j>e&&s[j]=='-') temp=0-temp;
                t-=temp;
            }
            else if(s[i]=='-'||s[i]=='+')
            {
               if(i==e+1) continue;
               if(s[i-1]=='x') continue;
               else{
                   temp=0;
                   k=i-1;
                   while(k>e&&s[k]>='0'&&s[k]<='9')
                   {
                       temp+=(s[k]-'0')*a[i-k-1];
                       k--;
                   }
                   if(k==e) y-=temp;
                   else if(s[k]=='-') y+=temp;
                   else if(s[k]=='+') y-=temp;
                  }
            }
            
        }
        if(s[m-1]!='x') 
        {
           k=m-1;
           temp=0;
           while(k>e&&s[k]>='0'&&s[k]<='9')
           {
              temp+=(s[k]-'0')*a[m-1-k];
              k--;
           }
           if(k==e) y-=temp;
           else if(k>e&&s[k]=='-') y+=temp;
           else if(s[k]=='+') y-=temp;
        }
        y=0-y;
        if(t==0&&y==0) cout<<"IDENTITY"<<endl;
        else if(t==0&&y!=0) cout<<"IMPOSSIBLE"<<endl;
        else {
           double x=(float)y/t;
           if(x>0) cout<<(int)x<<endl;
           else {
                double b=(int)x;
                if(b-x<0.000001) cout<<(int)x<<endl;
                else cout<<(int)(x-1)<<endl;
                }
             }
    }
    system("pause");
    return 0;
}

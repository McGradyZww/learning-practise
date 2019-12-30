#include<iostream>
#include<memory.h>
using namespace std;
int main()
{
    int start[1000],tracked[1001],out[1001];
    int ca,i,j,n,m,t;
    while(cin>>ca&&ca)
    {
     
      while(cin>>start[0]&&start[0])
      {
        for(i=1;i<ca;i++) cin>>start[i];
        memset(tracked,0,sizeof(tracked));
        memset(out,0,sizeof(out));
        t=0;
        for(i=0;i<ca;i++)
        {
          if(!tracked[start[i]])
            for(j=1;j<=start[i];j++)
            if(!out[j])tracked[j]=1;
            for(j=start[i]+1;j<=ca;j++)
            {
                if(tracked[j]&&!out[j]) {t=1;cout<<"No"<<endl;break;}
            }
            if(t) break;
            out[start[i]]=1;
            tracked[start[i]]=0;
            
        }
        if(i==ca) cout<<"Yes"<<endl;
      }
      cout<<endl;
    }
    system("pause");
    return 0;
}

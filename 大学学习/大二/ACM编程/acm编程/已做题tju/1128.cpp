#include<iostream>
#include<string.h>
#include<memory.h>
using namespace std;
int main()
{
    char s[20][100];
    int b[20][10],m,i,j,k;
    while(cin>>s[0])
    {
       if(strcmp(s[0],"-1")==0) break;
       m=strlen(s[0]);
       memset(b,0,sizeof(b));
       for(i=0;i<m;i++) b[0][s[0][i]-'0']++;
       k=1;
       while(k<16)
       {
          j=0;
          for(i=0;i<10;i++)
          {
             if(b[k-1][i]!=0){
                if(b[k-1][i]<10){
                  s[k][j++]=b[k-1][i]+'0';
                  s[k][j++]=i+'0';
                  }
                else {
                     s[k][j++]=b[k-1][i]/10+'0';
                     s[k][j++]=b[k-1][i]%10+'0';
                     s[k][j++]=i+'0';
                     } 
             }
          }
          s[k][j]='\0';
          for(i=k-1;i>=0;i--){
          if(strcmp(s[k],s[i])==0)
          {
            if(i==k-1){
              if(k==1) {cout<<s[0]<<" is self-inventorying"<<endl;break;}
              else {cout<<s[0]<<" is self-inventorying after "<<k-1<<" steps"<<endl;break;}
              }
             else {
                  cout<<s[0]<<" enters an inventory loop of length "<<k-i<<endl;break;
                  }
          }
          }
          if(i>=0) break;
          
          m=strlen(s[k]);
          for(i=0;i<m;i++) b[k][s[k][i]-'0']++;
          //cout<<s[k]<<endl;
          k++;
       }
       if(k==16) cout<<s[0]<<" can not be classified after 15 iterations"<<endl;
       
    }
    system("pause");
    return 0;
}

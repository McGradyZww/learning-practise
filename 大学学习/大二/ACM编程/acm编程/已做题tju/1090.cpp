#include<iostream>
#include<memory.h>
using namespace std;
int main()
{
    int m,n,b[201][201],num[201],i,j,k,len;
    char input[201][201];
    cin>>m>>n;
    memset(b,1,sizeof(b));
    memset(num,0,sizeof(num));
    for(i=0;i<m;i++)
        cin>>input[i];    
    for(i=0;i<n;i++)
      for(j=0;j<m;j++)
        if(input[j][i]=='0'&&b[j][i])
        {
            len=1;
            k=j+1;
            while(k<m&&input[k][i]=='0')
            {
               b[k][i]=0;
               k++;
               len++;
            }
            num[len]++;
        }
    for(i=1;i<=m;i++)
     if(num[i]) cout<<i<<" "<<num[i]<<endl;
    system("pause");
    return 0;
}

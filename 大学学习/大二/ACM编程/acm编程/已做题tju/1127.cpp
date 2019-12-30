#include<iostream>
#include<string>
using namespace std;
int main()
{
    int n,m;
    cin >>n>>m;
    
    
          string inch[200];
          int x[200];
          int i,j,k;
          bool a[5000];
          for (int t=0;t<5000;t++)
          {
              a[t]=false;
          }
    
          for (i=0;i<m;i++)
          {
              cin >>inch[i];
              x[i]=0;
              
              for (j=0;j<n;j++)
              {
                  for (k=1;k<n;k++)
                  {
                      if ((j+k)>=n) break;
                      if (inch[i][j]=='A') break;
                      if ((inch[i][j]=='C')&&(inch[i][j+k]=='A')) {x[i]=x[i]+1;continue;}
                      if ((inch[i][j]=='G')&&((inch[i][j+k]=='A')||(inch[i][j+k]=='C'))) {x[i]=x[i]+1;continue;}
                      if ((inch[i][j]=='T')&&(inch[i][j+k]!='T')) {x[i]=x[i]+1;continue;}
                      
                  }
              }
              a[x[i]]=true; 
          }
          int h=0;
          int l;
           while (h<5000)
          {
              if (a[h])
              {
                        l=0;
                        while (l<m)
                        {
                            if (x[l]==h) cout<<inch[l]<<endl;
                            l++;
                        }
              }
              h++;
          }
    
    system("pause");
    return 0;
}

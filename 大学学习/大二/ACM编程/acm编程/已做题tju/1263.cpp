#include<iostream>
using namespace std;
int main()
{
    int n,m,i,j,k,h,s,t,b;
    cin >>n;
    string a[101];
    int x[101];
    char left[101],right[101];
    while (n>0)
    {
          cin >>m;
          for (i=0;i<m;i++) {cin >>a[i];x[i]=a[i].size();}
          //接下来找出长度最小的字符串
          k=x[0];
          for (i=1;i<m;i++)
          {
              if (x[i]<k) 
              k=x[i];
          }
          for (i=0;i<m;i++) 
          {
              if (x[i]==k) 
              break;
          }
          for (j=k;j>=0;j--)
          {
              for (h=0;h<(k+1-j);h++) 
              {
                  t=0;
                  for (s=0;s<j;s++) 
                  { left[t]=a[i][h+s];
                    right[t]=a[i][h+j-1-s];
                    t++;
                  }
                  left[j]='\0';right[j]='\0';
                  for (b=0;b<m;b++)
                  {
                     if ((a[b].find(left)!=-1)||(a[b].find(right)!=-1)) //find()return -1,如果没找到；否则返回非负数 
                       continue;
                     else break;
                  }
                  if (b==m) 
                    break;
              }
              if (b==m) 
              {cout <<j<<endl;break;}
          }
          n--;
    }
   
    system("pause");
    return 0;
}

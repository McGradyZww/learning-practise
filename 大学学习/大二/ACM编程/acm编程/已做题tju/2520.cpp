#include<iostream>
using namespace std;
int main()
{
    char a[256];
    int x[256];
    cin.getline(a,256);
    int i,m,k,j;
    while (a[0]!='#')
    {
          for (j=1;j<256;j++) x[j]=0;
          m=strlen(a); 
          for (i=1;i<=m;i++) 
          {
              if ('A'<=a[i-1]&&a[i-1]<='Z') //if ('A'<=a[i-1]<='Z')是错的 ，它从左到右！！！！！！！！！！ 
              x[i]=i*(a[i-1]-'A'+1);
          }
          k=0;
          for (i=1;i<=m;i++) k=k+x[i];
          cout <<k<<endl; 
          cin.getline(a,256);
    }
    system("pause");
    return 0;
}

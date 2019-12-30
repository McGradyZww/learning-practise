#include<iostream>
#include<string>
using namespace std;
int main()
{
    int n,m,k,i,j;
    string a;
    cin >>n;  
    j=1;
    while (n>0)
    {
        
          cin >>m;
          cin >>a;
          k=a.size();
          cout <<j<<" ";
          for (i=0;i<m-1;i++) cout <<a[i];
          for (i=m;i<k;i++) cout <<a[i];
          cout <<endl;
          n--;
          j++;
    }
    system("pause");
    return 0;
}

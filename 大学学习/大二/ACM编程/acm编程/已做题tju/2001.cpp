#include<iostream>
#include<string>
using namespace std;
int main()
{
    int n,m,i,d,num;
    string a[11];
    cin >>n;
    d=1;
    while (n>0)
    {
          num=0;
          cin >>m;
          for (i=0;i<m;i++) cin >>a[i];
          for (i=0;i<m;i++) 
          {
              if (a[i]=="sheep") num++;
          }
          if (d!=1) 
          cout <<endl;
          cout <<"Case"<<" "<<d<<": This list contains"<<" "<<num<<" "<<"sheep."<<endl; 
         
          n--;
          d++;
    }     
    system("pause");
    return 0;
}

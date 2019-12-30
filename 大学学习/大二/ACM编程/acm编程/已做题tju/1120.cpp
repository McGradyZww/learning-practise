#include<iostream>
#include<stdio.h>
#include<string>
using namespace std;
int main()
{
    string t,a,b;
    float n;
    char ch;
    float m;
    cin>>a;
    while(a!="#")
    {
                 m=0.0;
                 while(a!="0"){
                         cin>>b>>n>>ch;
                         if(ch=='F')
                         {
                                    m+=2*n;
                         }
                         else if(ch=='B')
                         {
                              m+=3*n/2;
                         }
                         else if(ch=='Y')
                         {
                              if(n>500) m+=n;
                              else m+=500.0;
                         }
                         cin>>a;      
                 }
                  printf("%.f\n",m);
                 
                 cin>>a;
    }
    system("pause");
    return 0;
}

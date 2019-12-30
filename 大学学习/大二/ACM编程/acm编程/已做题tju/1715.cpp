#include<iostream>
#include<cmath> 
#include<stdio.h> 
using namespace std;
int main()
{
    float m1; 
    int n,m2,count=1;
    cin>>n;
    double r,t; 
    while(n--)
    {
      cin>>m1>>m2;
      t=sin(3.1415926/m2);
      r=(t*m1)/(1+t);
      cout<<"Scenario #"<<count<<":"<<endl;
      printf("%.3f",r); 
      cout<<endl<<endl; 
      count++; 
    } 
    system("pause");
    return 0; 
} 

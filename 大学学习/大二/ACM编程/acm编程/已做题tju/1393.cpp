#include<iostream>  
#include<cmath> 
#include<stdio.h> ///////开double的立方根！！！！！！！ 
using namespace std;
int main()
{ 
    int m,n;
    double t,d; 
    cin>>m>>n; 
    while(m!=0)
    {
         
        t=m*m*m-6*n/3.1415926;
        d=pow(t,1.0/3.0);
        printf("%.3f\n",d); 
        cin>>m>>n; 
    }          
    system("pause"); 
    return 0;
}


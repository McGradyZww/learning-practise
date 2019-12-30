#include<iostream>  
#include<string> 
#include<stdio.h> 
using namespace std;
int main()
{ 
    int m,n,i;
    double sum; 
    string a[1001],c;
    int b[1001]; 
    cin>>m>>n;
    for(i=0;i<m;i++) cin>>a[i]>>b[i];
    while(n>0){ 
       sum=0.0; 
       while(cin>>c&&c!=".")
       {
         for(i=0;i<m;i++) 
         if(c==a[i]) sum=sum+b[i]; 
       }
       printf("%.f\n",sum); 
    n--; 
    } 
    system("pause"); 
    return 0;
}


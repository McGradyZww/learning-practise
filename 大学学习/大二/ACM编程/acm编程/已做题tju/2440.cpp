#include<iostream>
#include <algorithm>
using namespace std;
int main()
{
    int n,min1,min2,max1,max2,i,count=0,flag=0;
    cin>>n;
                  
    int *t=new int[n];
    for(i=0;i<n;i++) cin>>t[i];
    sort(t,t+n);
    while(n){
    if (n==1) {cout<<t[0]<<endl;break;}
    if (n==2) {
     if(flag==0) {cout<<t[1]<<endl;break;}
     else if(flag==1) {cout<<count<<endl;break;}
     }
    if(n==3){
    if(flag==0) {cout<<t[0]+t[1]+t[2]<<endl;break;}
    else if(flag==1){count+=min1+t[n-1];
    cout<<count<<endl;
    break;}
    }
    else {
    min1=t[0];
    min2=t[1];   
    max1=t[n-1];
    max2=t[n-2];
    if(flag==0){
    if ((2*min2)>=(max2+min1)) count+=min2+min1*2+max1+max2;
    else if((2*min2)<(max2+min1)) count+=3*min2+min1+max1;}
    else if(flag==1){
         if ((2*min2)>=(max2+min1)) count+=min1*2+max1+max2;
    else if((2*min2)<(max2+min1)) count+=2*min2+min1+max1;}
    n=n-2;
    flag=1;
   }
   }
   delete []t;

    system("pause");
    return 0;
}

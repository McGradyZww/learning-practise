#include<iostream>
using namespace std;
int f(int n)
{
    int i,sum=0;
    for(i=1;i<n;i++)
    if(n%i==0) sum+=i;
    if(sum<n) return 0;
    else if(sum==n) return 1;
    else if(sum>n) return 2;
}
int main()
{
    int num1[100],num2[100],n,t[100],p;
    int i=0,j;
    while(cin>>n&&n!=0)
    {
       t[i]=1;
       num1[i]=n;
       num2[i]=f(n);  
       while(n>=10)
       {n=n/10;t[i]++;}           
       i++;
    }
    cout<<"PERFECTION OUTPUT"<<endl;
    for(j=0;j<i;j++)    
    {
       for(p=0;p<5-t[j];p++) cout<<" ";
       if(num2[j]==0) cout<<num1[j]<<"  "<<"DEFICIENT"<<endl;
       else if(num2[j]==1) cout<<num1[j]<<"  "<<"PERFECT"<<endl;
       else if(num2[j]==2) cout<<num1[j]<<"  "<<"ABUNDANT"<<endl;
    } 
    cout<<"END OF OUTPUT"<<endl;                 
    system("pause");
    return 0;
}

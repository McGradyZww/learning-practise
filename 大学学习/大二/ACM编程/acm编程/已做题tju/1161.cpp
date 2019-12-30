#include<iostream>
#include<string.h>
#include<stdlib.h>
using namespace std;
char a[100000][9];
string b,c="22233344455566677778889999";
int compare(const void * ele1,const void * ele2)
{
     return (strcmp((char *)ele1,(char *)ele2));
}
void standard(int n)
{
    int i,k;
    k=0;
    for(i=0;i<b.size();i++)
    {      
        if(b[i]=='-') continue;
        if(k==3) {a[n][k]='-';k++;}
        if(b[i]>='A'&&b[i]<='Z') {a[n][k]=c[b[i]-'A'];k++;}
        else {a[n][k]=b[i];k++;}
        
    }
    a[n][8]='\0';
}
int main()
{
    int n,i,j;
    bool p;
    cin>>n;
    for(i=0;i<n;i++)
    {
       cin>>b;
       standard(i);
    }
    qsort(a,n,9,compare);
    p=1;
    for(i=0;i<n;i+=(j-i))
    {
    for(j=i+1;j<n;j++) 
    {
       if(strcmp(a[i],a[j])!=0)  break;     
    }
    if(j-i>1) {cout<<a[i]<<" "<<j-i<<endl;p=0;}
    }
    if(p) cout<<"No duplicates."<<endl;
    system("pause");
    return 0;
}

#include<iostream>
#include<string>
using namespace std;
int cal(int n);
int main()
{
    int ca,m,n,k1,k2,i;
    string b,d;
    int c[10],e[10];
    cin>>ca;
    while(ca>0)
    {
            cin>>b>>d;
            k1=b.size();
            k2=d.size();
            for(i=0;i<k1;i++) c[i]=b[i]-'0';
            for (i=0;i<k2;i++) e[i]=d[i]-'0';
            m=0;n=0;
            for (i=0;i<k1;i++) m+=c[i]*cal(i);
            for (i=0;i<k2;i++) n+=e[i]*cal(i);
            cout<<m+n<<endl<<endl;
            ca--;
               
    }
    system("pause");
    return 0;
}
int cal(int n)
{
    int i,k=1;
    for (i=0;i<n;i++) k=k*10;
    return k;
}

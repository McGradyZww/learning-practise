#include<iostream>
using namespace std;
int main()
{
    int a,b,c,d,a1,b1;
    double m1,n1,m2,n2; 
    int ans; 
    while(cin>>a>>b>>c>>d)
    {
        if(a==0&&b==0&&c==0&&d==0) break;
        m1=(double)c/a;
        m2=(double)d/b;
        m1=m1>m2?m2:m1; 
        n1=(double)c/b;
        n2=(double)d/a; 
        n1=n1>n2?n2:n1;
        m1=m1*100;
        n1=n1*100;
        a1=(int)m1;
        b1=(int)n1; 
        ans=a1>b1?a1:b1;
        if(ans>100) cout<<100<<"%"<<endl; 
        else cout<<ans<<"%"<<endl; 
    } 
    system("pause");
    return 0; 
} 

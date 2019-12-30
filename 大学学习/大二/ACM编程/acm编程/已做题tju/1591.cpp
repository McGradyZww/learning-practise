#include<iostream>
#include<stdio.h>
#include<math.h>
using namespace std;
int main()
{
    float a,b,c;
    int count=1;
    while(cin>>a>>b>>c&&a!=0&&b!=0&&c!=0)
    {
        cout<<"Triangle #"<<count<<endl;
        if(a==-1) 
        {
             if(b>=c) cout<<"Impossible."<<endl<<endl;
             else {a=sqrt(c*c-b*b);
             printf("a = %.3f\n\n",a);}
        }
        else if(b==-1)
        {
             if(a>=c) cout<<"Impossible."<<endl<<endl;
             else {b=sqrt(c*c-a*a);
             printf("b = %.3f\n\n",b);}
        }
        else if(c==-1)
        { 
             c=sqrt(a*a+b*b);
             printf("c = %.3f\n\n",c);
        }
        count++;
    }
    system("pause");
    return 0;
}

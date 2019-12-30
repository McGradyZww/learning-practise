#include<iostream>
using namespace std;
int main()
{
    bool yes[1000000];
    for (int n=2;n<1000000;n++)
    {
        for (int p=n;p<1000000/n;p++)
            yes[n*p]=true;
    }
    int a,b,j,i=0,su[150000];
    for(j=3;j<1000000;j++)
    {if(!yes[j])
     {su[i]=j;
     i++;}
    }
    cin >>a;
    while (a!=0)
    {
        for (i=0;i<150000;i++)
        {
            b=a-su[i];
            if (!yes[b])
            {
            cout <<a<<" "<<"="<<" "<<su[i]<<" "<<"+"<<" "<<b<<endl;
            break;
            }
        }
        cin >>a;
    }
    system("pause");
    return 0;
}  

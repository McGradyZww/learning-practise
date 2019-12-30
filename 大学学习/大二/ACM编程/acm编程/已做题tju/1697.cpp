#include<iostream>     ///////////////Steve±ØÓ®£¡£¡£¡£¡ 
#include<algorithm>
using namespace std;
int main()
{
    int n,m,num,count1,count2,count3,sum1,sum2,sum3,i,count=1;
    cin>>n;
    int a[25],b[25];;
    while(n--)
    {
        cin>>m>>num;
        for(i=0;i<num;i++) cin>>a[i];
        sort(a,a+num);
        count2=0;
        sum2=0;
        for(i=0;i<num;i++)
        {
           if((sum2+a[i])>m) break;           
           sum2+=a[i];
           b[count2]=sum2; 
           count2++;
        }
        sum2=0; 
        for(i=0;i<count2;i++) sum2+=b[i]; 
        cout<<"Scenario #"<<count<<":"<<endl;
        cout<<"Steve wins with "<<count2<<" solved problems and a score of "<<sum2<<"."; 
        cout<<endl<<endl;
        count++;
    }
    system("pause");
    return 0;
}

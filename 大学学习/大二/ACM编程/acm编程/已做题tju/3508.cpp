#include<iostream>
#include<algorithm>
using namespace std;
int main()
{
    int ca,n,i,j,count;
    long long sum,a[801],b[801];
    count=1;
    cin>>ca;
    while(ca--)
    {
        cin>>n;
        for(i=0;i<n;i++) cin>>a[i];
        for(i=0;i<n;i++) cin>>b[i];
        sort(a,a+n);
        sort(b,b+n);
        sum=0;
        for(i=0,j=n-1;i<n&&j>=0;i++,j--)
        {
           sum+=a[i]*b[j];
        }
        cout<<"Case #"<<count<<": "<<sum<<endl;        
        count++;
    }
    system("pause");
    return 0;
}

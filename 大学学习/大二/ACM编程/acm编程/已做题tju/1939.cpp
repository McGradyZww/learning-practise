#include<iostream>
using namespace std;
int main()
{
    int ca,i,k;
    cin >>ca;
    int a[10],b[10],x[10];
    while (ca!=-1)
    {
        k=0;
        for (i=0;i<ca;i++) cin >>a[i]>>b[i];
        x[0]=a[0]*b[0];
        for (i=1;i<ca;i++)
        {
            x[i]=a[i]*(b[i]-b[i-1]);
        }  
        for (i=0;i<ca;i++) k=k+x[i];
        cout <<k<<" "<<"miles"<<endl;
        cin >>ca;
    }
    system("pause");
    return 0;
}

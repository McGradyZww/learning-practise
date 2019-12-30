#include<iostream>
using namespace std;
int main()
{
    int a1,a2,b1,b2,c1,c2,m,n;
    cin>>a1>>a2>>b1>>b2>>c1>>c2;
    while(a1!=0||a2!=0||b1!=0||b2!=0||c1!=0||c2!=0)
    {
                                                   m=a1+a2;
                                                   n=a1+b1+c1-a2-b2-c2;
                                                   cout<<"Anna's won-loss record is "<<(m-n)/2<<"-"<<(m+n)/2<<"."<<endl;
                                                   cin>>a1>>a2>>b1>>b2>>c1>>c2;
    }
    system("pause");
    return 0;
}

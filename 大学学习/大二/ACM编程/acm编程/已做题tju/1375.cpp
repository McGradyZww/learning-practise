#include<iostream>  //1��11,111,1111.������n��������С��1�ĸ��� 
using namespace std;
int main()
{ 
    int n;            //��Щ���ı������ܽϴ�һ��һ�������׳�ʱ 
    int a,count;                  //��һ��������n�������ǣ�ǰһ������*10+1��/n; 
    while(cin>>n)
    {
        count=1;
        a=1; 
        a=a%n;
        while(a!=0)
        {
           count++;
           a=a*10+1; 
           a=a%n; 
        } 
        cout<<count<<endl; 
    } 
    system("pause"); 
    return 0;
}


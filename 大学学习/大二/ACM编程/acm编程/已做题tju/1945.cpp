#include<iostream>
#include<math.h>
using namespace std;
int pow(int n)
{
    return n*n*n;
}
int main()
{
    int a,b,c,d;
    for(a=6;a<=200;a++)
    {
       for(b=2;b<a;b++)
       {
          for(c=b;c<a;c++)
          {
             for(d=c;d<a;d++)
             if(pow(a)==(pow(b)+pow(c)+pow(d)))
             cout<<"Cube = "<<a<<", Triple = ("<<b<<","<<c<<","<<d<<")"<<endl;
          }
       }
    }
    system("pause");
    return 0;  
}

#include<iostream>
using namespace std;
int main()
{
    int a,b,c,d;
    long cube[201];
    for(int i=1;i<=200;i++)
    cube[i]=i*i*i; 
    for(a=6;a<=200;a++)
      for(b=2;b<a-1;b++)
      {
         if(cube[a]<cube[b]+cube[b+1]+cube[b+1]) break;
         for(c=b+1;c<a;c++)
         {
            if(cube[a]<cube[b]+cube[c]+cube[c+1])  break;
            for(d=c+1;d<a;d++)
            {
               if(cube[a]<cube[b]+cube[c]+cube[d]) break;
               else if(cube[a]==cube[b]+cube[c]+cube[d]) 
                cout<<"Cube = "<<a<<", Triple = ("<<b<<","<<c<<","<<d<<")"<<endl; 
            } 
         } 
      } 
    system("pause");
    return 0; 
} 

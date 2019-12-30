#include<iostream>
using namespace std;
int main()
{
    int a,b,c,num,temp;
    cin>>a>>b>>c;
    if((b-a)<=(c-b))
    {
       num=0;
       while(c-b>=2)
       {
          num++;
          b++;
       }
    }
    else{
         num=0;
         while(b-a>=2)
         {
            num++;
            b--;
         }
    }
    cout<<num<<endl;
    system("pause");
    return 0;
}

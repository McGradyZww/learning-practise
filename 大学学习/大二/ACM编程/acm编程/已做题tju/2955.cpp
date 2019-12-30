#include<iostream>
#include<math.h>
using namespace std;
int main()
{

    int a[3],b[3],m,n,i;
    for(i=0;i<3;i++)
    cin>>a[i]>>b[i];
    if(a[0]==a[1]) 
    {
             if(b[2]==b[0]) cout<<a[2]<<" "<<b[1]<<endl;
             else cout<<a[2]<<" "<<b[0]<<endl;      
    }
    else if(a[0]==a[2])
    {        
             if(b[1]==b[0]) cout<<a[1]<<" "<<b[2]<<endl;
             else cout<<a[1]<<" "<<b[0]<<endl;  
    }
    else if(a[1]==a[2])
    {
         
             if(b[0]==b[1]) cout<<a[0]<<" "<<b[2]<<endl;
             else cout<<a[0]<<" "<<b[1]<<endl;  
    }
  

    system("pause");
    return 0;
}

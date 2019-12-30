#include<iostream>
using namespace std;
int main()
{
    int M,L,num[10000],I,Z,i,count,j,flag1,flag2,flag3=1;
    cin>>Z>>I>>M>>L;
    while(Z!=0||I!=0||M!=0||L!=0){
       i=1;
       flag2=0;
       num[0]=L;
       count=1;
       while(1)
       {
          L=(Z*L+I)%M;
          for(j=0;j<count;j++)
          if(L==num[j]) 
          {flag1=j;flag2=1;break;}
          num[i]=L;
          if(flag2==1) 
          break;
          i++;
          count++;
       }
       cout<<"Case "<<flag3<<": ";
       cout<<i-flag1<<endl; 
       
       cin>>Z>>I>>M>>L;
       flag3++;
     
    } 
    system("pause");
    return 0;
}

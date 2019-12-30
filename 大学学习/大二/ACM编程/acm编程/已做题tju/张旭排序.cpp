#include<iostream>
using namespace std;
int main()
{int k5,k2,lc3,lc7,k4,c1,common[10000];
   cin>>k2;
   for(lc3=0;lc3<k2;lc3++)
     cin>>common[lc3];
  for(k5=k2;k5>0;k5--)
  {for(lc3=0;lc3<k2;lc3++)
       { k4=common[lc3];
         c1=0;
         for(lc7=0;lc7<k2;lc7++)
         { if(common[lc7]>k4)
           c1++;
         }
         if(c1==k5-1)
         cout<<k4<<" ";
       }
  }
       system("pause");
       return 0;
}

#include<iostream>
#include<string.h>
#include<memory.h>
using namespace std;
struct Node{
      int x,y;
      int next;
}node[200];
Node tail,head;
int main()
{
    int n,i,k,a[51][51];
    char s[101];
    while(cin>>n&&n)
    {
       cin>>s;
       memset(a,0,sizeof(a));
       for(k=0;k<200;k++) node[k].next=k+1;
       k=0;
       for(i=11;i<=30;i++) 
       {
          node[k].x=25;node[k].y=i;
          k++;
          a[25][i]=1;
       }
       tail=node[0];head=node[k-1];
       for(i=0;i<n;i++)
       {
           a[tail.x][tail.y]=0;
           tail=node[tail.next];
           
           if(s[i]=='N')
           {
              if((head.x-1)<1) 
              {cout<<"The worm ran off the board on move "<<i+1<<"."<<endl;break;}
              else if(a[head.x-1][head.y]) 
              {cout<<"The worm ran into itself on move "<<i+1<<"."<<endl;break;}
              else 
              {node[k].x=head.x-1;node[k].y=head.y;head=node[k];a[head.x][head.y]=1;k++;}
           }
           else if(s[i]=='S')
           {
              if((head.x+1)>50) 
              {cout<<"The worm ran off the board on move "<<i+1<<"."<<endl;break;}
              else if(a[head.x+1][head.y]) 
              {cout<<"The worm ran into itself on move "<<i+1<<"."<<endl;break;}
              else 
              {node[k].x=head.x+1;node[k].y=head.y;head=node[k];a[head.x][head.y]=1;k++;}
           }
           else if(s[i]=='W')
           {
              if((head.y-1)<1) 
              {cout<<"The worm ran off the board on move "<<i+1<<"."<<endl;break;}
              else if(a[head.x][head.y-1]) 
              {cout<<"The worm ran into itself on move "<<i+1<<"."<<endl;break;}
              else 
              {node[k].x=head.x;node[k].y=head.y-1;head=node[k];a[head.x][head.y]=1;k++;}
           }
           else if(s[i]=='E')
           {
              if((head.y+1)>50) 
              {cout<<"The worm ran off the board on move "<<i+1<<"."<<endl;break;}
              else if(a[head.x][head.y+1]) 
              {cout<<"The worm ran into itself on move "<<i+1<<"."<<endl;break;}
              else  
              {node[k].x=head.x;node[k].y=head.y+1;head=node[k];a[head.x][head.y]=1;k++;}
           }
       }
       if(i==n) 
       cout<<"The worm successfully made all "<<n<<" moves."<<endl;
    }
    system("pause");
    return 0;
}

#include<iostream>
#include<cstdlib>
typedef struct linklist{
        int data;
        linklist *next;
}*LinkList;
LinkList p1,p2,p,temp,pre,aft;
int k,m,n,t;
void Create();
using namespace std;
int main()
{
	int count;
   cin>>k;
   while(k!=0)
   {    n=1;  
        while (1) 
        {
          for(m=n*k+1;m<=k*(n+1);m++)
          {                 
             Create();
             count=0;
             p=temp;
             while (p)
             {
             for (int i=0;i<m-2;i++) 
             p=p->next;
             pre=p->next;aft=pre->next;
             
             
             if (1<=pre->data&&pre->data<=k) 
             break;
             else {
                  count++;
                  p->next=aft;
                  p=aft;
                  }
             if (count==k) 
             break;
             
             }
             
            
             if (count==k) 
             break;
          }
          if (count==k) {cout<<m<<endl;break;}
          n+=2; 
          }
          cin>>k;
   }
          
    
    system("pause");
    return 0;
}
void Create()
{
     int count =1;
     p2=(LinkList)malloc(sizeof(linklist));
     p2->data=count++;
     p1=p2;
     temp=p1;
     for (int i=0;i<2*k-1;i++)
     {
         p2=(LinkList)malloc(sizeof(linklist));
         p2->data=count++;
         p1->next=p2;
         p1=p2;
         
     }
     p2->next=temp;
}

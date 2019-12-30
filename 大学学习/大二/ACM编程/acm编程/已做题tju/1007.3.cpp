#include<iostream>
#include<cstdlib>
typedef struct linklist{
        int data;
        linklist *next;
}*LinkList;
LinkList p1,p2,p,temp,pre,aft;
int k,m,n;
void Create();
using namespace std;
int main()
{
    cin>>k;
    while (k!=0)
    {
          
          for(m=k+1;m>0;m++)
          {
             Create();
             int count=0;
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
             if (1<=pre->data&&pre->data<=k) 
             continue;
             if (count==k) 
             {cout<<m<<endl;break;}
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

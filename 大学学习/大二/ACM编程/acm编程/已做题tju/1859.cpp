#include<iostream>
#include<math.h>
#include<memory.h> 
using namespace std;
/*int prim(int a) /////�ж���������Ч�����㷨  �������⻹�ǳ�ʱ ���������ҳ�������һһ�жϣ� 
{ 
    int i;   
    if(a%2==0) return 0; 
    for(i=3;i <=sqrt(doublea);i+=2) 
    { 
       if(a%i==0)return 0; 
    } 
    return 1; 
} */
bool b[35000];
 
void init() //�ҳ�35000���������� 
{
     int i,j; 
     memset(b,1,sizeof(b)); 
     for(i=2;i<35000;i++) 
     if(b[i]) for(j=2;i*j<35000;j++)  b[i*j]=0; 
} 

int main()
{
    init(); 
    int n,i,count;
    while(cin>>n&&n!=0)
    { 
       count=0;
       if(n==4)  cout<<1<<endl; 
       else {
            for(i=3;i<=n/2;i+=2)
            {
               if(b[i]&&b[n-i]) count++;
            }
            cout<<count<<endl;
            } 
    }
    system("pause");
    return 0;
}

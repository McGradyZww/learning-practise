#include<iostream>
#include<math.h> 
using namespace std;
int prim(int a)                          //�ж����� 
{ 
        int i; 
        if(a==1) return 0; 
        if(a==2) return 1; 
        if(a%2==0) return 0; 
        for(i=3;i<=sqrt(a);i+=2) 
        { 
            if(a%i==0)return 0; 
        } 
        return 1; 
} 
 
int main()
{
    int n,num,i,m;                  //num��������Ŀ                    // 
    while(cin>>n)
    { 
       num=0; 
       if(n==0) break;
       for(i=1;i<=sqrt(n);i++)         //sqrt(n)��λ���������ӵ��м�ֵ,�п��ܵ���,���￼������һ������ 
       {
          if(n%i==0) {                   //������i 
          if(prim(i)) num++;             //�ж����� 
          m=n/i;                           //�ж���һ����Ӧ�����ǲ�������  
          if(m!=i&&prim(m)) num++;            // ��9�����ģ�3��3��ͬһ�������ų� 
          } 
          
       } 
       cout<<n<<" : "<<num<<endl; 
    }
    system("pause");
    return 0;
}

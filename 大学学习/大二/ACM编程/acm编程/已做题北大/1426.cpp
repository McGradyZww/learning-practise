#include<iostream>//////////////////ps.�ύ��ʱ����G++AC,��C++  tle!!! 
#include<queue>//���ȶ��е�ʹ�� 
using namespace std;
int n; 
long long BFS()
{
     queue<long long> p;
     if(!p.empty()) 
     p.pop(); 
     p.push(1); //����Ԫ�� 
     while(1)
     {
        long long s=p.front();//��ͷԪ�� 
        if(s%n==0) return s;
        p.pop();//ɾ����ͷԪ�� 
        p.push(10*s);
        p.push(10*s+1); 
        
         
     } 
} 
int main()
{ 
    while(cin>>n&&n)
    {
       cout<<BFS()<<endl;
    }
    system("pause");
    return 0;
}

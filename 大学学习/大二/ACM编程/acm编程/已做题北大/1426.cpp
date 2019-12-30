#include<iostream>//////////////////ps.提交的时候用G++AC,用C++  tle!!! 
#include<queue>//优先队列的使用 
using namespace std;
int n; 
long long BFS()
{
     queue<long long> p;
     if(!p.empty()) 
     p.pop(); 
     p.push(1); //插入元素 
     while(1)
     {
        long long s=p.front();//最头元素 
        if(s%n==0) return s;
        p.pop();//删除最头元素 
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

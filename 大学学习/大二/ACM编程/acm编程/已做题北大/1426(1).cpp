#include <iostream>
#include <queue>
using namespace std;
int n;
long long bfs()
{
     queue<long long> p;
     while(!p.empty())
     p.pop();
     p.push(1);
     while(1)
     {
             long long sum=p.front();
             if(sum%n==0)
             return sum;
             p.pop();
             p.push(10*sum);
             p.push(10*sum+1);
     }
}
int main()
{
    while(cin>>n,n)
    {
                   cout<<bfs()<<endl;
    }
    return 1;
}


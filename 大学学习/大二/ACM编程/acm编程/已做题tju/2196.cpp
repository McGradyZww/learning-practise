#include<iostream>
#include<algorithm>
#include<vector>
using namespace std;
int main()
{
    int n,i,m;
    vector<int> a;
    char ch;
    while(cin>>n&&n!=0)
    {
       a.clear();
       for(i=0;i<n;i++)
       {
          cin>>ch;
          if(ch=='B') 
          {
             cin>>m;
             a.push_back(m);
          }
          else if(ch=='G')
          {
              sort(a.begin(),a.end());
              cout<<a[0]<<endl;
              a.erase(a.begin()); 
          }
          
       }
    }
    system("pause");
    return 0;
}

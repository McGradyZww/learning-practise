#include<iostream>
using namespace std;
int main()
{ 
  int n,m[100],i,count=1,sum,t;
  while(cin>>n&&n!=0)
  {
     sum=0;
     t=0;
     for(i=0;i<n;i++) {cin>>m[i];t+=m[i];}
     t=t/n;
     for(i=0;i<n;i++) 
     if(m[i]>t) sum+=m[i]-t;
     cout<<"Set #"<<count<<endl;
     cout<<"The minimum number of moves is "<<sum<<"."<<endl<<endl;
     count++;
  }
   system("pause");
   return 0;
}

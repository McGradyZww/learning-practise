#include<iostream>
using namespace std;
int main()
{
    int score[10001];
    int num,rank=0,m,i;
    
    while (cin>>num)
    {
          for (i=0;i<num;i++)
          cin>>score[i];
          m=score[0];
          for (i=1;i<num;i++)
          {
             if (score[i]>m) rank++;
          }
          rank+=1;
          cout<<rank<<endl;
    }
    
    system("pause");
    return 0;
}

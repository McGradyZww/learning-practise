#include<iostream>
#include<string>
using namespace std;                         //ע�⣬�ж�ʱ��8�����򣡣���������������ȫ���ˣ���ѧϰ���˵����ѣ�����ʵ�õġ������1959 
int main()
{
    int m,n,i,j,len,sum;
    string s[100];
    while(cin>>m>>n)
    {
       sum=0;
       if(m==0&&n==0) break;
       for(i=0;i<m;i++) cin>>s[i];
       if(s[0][0]=='@') sum++;
       for(i=1;i<n;i++)                               
       if(s[0][i]=='@'&&s[0][i-1]!='@') sum++;      //�жϵ�һ�в�����'@'��Ŀ 
       for(i=1;i<m;i++)
       {
           if(s[i][0]=='@'&&s[i-1][0]!='@'&&s[i-1][1]!='@') sum++;   //��һ�������ж� 
           for(j=1;j<n-1;j++)                       
           if(s[i][j]=='@'&&s[i-1][j]!='@'&&s[i-1][j-1]!='@'&&s[i-1][j+1]!='@'&&s[i][j-1]!='@') sum++;
           if(s[i][n-1]=='@'&&s[i-1][n-1]!='@'&&s[i-1][n-2]!='@'&&s[i][n-2]!='@') sum++; 
       } 
       cout<<sum<<endl; 
    }
    system("pause");
    return 0;
}

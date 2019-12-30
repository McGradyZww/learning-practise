#include<iostream>
#include<string>
using namespace std;
int main()
{
    int n,m,i,j,k,k1,k2,count1,count2,p;
    string a;
    char ch,temp1,temp2;
    char b[201],d[201];
    int c[201];
    cin >>n;
    
    while (n!=0)
    {
        
          for (i=0;i<n;i++) cin>>c[i];
          cin>>m;
          while (m!=0)
          { for (i=0;i<n;i++) b[i]=' ';
          cin.get(ch); 
          getline(cin,a);
          k1=a.size();
          count1=0;
            while (m>0)
            {
                
               if (count1==0)
               {
                for (i=0;i<k1;i++)
                {
                    count1=1;
                    
                    b[c[i]-1]=a[i];
                }
                }
                else {
                     for (i=0;i<n;i++)
                     {
                         k2=c[i]-1;
                         d[k2]=b[i];
                     }
                     //需要优化  
                    
                     
                     for (j=0;j<n;j++) b[j]=d[j];//需要优化 
                     }
                m--;
                
            } 
            
            for (i=0;i<n;i++) cout<<b[i];
            cout<<endl;
            cin>>m;
          } 
          cin>>n;
    }
    system("pause");
    return 0;
}

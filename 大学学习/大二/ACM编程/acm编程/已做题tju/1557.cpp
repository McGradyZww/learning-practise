#include<iostream>  
using namespace std;
int function(int);
int main()
{
    int a[17][3],x[17],b[3];
    int i,j,m,n,p;
    bool inch[100000];
   
    for (i=0;i<16;i++)
    {
        for (j=0;j<3;j++)
        cin >>a[i][j];
              
    }
    for (i=0;i<3;i++)
    cin >>b[i];
    while (b[0]!=-1)
    {
           for (j=0;j<100000;j++)
            inch[j]=false;
          
              for (i=0;i<16;i++)
              {
                  x[i]=0;
                  for (j=0;j<3;j++)
                  {
                      m=a[i][j]-b[j];
                      x[i]=function(m)+x[i];
                  }
                  inch[x[i]]=true;
              }
              for (j=0;j<100000;j++)
              {
                  if (inch[j]) 
                  {
                            for (i=0;i<16;i++)
                            {
                                if (x[i]==j) 
                                {
                                             
                                             cout <<"("<<b[0]<<","<<b[1]<<","<<b[2]<<")";
                                             cout <<" "<<"maps to "<<"("<<a[i][0]<<","<<a[i][1]<<","<<a[i][2]<<")"<<endl;
                                             break;
                                }
                            }
                            break;
                  }
                  
              }
          cin >>b[0]>>b[1]>>b[2];
              
    }
    system("pause");
    return 0;
}
int function(int t)
{
    return t*t;
}

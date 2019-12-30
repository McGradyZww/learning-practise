#include<iostream>
#include<string>
using namespace std;
int main()
{
    int ca,n,m,i,j,num;
    int k1,k2;
    int a[5000],b[5000];
    bool inch[101];
    bool p=true;
    cin >>ca;
    while (ca>0)
    {
          num=0;
          cin >>n>>m;
          int x[m];
          for (i=1;i<101;i++) inch[i]=0;
          if (m>0)
          {
                cin >>a[0]>>b[0];
                inch[a[0]]=1;inch[b[0]]=1;
                x[0]=1;
                j=1;
                while (j<m)
                {
                      cin >>a[j]>>b[j];
                      if ((!inch[a[j]])&&(!inch[b[j]])) 
                      x[j]=1;
                      else if ((inch[a[j]])&&(inch[b[j]]))
                      {
                           x[j]=0;//
                           for (i=j-1;i>=0;i--)
                           {
                               if ((a[j]==a[i])||(a[j]==b[i])) {k1=i;break;}
                           }
                           for (i=j-1;i>=0;i--)
                           {
                               if ((b[j]==a[i])||(b[j]==b[i])) {k2=i;break;}
                           }
                           if (x[k1]==1&&x[k2]==1) {x[k1]=1;x[k2]=0;}//
                           else if (x[k1]==1&&x[k2]==0) 
                           {
                                if ((a[k1]!=a[k2])&&(a[k1]!=b[k2])&&(b[k1]!=a[k2])&&(b[k1]!=b[k2]))//这里有大问题！
                                {
                                      for (i=j-1;i>=0;i--)
                                      {
                                          
                                       if (((a[i]==a[k1])||(a[i]==b[k1])||(b[i]==a[k1])||(b[i]==b[k1]))&&((a[i]==a[k2])||(a[i]==b[k2])||(b[i]==a[k2])||(b[i]==b[k2])))
                                       {p=false;break;}
                                       
                                      }
                                      if (p) x[k1]=x[k2];                                                                             
                                } 
                           }
                           else if (x[k1]==0&&x[k2]==1) 
                           {
                                if ((a[k1]!=a[k2])&&(a[k1]!=b[k2])&&(b[k1]!=a[k2])&&(b[k1]!=b[k2])) 
                                if (((a[i]==a[k1])||(a[i]==b[k1])||(b[i]==a[k1])||(b[i]==b[k1]))&&((a[i]==a[k2])||(a[i]==b[k2])||(b[i]==a[k2])||(b[i]==b[k2])))
                                {p=false;break;}
                                
                           }
                           if (p) x[k2]=x[k1];
                      }
                      else if (((inch[a[j]])&&(!inch[b[j]]))||((!inch[a[j]])&&(inch[b[j]])))
                      x[j]=0;
                      inch[a[j]]=1;
                      inch[b[j]]=1;
                     
                      j++;
                }
          }
          for (i=1;i<=n;i++) {if (!inch[i]) num++;}
          for (i=0;i<m;i++) {num=num+x[i];}
          cout <<num<<endl;
          ca--;    
    }
    system("pause");
    return 0;
}

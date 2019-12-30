#include <iostream>
#include<string>
using namespace std;
int main()
{ 
    int m,i,j,c[100];
    string a[100],num;
    while(getline(cin,num)&&num!="0")
    {
                       i=0; 
                       m=num.size();
                       if(m==2) c[i]=10;
                       else c[i]=num[0]-'0'; 
                       getline(cin,a[i]);
                       while(a[i]!="right on")
                       {
                           i++;
                           getline(cin,num);
                           m=num.size();
                           if(m==2) c[i]=10;
                           else c[i]=num[0]-'0';
                           getline(cin,a[i]);
                           
                       }
                       if(i==0) cout<<"Stan may be honest"<<endl;
                       else {
                            for(j=0;j<i;j++)
                            {
                               if(a[j]=="too high"&&c[i]>=c[j])   
                               {cout<<"Stan is dishonest"<<endl;break;}
                               else if(a[j]=="too low"&&c[i]<=c[j])
                               {cout<<"Stan is dishonest"<<endl;break;}
                            }
                            if(j==i) cout<<"Stan may be honest"<<endl;
                            }
        
    }    
    system("pause"); 
    return 0;
}

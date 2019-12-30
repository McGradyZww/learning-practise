#include<iostream>
#include<string>
using namespace std;
int main()
{
    int n,i,j,m,p,count;
    cin>>n;
    string str1[101];
    string str2[101];
    string str3[101];
    while(n!=0)
    {
               
               
               j=0;
               cin>>str1[0];
       m=str1[0].size();
       for(i=1;i<n;i++) {
                        cin>>str1[i];
                        if(m>str1[i].size()) m=str1[i].size();}
       if(n==1) 
       {cout<<str1[0].size()-1<<endl;}
       else{
       for(i=0;i<n;i++) 
       {
          if(str1[i].size()==m) 
          {str2[j]=str1[i];j++;}
       }
       count=0;
       while(m>1){
                
                if(j==1) 
                {cout<<str2[0].size()-1<<endl;break;}
                else{
       for(i=0;i<j;i++)
       {
          str3[i]=str2[i].substr(1,m-1);
       }
       for(p=0;p<j;p++)
       {
          for(i=p+1;i<j;i++)
          {if(str3[i]==str3[p]) 
          break;}
          if(i!=j){break;}
       }
       if(i!=j){break;}
       else{count++;
            m=m-1;
            for(i=0;i<j;i++) str2[i]=str3[i];
       }
       }
       }
      if(j!=1) cout<<count<<endl;
       
       }
       cin>>n;
    }
    
    system("pause");
    return 0;
}

#include<iostream>
#include<string>
using namespace std;
int main()
{
    int n,a1,b1,c1,m,i,j,count=1;
    string s1,a,b,c,s2;
    cin>>n;
    a="://";
    b=":";
    c="/";
    while(n--)
    {
        cin>>s1;
        m=s1.size();
        a1=s1.find(a);
        s2=s1.substr(a1+3,m-a1-3);
        
        b1=s2.find(b);
        c1=s2.find(c);
        
        cout<<"URL #"<<count<<endl;
        cout<<"Protocol = ";
        if(a1!=-1)
        for(i=0;i<a1;i++) 
        cout<<s1[i];
        if(a1==-1) for(i=0;i<m;i++) cout<<s1[i];
        cout<<endl;
        cout<<"Host     = ";
        if(b1==-1&&c1==-1){
        if(a1!=-1)
        for(i=a1+3;i<m;i++) 
        cout<<s1[i];
        cout<<endl;
        cout<<"Port     = ";
        cout<<"<default>"<<endl;
        cout<<"Path     = "<<"<default>"<<endl<<endl;
        }
        else if(b1!=-1&&c1!=-1){
             b1=b1+a1+3;
             c1=c1+a1+3;
             for(i=a1+3;i<b1;i++) 
             cout<<s1[i];
             cout<<endl;
             cout<<"Port     = ";
             for(i=b1+1;i<c1;i++)  cout<<s1[i];
             //if((b1+1)==c1) cout<<"<default>";
             cout<<endl;
             cout<<"Path     = ";
             for(i=c1+1;i<m;i++)  cout<<s1[i];
             //if((c1+1)==m) cout<<"<default>";
             cout<<endl<<endl;
             }
             else if(b1==-1&&c1!=-1){
                  c1+=a1+3;
                  for(i=a1+3;i<c1;i++) 
                  cout<<s1[i];
                  cout<<endl;
                  cout<<"Port     = ";
                  cout<<"<default>"<<endl;
                  cout<<"Path     = ";
                  for(i=c1+1;i<m;i++)  cout<<s1[i];
                  //if((c1+1)==m) cout<<"<default>";
                  cout<<endl<<endl;
                  }
                  else if(b1!=-1&&c1==-1){
                       b1+=a1+3;
                       for(i=a1+3;i<b1;i++) 
                       cout<<s1[i];
                       cout<<endl;
                       cout<<"Port     = ";
                       for(i=b1+1;i<m;i++)  cout<<s1[i];
                       //if((b1+1)==m) cout<<"<default>";
                       cout<<endl;
                       cout<<"Path     = "<<"<default>"<<endl<<endl;
                       }
        
        count++;
        
    }
    system("pause");
    return 0;
}

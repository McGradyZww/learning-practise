#include<iostream>
using namespace std;
int main()
{
    int a[9],i,p; 
    while(cin>>a[8]>>a[7]>>a[6]>>a[5]>>a[4]>>a[3]>>a[2]>>a[1]>>a[0]) 
    {
         p=0; 
         for(i=0;i<9;i++)
         if(a[i]!=0) break;
         if(i==9) {cout<<0<<endl;continue;} 
         if(a[8]>0){
            p=1; 
            if(a[8]!=1) cout<<a[8];
            cout<<"x^8"; 
         }
         else if(a[8]<0)   
         {
            p=1; 
            if(a[8]!=-1) cout<<a[8]<<"x^8";
            else cout<<"-x^8"; 
         } 
        for(i=7;i>1;i--)
        {
        
            if(a[i]>0){
                 if(p) cout<<" + "; 
                 p=1; 
               if(a[i]!=1) cout<<a[i];
            cout<<"x^"<<i; 
         }
         else if(a[i]<0)   
         {
            if(p) {cout<<" - "; 
            if(a[i]!=-1) {a[i]=0-a[i];cout<<a[i]<<"x^"<<i;} 
            else cout<<"x^"<<i; 
            } 
            else {
                 p=1;
             if(a[i]!=-1)    cout<<a[i]<<"x^"<<i; 
             else cout<<"-x^"<<i; 
                 } 
         } 
        
        } 
        if(a[1]>0){ 
          if(p) cout<<" + ";
          p=1;  
        if(a[1]!=1) cout<<a[1];
        cout<<"x"; 
        } 
        else if(a[1]<0)
        {
             if(p)   {cout<<" - "; 
             if(a[1]!=-1) {a[1]=0-a[1];cout<<a[1];}     
             cout<<"x";
             } 
             else {
                p=1;
              if(a[1]!=-1)  cout<<a[1]<<"x";
              else cout<<"-x"; 
                  } 
        }   
        if(a[0]>0) 
        {
           if(p)   cout<<" + "; 
           p=1; 
           cout<<a[0]; 
        } 
        else if(a[0]<0) {
           if(p) { 
            a[0]=0-a[0];
             cout<<" - "<<a[0]; 
            } 
            else cout<<a[0]; 
        } 
        cout<<endl; 
    } 
    system("pause");
    return 0; 
} 

#include<iostream>
using namespace std;
int main()
{
   int n,m,i,j,k;
   
   string a;
   int x[10];
   cin >>n;
   cin >>a;
   while (n!=0)
   {
       
        m=a.size();
        for (k=0;k<m;k++) x[k]=a[k]-'0';
        for (i=0;i<2*n+3;i++)
        {
            for (j=0;j<m;j++)
            {
               if (j) cout <<" ";
               
               if (x[j]==0) 
               {
               if ((i==0)||(i==(2*n+2))) {cout <<" ";for (k=0;k<n;k++) cout <<"-";cout <<" ";}
               if (i==(n+1)) {for (k=0;k<n+2;k++) cout <<" ";}
              if (((i<(n+1))&&(i!=0))||((i>(n+1))&&(i!=(2*n+2)))) {cout <<"|";for (k=0;k<n;k++) cout <<" ";cout <<"|";}
               }
               
            if (x[j]==1) 
            {
               if ((i==0)||(i==n+1)||(i==(2*n+2)))  {for (k=0;k<n+2;k++) cout <<" ";} 
               if ((i!=0)&&(i!=(n+1))&&(i!=(2*n+2))) {for (k=0;k<n+1;k++) cout <<" ";cout <<"|";}       
            }
            
            if (x[j]==2) 
            {
               if ((i==0)||(i==(n+1))||(i==(2*n+2))) {cout <<" ";for (k=0;k<n;k++) cout <<"-";cout <<" ";}
               if ((i<(n+1))&&(i!=0)) {for (k=0;k<n+1;k++) cout <<" ";cout <<"|";}
              if ((i>(n+1))&&(i!=(2*n+2))) {cout <<"|";for (k=0;k<n+1;k++) cout <<" ";}
            }
            
            if (x[j]==3)
            {
                if ((i==0)||(i==(n+1))||(i==2*n+2)) {cout <<" ";for (k=0;k<n;k++) cout <<"-";cout <<" ";}        
                if ((i!=0)&&(i!=(n+1))&&(i!=(2*n+2))) {for (k=0;k<n+1;k++) cout <<" ";cout <<"|";}
            }
            
            if (x[j]==4) 
            {
                if ((i==0)||(i==(2*n+2))) {for (k=0;k<n+2;k++) cout <<" ";}
                if (i==(n+1)) {cout <<" ";for (k=0;k<n;k++) cout <<"-";cout <<" ";}
                if ((i<(n+1))&&(i!=0)) {cout <<"|";for (k=0;k<n;k++) cout <<" ";cout <<"|";}
                if ((i>(n+1))&&(i!=(2*n+2))) {for (k=0;k<n+1;k++) cout <<" ";cout <<"|";}
            }
            
            if (x[j]==5)
            {
               if ((i==0)||(i==(n+1))||(i==(2*n+2))) {cout <<" ";for (k=0;k<n;k++) cout <<"-";cout <<" ";}         
               if ((i<(n+1))&&(i!=0)) {cout <<"|";for (k=0;k<n+1;k++) cout <<" ";}
               if ((i>(n+1))&&(i!=(2*n+2))) {for (k=0;k<n+1;k++) cout <<" ";cout <<"|";}            
            }
            
            if (x[j]==6)
            {
               if ((i==0)||(i==(n+1))||(i==2*n+2)) {cout <<" ";for (k=0;k<n;k++) cout <<"-";cout <<" ";}
               if ((i<(n+1))&&(i!=0)) {cout <<"|";for (k=0;k<n+1;k++) cout <<" ";}
               if ((i>(n+1))&&(i!=(2*n+2))) {cout <<"|";for (k=0;k<n;k++) cout <<" ";cout <<"|";}
            }
            
            if (x[j]==7) 
            {
               if (i==0) {cout <<" ";for (k=0;k<n;k++) cout <<"-";cout <<" ";} 
               else if (i == n+1 || i == 2*n+2) for (k = 0; k < n + 2; k++) cout << " ";
               else {for (k=0;k<n+1;k++) cout <<" ";cout <<"|";}         
            }
            
            if (x[j]==8)
            {
               if ((i==0)||(i==(n+1))||(i==2*n+2)) {cout <<" ";for (k=0;k<n;k++) cout <<"-";cout <<" ";}         
               if ((i!=0)&&(i!=(n+1))&&(i!=(2*n+2))) {cout <<"|";for (k=0;k<n;k++) cout <<" ";cout <<"|";}
            }
            
            if (x[j]==9)
            {
                if ((i==0)||(i==(n+1))||(i==2*n+2)) {cout <<" ";for (k=0;k<n;k++) cout <<"-";cout <<" ";}
                 if ((i<(n+1))&&(i!=0)) {cout <<"|";for (k=0;k<n;k++) cout <<" ";cout <<"|";}
                if ((i>(n+1))&&(i!=(2*n+2))) {for (k=0;k<n+1;k++) cout <<" ";cout <<"|";}
            }  
            }       
           cout <<endl;
        }   
        cout <<endl; 
        cin >>n;
        cin >>a;
   }
    system("pause");
    return 0;
}

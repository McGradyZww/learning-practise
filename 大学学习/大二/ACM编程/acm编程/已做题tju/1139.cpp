#include<iostream>
#include<string>
using namespace std;
int main()
{
    string m,n;
    int i,j,p,q,flag,pos,t1,t2;
    string input1[101],input2[101],output[101];
    while(cin>>m)
    {
       i=0;
       if(m!="#") input1[i++]=m;
       if(m!="#"){while(cin>>m&&m!="#"){
           input1[i++]=m;
       }
       }
       j=0;
       while(cin>>n&&n!="#"){
           input2[j++]=n;
       }
       flag=-1;
       pos=0;
       //output[0]="NULL";
       for(p=0;p<i;p++){t2=0;
                        for(t1=0;t1<p;t1++){
                           if(input1[t1]==input1[p]) {t2=1;break;}
                        }
        if(t2==0){
           for(q=flag+1;q<j;q++)
           if(input1[p]==input2[q]) {flag=q;output[++pos]=input1[p];break;}
           }
       }
       if(pos!=0){
       for(i=1;i<pos;i++)
       cout<<output[i]<<" ";
       cout<<output[pos]<<endl;
       }
    }
    system("pause");
    return 0;
}

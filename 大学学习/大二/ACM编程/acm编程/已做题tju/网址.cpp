#include<iostream>
#include<string>
using namespace std;
int main()
{
    string logo[200];
    logo[0]="http://www.acm.org/";
    string web;
    cin >> web;
    int i=0;
    bool b[200];
    for (int p=0;p<200;p++)
    {
        b[p]=false;
    }
    b[0]=true;
    
    enum instructions{VISIT,BACK,FORWARD,QUIT};
    instructions currInstr;

    
    while (web!="QUIT")
    {
          if(web=="BACK")
         currInstr=BACK;
         else if(web=="FORWARD")
         currInstr=FORWARD;
         else if(web=="QUIT")
         currInstr=QUIT;
         else
        currInstr=VISIT;
         
          switch (currInstr)
          {
                 case VISIT : cin >>web;i++;logo[i]=web;
                              cout <<web<<endl;
                              b[i]=true;
                              for (int q=i+1;q<200;q++)
                              b[q]=false;
                              break;  
                 case BACK : i--;if (i>=0){cout <<logo[i]<<endl;}
                             else {cout <<"Ignored"<<endl;i++;}
                             break;
                 case FORWARD : if (b[i+1]) {cout <<logo[i+1]<<endl;i++;}
                                else cout <<"Ignored"<<endl;
                                break;
          }   
                   
    cin >>web;
   }               
    return 0;
}

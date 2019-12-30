#include<iostream>
using namespace std;
int main()
{
    int n,a,year,daynumber,m,endyear,firstd,second;
    string b,month,mont;
    cin >>n;
    cout <<n<<endl;
    while (n>0)
    {
          m=0;
          cin >>a>>b>>month>>year;
          if (month=="pop") m=0;
          if (month=="no")  m=1;        
          if (month=="zip") m=2;
          if (month=="zotz") m=3;
          if (month=="tzec") m=4;
          if (month=="xul") m=5;
          if (month=="yoxkin") m=6;
          if (month=="mol") m=7;
          if (month=="chen") m=8;
          if (month=="yax") m=9;
          if (month=="zac")  m=10;
          if (month=="ceh") m=11;
          if (month=="mac") m=12;
          if (month=="kankin") m=13;
          if (month=="muan") m=14;
          if (month=="pax") m=15;
          if (month=="koyab") m=16;
          if (month=="cumhu") m=17;
          if (month=="uayet") m=18;
          daynumber=m*20+year*365+1+a;
          if (daynumber%260==0) endyear=daynumber/260-1;
          if (daynumber%260!=0) endyear=daynumber/260;
          if (daynumber<13) firstd=daynumber;
          else if(daynumber%13==0) firstd=13;
          else firstd=daynumber%13;
          second=daynumber%20;
          if (second==0) mont="ahau";
          if (second==1) mont="imix";
          if (second==2) mont="ik";
          if (second==3) mont="akbal";
          if (second==4) mont="kan";
          if (second==5) mont="chicchan";
          if (second==6) mont="cimi";
          if (second==7) mont="manik";
          if (second==8) mont="lamat";
          if (second==9) mont="muluk";
          if (second==10) mont="ok";
          if (second==11) mont="chuen";
          if (second==12) mont="eb";
          if (second==13) mont="ben";
          if (second==14) mont="ix";
          if (second==15) mont="mem";
          if (second==16) mont="cib";
          if (second==17) mont="caban";
          if (second==18) mont="eznab";
          if (second==19) mont="canac";
           
    
          cout <<firstd<<" "<<mont<<" "<<endyear<<endl;
          n--;
          
    }
    system("pause");
    return 0; 
}

#include<iostream>
#include<string.h>
using namespace std;
int ryear[12]={31,29,31,30,31,30,31,31,30,31,30,31};
int pyear[12]={31,28,31,30,31,30,31,31,30,31,30,31};
char Day[7][10]={"Saturday","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday"};
int isryear(int n)
{
    /*if(n%4!=0) return 0;
    else if(n%4==0&&n%100!=0) return 1;
    else if(n%100==0&&n%400!=0) return 0;
    return 1;*/
     if (n% 4 == 0 && n % 100 != 0 || n % 400 == 0) return true;   
     else return false;
}
int main()
{
    int n;
    while(cin>>n)
    {
        if(n==-1) break;
        int i,year,month,day,s1=0,s2=0,s3;
        for(i=2000;;i++)
        {
           if(isryear(i)) s1+=366;
           else s1+=365;
           if(s1-1>=n) {year=i;break;}
        }
        if(isryear(i)) 
        {
            s1-=367;
            for(i=0;i<12;i++)
            {
                s2+=ryear[i];
                if(s2>=(n-s1)) {month=i+1;break;}
            }
            s2-=ryear[month-1];
            day=n-s1-s2;
        }
        else 
        {
           s1-=366;
           for(i=0;i<12;i++)
            {
                s2+=pyear[i];
                if(s2>=(n-s1)) {month=i+1;break;}
            }
           s2-=ryear[month-1];
           day=n-s1-s2;
        }
        cout<<year<<"-";
        if(month<10) cout<<0;
        cout<<month<<"-";
        if(day<10) cout<<0;
        cout<<day<<" ";
        cout<<Day[n%7]<<endl;
        
        
    }
    system("pause");
    return 0;
}

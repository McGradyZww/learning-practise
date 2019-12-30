#include<iostream>
#include<math.h> 
using namespace std;
int cal(double n)
{   
    if(n>=0&&n<=3) return 100;
    else if(n>3&&n<=6) return 80;
    else if(n>6&&n<=9) return 60;
    else if(n>9&&n<=12) return 40;
    else if(n>12&&n<=15) return 20;
    else return 0;
} 
int main()
{
    double a,b,c,d,e,f,a1,b1,c1,d1,e1,f1;
    int sum1,sum2; 
    while(cin>>a&&a!=-100)
    {
        cin>>b>>c>>d>>e>>f>>a1>>b1>>c1>>d1>>e1>>f1; 
        sum1=cal(sqrt(a*a+b*b))+cal(sqrt(c*c+d*d))+cal(sqrt(e*e+f*f)); 
        sum2=cal(sqrt(a1*a1+b1*b1))+cal(sqrt(c1*c1+d1*d1))+cal(sqrt(e1*e1+f1*f1));
        if(sum1==sum2) cout<<"SCORE: "<<sum1<<" to "<<sum1<<", TIE."<<endl; 
        else if(sum1>sum2) cout<<"SCORE: "<<sum1<<" to "<<sum2<<", PLAYER 1 WINS."<<endl; 
        else cout<<"SCORE: "<<sum1<<" to "<<sum2<<", PLAYER 2 WINS."<<endl; 
    } 
    system("pause");
    return 0; 
} 

#include<iostream>

using namespace std;
int main()
{
    int a,b,c,day,k1,k2,k3,count,i,k;
    char ch;
    while (cin>>a)
    {
          count=0;
          k=0;
    cin.get(ch);
    cin>>b;
    cin.get(ch);
    cin>>c;
    if((a%4==0&&a%100!=0||a%400==0)) k=1;
    for (i=2010;i<a;i++) if((a%4==0&&a%100!=0||a%400==0)) count++;
    if (b==1) day=365*(a-2010)+c+count-31+27;
    if (b==2) day=365*(a-2010)+c-27+count;
    if (b==3) day=365*(a-2010)+1+c+count+k;
    if (b==4) day=365*(a-2010)+32+c+count+k;
    if (b==5) day=365*(a-2010)+62+c+count+k;
    if (b==6) day=365*(a-2010)+93+c+count+k;
    if (b==7) day=365*(a-2010)+c+123+count+k;
    if (b==8) day=365*(a-2010)+c+154+count+k;
    if (b==9) day=365*(a-2010)+c+185+count+k;
    if (b==10) day=365*(a-2010)+c+215+count+k;
    if (b==11) day=365*(a-2010)+c+246+count+k;
    if (b==12) day=365*(a-2010)+c+276+count+k;
    k1=day/7;
    k2=k1%3;
    k3=day%7;
    if (k2==0)
    {
    if (k3==0||k3==6) cout<<"Resting"<<endl;
    if (k3==1||k3==4) cout<<"7:00-11:00, 18:30-23:00"<<endl;
    if (k3==2||k3==5) cout<<"16:00-23:00"<<endl;
    if(k3==3) cout<<"11:30-23:00"<<endl;
    }
    if (k2==1)
    {
    if (k3==0||k3==6) cout<<"7:00-11:00, 18:30-23:00"<<endl;
    if (k3==1||k3==4) cout<<"16:00-23:00"<<endl;
    if (k3==2||k3==5) cout<<"Resting"<<endl;
    if(k3==3) cout<<"11:30-23:00"<<endl;
    }
    if (k2==2)
    {
    if (k3==0||k3==6) cout<<"16:00-23:00"<<endl;
    if (k3==1||k3==4) cout<<"Resting"<<endl;
    if (k3==2||k3==5) cout<<"7:00-11:00, 18:30-23:00"<<endl;
    if(k3==3) cout<<"11:30-23:00"<<endl;   
    }
    }
    system("pause");
    return 0;
}

#include <iostream>
#include <string> 
using namespace std; 
string week[] = {"Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"};
int day[] = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}; /* �ж��Ƿ����� */
bool isleap(int& year)
{    
     if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) return true;    
     else return false;
} /* ����һ���������� */
int maxday(int& year)
{    
     if (isleap(year)) return 366;   
      else return 365;
} /* �õ���� */
int getyear(int& days)
{    
     int year = 2000;    
     while (days > maxday(year))    
     {        
              days -= maxday(year);        
              year++;    
     }    
     return year;
} /* �õ��·� */
int getmonth(int year, int& days)
{    
     int month = 1;    
     if (isleap(year)) day[2] = 29;    
     else day[2] = 28;    
     while (days > day[month])    
     {        
              days -= day[month];        
              month++;   
     }    
     return month;
} /* �õ����� */
int getday(int& days)
{    return days;} /* �õ����� */
string getweek(int& days)
{    return week[days % 7];} /* ������ */
int main()
{    
     int days;    
     int y, m, d;    
     string wk;    
     while(cin >> days && days != -1)    
     {        
              wk = getweek(days);        
              days++;        
              y = getyear(days);        
              m = getmonth(y, days);        
              d = getday(days);         
              cout << y << "-";        
              if (m < 10) cout << 0;        
              cout << m << "-";        
              if (d < 10) cout << 0;        
              cout << d << " " << wk << endl;    
      }    //system("pause");    
      return 0;
}

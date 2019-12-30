#include <iostream>
#include <string> 
using namespace std; 
string week[] = {"Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"};
int day[] = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}; /* 判断是否闰年 */
bool isleap(int& year)
{    
     if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) return true;    
     else return false;
} /* 返回一年的最大天数 */
int maxday(int& year)
{    
     if (isleap(year)) return 366;   
      else return 365;
} /* 得到年份 */
int getyear(int& days)
{    
     int year = 2000;    
     while (days > maxday(year))    
     {        
              days -= maxday(year);        
              year++;    
     }    
     return year;
} /* 得到月份 */
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
} /* 得到天数 */
int getday(int& days)
{    return days;} /* 得到星期 */
string getweek(int& days)
{    return week[days % 7];} /* 主函数 */
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

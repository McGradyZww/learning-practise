#include<iomanip>
using namespace std;
const float LOAN_AMOUNT=50000.00;
const float YEARLY_INTEREST=0.0524;
const int NUMBER_OF_YEARS=7; 
int main()
{
    float monthlyInterest;
    int numberOfPayments;
    float payment;
    monthlyInterest=YEARLY_INTEREST/12;
    numberOfPayments=NUMBER_OF_YEARS*12;
    payment=(LOAN_AMOUNT*pow(monthlyInterest+1,numberOfPayments)*monthlyInterest)/(pow(monthlyInterest+1,numberOfPayments)-1);
    cout <<fixed<<setprecision(2)<<"For a loan amount of "<<YEARLY_INTEREST<<" and a "<<NUMBER_OF_YEARS<<" year mortgage, "<<endl;
    cout <<"your monthly payments are $"<<payment<<"."<<endl;
    system("pause");
    return 0;
}

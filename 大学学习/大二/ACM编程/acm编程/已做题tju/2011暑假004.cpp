#include<fstream>
#include<string>
using namespace std;
int main()
{
    ifstream indata;
    ofstream outdata;
    indata.open("name.dat");
    outdata.open("name.out");
    string socialNum;
    string firstName;
    string lastName;
    string middleName;
    string initial;
    indata>>socialNum>>firstName>>middleName>>lastName;
    initial=middleName.substr(0,1)+".";
    outdata<<firstName<<" "<<middleName<<" "<<lastName
           <<" "<<socialNum<<endl;
    outdata<<lastName<<", "<<firstName<<" "<<middleName
           <<" "<<socialNum<<endl;    
    system("pause");          
    return 0;
}

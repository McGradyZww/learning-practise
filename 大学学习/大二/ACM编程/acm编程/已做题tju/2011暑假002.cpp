#include<iostream>
#include<fstream>
using namespace std;
int main()
{
    char inchar;
    ifstream inFile;
    inFile.open("text.dat");
    if(!inFile)
    {
               cout<<"Can't open the input file.";
               system("pause");
               return 1;
    }
    inFile.get(inchar);
    while(inchar!='\n')
    {
                       cout<<inchar;
                       inFile.get(inchar);
    }
    cout<<endl;
    system("pause");
    return 0;
}


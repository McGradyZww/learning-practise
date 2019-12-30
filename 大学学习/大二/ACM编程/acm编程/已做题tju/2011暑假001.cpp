#include<iostream>
#include<fstream>
using namespace std;
int main()
{
    int height;
    int width;
    ifstream inFile;
    inFile.open("measures.dat");
    if (!inFile)
    {
                cout<<"Can't open the input file.";
                return 1;
    }
    inFile>>height>>width;
    cout<<height*width<<endl;
    system("pause");
    return 0;
}


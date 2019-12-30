#include<iostream>
#include<map>
using namespace std;
int main(void)
{
    map<char,int,less<char> > map1; 
    map<char,int,less<char> >::iterator mapIter;
    map1['c']=3;
    map1['d']=4;
    map1['a']=1;
    map1['b']=2;
    for(mapIter=map1.begin();mapIter!=map1.end();++mapIter)
    {
        cout<<" "<<(*mapIter).first<<": "<<(*mapIter).second;
    }
    map<char,int,less<char> >::const_iterator ptr;
    ptr=map1.find('d'); 
    cout<<"\n"<<" "<<(*ptr).first<<" 键对应于值："<<(*ptr).second;  
    cin.get(); 
    return 0; 
} 

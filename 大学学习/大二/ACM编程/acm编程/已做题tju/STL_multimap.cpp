#include<iostream>
#include<map>
#include <string> 
using namespace std;
int main(void) 
{
    multimap<string,string,less<string> >mulmap; 
    multimap<string,string,less<string> >::iterator p; 
    typedef multimap<string,string,less<string> >::value_type vt; 
    typedef string s; 
    mulmap.insert(vt(s("Tom "),s("is a student"))); 
    mulmap.insert(vt(s("Tom "),s("is a boy")));
    mulmap.insert(vt(s("Tom "),s("is a bad boy of blue!"))); 
    mulmap.insert(vt(s("Jerry "),s("is a student"))); 
    mulmap.insert(vt(s("Jerry "),s("is a beatutiful girl"))); 
    mulmap.insert(vt(s("DJ "),s("is a student"))); 
    for(p=mulmap.begin();p!=mulmap.end();++p)
    cout<<(*p).first<<(*p).second<<endl; 
    cout<<"find Jerry :"<<endl; 
    p=mulmap.find(s("Jerry ")); 
    while((*p).first=="Jerry ") 
    {
        cout<<(*p).first<<(*p).second<<endl; 
        ++p; 
    } 
    cin.get(); 
    return 0; 
    
} 

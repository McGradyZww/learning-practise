#include<iostream>
#include<vector> 
#include<string> 
using namespace std;
int main()                                  //vector<>тксц 
{
    int h,l,w,n,i,max,maxn,min,minn;
    string s;
    vector<int> cubic;
    vector<string> name; 
    while(cin>>n&&n!=-1)
    {
        cubic.clear();
        name.clear(); 
        for(i=0;i<n;i++)
        {
            cin>>h>>l>>w>>s; 
            cubic.push_back(h*l*w);
            name.push_back(s);
        } 
            max=0;min=250;
            for(i=0;i<cubic.size();i++)
            {
                if(cubic[i]>max) {max=cubic[i];maxn=i;} 
                if(cubic[i]<min) {min=cubic[i];minn=i;} 
            } 
            cout<<name[maxn]<<" took clay from "<<name[minn]<<"."<<endl; 
    } 
    system("pause");
    return 0; 
} 

#include <iostream>
#include <string.h>
#include<stdio.h> //gets()需要 
using namespace std; 
int main()
{
    char plain[132], sub[132], tmp[68], *off;
    int i, length, offset;
    gets(plain);
    gets(sub);
    cout<<sub<<endl<<plain<<endl;
    while (gets(tmp) != NULL)
    {
        length = strlen(tmp);
        for (i = 0; i < length; i++)
        {
            off = strchr(plain, tmp[i]);
            /*如果字符串中包含字符TMP[I]则返回PLAIN中
                第一次出现该字符的位置指针，否则返回NULL*/
            if (off != NULL)
            {
                offset = (int)(off-plain);
                cout<<sub[offset];
            }
            else
                cout<<tmp[i];
        }
        cout<<endl;
    }
    return 0;
}

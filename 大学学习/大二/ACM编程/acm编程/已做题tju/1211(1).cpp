#include <iostream>
#include <string.h>
#include<stdio.h> //gets()��Ҫ 
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
            /*����ַ����а����ַ�TMP[I]�򷵻�PLAIN��
                ��һ�γ��ָ��ַ���λ��ָ�룬���򷵻�NULL*/
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

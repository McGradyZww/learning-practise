#include <iostream>//�������û�� 
#include <algorithm>//�����ܶ��㷨����,�����������������������ͷ�ļ� 
#include <cstdio>
using namespace std;

int ary[164001];

int main()
{
    int n, m;
    while(scanf("%d %d", &n, &m) != EOF){
        for(int i = 0; i < n + m; ++i)
            scanf("%d", ary + i);
        sort(ary, ary + n + m-1);//�������� 
        int sz = unique(ary, ary + n + m-1) - ary+1;//ɾ���ظ� 
        printf("%d\n", n + m - sz);
    }
    return 0;
}

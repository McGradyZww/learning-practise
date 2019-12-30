#include <iostream>//这里可以没有 
#include <algorithm>//包含很多算法或函数,下面两个函数均必须有这个头文件 
#include <cstdio>
using namespace std;

int ary[164001];

int main()
{
    int n, m;
    while(scanf("%d %d", &n, &m) != EOF){
        for(int i = 0; i < n + m; ++i)
            scanf("%d", ary + i);
        sort(ary, ary + n + m-1);//整理排序 
        int sz = unique(ary, ary + n + m-1) - ary+1;//删除重复 
        printf("%d\n", n + m - sz);
    }
    return 0;
}

#include <stdio.h>
#include <malloc.h>

int main()
{
    int c, i, j, k, n, *cases = 0, e;
    scanf("%d", &c);
    if (0 == c)
        return -1;
    cases = (int*)malloc(c * sizeof(int));
    for (i = 0; i <c; i++)
    {
        e = 0;
        scanf("%d", cases + i);
        n = *(cases + i);
        char* cells = (char*)malloc(n + 1);
        for (j = 0; j <n; j++)
            cells[j] = '0';
        cells[n] = '\0';
        for (j = 0; j <n; j++)
            for (k = j; k <n; k += j + 1)
                cells[k]++;
        for (j = 0; j <n; j++)
        {
            if (1 == cells[j] % 2)
                e++;
        }
        printf("%d\n", e);
        free(cells);
    }
    free(cases);
    return 0;
}



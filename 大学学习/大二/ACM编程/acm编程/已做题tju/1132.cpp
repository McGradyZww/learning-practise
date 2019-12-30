#include<stdio.h>   
#include<string.h>   
#include<stdlib.h>   
int dir[8][2]={{-2,1},{-2,-1},{2,-1},{2,1},{-1,2},{-1,-2},{1,2},{1,-2}};  //��ÿһ���İ˸����� 
int ans[10][10];   //��ÿ���㵽���ľ��� 
int visit[10][10];  //���ǰ���Ƿ��Ѿ��������ˣ���Ȼ����û������㣬���������ľ���ֵ���䡣 
struct cam  
{  
    int x;  
    int y;  
}list[100];  //��ṹ 
int go(int x,int y)   
{  
    if(1<=x&&x<=8&&0<=y&&y<8)  
    return 1;  
    return 0;  
}  
int bfs(int x1,int y1,int x2,int y2)  
{  
    int i,head,tail;  //head,tail ��˼��ָhead�߳���tail�� 
    int xx,yy;  
    memset(visit,0,sizeof(visit));  
    memset(ans,0,sizeof(ans));  
    ans[x1][y1]=0;  
    visit[x1][y1]=1;  
    head=0;  
    tail=1;  
    list[0].x=x1;  
    list[0].y=y1;  
    while(head<tail)  //������1��û���⣬��Ϊһ���н������ 
    {  
        x1=list[head].x;  
        y1=list[head].y;  
        if(x1==x2&&y1==y2)  
        return ans[x2][y2];  
        for(i=0;i<8;i++)  
        {  
            xx=x1+dir[i][0];  
            yy=y1+dir[i][1];  
            if(go(xx,yy)&&!visit[xx][yy])  
            {  
                visit[xx][yy]=1;  
                ans[xx][yy]=ans[x1][y1]+1; //�������Ҫ����¼�����ľ��� 
                list[tail].x=xx;  
                list[tail].y=yy;  
                tail++;  
            }  
        }  
        head++;  
    }  
    return -1;  //����ν��һ���������������ϼ������ 
}  
int main()  
{
    int x1,y1,x2,y2,sol;  
    char s1[3],s2[3];  
    while(scanf("%s %s",s1,s2)!=EOF)  
    {  
        y1=s1[0]-'a';  
        x1=s1[1]-'0';  
        y2=s2[0]-'a';  
        x2=s2[1]-'0';  
        sol=bfs(x1,y1,x2,y2);  
        printf("To get from %s to %s takes %d knight moves.\n",s1,s2,sol);  
    }  
    return 0;  
}  

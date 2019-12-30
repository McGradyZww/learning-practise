#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int channel[27],map[27][27],result,num,flag;

int main()
{
    int i,j,k,ctl;
    char ch1,ch2;
    
    while(scanf("%d",&num),num)
    {
         memset(channel,0,sizeof(channel));
         memset(map,0,sizeof(map));
         result = 0;
         flag = 0;
         ctl=num;
         getchar();
         while(ctl--)
         {
             ch1=getchar();
             getchar();
             while((ch2=getchar())!='\n')
                  map[ch1-64][ch2-64] = 1;
         }   //输入，并用邻接矩阵存储图
         
         /*for(i=1;i<=num;i++)
         {
             for(j=1;j<=num;j++)
                 printf("%d ",map[i][j]);
             printf("\n");
         }*/
         
         for(i=1;i<=num;i++)    //遍历每一行，即每个节点
         {
             channel[i] = 1;    //标记此节点已分配过频段
             flag=0;            //是否找到符合要求节点的标记
             for(j=1;j<=num;j++)//检查是否有之前分配过频段的节点与当前遍历
                                //的节点无关系
                 if(i!=j && channel[j]==1 && map[i][j]==0) 
                 {
                     flag=1;    //如果有，置标记为1
                     for(k=1;k<=num;k++) //将与此节点有关系的节点建立关系到                   
                                         //与他分配相同频段的节点上
                         if(map[k][i]==1) map[k][j]=map[j][k]=1;
                 }
             if(!flag) result++;//如果没有找到符合要求的节点，所需频段数加1
         }
         if(result == 1)
             printf("1 channel needed.\n");
         else
             printf("%d channels needed.\n",result);                           
    }
    
    return 0;    
}

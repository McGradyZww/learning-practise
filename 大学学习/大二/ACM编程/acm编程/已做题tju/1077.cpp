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
         }   //���룬�����ڽӾ���洢ͼ
         
         /*for(i=1;i<=num;i++)
         {
             for(j=1;j<=num;j++)
                 printf("%d ",map[i][j]);
             printf("\n");
         }*/
         
         for(i=1;i<=num;i++)    //����ÿһ�У���ÿ���ڵ�
         {
             channel[i] = 1;    //��Ǵ˽ڵ��ѷ����Ƶ��
             flag=0;            //�Ƿ��ҵ�����Ҫ��ڵ�ı��
             for(j=1;j<=num;j++)//����Ƿ���֮ǰ�����Ƶ�εĽڵ��뵱ǰ����
                                //�Ľڵ��޹�ϵ
                 if(i!=j && channel[j]==1 && map[i][j]==0) 
                 {
                     flag=1;    //����У��ñ��Ϊ1
                     for(k=1;k<=num;k++) //����˽ڵ��й�ϵ�Ľڵ㽨����ϵ��                   
                                         //����������ͬƵ�εĽڵ���
                         if(map[k][i]==1) map[k][j]=map[j][k]=1;
                 }
             if(!flag) result++;//���û���ҵ�����Ҫ��Ľڵ㣬����Ƶ������1
         }
         if(result == 1)
             printf("1 channel needed.\n");
         else
             printf("%d channels needed.\n",result);                           
    }
    
    return 0;    
}

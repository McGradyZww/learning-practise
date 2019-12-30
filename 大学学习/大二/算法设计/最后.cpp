#include<stdio.h>
#include<stdlib.h>
    #define OK 1
	#define MAX_VERTEX_NUM 20 // ��󶥵���
	typedef int Status;  //���������ͣ���ֵ�Ǻ������״̬����
	typedef char VertexType;
	typedef int VRType;
	typedef int InforType;	
	typedef struct ArcNode
	{
	        int adjvex;   //�ñ���ָ�Ķ����λ��
	        struct ArcNode *nextarc;   //ָ����һ���ߵ�ָ��
	}ArcNode;   //��Ľ��	
	typedef struct VNode
	{
	        VertexType data;   //������Ϣ�������ݵȣ�
	        ArcNode *firstarc;   //ָ���һ�������ö���ıߵĻ�ָ��
	}VNode, AdjList[MAX_VERTEX_NUM];   //ͷ���	
	typedef struct ALGraph
	{
	        AdjList vertices;
	        int vexnum, arcnum;   //ͼ�ĵ�ǰ�������ͻ���
	}ALGraph;
	ALGraph G;   //ȫ�ֱ��� 
	typedef struct Set{       //���� 
            int pos;
            Set *next;
 }*A;
	//���ض���v�ڶ��������е�λ��
	int LocateVex(ALGraph G, char v)
	{
	        int i;
	        for(i = 0; v != G.vertices[i].data && i < G.vexnum; i++)
	                ;
	        if(i >= G.vexnum)
	                return -1;
	        return i;
	}	
	//�����ڽ�����
	Status CreateUDN(ALGraph &G)
	{
	        int  j;
	        ArcNode *s, *t;
	        printf("��������ͼ������: ");
	        scanf("%d", &G.vexnum);
	       //printf("%d",G.vexnum);
	        printf("��������ͼ����: ");
	        scanf("%d", &G.arcnum);
	        getchar();	
	        for(int i = 0; i < G.vexnum; i++)
	        {
	                printf("�����%d��������Ϣ:", i+1);
	                scanf("%c", &G.vertices[i].data);   //���춥������
	                G.vertices[i].firstarc = NULL;
	                getchar();
	        }
	
	        char v1, v2;	       
	        for(int k = 0; k < G.arcnum; k++)
	        {
	                printf("����� %d ���������Ķ���v1: ", k+1);
	                scanf("%c", &v1);
	                getchar();
	                printf("����� %d ���������Ķ���v2: ", k+1);
	                scanf("%c", &v2);
	                getchar();
	
	                int i = LocateVex(G, v1);
	                int j = LocateVex(G, v2);    //ȷ��v1 , v2��G�е�λ��
	
	                s = (ArcNode*) malloc (sizeof(ArcNode));
	                t = (ArcNode*) malloc (sizeof(ArcNode));
	
	                s->adjvex = j;   //�ñ���ָ��Ķ����λ��Ϊj
	                s->nextarc = G.vertices[i].firstarc;
	                G.vertices[i].firstarc =s;
	
	                t->adjvex = i;   //�ñ���ָ��Ķ����λ��Ϊj
	                t->nextarc = G.vertices[j].firstarc;
	                G.vertices[j].firstarc =t;
	        }	     	
	        return OK;
	}
	/*Status PrintAdjList(ALGraph &G)
	{
	        ArcNode *p;
	        printf("%4s%6s%12s\n", "���", "����", "���ڱ߱��");
	        for(int i = 0; i < G.vexnum; i++)
	        {
	                printf("%4d%6c", i, G.vertices[i].data);
	                for(p = G.vertices[i].firstarc; p; p = p->nextarc)
	                        printf("%4d", p->adjvex);
	                printf("\n");
	        }
	        return OK;	
	}*/
int Count(int m){
    int a=0;
    ArcNode *e;
    for(e = G.vertices[m].firstarc; e; e = e->nextarc)
    a++;
    return a;
}
void MaxIndependentSet(int V[])

{// Find an independent set using the greedy method.
 // Return the independent set size and put the independent
 // set vertices in V[0:size-1]
   A p,q,L1,L2,L3;
   int n = G.vexnum;
   //printf("%d",n);
   int i;
   int *C = new int [n+1];  // candidate array

                            // i is candidate iff C[i] = 2
   // count[i] is number of candidate vertices i
   int *count = new int [n+1];
   for(i=0;i<n;i++)
   count[i]=Count(i);
   // initialize candidate array
   for (i = 0; i < n; i++)
      C[i] = 2;
   // find vertex with min degree
   int MinDegree = count[0];
   int MinV = 0;
   for (int i = 1; i <n; i++) {
     int m = count[i];
     if (m < MinDegree) {
        MinDegree = m;
        MinV = i;}
     }
   // MinV is first vertex in independent set
   C[MinV] = 1;
   // define three chains for candidate and eliminated vertices
  // vertices adjacent to MinV are no longer candidates
   ArcNode *r=(ArcNode*) malloc (sizeof(ArcNode));
   //��Minv�ڽӵ� 
   r = G.vertices[MinV].firstarc;
   int v;  
   while (r) {
         
      v=r->adjvex;
      C[v] = 0;
      r=r->nextarc;
      }
   // create candidate chain
L1=(A) malloc (sizeof(Set));
L1->next=NULL;
   for (int i = 0; i <n; i++)

      if (C[i] == 2){      //��������ѡ���� 
               p=(A) malloc (sizeof(Set));
               p->pos=i;
        	   p->next=L1->next;
        	   L1->next=p;
            }
   // find next vertex to add to independent set 
   // this is a candidate vertex which is adjacent to
   // to the fewest other candidate vertices
   MinDegree = n + 1;
   // define a chain iterator to go down chain of candidates   
   p=L1->next;
   int u;
   while (p) {
      // vertex u is a candidate
      // find number of other candidates adjacent to it
      u=p->pos;
      r = G.vertices[u].firstarc;     
      count[u] = 0;
      while (r) {
         v=r->adjvex;
         // if v is a candidate, increment count[u]
         if (C[v] == 2) count[u]++;
         r = r->nextarc;         
         }
      // is this better vertex to add next?
      if (count[u] < MinDegree) {// yes it is
         MinDegree = count[u];
         MinV = u;}
      p=p->next;
      }
L2=(A) malloc (sizeof(Set));
L2->next=NULL;
   // add additional vertices to clique
   while (MinDegree < n + 1) {
      // MinV will be added to independent set and
      // adjacent candidate vertices will be eliminated
      //�޳����ֺ�ѡ���� 
      r = G.vertices[MinV].firstarc;
      while (r) {
         // v is to be eliminated, but first
         // make sure it was a candidate
         v=r->adjvex;
         if (C[v] == 2) {
            C[v] = 0;
            //v�����޳����� 
            p=(A) malloc (sizeof(Set));
               p->pos=v;
        	   p->next=L2->next;
        	   L2->next=p;
            }
         r=r->nextarc;         
         }
      // add MinV to independent set
      C[MinV] = 1;
      // now set up new candidates
  L3= (A) malloc (sizeof(Set));
  L3->next=NULL;   
      p=L1->next;      
      while (p) {
         u=p->pos;
         if (C[u] == 2){
           // u remains a candidate
           //u�����µĺ�ѡ���� 
          q=(A) malloc (sizeof(Set));
               q->pos=u;
        	   q->next=L3->next;
        	   L3->next=q;
}
         p=p->next;        
         }     
     //ɾ��ԭʼ��ѡ���㼯�� 
      /*for(q=L1->next;q;q=q->next)
      free (q);*/      
      //���µĺ�ѡ���ϸ���L1 
      L1=L3;
      // update count to account for eliminated
      // candidates and selection of MinV
      p=L2->next;      
      while (p) {         
         u=p->pos;
         r = G.vertices[u].firstarc;                 
         while (r) {
            v=r->adjvex;
            // easier to reduce everyone's count            
            count[v]--;
            r=r->nextarc;            
            }
         p=p->next;         
         }
      for(q=L2->next;q;q=q->next)
      free (q);
      // update MinV
      MinDegree = n + 1;
      p=L1->next;        
      while (p) {
          u = p->pos;
         if (count[u] < MinDegree) {
            MinDegree = count[u];
            MinV = u;
            }
    p=p->next;
         }
      }      
   // put clique vertices into V
   int s = -1;
  //for (i =0; i<n; i++) printf("%d ",C[i]);
  //printf("\n"); 
   for (i = 0; i <n; i++) 
      if (C[i] == 1) V[++s] = i;
      printf("����޹ؼ�: %d\n",s+1);
   for(i=0;i<=s;i++) printf("%c ",G.vertices[V[i]].data); 
   printf("\n");
   delete [] C;
   delete [] count;
}
int main(){   
    CreateUDN(G);
    int V[20];
    MaxIndependentSet(V);
    system("pause");
    return 0;
}

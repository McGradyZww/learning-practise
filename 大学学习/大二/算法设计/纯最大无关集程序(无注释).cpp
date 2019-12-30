#include<stdio.h>
#include<stdlib.h>
#define OK 1
	#define MAX_VERTEX_NUM 20 
	typedef int Status;  	
	typedef char VertexType;
	typedef int VRType;
	typedef int InforType;	
	typedef struct ArcNode
	{
	        int adjvex;   
	        struct ArcNode *nextarc;   
	}ArcNode;   
	typedef struct VNode
	{
	        VertexType data;   
	        ArcNode *firstarc;   
	}VNode, AdjList[MAX_VERTEX_NUM];   
	typedef struct ALGraph
	{
	        AdjList vertices;
	        int vexnum, arcnum;  
	}ALGraph;
	ALGraph G;   
	typedef struct Set{       
            int pos;
            Set *next;
 }*A;
	int LocateVex(ALGraph G, char v)
	{
	        int i;
	        for(i = 0; v != G.vertices[i].data && i < G.vexnum; i++)
	                ;
	        if(i >= G.vexnum)
	                return -1;
	        return i;
	}
	Status CreateUDN(ALGraph &G)
	{
	        int  j;
	        ArcNode *s, *t;
	        printf("输入无向图顶点数: ");
	        scanf("%d", &G.vexnum);
	        printf("输入无向图边数: ");
	        scanf("%d", &G.arcnum);
	        getchar();	
	        for(int i = 0; i < G.vexnum; i++)
	        {
	                printf("输入第%d个顶点信息:", i+1);
	                scanf("%c", &G.vertices[i].data);  
	                G.vertices[i].firstarc = NULL;
	                getchar();
	        }	
	        char v1, v2;	       
	        for(int k = 0; k < G.arcnum; k++)
	        {
	                printf("输入第 %d 条边依附的顶点v1: ", k+1);
	                scanf("%c", &v1);
	                getchar();
	                printf("输入第 %d 条边依附的顶点v2: ", k+1);
	                scanf("%c", &v2);
	                getchar();	
	                int i = LocateVex(G, v1);
	                int j = LocateVex(G, v2); 	
	                s = (ArcNode*) malloc (sizeof(ArcNode));
	                t = (ArcNode*) malloc (sizeof(ArcNode));	
	                s->adjvex = j;  
	                s->nextarc = G.vertices[i].firstarc;
	                G.vertices[i].firstarc =s;	
	                t->adjvex = i;   
	                t->nextarc = G.vertices[j].firstarc;
	                G.vertices[j].firstarc =t;
	        }	      	
	        return OK;
	}
int Count(int m){
    int a=0;
    ArcNode *e;
    for(e = G.vertices[m].firstarc; e; e = e->nextarc)
    a++;
    return a;
}
void MaxIndependentSet(int V[])
{
   A p,q,L1,L2,L3;
   int n = G.vexnum;
   int i;
   int *C = new int [n+1];  
   int *count = new int [n+1];
   for(i=0;i<n;i++)
   count[i]=Count(i);
   for (i = 0; i < n; i++)
      C[i] = 2;
   int MinDegree = count[0];
   int MinV = 0;
   for (int i = 1; i <n; i++) {
     int m = count[i];
     if (m < MinDegree) {
        MinDegree = m;
        MinV = i;}
     }
   C[MinV] = 1;
   ArcNode *r=(ArcNode*) malloc (sizeof(ArcNode));
   r = G.vertices[MinV].firstarc;
   int v;  
   while (r) {         
      v=r->adjvex;
      C[v] = 0;
      r=r->nextarc;
      }
L1=(A) malloc (sizeof(Set));
L1->next=NULL;
   for (int i = 0; i <n; i++)
      if (C[i] == 2){     
               p=(A) malloc (sizeof(Set));
               p->pos=i;
        	   p->next=L1->next;
        	   L1->next=p;
            }
   MinDegree = n + 1;
   p=L1->next;
   int u;
   while (p) {
      u=p->pos;
      r = G.vertices[u].firstarc;     
      count[u] = 0;
      while (r) {
         v=r->adjvex;
         if (C[v] == 2) count[u]++;
         r = r->nextarc;
         }
      if (count[u] < MinDegree) {
         MinDegree = count[u];
         MinV = u;}
      p=p->next;
      }
L2=(A) malloc (sizeof(Set));
L2->next=NULL;
   while (MinDegree < n + 1) {
      r = G.vertices[MinV].firstarc;
      while (r) {
         v=r->adjvex;
         if (C[v] == 2) {
            C[v] = 0;
            p=(A) malloc (sizeof(Set));
               p->pos=v;
        	   p->next=L2->next;
        	   L2->next=p;
            }
         r=r->nextarc;
         }
      C[MinV] = 1;
  L3= (A) malloc (sizeof(Set));
  L3->next=NULL;   
      p=L1->next;      
      while (p) {
         u=p->pos;
         if (C[u] == 2){
          q=(A) malloc (sizeof(Set));
               q->pos=u;
        	   q->next=L3->next;
        	   L3->next=q;
}
         p=p->next;
         }
      L1=L3;
      p=L2->next;      
      while (p) {                
         u=p->pos;
         r = G.vertices[u].firstarc;
         while (r) {
            v=r->adjvex;           
            count[v]--;
            r=r->nextarc;
            }
         p=p->next;
         }
      for(q=L2->next;q;q=q->next)
      free (q);
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
   int s = -1;
   for (i = 0; i <n; i++) 
      if (C[i] == 1) V[++s] = i;
      printf("最大无关集: %d\n",s+1);
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

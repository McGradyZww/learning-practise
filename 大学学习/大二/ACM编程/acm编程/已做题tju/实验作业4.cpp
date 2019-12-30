#include<iostream>
using namespace std;
typedef struct CSNode{     //����ɭ�ֶ���ṹ�� 
       int n;
       CSNode *lchild;
       CSNode *nextsibling;
}*CSTree;
typedef struct node {          //�߽��
    int dest;                            //Ŀ�궥���±�
    	         
    struct node * link;           //��һ������ָ��
} EdgeNode;
typedef struct {                   //������
    int data;              //����������
    EdgeNode * firstAdj;       //������ͷָ��
} VertexNode;
typedef struct {                   //ͼ���ڽӱ�
    VertexNode VexList [100]; 
    int vexnum, e;            //ͼ�е�ǰ�Ķ�����������
}Graph;
CSTree p,q,T,R;
bool visited[100],first;//visited[],first���ڱ�� 
void CreateGraph(Graph G);//��ͼ���� 
void DFSForest(Graph G,CSTree T);//������Ƚ�������ɭ�� 
int FirstAdjVex(Graph G,int v);//��ͼ����ĵ�һ���ڽӶ��� 
int NextAdjVex(Graph G,int v,int w);//��ͼ����������ڽӶ��� 
void DFSTree(Graph G,int v,CSTree T);//������Ƚ��������� 
void CreateGraph(Graph G) {//��ͼ����
    cin >> G.vexnum >> G.e;	     //���붥������ͱ���
    int tail,head,i;
    for ( i = 0; i < G.vexnum; i++) {
        cout<<"���붥����Ϣ:"; 
        cin >> G.VexList[i].data;    //���붥����Ϣ
        G.VexList[i].firstAdj = NULL;
    }
    for ( i = 0; i < G.e; i++) {         //����������
        cout<<"������߹�������������:";
        cin >> tail >> head;
        EdgeNode * t = new EdgeNode;//��ʼ�����ڽӱ� 
        t->dest = head; 
        t->link = G.VexList[tail].firstAdj;     
        G.VexList[tail].firstAdj = t;
  
		t = new EdgeNode;
        t->dest = tail;
        //����� head �������ǰ��
        t->link = G.VexList[head].firstAdj;     
        G.VexList[head].firstAdj = t;
    }
}
int FirstAdjVex(Graph G,int v){//��ͼ����ĵ�һ���ڽӶ���
    if (G.VexList[v].firstAdj)
    return G.VexList[v].firstAdj->dest;
    else
    return -1;
}

int NextAdjVex(Graph G,int v,int w){//��ͼ����������ڽӶ��� 
    if(G.VexList[v].firstAdj->link)
    return G.VexList[v].firstAdj->link->dest;
    else
    return -1;
}
    
void DFSTree(Graph G,int v,CSTree R){
     visited[v]=1;//����v�ѷ���
     first=1;
     int w;
     for(w=FirstAdjVex(G,v);w>=0;w=NextAdjVex(G,v,w))
     if(!visited[w]){
     p=(CSTree)malloc(sizeof(CSNode));
     p->n=G.VexList[w].data;//������ɭ��.���㸳ֵ 
     p->nextsibling=NULL;
     p->lchild=NULL;
     if(first){
               R->lchild=p;//ɭ�ֶ�������� 
               first=0;
     } 
     else{
          q->nextsibling=p;//ɭ�ֶ�������ֵ� 
          }
          q=p;
          DFSTree(G,w,q);
     }
}
void DFSForest(Graph G,CSTree T){//������Ƚ�������ɭ�� 
     T=NULL;
     int v;
     for(v=0;v<G.vexnum;v++)
     visited[v]=0;
     for(v=0;v<G.vexnum;v++)
     if(!visited[v]){
     p=(CSTree)malloc(sizeof(CSNode));
     p->n=G.VexList[v].data;
     p->nextsibling=NULL;
     p->lchild=NULL;
     if(!T) T=p;
     else q->nextsibling=p;//�������ֵ� 
     q=p;
     DFSTree(G,v,p);
     }
}
int main()
{
    cout<<"����������ͼ�Ķ���ͱ���:"; 
    Graph G;
    CreateGraph(G);
    system("pause");
    return 0;
}	


     

#include<iostream>
using namespace std;
typedef struct CSNode{     //生成森林顶点结构体 
       int n;
       CSNode *lchild;
       CSNode *nextsibling;
}*CSTree;
typedef struct node {          //边结点
    int dest;                            //目标顶点下标
    	         
    struct node * link;           //下一边链接指针
} EdgeNode;
typedef struct {                   //顶点结点
    int data;              //顶点数据域
    EdgeNode * firstAdj;       //边链表头指针
} VertexNode;
typedef struct {                   //图的邻接表
    VertexNode VexList [100]; 
    int vexnum, e;            //图中当前的顶点个数与边数
}Graph;
CSTree p,q,T,R;
bool visited[100],first;//visited[],first用于标记 
void CreateGraph(Graph G);//建图函数 
void DFSForest(Graph G,CSTree T);//深度优先建立生成森林 
int FirstAdjVex(Graph G,int v);//找图顶点的第一个邻接顶点 
int NextAdjVex(Graph G,int v,int w);//找图顶点的其他邻接顶点 
void DFSTree(Graph G,int v,CSTree T);//深度优先建立生成树 
void CreateGraph(Graph G) {//建图函数
    cin >> G.vexnum >> G.e;	     //输入顶点个数和边数
    int tail,head,i;
    for ( i = 0; i < G.vexnum; i++) {
        cout<<"输入顶点信息:"; 
        cin >> G.VexList[i].data;    //输入顶点信息
        G.VexList[i].firstAdj = NULL;
    }
    for ( i = 0; i < G.e; i++) {         //逐条边输入
        cout<<"输入与边关联的两个顶点:";
        cin >> tail >> head;
        EdgeNode * t = new EdgeNode;//开始建立邻接表 
        t->dest = head; 
        t->link = G.VexList[tail].firstAdj;     
        G.VexList[tail].firstAdj = t;
  
		t = new EdgeNode;
        t->dest = tail;
        //链入第 head 号链表的前端
        t->link = G.VexList[head].firstAdj;     
        G.VexList[head].firstAdj = t;
    }
}
int FirstAdjVex(Graph G,int v){//找图顶点的第一个邻接顶点
    if (G.VexList[v].firstAdj)
    return G.VexList[v].firstAdj->dest;
    else
    return -1;
}

int NextAdjVex(Graph G,int v,int w){//找图顶点的其他邻接顶点 
    if(G.VexList[v].firstAdj->link)
    return G.VexList[v].firstAdj->link->dest;
    else
    return -1;
}
    
void DFSTree(Graph G,int v,CSTree R){
     visited[v]=1;//顶点v已访问
     first=1;
     int w;
     for(w=FirstAdjVex(G,v);w>=0;w=NextAdjVex(G,v,w))
     if(!visited[w]){
     p=(CSTree)malloc(sizeof(CSNode));
     p->n=G.VexList[w].data;//给生成森林.顶点赋值 
     p->nextsibling=NULL;
     p->lchild=NULL;
     if(first){
               R->lchild=p;//森林顶点的左孩子 
               first=0;
     } 
     else{
          q->nextsibling=p;//森林顶点的右兄弟 
          }
          q=p;
          DFSTree(G,w,q);
     }
}
void DFSForest(Graph G,CSTree T){//深度优先建立生成森林 
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
     else q->nextsibling=p;//顶点右兄弟 
     q=p;
     DFSTree(G,v,p);
     }
}
int main()
{
    cout<<"请输入无向图的顶点和边数:"; 
    Graph G;
    CreateGraph(G);
    system("pause");
    return 0;
}	


     

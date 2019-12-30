#include<iostream>
#include<algorithm>
#include<stdlib.h>  //qsort()
#define MAXN 100
using namespace std;
struct Block{
       int x,y,z;
       int area;
}block[MAXN];
int cmp(const void *ele1,const void *ele2)    //结构体数组排序函数 
{
    return (*(Block*)ele1).area>(*(Block*)ele2).area?1:-1;
}
int sat(Block a,Block b)     //判断a是否可以加在b上 
{
    int min1,max1,min2,max2;
    min1=a.x>a.y?a.y:a.x;
    max1=a.x>a.y?a.x:a.y;
    min2=b.x>b.y?b.y:b.x;
    max2=b.x>b.y?b.x:b.y;
    if(min1<min2&&max1<max2) return 1;
    return 0;
}
int main()
{
    int n,k,i,j,a,b,c,ans[MAXN],max,count=1;
    while(cin>>n&&n)
    {
        k=0;
        for(i=0;i<n;i++)   //将一组输入分为3个结构体,即每种砖头细分为3种类型 
        {
            cin>>a>>b>>c;
            block[k].x=a;
            block[k].y=b;
            block[k].z=c;
            block[k].area=a*b;
            k++;
            block[k].x=a;
            block[k].y=c;
            block[k].z=b;
             block[k].area=a*c;
            k++;
            block[k].x=b;
            block[k].y=c;
            block[k].z=a;
            block[k].area=c*b;
            k++;
        }
        qsort(block,k,sizeof(block[0]),cmp);  //砖头按底面积排序 
        
        ans[k-1]=block[k-1].z;
        for(i=k-2;i>=0;i--)        //以block[i]为顶的高度 
        {
            max=0;
            for(j=i+1;j<k;j++)
            {
               if(sat(block[i],block[j])&&ans[j]>max) //max为block i 底下的最大高度 ，但block[j]必须能放在 block[i]下 
               max=ans[j]; 
            }
            ans[i]=max+block[i].z;
        }
        
        sort(ans,ans+k);//输出最大高度 
        cout<<"Case "<<count<<": maximum height = ";
        cout<<ans[k-1]<<endl;
        count++;
        
    }
    system("pause");
    return 0;
}

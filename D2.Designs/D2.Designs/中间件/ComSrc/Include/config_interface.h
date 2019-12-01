/**
	LD中间件配置、XML处理服务接口
**/
#ifndef __CONFIG_INTERFACE_H__
#define __CONFIG_INTERFACE_H__

#include "module_interface.h"

/// 只读配置对象接口
struct IRCfgNode : public IUnKnown
{
	/// 查找指定对象名的配置节点
	/**
	 *@param lpChildPath: 配置对象在配置信息中的位置
	 *@return : 符合条件的配置节点指针;失败返回NULL
	 */
	virtual IRCfgNode* LD_CALL_MODE GetChildObj(const char * lpChildPath) = 0;
        
	/// 根据序号获得属性名
	/**
	 *@param iIndex:第几个属性
	 *@return :属性名,序号超出，返回NULL
	 */
	virtual const char * LD_CALL_MODE GetAttrName(int iIndex) = 0;
		
	///根据属性名获得属性值
	/**
	 *@param lpAttrName:属性名
	 *@return 属性值;未找到目标返回NULL
	 */
	virtual const char * LD_CALL_MODE GetAttrValue(const char * lpAttrName) = 0;
		
	/// 获取本配置对象的文本内容。当文本值之中仅有空格字符时,则为NULL,即认为没有文本值;
	virtual const char * LD_CALL_MODE GetText(void) = 0;
		
	/// 获得配置节点名
	virtual const char * LD_CALL_MODE GetName(void) = 0;

	/// 获得第一个子节点,无子节点则返回NULL
	virtual IRCfgNode * LD_CALL_MODE GetFirstChild(void) = 0;
		
	/// 获取当前节点的下一兄弟节点对象,无下一兄弟节点返回NULL
	virtual IRCfgNode * LD_CALL_MODE GetSibling(void) = 0;

	///根据属性名获得字串形式的属性值
	/**
	*@param lpAttrName:属性名
	*@return 属性值;未找到目标返回lpDefault
	*/
	virtual const char * LD_CALL_MODE GetStrAttrValue(const char * lpAttrName, const char* lpDefault) = 0;
	///根据属性名获得整数形式的属性值
	/**
	*@param lpAttrName:属性名
	*@return 属性值;未找到目标返回lpDefault
	*/
	virtual int LD_CALL_MODE GetIntAttrValue(const char * lpAttrName, int iDefault) = 0;
	/// 获取当前节点的特定名字的下一兄弟节点对象,无下一该名的兄弟节点返回NULL
	virtual IRCfgNode * LD_CALL_MODE GetSiblingByName(const char* lpName) = 0;
	/// 获得第一个名为lpName的子节点,无该子节点则返回NULL
	virtual IRCfgNode * LD_CALL_MODE GetFirstChildByName(const char* lpName) = 0;
};


/// 配置服务接口
struct ICfgSvr : public IUnKnown
{
	/**
	 *@param szFileUrl:		文件的Url及文件名.
	 *@param szLocation:	配置对象位置。不同类型的文件此参数表述的含义略有差异,差异如下:
	 * XML: /根标签名/次层标签名/.../第n级标签名；如果等于缺省值,则返回根标签项.
	 * INI: /第一维名; 如果等于缺少值，则返回以文件名为第一维名称的配置项
	 *@return: 配置对象指针.如果参数非法或者目标配置对象不存在则返回NULL
	 */
	virtual IRCfgNode * LD_CALL_MODE LoadFromFile(const char * szFileUrl, const char * szLocation = "") = 0;


	///从缓冲区读取配置对象
	/**
	 *@param lpBuf:			缓冲区地址
	 *@param iBufSize:		缓冲区大小
	 *@param szLocation:	配置对象位置
	 *@return: 配置对象指针.如果参数非法或者目标配置对象不存在则返回NULL
	 */
	virtual IRCfgNode * LD_CALL_MODE LoadFromBuf(void * lpBuf, int iBufSize, const char * szLocation = "") = 0;
	//	获得
//	virtual MODULE_SID  LD_CALL_MODE GetSID()=0;
	virtual void  LD_CALL_MODE OnManager(int iFunc, IFastMessage* lpInReq, IFastMessage* lpOutAns)=0;
};


#endif

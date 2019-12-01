/**
	LD�м�����á�XML�������ӿ�
**/
#ifndef __CONFIG_INTERFACE_H__
#define __CONFIG_INTERFACE_H__

#include "module_interface.h"

/// ֻ�����ö���ӿ�
struct IRCfgNode : public IUnKnown
{
	/// ����ָ�������������ýڵ�
	/**
	 *@param lpChildPath: ���ö�����������Ϣ�е�λ��
	 *@return : �������������ýڵ�ָ��;ʧ�ܷ���NULL
	 */
	virtual IRCfgNode* LD_CALL_MODE GetChildObj(const char * lpChildPath) = 0;
        
	/// ������Ż��������
	/**
	 *@param iIndex:�ڼ�������
	 *@return :������,��ų���������NULL
	 */
	virtual const char * LD_CALL_MODE GetAttrName(int iIndex) = 0;
		
	///�����������������ֵ
	/**
	 *@param lpAttrName:������
	 *@return ����ֵ;δ�ҵ�Ŀ�귵��NULL
	 */
	virtual const char * LD_CALL_MODE GetAttrValue(const char * lpAttrName) = 0;
		
	/// ��ȡ�����ö�����ı����ݡ����ı�ֵ֮�н��пո��ַ�ʱ,��ΪNULL,����Ϊû���ı�ֵ;
	virtual const char * LD_CALL_MODE GetText(void) = 0;
		
	/// ������ýڵ���
	virtual const char * LD_CALL_MODE GetName(void) = 0;

	/// ��õ�һ���ӽڵ�,���ӽڵ��򷵻�NULL
	virtual IRCfgNode * LD_CALL_MODE GetFirstChild(void) = 0;
		
	/// ��ȡ��ǰ�ڵ����һ�ֵܽڵ����,����һ�ֵܽڵ㷵��NULL
	virtual IRCfgNode * LD_CALL_MODE GetSibling(void) = 0;

	///��������������ִ���ʽ������ֵ
	/**
	*@param lpAttrName:������
	*@return ����ֵ;δ�ҵ�Ŀ�귵��lpDefault
	*/
	virtual const char * LD_CALL_MODE GetStrAttrValue(const char * lpAttrName, const char* lpDefault) = 0;
	///�������������������ʽ������ֵ
	/**
	*@param lpAttrName:������
	*@return ����ֵ;δ�ҵ�Ŀ�귵��lpDefault
	*/
	virtual int LD_CALL_MODE GetIntAttrValue(const char * lpAttrName, int iDefault) = 0;
	/// ��ȡ��ǰ�ڵ���ض����ֵ���һ�ֵܽڵ����,����һ�������ֵܽڵ㷵��NULL
	virtual IRCfgNode * LD_CALL_MODE GetSiblingByName(const char* lpName) = 0;
	/// ��õ�һ����ΪlpName���ӽڵ�,�޸��ӽڵ��򷵻�NULL
	virtual IRCfgNode * LD_CALL_MODE GetFirstChildByName(const char* lpName) = 0;
};


/// ���÷���ӿ�
struct ICfgSvr : public IUnKnown
{
	/**
	 *@param szFileUrl:		�ļ���Url���ļ���.
	 *@param szLocation:	���ö���λ�á���ͬ���͵��ļ��˲��������ĺ������в���,��������:
	 * XML: /����ǩ��/�β��ǩ��/.../��n����ǩ�����������ȱʡֵ,�򷵻ظ���ǩ��.
	 * INI: /��һά��; �������ȱ��ֵ���򷵻����ļ���Ϊ��һά���Ƶ�������
	 *@return: ���ö���ָ��.��������Ƿ�����Ŀ�����ö��󲻴����򷵻�NULL
	 */
	virtual IRCfgNode * LD_CALL_MODE LoadFromFile(const char * szFileUrl, const char * szLocation = "") = 0;


	///�ӻ�������ȡ���ö���
	/**
	 *@param lpBuf:			��������ַ
	 *@param iBufSize:		��������С
	 *@param szLocation:	���ö���λ��
	 *@return: ���ö���ָ��.��������Ƿ�����Ŀ�����ö��󲻴����򷵻�NULL
	 */
	virtual IRCfgNode * LD_CALL_MODE LoadFromBuf(void * lpBuf, int iBufSize, const char * szLocation = "") = 0;
	//	���
//	virtual MODULE_SID  LD_CALL_MODE GetSID()=0;
	virtual void  LD_CALL_MODE OnManager(int iFunc, IFastMessage* lpInReq, IFastMessage* lpOutAns)=0;
};


#endif

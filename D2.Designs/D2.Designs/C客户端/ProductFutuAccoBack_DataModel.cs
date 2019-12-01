using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //�߼�_��Ʒ�ڻ�_�˻���ά_��ѯȫ���ڻ��˻�
   public class FuncpdfutuL_7_1Model : BaseModel
   {
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// ���ױ�����
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ���ױ���
        /// </summary>
        public String futu_acco { get; set; }
 
        /// <summary>
        /// ���ױ�������
        /// </summary>
        public String futu_acco_name { get; set; }
 
        /// <summary>
        /// ���ױ���״̬
        /// </summary>
        public String futu_acco_status { get; set; }
 
   }
 
   //�߼�_��Ʒ�ڻ�_�˻���ά_�����ڻ��˻���Ϣ
   public class FuncpdfutuL_7_2Model : BaseModel
   {
        /// <summary>
        /// ���ױ�����
        /// </summary>
        public int futu_acco_no { get; set; }
 
   }
 
   //�߼�_��Ʒ�ڻ�_�˻���ά_��ѯ�ڻ��˻���Ϣ
   public class FuncpdfutuL_7_5Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int create_date { get; set; }
 
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int create_time { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int update_date { get; set; }
 
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int update_time { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// ���ױ�����
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ���ױ���
        /// </summary>
        public String futu_acco { get; set; }
 
        /// <summary>
        /// ���ױ�������
        /// </summary>
        public String futu_acco_name { get; set; }
 
        /// <summary>
        /// ���ױ���״̬
        /// </summary>
        public String futu_acco_status { get; set; }
 
        /// <summary>
        /// �ױ���־
        /// </summary>
        public int hedge_type { get; set; }
 
        /// <summary>
        /// ���������Լ����
        /// </summary>
        public String allow_contrc_type { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
}

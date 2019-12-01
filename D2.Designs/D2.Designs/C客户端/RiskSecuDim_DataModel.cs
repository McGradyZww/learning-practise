using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //�߼�_���֤ȯ_ά��_��ѯָ������
   public class FuncrksecuL_3_1Model : BaseModel
   {
        /// <summary>
        /// ָ�����
        /// </summary>
        public int index_no { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public String index_code { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public String index_name { get; set; }
 
        /// <summary>
        /// ָ�����ƻ���
        /// </summary>
        public String index_build_orgn { get; set; }
 
        /// <summary>
        /// Ȩ������
        /// </summary>
        public int weight_type { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //�߼�_���֤ȯ_ά��_��ѯָ��֤ȯ����
   public class FuncrksecuL_3_2Model : BaseModel
   {
        /// <summary>
        /// ָ�����
        /// </summary>
        public int index_no { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public String index_code { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public String index_name { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// Ȩ��ֵ
        /// </summary>
        public double weight_value { get; set; }
 
        /// <summary>
        /// Ȩ�ر���
        /// </summary>
        public double weight_ratio { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //�߼�_���֤ȯ_ά��_��ѯ��ҵ����
   public class FuncrksecuL_3_3Model : BaseModel
   {
        /// <summary>
        /// ��ҵ���ͱ��
        /// </summary>
        public int indu_type_no { get; set; }
 
        /// <summary>
        /// ��ҵ��������
        /// </summary>
        public String indu_type_name { get; set; }
 
        /// <summary>
        /// ��ҵ���ƻ���
        /// </summary>
        public String indu_bulid_orgn { get; set; }
 
        /// <summary>
        /// ��ҵ�ۼƲ㼶
        /// </summary>
        public int indu_level_total { get; set; }
 
        /// <summary>
        /// Ȩ������
        /// </summary>
        public int weight_type { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //�߼�_���֤ȯ_ά��_��ѯ��ҵ�㼶
   public class FuncrksecuL_3_4Model : BaseModel
   {
        /// <summary>
        /// ��ҵ���ͱ��
        /// </summary>
        public int indu_type_no { get; set; }
 
        /// <summary>
        /// ��ҵ����
        /// </summary>
        public String indu_code { get; set; }
 
        /// <summary>
        /// ��ҵ����
        /// </summary>
        public String indu_name { get; set; }
 
        /// <summary>
        /// ��ҵ�ۼƲ㼶
        /// </summary>
        public int indu_level_total { get; set; }
 
        /// <summary>
        /// ��ҵ��ǰ�㼶
        /// </summary>
        public int indu_level { get; set; }
 
        /// <summary>
        /// �ϼ���ҵ����
        /// </summary>
        public String highup_indu_code { get; set; }
 
        /// <summary>
        /// Ȩ������
        /// </summary>
        public int weight_type { get; set; }
 
        /// <summary>
        /// Ȩ��ֵ
        /// </summary>
        public double weight_value { get; set; }
 
        /// <summary>
        /// Ȩ�ر���
        /// </summary>
        public double weight_ratio { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //�߼�_���֤ȯ_ά��_��ѯ��ҵ֤ȯ����
   public class FuncrksecuL_3_5Model : BaseModel
   {
        /// <summary>
        /// ��ҵ���ͱ��
        /// </summary>
        public int indu_type_no { get; set; }
 
        /// <summary>
        /// ��ҵ����
        /// </summary>
        public String indu_code { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// Ȩ��ֵ
        /// </summary>
        public double weight_value { get; set; }
 
        /// <summary>
        /// Ȩ�ر���
        /// </summary>
        public double weight_ratio { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //�߼�_���֤ȯ_ά��_��ѯ�Զ���ά������
   public class FuncrksecuL_3_6Model : BaseModel
   {
        /// <summary>
        /// ά�����ͱ���
        /// </summary>
        public String dime_type_code { get; set; }
 
        /// <summary>
        /// ά����������
        /// </summary>
        public String dime_type_name { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //�߼�_���֤ȯ_ά��_��ѯ�Զ���ά��֤ȯ����
   public class FuncrksecuL_3_7Model : BaseModel
   {
        /// <summary>
        /// ά�����ͱ���
        /// </summary>
        public String dime_type_code { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// Ȩ��ֵ
        /// </summary>
        public double weight_value { get; set; }
 
        /// <summary>
        /// Ȩ�ر���
        /// </summary>
        public double weight_ratio { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //�߼�_���֤ȯ_ά��_��ѯ����ά������
   public class FuncrksecuL_3_11Model : BaseModel
   {
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ����ά������
        /// </summary>
        public int user_dim_type { get; set; }
 
        /// <summary>
        /// ά�����ͱ���
        /// </summary>
        public String dime_type_code { get; set; }
 
        /// <summary>
        /// ά����������
        /// </summary>
        public String dime_type_name { get; set; }
 
        /// <summary>
        /// Ȩ������
        /// </summary>
        public int weight_type { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //�߼�_���֤ȯ_ά��_��ѯ����ά��֤ȯ����
   public class FuncrksecuL_3_14Model : BaseModel
   {
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ά�����ͱ���
        /// </summary>
        public String dime_type_code { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// Ȩ��ֵ
        /// </summary>
        public double weight_value { get; set; }
 
        /// <summary>
        /// Ȩ�ر���
        /// </summary>
        public double weight_ratio { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int create_date { get; set; }
 
   }
 
   //�߼�_���֤ȯ_ά��_ά����Ż�ȡά�ȱ���
   public class FuncrksecuL_3_15Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ά������
        /// </summary>
        public int dime_type { get; set; }
 
        /// <summary>
        /// ��������ά�ȱ��봮
        /// </summary>
        public String ctrl_cond_dim_code_str { get; set; }
 
   }
 
   //�߼�_���֤ȯ_ά��_ά�ȱ����ȡά�����
   public class FuncrksecuL_3_16Model : BaseModel
   {
        /// <summary>
        /// ά�����
        /// </summary>
        public ulong dime_id { get; set; }
 
   }
 
   //�߼�_���֤ȯ_ά��_��ѯ֤ȯ�����Ʊ��
   public class FuncrksecuL_3_24Model : BaseModel
   {
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
}

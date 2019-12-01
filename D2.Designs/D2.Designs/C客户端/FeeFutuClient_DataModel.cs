using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //�߼�_����_�ڻ����ÿͻ���_�����ڻ�����ģ��
   public class FuncpubL_18_41Model : BaseModel
   {
        /// <summary>
        /// ����ģ����
        /// </summary>
        public int fee_tmplat_no { get; set; }
 
   }
 
   //�߼�_����_�ڻ����ÿͻ���_��ѯ�ڻ�����ģ��
   public class FuncpubL_18_44Model : BaseModel
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
        /// ����ģ����
        /// </summary>
        public int fee_tmplat_no { get; set; }
 
        /// <summary>
        /// ����ģ������
        /// </summary>
        public String fee_tmplat_name { get; set; }
 
        /// <summary>
        /// ����ģ�����
        /// </summary>
        public int fee_tmplat_kind { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //�߼�_����_�ڻ����ÿͻ���_��ѯ�ڻ�����ģ����ˮ
   public class FuncpubL_18_45Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ����Ա�������
        /// </summary>
        public int opor_co_no { get; set; }
 
        /// <summary>
        /// ����Ա���
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// ����MAC
        /// </summary>
        public String oper_mac { get; set; }
 
        /// <summary>
        /// ����IP
        /// </summary>
        public String oper_ip_addr { get; set; }
 
        /// <summary>
        /// ������Ϣ
        /// </summary>
        public String oper_info { get; set; }
 
        /// <summary>
        /// ������ʽ
        /// </summary>
        public String oper_way { get; set; }
 
        /// <summary>
        /// �����˵�
        /// </summary>
        public int oper_menu_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public String oper_func_code { get; set; }
 
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ����ģ����
        /// </summary>
        public int fee_tmplat_no { get; set; }
 
        /// <summary>
        /// ����ģ������
        /// </summary>
        public String fee_tmplat_name { get; set; }
 
        /// <summary>
        /// ����ģ�����
        /// </summary>
        public int fee_tmplat_kind { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// ������ע
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //�߼�_����_�ڻ����ÿͻ���_��ѯ��ʷ�ڻ�����ģ����ˮ
   public class FuncpubL_18_46Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ����Ա�������
        /// </summary>
        public int opor_co_no { get; set; }
 
        /// <summary>
        /// ����Ա���
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// ����MAC
        /// </summary>
        public String oper_mac { get; set; }
 
        /// <summary>
        /// ����IP
        /// </summary>
        public String oper_ip_addr { get; set; }
 
        /// <summary>
        /// ������Ϣ
        /// </summary>
        public String oper_info { get; set; }
 
        /// <summary>
        /// ������ʽ
        /// </summary>
        public String oper_way { get; set; }
 
        /// <summary>
        /// �����˵�
        /// </summary>
        public int oper_menu_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public String oper_func_code { get; set; }
 
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ����ģ����
        /// </summary>
        public int fee_tmplat_no { get; set; }
 
        /// <summary>
        /// ����ģ������
        /// </summary>
        public String fee_tmplat_name { get; set; }
 
        /// <summary>
        /// ����ģ�����
        /// </summary>
        public int fee_tmplat_kind { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// ������ע
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //�߼�_����_�ڻ����ÿͻ���_��ѯ��Լ���ͷ���ģ����ϸ
   public class FuncpubL_18_54Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ����ģ����
        /// </summary>
        public int fee_tmplat_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_type { get; set; }
 
        /// <summary>
        /// ���ñ��
        /// </summary>
        public int fee_no { get; set; }
 
        /// <summary>
        /// �ڻ���������
        /// </summary>
        public int futu_fee_type { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// ��ƽ����
        /// </summary>
        public int contrc_dir { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double amt_ratio { get; set; }
 
        /// <summary>
        /// ���̶���
        /// </summary>
        public double amt_value { get; set; }
 
        /// <summary>
        /// ��ֵ����
        /// </summary>
        public double par_value_ratio { get; set; }
 
        /// <summary>
        /// ��ֵ�̶���
        /// </summary>
        public double par_value_value { get; set; }
 
        /// <summary>
        /// ��߷���
        /// </summary>
        public double max_fee { get; set; }
 
        /// <summary>
        /// ��ͷ���
        /// </summary>
        public double min_fee { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// �ױ���־
        /// </summary>
        public int hedge_type { get; set; }
 
   }
 
   //�߼�_����_�ڻ����ÿͻ���_��ѯ��Լ���ͷ���ģ����ϸ��ˮ
   public class FuncpubL_18_55Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ����Ա�������
        /// </summary>
        public int opor_co_no { get; set; }
 
        /// <summary>
        /// ����Ա���
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// ����MAC
        /// </summary>
        public String oper_mac { get; set; }
 
        /// <summary>
        /// ����IP
        /// </summary>
        public String oper_ip_addr { get; set; }
 
        /// <summary>
        /// ������Ϣ
        /// </summary>
        public String oper_info { get; set; }
 
        /// <summary>
        /// ������ʽ
        /// </summary>
        public String oper_way { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public String oper_func_code { get; set; }
 
        /// <summary>
        /// �����˵�
        /// </summary>
        public int oper_menu_no { get; set; }
 
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_type { get; set; }
 
        /// <summary>
        /// ����ģ����
        /// </summary>
        public int fee_tmplat_no { get; set; }
 
        /// <summary>
        /// ��ˮ�䶯�ֶ�
        /// </summary>
        public String jour_occur_field { get; set; }
 
        /// <summary>
        /// ��ˮ����Ϣ
        /// </summary>
        public String jour_after_occur_info { get; set; }
 
        /// <summary>
        /// ������ע
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //�߼�_����_�ڻ����ÿͻ���_��ѯ��ʷ��Լ���ͷ���ģ����ϸ��ˮ
   public class FuncpubL_18_56Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ����Ա�������
        /// </summary>
        public int opor_co_no { get; set; }
 
        /// <summary>
        /// ����Ա���
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// ����MAC
        /// </summary>
        public String oper_mac { get; set; }
 
        /// <summary>
        /// ����IP
        /// </summary>
        public String oper_ip_addr { get; set; }
 
        /// <summary>
        /// ������Ϣ
        /// </summary>
        public String oper_info { get; set; }
 
        /// <summary>
        /// ������ʽ
        /// </summary>
        public String oper_way { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public String oper_func_code { get; set; }
 
        /// <summary>
        /// �����˵�
        /// </summary>
        public int oper_menu_no { get; set; }
 
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_type { get; set; }
 
        /// <summary>
        /// ����ģ����
        /// </summary>
        public int fee_tmplat_no { get; set; }
 
        /// <summary>
        /// ��ˮ�䶯�ֶ�
        /// </summary>
        public String jour_occur_field { get; set; }
 
        /// <summary>
        /// ��ˮ����Ϣ
        /// </summary>
        public String jour_after_occur_info { get; set; }
 
        /// <summary>
        /// ������ע
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //�߼�_����_�ڻ����ÿͻ���_��ѯ��Լ�������ģ����ϸ
   public class FuncpubL_18_64Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ����ģ����
        /// </summary>
        public int fee_tmplat_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ��Լ������
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// ���ñ��
        /// </summary>
        public int fee_no { get; set; }
 
        /// <summary>
        /// �ڻ���������
        /// </summary>
        public int futu_fee_type { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// ��ƽ����
        /// </summary>
        public int contrc_dir { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double amt_ratio { get; set; }
 
        /// <summary>
        /// ���̶���
        /// </summary>
        public double amt_value { get; set; }
 
        /// <summary>
        /// ��ֵ����
        /// </summary>
        public double par_value_ratio { get; set; }
 
        /// <summary>
        /// ��ֵ�̶���
        /// </summary>
        public double par_value_value { get; set; }
 
        /// <summary>
        /// ��߷���
        /// </summary>
        public double max_fee { get; set; }
 
        /// <summary>
        /// ��ͷ���
        /// </summary>
        public double min_fee { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// �ױ���־
        /// </summary>
        public int hedge_type { get; set; }
 
   }
 
   //�߼�_����_�ڻ����ÿͻ���_��ѯ��Լ�������ģ����ϸ��ˮ
   public class FuncpubL_18_65Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ����Ա�������
        /// </summary>
        public int opor_co_no { get; set; }
 
        /// <summary>
        /// ����Ա���
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// ����MAC
        /// </summary>
        public String oper_mac { get; set; }
 
        /// <summary>
        /// ����IP
        /// </summary>
        public String oper_ip_addr { get; set; }
 
        /// <summary>
        /// ������Ϣ
        /// </summary>
        public String oper_info { get; set; }
 
        /// <summary>
        /// ������ʽ
        /// </summary>
        public String oper_way { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public String oper_func_code { get; set; }
 
        /// <summary>
        /// �����˵�
        /// </summary>
        public int oper_menu_no { get; set; }
 
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ��Լ������
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// ����ģ����
        /// </summary>
        public int fee_tmplat_no { get; set; }
 
        /// <summary>
        /// ��ˮ�䶯�ֶ�
        /// </summary>
        public String jour_occur_field { get; set; }
 
        /// <summary>
        /// ��ˮ����Ϣ
        /// </summary>
        public String jour_after_occur_info { get; set; }
 
        /// <summary>
        /// ������ע
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //�߼�_����_�ڻ����ÿͻ���_��ѯ��ʷ��Լ�������ģ����ϸ��ˮ
   public class FuncpubL_18_66Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ����Ա�������
        /// </summary>
        public int opor_co_no { get; set; }
 
        /// <summary>
        /// ����Ա���
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// ����MAC
        /// </summary>
        public String oper_mac { get; set; }
 
        /// <summary>
        /// ����IP
        /// </summary>
        public String oper_ip_addr { get; set; }
 
        /// <summary>
        /// ������Ϣ
        /// </summary>
        public String oper_info { get; set; }
 
        /// <summary>
        /// ������ʽ
        /// </summary>
        public String oper_way { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public String oper_func_code { get; set; }
 
        /// <summary>
        /// �����˵�
        /// </summary>
        public int oper_menu_no { get; set; }
 
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ��Լ������
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// ����ģ����
        /// </summary>
        public int fee_tmplat_no { get; set; }
 
        /// <summary>
        /// ��ˮ�䶯�ֶ�
        /// </summary>
        public String jour_occur_field { get; set; }
 
        /// <summary>
        /// ��ˮ����Ϣ
        /// </summary>
        public String jour_after_occur_info { get; set; }
 
        /// <summary>
        /// ������ע
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //�߼�_����_�ڻ����ÿͻ���_��ѯ�ʲ��˻��ڻ�����ģ��
   public class FuncpubL_18_74Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// �ڻ������������ģ����
        /// </summary>
        public int futu_code_spec_fee_tmplat_no { get; set; }
 
        /// <summary>
        /// �ڻ������������ģ����
        /// </summary>
        public int futu_type_spec_fee_tmplat_no { get; set; }
 
        /// <summary>
        /// �ڻ��������ģ����
        /// </summary>
        public int futu_code_fee_tmplat_no { get; set; }
 
        /// <summary>
        /// �ڻ����ͷ���ģ����
        /// </summary>
        public int futu_type_fee_tmplat_no { get; set; }
 
        /// <summary>
        /// �ڻ������ⲿ����ģ����
        /// </summary>
        public int futu_code_out_fee_tmplat_no { get; set; }
 
        /// <summary>
        /// �ڻ������ⲿ����ģ����
        /// </summary>
        public int futu_type_out_fee_tmplat_no { get; set; }
 
   }
 
   //�߼�_����_�ڻ����ÿͻ���_��ѯ�ʲ��˻��ڻ�����ģ����ˮ
   public class FuncpubL_18_75Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ����Ա�������
        /// </summary>
        public int opor_co_no { get; set; }
 
        /// <summary>
        /// ����Ա���
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// ����MAC
        /// </summary>
        public String oper_mac { get; set; }
 
        /// <summary>
        /// ����IP
        /// </summary>
        public String oper_ip_addr { get; set; }
 
        /// <summary>
        /// ������Ϣ
        /// </summary>
        public String oper_info { get; set; }
 
        /// <summary>
        /// ������ʽ
        /// </summary>
        public String oper_way { get; set; }
 
        /// <summary>
        /// �����˵�
        /// </summary>
        public int oper_menu_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public String oper_func_code { get; set; }
 
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��ˮ�䶯�ֶ�
        /// </summary>
        public String jour_occur_field { get; set; }
 
        /// <summary>
        /// ��ˮ����Ϣ
        /// </summary>
        public String jour_after_occur_info { get; set; }
 
        /// <summary>
        /// ������ע
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //�߼�_����_�ڻ����ÿͻ���_��ѯ��ʷ�ʲ��˻��ڻ�����ģ����ˮ
   public class FuncpubL_18_76Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ����Ա�������
        /// </summary>
        public int opor_co_no { get; set; }
 
        /// <summary>
        /// ����Ա���
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// ����MAC
        /// </summary>
        public String oper_mac { get; set; }
 
        /// <summary>
        /// ����IP
        /// </summary>
        public String oper_ip_addr { get; set; }
 
        /// <summary>
        /// ������Ϣ
        /// </summary>
        public String oper_info { get; set; }
 
        /// <summary>
        /// ������ʽ
        /// </summary>
        public String oper_way { get; set; }
 
        /// <summary>
        /// �����˵�
        /// </summary>
        public int oper_menu_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public String oper_func_code { get; set; }
 
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��ˮ�䶯�ֶ�
        /// </summary>
        public String jour_occur_field { get; set; }
 
        /// <summary>
        /// ��ˮ����Ϣ
        /// </summary>
        public String jour_after_occur_info { get; set; }
 
        /// <summary>
        /// ������ע
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //�߼�_����_�ڻ����ÿͻ���_��ѯϵͳ��Լ���ͷ���
   public class FuncpubL_18_144Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_type { get; set; }
 
        /// <summary>
        /// ���ñ��
        /// </summary>
        public int fee_no { get; set; }
 
        /// <summary>
        /// �ڻ���������
        /// </summary>
        public int futu_fee_type { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// ��ƽ����
        /// </summary>
        public int contrc_dir { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double amt_ratio { get; set; }
 
        /// <summary>
        /// ���̶���
        /// </summary>
        public double amt_value { get; set; }
 
        /// <summary>
        /// ��ֵ����
        /// </summary>
        public double par_value_ratio { get; set; }
 
        /// <summary>
        /// ��ֵ�̶���
        /// </summary>
        public double par_value_value { get; set; }
 
        /// <summary>
        /// ��߷���
        /// </summary>
        public double max_fee { get; set; }
 
        /// <summary>
        /// ��ͷ���
        /// </summary>
        public double min_fee { get; set; }
 
   }
 
   //�߼�_����_�ڻ����ÿͻ���_��ѯϵͳ��Լ�������
   public class FuncpubL_18_154Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ��Լ������
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// ���ñ��
        /// </summary>
        public int fee_no { get; set; }
 
        /// <summary>
        /// �ڻ���������
        /// </summary>
        public int futu_fee_type { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// ��ƽ����
        /// </summary>
        public int contrc_dir { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double amt_ratio { get; set; }
 
        /// <summary>
        /// ���̶���
        /// </summary>
        public double amt_value { get; set; }
 
        /// <summary>
        /// ��ֵ����
        /// </summary>
        public double par_value_ratio { get; set; }
 
        /// <summary>
        /// ��ֵ�̶���
        /// </summary>
        public double par_value_value { get; set; }
 
        /// <summary>
        /// ��߷���
        /// </summary>
        public double max_fee { get; set; }
 
        /// <summary>
        /// ��ͷ���
        /// </summary>
        public double min_fee { get; set; }
 
   }
 
   //�߼�_����_�ڻ����ÿͻ���_�����ڻ�����
   public class FuncpubL_18_203Model : BaseModel
   {
        /// <summary>
        /// Ӧ�ձ�֤��
        /// </summary>
        public double rece_margin { get; set; }
 
        /// <summary>
        /// ����Ӷ��
        /// </summary>
        public double trade_commis { get; set; }
 
        /// <summary>
        /// �걨����
        /// </summary>
        public double report_fee { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double wtdraw_fee { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public double deli_fee { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double other_fee { get; set; }
 
        /// <summary>
        /// ����Ӷ��
        /// </summary>
        public double other_commis { get; set; }
 
   }
 
   //�߼�_����_�ڻ����ÿͻ���_��ѯ���ñ��
   public class FuncpubL_18_302Model : BaseModel
   {
        /// <summary>
        /// ���ñ��
        /// </summary>
        public int fee_no { get; set; }
 
        /// <summary>
        /// �ڻ���������
        /// </summary>
        public int futu_fee_type { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// ��ƽ����
        /// </summary>
        public int contrc_dir { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //�߼�_����_�ڻ����ÿͻ���_��ȡ�ڻ���֤�����
   public class FuncpubL_18_303Model : BaseModel
   {
        /// <summary>
        /// ��֤�����
        /// </summary>
        public double margin_ratio { get; set; }
 
   }
 
   //�߼�_����_�ڻ����ÿͻ���_�����ڻ�����ģ��
   public class FuncpubL_18_78Model : BaseModel
   {
        /// <summary>
        /// ����ģ����
        /// </summary>
        public int fee_tmplat_no { get; set; }
 
   }
 
}

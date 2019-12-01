using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //�߼�_�����ڻ�_����_��������
   public class FunctdfutuL_4_11Model : BaseModel
   {
        /// <summary>
        /// ����Ա���
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// �ⲿ�˺�
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_type { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_date { get; set; }
 
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int order_time { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public ulong order_id { get; set; }
 
        /// <summary>
        /// ����״̬
        /// </summary>
        public String order_status { get; set; }
 
        /// <summary>
        /// �Ϲ津�����
        /// </summary>
        public ulong compli_trig_id { get; set; }
 
   }
 
   //�߼�_�����ڻ�_����_��������
   public class FunctdfutuL_4_12Model : BaseModel
   {
        /// <summary>
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public String contrc_code { get; set; }
 
        /// <summary>
        /// �ⲿ���
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// �걨���
        /// </summary>
        public String report_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public ulong order_id { get; set; }
 
        /// <summary>
        /// ����״̬
        /// </summary>
        public String order_status { get; set; }
 
        /// <summary>
        /// ����״̬
        /// </summary>
        public String wtdraw_status { get; set; }
 
        /// <summary>
        /// �ر���Ϣ
        /// </summary>
        public String rsp_info { get; set; }
 
   }
 
   //�߼�_�����ڻ�_����_��ѯ���̶���
   public class FunctdfutuL_4_31Model : BaseModel
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
        /// ��������
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ���ױ���
        /// </summary>
        public String futu_acco { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public String contrc_code { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_type { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_unit { get; set; }
 
        /// <summary>
        /// �ⲿ�˺�
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// �ⲿ���
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// ��ƽ����
        /// </summary>
        public int contrc_dir { get; set; }
 
        /// <summary>
        /// �ױ���־
        /// </summary>
        public int hedge_type { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public ulong order_id { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_date { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// �����۸�
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// ����״̬
        /// </summary>
        public String order_status { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //�߼�_�����ڻ�_����_��ѯ���̳���
   public class FunctdfutuL_4_32Model : BaseModel
   {
        /// <summary>
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public String contrc_code { get; set; }
 
        /// <summary>
        /// �ⲿ���
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// �ⲿ�˺�
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public ulong order_id { get; set; }
 
        /// <summary>
        /// �걨���
        /// </summary>
        public String report_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double wtdraw_qty { get; set; }
 
        /// <summary>
        /// ����״̬
        /// </summary>
        public String wtdraw_status { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //�߼�_�����ڻ�_����_��ѯ����
   public class FunctdfutuL_4_101Model : BaseModel
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
        /// ��ʼ������
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// �ⲿ�˺�
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// ���ױ�����
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// ��Լ������
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// �ʲ�����
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_type { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_unit { get; set; }
 
        /// <summary>
        /// �ⲿ���
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// �걨����
        /// </summary>
        public int report_date { get; set; }
 
        /// <summary>
        /// �걨ʱ��
        /// </summary>
        public int report_time { get; set; }
 
        /// <summary>
        /// �걨���
        /// </summary>
        public String report_no { get; set; }
 
        /// <summary>
        /// ָ�����
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_date { get; set; }
 
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int order_time { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_batch_no { get; set; }
 
        /// <summary>
        /// ��ƽ����
        /// </summary>
        public int contrc_dir { get; set; }
 
        /// <summary>
        /// �ױ���־
        /// </summary>
        public int hedge_type { get; set; }
 
        /// <summary>
        /// �����۸�
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// ����״̬
        /// </summary>
        public String order_status { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double wtdraw_qty { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// �ɽ��۸�
        /// </summary>
        public double strike_price { get; set; }
 
        /// <summary>
        /// �ɽ����
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// ���׷���
        /// </summary>
        public double trade_fee { get; set; }
 
        /// <summary>
        /// ����Ӷ��
        /// </summary>
        public double trade_commis { get; set; }
 
        /// <summary>
        /// ����Ӷ��
        /// </summary>
        public double other_commis { get; set; }
 
        /// <summary>
        /// �ɽ�Ӷ��
        /// </summary>
        public double strike_commis { get; set; }
 
        /// <summary>
        /// �ɽ�����Ӷ��
        /// </summary>
        public double strike_other_commis { get; set; }
 
        /// <summary>
        /// �ɽ�ȫ������
        /// </summary>
        public double strike_all_fee { get; set; }
 
        /// <summary>
        /// �걨����
        /// </summary>
        public double report_fee { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double wtdraw_fee { get; set; }
 
        /// <summary>
        /// Ӧ�ձ�֤��
        /// </summary>
        public double rece_margin { get; set; }
 
        /// <summary>
        /// ���ױ䶯���
        /// </summary>
        public double trade_occur_amt { get; set; }
 
        /// <summary>
        /// ��ϱ���
        /// </summary>
        public String comb_code { get; set; }
 
        /// <summary>
        /// ��֤�����
        /// </summary>
        public double margin_ratio { get; set; }
 
        /// <summary>
        /// �ر���Ϣ
        /// </summary>
        public String rsp_info { get; set; }
 
        /// <summary>
        /// �Ϲ津�����
        /// </summary>
        public ulong compli_trig_id { get; set; }
 
        /// <summary>
        /// ����������ʽ
        /// </summary>
        public String order_oper_way { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //�߼�_�����ڻ�_����_��ѯ������ʷ
   public class FunctdfutuL_4_102Model : BaseModel
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
        /// ��ʼ������
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// �ⲿ�˺�
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// ���ױ�����
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// ��Լ������
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// �ʲ�����
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_type { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_unit { get; set; }
 
        /// <summary>
        /// �ⲿ���
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// �걨����
        /// </summary>
        public int report_date { get; set; }
 
        /// <summary>
        /// �걨ʱ��
        /// </summary>
        public int report_time { get; set; }
 
        /// <summary>
        /// �걨���
        /// </summary>
        public String report_no { get; set; }
 
        /// <summary>
        /// ָ�����
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_date { get; set; }
 
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int order_time { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_batch_no { get; set; }
 
        /// <summary>
        /// ��ƽ����
        /// </summary>
        public int contrc_dir { get; set; }
 
        /// <summary>
        /// �ױ���־
        /// </summary>
        public int hedge_type { get; set; }
 
        /// <summary>
        /// �����۸�
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// ����״̬
        /// </summary>
        public String order_status { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double wtdraw_qty { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// �ɽ��۸�
        /// </summary>
        public double strike_price { get; set; }
 
        /// <summary>
        /// �ɽ����
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// ���׷���
        /// </summary>
        public double trade_fee { get; set; }
 
        /// <summary>
        /// ����Ӷ��
        /// </summary>
        public double trade_commis { get; set; }
 
        /// <summary>
        /// ����Ӷ��
        /// </summary>
        public double other_commis { get; set; }
 
        /// <summary>
        /// �ɽ�Ӷ��
        /// </summary>
        public double strike_commis { get; set; }
 
        /// <summary>
        /// �ɽ�����Ӷ��
        /// </summary>
        public double strike_other_commis { get; set; }
 
        /// <summary>
        /// �ɽ�ȫ������
        /// </summary>
        public double strike_all_fee { get; set; }
 
        /// <summary>
        /// �걨����
        /// </summary>
        public double report_fee { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double wtdraw_fee { get; set; }
 
        /// <summary>
        /// Ӧ�ձ�֤��
        /// </summary>
        public double rece_margin { get; set; }
 
        /// <summary>
        /// ���ױ䶯���
        /// </summary>
        public double trade_occur_amt { get; set; }
 
        /// <summary>
        /// ��ϱ���
        /// </summary>
        public String comb_code { get; set; }
 
        /// <summary>
        /// ��֤�����
        /// </summary>
        public double margin_ratio { get; set; }
 
        /// <summary>
        /// �ر���Ϣ
        /// </summary>
        public String rsp_info { get; set; }
 
        /// <summary>
        /// �Ϲ津�����
        /// </summary>
        public ulong compli_trig_id { get; set; }
 
        /// <summary>
        /// ����������ʽ
        /// </summary>
        public String order_oper_way { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //�߼�_�����ڻ�_����_��ѯ���ܶ��������
   public class FunctdfutuL_4_103Model : BaseModel
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
        /// ��ʼ������
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// ���ұ���
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ��Լ������
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public String contrc_code { get; set; }
 
        /// <summary>
        /// �ʲ�����
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_type { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_unit { get; set; }
 
        /// <summary>
        /// �ⲿ���
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_batch_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_date { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// ��ƽ����
        /// </summary>
        public int contrc_dir { get; set; }
 
        /// <summary>
        /// �ױ���־
        /// </summary>
        public int hedge_type { get; set; }
 
        /// <summary>
        /// �����۸�
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// ��������״̬
        /// </summary>
        public String order_sum_status { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double wtdraw_qty { get; set; }
 
        /// <summary>
        /// �ϵ�����
        /// </summary>
        public double waste_qty { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_aver_price { get; set; }
 
        /// <summary>
        /// �ɽ����
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// ���׷���
        /// </summary>
        public double trade_fee { get; set; }
 
        /// <summary>
        /// ����Ӷ��
        /// </summary>
        public double trade_commis { get; set; }
 
        /// <summary>
        /// ����Ӷ��
        /// </summary>
        public double other_commis { get; set; }
 
        /// <summary>
        /// �ɽ�Ӷ��
        /// </summary>
        public double strike_commis { get; set; }
 
        /// <summary>
        /// �ɽ�����Ӷ��
        /// </summary>
        public double strike_other_commis { get; set; }
 
        /// <summary>
        /// �걨����
        /// </summary>
        public double report_fee { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double wtdraw_fee { get; set; }
 
        /// <summary>
        /// �ɽ�ȫ������
        /// </summary>
        public double strike_all_fee { get; set; }
 
        /// <summary>
        /// Ӧ�ձ�֤��
        /// </summary>
        public double rece_margin { get; set; }
 
        /// <summary>
        /// ����������ʽ
        /// </summary>
        public String order_oper_way { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //�߼�_�����ڻ�_����_��ѯ��ʷ���ܶ��������
   public class FunctdfutuL_4_104Model : BaseModel
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
        /// ��ʼ������
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// ���ұ���
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ��Լ������
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public String contrc_code { get; set; }
 
        /// <summary>
        /// �ʲ�����
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_type { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_unit { get; set; }
 
        /// <summary>
        /// �ⲿ���
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_batch_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_date { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// ��ƽ����
        /// </summary>
        public int contrc_dir { get; set; }
 
        /// <summary>
        /// �ױ���־
        /// </summary>
        public int hedge_type { get; set; }
 
        /// <summary>
        /// �����۸�
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// ��������״̬
        /// </summary>
        public String order_sum_status { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double wtdraw_qty { get; set; }
 
        /// <summary>
        /// �ϵ�����
        /// </summary>
        public double waste_qty { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_aver_price { get; set; }
 
        /// <summary>
        /// �ɽ����
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// ���׷���
        /// </summary>
        public double trade_fee { get; set; }
 
        /// <summary>
        /// ����Ӷ��
        /// </summary>
        public double trade_commis { get; set; }
 
        /// <summary>
        /// ����Ӷ��
        /// </summary>
        public double other_commis { get; set; }
 
        /// <summary>
        /// �ɽ�Ӷ��
        /// </summary>
        public double strike_commis { get; set; }
 
        /// <summary>
        /// �ɽ�����Ӷ��
        /// </summary>
        public double strike_other_commis { get; set; }
 
        /// <summary>
        /// �걨����
        /// </summary>
        public double report_fee { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double wtdraw_fee { get; set; }
 
        /// <summary>
        /// �ɽ�ȫ������
        /// </summary>
        public double strike_all_fee { get; set; }
 
        /// <summary>
        /// Ӧ�ձ�֤��
        /// </summary>
        public double rece_margin { get; set; }
 
        /// <summary>
        /// ����������ʽ
        /// </summary>
        public String order_oper_way { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //�߼�_�����ڻ�_����_�����ĵ�
   public class FunctdfutuL_4_33Model : BaseModel
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
        /// ��������
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// �ⲿ�˺�
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ���״�����
        /// </summary>
        public int trade_code_no { get; set; }
 
        /// <summary>
        /// ��Լ������
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// �걨���
        /// </summary>
        public String report_no { get; set; }
 
        /// <summary>
        /// ָ�����
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// �ĵ����
        /// </summary>
        public ulong modi_order_id { get; set; }
 
        /// <summary>
        /// �¶������
        /// </summary>
        public ulong new_order_id { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// �����۸�
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public ulong wtdraw_id { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double wtdraw_qty { get; set; }
 
        /// <summary>
        /// ����״̬
        /// </summary>
        public String wtdraw_status { get; set; }
 
        /// <summary>
        /// �Ϲ津�����
        /// </summary>
        public ulong compli_trig_id { get; set; }
 
        /// <summary>
        /// ԭ����״̬
        /// </summary>
        public String old_order_status { get; set; }
 
        /// <summary>
        /// �¶���״̬
        /// </summary>
        public String new_order_status { get; set; }
 
   }
 
   //�߼�_�����ڻ�_����_��ѯ���̶�������
   public class FunctdfutuL_4_41Model : BaseModel
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
        /// ��������
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ���ױ���
        /// </summary>
        public String futu_acco { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public String contrc_code { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_type { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_unit { get; set; }
 
        /// <summary>
        /// �ⲿ�˺�
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// �ⲿ���
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// ��ƽ����
        /// </summary>
        public int contrc_dir { get; set; }
 
        /// <summary>
        /// �ױ���־
        /// </summary>
        public int hedge_type { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public ulong order_id { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_date { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// �����۸�
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// ����״̬
        /// </summary>
        public String order_status { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //�߼�_�����ڻ�_����_��ѯ���̳�������
   public class FunctdfutuL_4_42Model : BaseModel
   {
        /// <summary>
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public String contrc_code { get; set; }
 
        /// <summary>
        /// �ⲿ���
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// �ⲿ�˺�
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public ulong order_id { get; set; }
 
        /// <summary>
        /// �걨���
        /// </summary>
        public String report_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double wtdraw_qty { get; set; }
 
        /// <summary>
        /// ����״̬
        /// </summary>
        public String wtdraw_status { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
   }
 
}

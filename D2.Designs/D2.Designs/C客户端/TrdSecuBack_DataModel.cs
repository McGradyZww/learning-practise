using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //�߼�_����֤ȯ_������ά_��ѯָ��
   public class FunctdsecuL_10_31Model : BaseModel
   {
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
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
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
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// �ʲ�����
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// ָ���´���
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// ָ��ִ����
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// ָ�����
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// ָ��ʱ��
        /// </summary>
        public int comm_time { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// ָ���
        /// </summary>
        public int comm_dir { get; set; }
 
        /// <summary>
        /// ָ���޼�
        /// </summary>
        public double comm_limit_price { get; set; }
 
        /// <summary>
        /// ָ��ʵ���޼�
        /// </summary>
        public double limit_actual_price { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public double comm_qty { get; set; }
 
        /// <summary>
        /// ָ����
        /// </summary>
        public double comm_amt { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// ָ�������
        /// </summary>
        public double comm_cancel_qty { get; set; }
 
        /// <summary>
        /// �ɽ����
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// ָ�����
        /// </summary>
        public double comm_frozen_amt { get; set; }
 
        /// <summary>
        /// ָ�������
        /// </summary>
        public double comm_frozen_qty { get; set; }
 
        /// <summary>
        /// ���۱�־
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// Ʊ����ֵ
        /// </summary>
        public double par_value { get; set; }
 
        /// <summary>
        /// ծȯ������Ϣ
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// �ɽ�״̬
        /// </summary>
        public String strike_status { get; set; }
 
        /// <summary>
        /// ָ��״̬
        /// </summary>
        public String comm_status { get; set; }
 
        /// <summary>
        /// ָ�ʼ����
        /// </summary>
        public int comm_begin_date { get; set; }
 
        /// <summary>
        /// ָ���������
        /// </summary>
        public int comm_end_date { get; set; }
 
        /// <summary>
        /// ָ�ʼʱ��
        /// </summary>
        public int comm_begin_time { get; set; }
 
        /// <summary>
        /// ָ�����ʱ��
        /// </summary>
        public int comm_end_time { get; set; }
 
        /// <summary>
        /// ָ���������
        /// </summary>
        public int comm_comple_date { get; set; }
 
        /// <summary>
        /// ָ�����ʱ��
        /// </summary>
        public int comm_comple_time { get; set; }
 
        /// <summary>
        /// ָ����������
        /// </summary>
        public int comm_appr_date { get; set; }
 
        /// <summary>
        /// ָ������ʱ��
        /// </summary>
        public int comm_appr_time { get; set; }
 
        /// <summary>
        /// ָ������״̬
        /// </summary>
        public String comm_appr_status { get; set; }
 
        /// <summary>
        /// ָ����������Ա���
        /// </summary>
        public int comm_appr_oper_no { get; set; }
 
        /// <summary>
        /// ָ����������Ա
        /// </summary>
        public int comm_appr_oper { get; set; }
 
        /// <summary>
        /// ָ������˵��
        /// </summary>
        public String comm_appr_remark { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public ulong basket_id { get; set; }
 
        /// <summary>
        /// ָ�������ʽ
        /// </summary>
        public String comm_oper_way { get; set; }
 
        /// <summary>
        /// ����ָ���־
        /// </summary>
        public int exter_comm_flag { get; set; }
 
        /// <summary>
        /// ָ����ɱ�־
        /// </summary>
        public int comm_comple_flag { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ά_��ѯָ����ʷ
   public class FunctdsecuL_10_32Model : BaseModel
   {
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
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
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
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// �ʲ�����
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// ָ���´���
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// ָ��ִ����
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// ָ�����
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// ָ��ʱ��
        /// </summary>
        public int comm_time { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// ָ���
        /// </summary>
        public int comm_dir { get; set; }
 
        /// <summary>
        /// ָ���޼�
        /// </summary>
        public double comm_limit_price { get; set; }
 
        /// <summary>
        /// ָ��ʵ���޼�
        /// </summary>
        public double limit_actual_price { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public double comm_qty { get; set; }
 
        /// <summary>
        /// ָ����
        /// </summary>
        public double comm_amt { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// ָ�������
        /// </summary>
        public double comm_cancel_qty { get; set; }
 
        /// <summary>
        /// �ɽ����
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// ָ�����
        /// </summary>
        public double comm_frozen_amt { get; set; }
 
        /// <summary>
        /// ָ�������
        /// </summary>
        public double comm_frozen_qty { get; set; }
 
        /// <summary>
        /// ���۱�־
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// Ʊ����ֵ
        /// </summary>
        public double par_value { get; set; }
 
        /// <summary>
        /// ծȯ������Ϣ
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// �ɽ�״̬
        /// </summary>
        public String strike_status { get; set; }
 
        /// <summary>
        /// ָ��״̬
        /// </summary>
        public String comm_status { get; set; }
 
        /// <summary>
        /// ָ�ʼ����
        /// </summary>
        public int comm_begin_date { get; set; }
 
        /// <summary>
        /// ָ���������
        /// </summary>
        public int comm_end_date { get; set; }
 
        /// <summary>
        /// ָ�ʼʱ��
        /// </summary>
        public int comm_begin_time { get; set; }
 
        /// <summary>
        /// ָ�����ʱ��
        /// </summary>
        public int comm_end_time { get; set; }
 
        /// <summary>
        /// ָ���������
        /// </summary>
        public int comm_comple_date { get; set; }
 
        /// <summary>
        /// ָ�����ʱ��
        /// </summary>
        public int comm_comple_time { get; set; }
 
        /// <summary>
        /// ָ����������
        /// </summary>
        public int comm_appr_date { get; set; }
 
        /// <summary>
        /// ָ������ʱ��
        /// </summary>
        public int comm_appr_time { get; set; }
 
        /// <summary>
        /// ָ������״̬
        /// </summary>
        public String comm_appr_status { get; set; }
 
        /// <summary>
        /// ָ����������Ա���
        /// </summary>
        public int comm_appr_oper_no { get; set; }
 
        /// <summary>
        /// ָ����������Ա
        /// </summary>
        public int comm_appr_oper { get; set; }
 
        /// <summary>
        /// ָ������˵��
        /// </summary>
        public String comm_appr_remark { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public ulong basket_id { get; set; }
 
        /// <summary>
        /// ָ�������ʽ
        /// </summary>
        public String comm_oper_way { get; set; }
 
        /// <summary>
        /// ����ָ���־
        /// </summary>
        public int exter_comm_flag { get; set; }
 
        /// <summary>
        /// ָ����ɱ�־
        /// </summary>
        public int comm_comple_flag { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ά_��ѯ����
   public class FunctdsecuL_10_41Model : BaseModel
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
        /// �ɶ�������
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// �ʲ�����
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// ָ���´���
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// �ⲿ���
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// ָ�����
        /// </summary>
        public ulong comm_id { get; set; }
 
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
        /// ��������
        /// </summary>
        public int order_batch_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public ulong order_id { get; set; }
 
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
        /// �۸�����
        /// </summary>
        public int price_type { get; set; }
 
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
        /// �ɽ����
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// ȫ������
        /// </summary>
        public double all_fee { get; set; }
 
        /// <summary>
        /// ӡ��˰
        /// </summary>
        public double stamp_tax { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double trans_fee { get; set; }
 
        /// <summary>
        /// ���ַ�
        /// </summary>
        public double brkage_fee { get; set; }
 
        /// <summary>
        /// ֤�ܷ�
        /// </summary>
        public double SEC_charges { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double other_fee { get; set; }
 
        /// <summary>
        /// ����Ӷ��
        /// </summary>
        public double trade_commis { get; set; }
 
        /// <summary>
        /// ����Ӷ��
        /// </summary>
        public double other_commis { get; set; }
 
        /// <summary>
        /// ծȯ������Ϣ
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// ���۱�־
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// ����������
        /// </summary>
        public double order_frozen_amt { get; set; }
 
        /// <summary>
        /// ������������
        /// </summary>
        public double order_frozen_qty { get; set; }
 
        /// <summary>
        /// �ر���Ϣ
        /// </summary>
        public String rsp_info { get; set; }
 
        /// <summary>
        /// �Ϲ津�����
        /// </summary>
        public ulong compli_trig_id { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// ����������ʽ
        /// </summary>
        public String order_oper_way { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ά_��ѯ������ʷ
   public class FunctdsecuL_10_42Model : BaseModel
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
        /// �ɶ�������
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// �ʲ�����
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// ָ���´���
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// �ⲿ���
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// ָ�����
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_batch_no { get; set; }
 
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
        /// ��������
        /// </summary>
        public int order_batch_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public ulong order_id { get; set; }
 
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
        /// �۸�����
        /// </summary>
        public int price_type { get; set; }
 
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
        /// �ɽ����
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// ȫ������
        /// </summary>
        public double all_fee { get; set; }
 
        /// <summary>
        /// ӡ��˰
        /// </summary>
        public double stamp_tax { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double trans_fee { get; set; }
 
        /// <summary>
        /// ���ַ�
        /// </summary>
        public double brkage_fee { get; set; }
 
        /// <summary>
        /// ֤�ܷ�
        /// </summary>
        public double SEC_charges { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double other_fee { get; set; }
 
        /// <summary>
        /// ����Ӷ��
        /// </summary>
        public double trade_commis { get; set; }
 
        /// <summary>
        /// ����Ӷ��
        /// </summary>
        public double other_commis { get; set; }
 
        /// <summary>
        /// ծȯ������Ϣ
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// ���۱�־
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// ����������
        /// </summary>
        public double order_frozen_amt { get; set; }
 
        /// <summary>
        /// ������������
        /// </summary>
        public double order_frozen_qty { get; set; }
 
        /// <summary>
        /// �ر���Ϣ
        /// </summary>
        public String rsp_info { get; set; }
 
        /// <summary>
        /// �Ϲ津�����
        /// </summary>
        public ulong compli_trig_id { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// ����������ʽ
        /// </summary>
        public String order_oper_way { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ά_��ѯ�����ر�
   public class FunctdsecuL_10_51Model : BaseModel
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
        /// ��ʼ������
        /// </summary>
        public int init_date { get; set; }
 
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
        /// �ɶ�����
        /// </summary>
        public String stock_acco { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
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
        /// ��������
        /// </summary>
        public int order_date { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public ulong order_id { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// �����۸�
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// �۸�����
        /// </summary>
        public int price_type { get; set; }
 
        /// <summary>
        /// �����ر�״̬
        /// </summary>
        public String order_rsp_status { get; set; }
 
        /// <summary>
        /// �ر���Ϣ
        /// </summary>
        public String rsp_info { get; set; }
 
        /// <summary>
        /// ����״̬
        /// </summary>
        public String deal_status { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ά_��ѯ�ɽ��ر�
   public class FunctdsecuL_10_52Model : BaseModel
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
        /// ��ʼ������
        /// </summary>
        public int init_date { get; set; }
 
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
        /// �ɶ�����
        /// </summary>
        public String stock_acco { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public int strike_date { get; set; }
 
        /// <summary>
        /// �ɽ�ʱ��
        /// </summary>
        public int strike_time { get; set; }
 
        /// <summary>
        /// �ɽ����
        /// </summary>
        public String strike_no { get; set; }
 
        /// <summary>
        /// �걨���
        /// </summary>
        public String report_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// �ɽ��۸�
        /// </summary>
        public double strike_price { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// �ɽ����
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// �ɽ�����ʽ
        /// </summary>
        public int strike_deal_type { get; set; }
 
        /// <summary>
        /// �ر���Ϣ
        /// </summary>
        public String rsp_info { get; set; }
 
        /// <summary>
        /// ����״̬
        /// </summary>
        public String deal_status { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
        /// <summary>
        /// �걨����
        /// </summary>
        public int report_date { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ά_��ѯ�ɽ���ϸ
   public class FunctdsecuL_10_53Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
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
        /// �ⲿ�˺�
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// �ɶ�������
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// ָ�����
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public int strike_date { get; set; }
 
        /// <summary>
        /// �ɽ�ʱ��
        /// </summary>
        public int strike_time { get; set; }
 
        /// <summary>
        /// �ɽ����
        /// </summary>
        public String strike_no { get; set; }
 
        /// <summary>
        /// �걨����
        /// </summary>
        public int report_date { get; set; }
 
        /// <summary>
        /// �걨���
        /// </summary>
        public String report_no { get; set; }
 
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
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// �����۸�
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double order_qty { get; set; }
 
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
        /// ȫ������
        /// </summary>
        public double all_fee { get; set; }
 
        /// <summary>
        /// ӡ��˰
        /// </summary>
        public double stamp_tax { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double trans_fee { get; set; }
 
        /// <summary>
        /// ���ַ�
        /// </summary>
        public double brkage_fee { get; set; }
 
        /// <summary>
        /// ֤�ܷ�
        /// </summary>
        public double SEC_charges { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double other_fee { get; set; }
 
        /// <summary>
        /// ����Ӷ��
        /// </summary>
        public double trade_commis { get; set; }
 
        /// <summary>
        /// ����Ӷ��
        /// </summary>
        public double other_commis { get; set; }
 
        /// <summary>
        /// ծȯ������Ϣ
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// �ɽ�ծȯ������Ϣ
        /// </summary>
        public double strike_bond_accr_intrst { get; set; }
 
        /// <summary>
        /// ���۱�־
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// ����������ʽ
        /// </summary>
        public String order_oper_way { get; set; }
 
        /// <summary>
        /// ����ָ���־
        /// </summary>
        public int exter_comm_flag { get; set; }
 
        /// <summary>
        /// ��¼��Ч��־
        /// </summary>
        public int record_valid_flag { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ά_��ѯ�ɽ���ϸ��ʷ
   public class FunctdsecuL_10_54Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
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
        /// �ⲿ�˺�
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// �ɶ�������
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// ָ�����
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public int strike_date { get; set; }
 
        /// <summary>
        /// �ɽ�ʱ��
        /// </summary>
        public int strike_time { get; set; }
 
        /// <summary>
        /// �ɽ����
        /// </summary>
        public String strike_no { get; set; }
 
        /// <summary>
        /// �걨����
        /// </summary>
        public int report_date { get; set; }
 
        /// <summary>
        /// �걨���
        /// </summary>
        public String report_no { get; set; }
 
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
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// �����۸�
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double order_qty { get; set; }
 
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
        /// ȫ������
        /// </summary>
        public double all_fee { get; set; }
 
        /// <summary>
        /// ӡ��˰
        /// </summary>
        public double stamp_tax { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double trans_fee { get; set; }
 
        /// <summary>
        /// ���ַ�
        /// </summary>
        public double brkage_fee { get; set; }
 
        /// <summary>
        /// ֤�ܷ�
        /// </summary>
        public double SEC_charges { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double other_fee { get; set; }
 
        /// <summary>
        /// ����Ӷ��
        /// </summary>
        public double trade_commis { get; set; }
 
        /// <summary>
        /// ����Ӷ��
        /// </summary>
        public double other_commis { get; set; }
 
        /// <summary>
        /// ծȯ������Ϣ
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// ���۱�־
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// �ɽ�ծȯ������Ϣ
        /// </summary>
        public double strike_bond_accr_intrst { get; set; }
 
        /// <summary>
        /// ����������ʽ
        /// </summary>
        public String order_oper_way { get; set; }
 
        /// <summary>
        /// ����ָ���־
        /// </summary>
        public int exter_comm_flag { get; set; }
 
        /// <summary>
        /// ��¼��Ч��־
        /// </summary>
        public int record_valid_flag { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ά_��ѯ����ͳ�ƶ���
   public class FunctdsecuL_10_55Model : BaseModel
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
        /// ����״̬
        /// </summary>
        public String order_status { get; set; }
 
        /// <summary>
        /// ����������ʽ
        /// </summary>
        public String order_oper_way { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ά_��ѯ����ͳ���쳣����
   public class FunctdsecuL_10_60Model : BaseModel
   {
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// δ����¼��
        /// </summary>
        public int no_report_cnt { get; set; }
 
        /// <summary>
        /// �ѱ���¼��
        /// </summary>
        public int already_report_cnt { get; set; }
 
        /// <summary>
        /// ������¼��
        /// </summary>
        public int wait_report_cnt { get; set; }
 
        /// <summary>
        /// �����쳣��
        /// </summary>
        public int wait_report_except_cnt { get; set; }
 
        /// <summary>
        /// ������¼��
        /// </summary>
        public int in_report_cnt { get; set; }
 
        /// <summary>
        /// �����쳣��
        /// </summary>
        public int in_report_except_cnt { get; set; }
 
        /// <summary>
        /// ������¼��
        /// </summary>
        public int wait_cancel_cnt { get; set; }
 
        /// <summary>
        /// �����쳣��
        /// </summary>
        public int wait_cancel_except_cnt { get; set; }
 
        /// <summary>
        /// ������¼��
        /// </summary>
        public int part_cancel_cnt { get; set; }
 
        /// <summary>
        /// �ѳ���¼��
        /// </summary>
        public int all_cancel_cnt { get; set; }
 
        /// <summary>
        /// ���ɼ�¼��
        /// </summary>
        public int part_strike_cnt { get; set; }
 
        /// <summary>
        /// �ѳɼ�¼��
        /// </summary>
        public int all_strike_cnt { get; set; }
 
        /// <summary>
        /// �ϵ���¼��
        /// </summary>
        public int abolish_cnt { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ά_��ѯָ����ܿ���
   public class FunctdsecuL_10_61Model : BaseModel
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
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// �ʲ�����
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// ָ���´���
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// ָ��ִ����
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// ָ��ʱ��
        /// </summary>
        public int comm_time { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// ָ���
        /// </summary>
        public int comm_dir { get; set; }
 
        /// <summary>
        /// ָ���޼�
        /// </summary>
        public double comm_limit_price { get; set; }
 
        /// <summary>
        /// ָ��ʵ���޼�
        /// </summary>
        public double limit_actual_price { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public double comm_qty { get; set; }
 
        /// <summary>
        /// ָ����
        /// </summary>
        public double comm_amt { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// ָ�������
        /// </summary>
        public double comm_cancel_qty { get; set; }
 
        /// <summary>
        /// �ɽ����
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// ���۱�־
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// Ʊ����ֵ
        /// </summary>
        public double par_value { get; set; }
 
        /// <summary>
        /// ծȯ������Ϣ
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// �ɽ�״̬
        /// </summary>
        public String strike_status { get; set; }
 
        /// <summary>
        /// ָ�����״̬
        /// </summary>
        public String comm_sum_status { get; set; }
 
        /// <summary>
        /// ָ�ʼ����
        /// </summary>
        public int comm_begin_date { get; set; }
 
        /// <summary>
        /// ָ���������
        /// </summary>
        public int comm_end_date { get; set; }
 
        /// <summary>
        /// ָ�ʼʱ��
        /// </summary>
        public int comm_begin_time { get; set; }
 
        /// <summary>
        /// ָ�����ʱ��
        /// </summary>
        public int comm_end_time { get; set; }
 
        /// <summary>
        /// ָ���������
        /// </summary>
        public int comm_comple_date { get; set; }
 
        /// <summary>
        /// ָ�����ʱ��
        /// </summary>
        public int comm_comple_time { get; set; }
 
        /// <summary>
        /// ָ������������
        /// </summary>
        public int max_comm_comple_date { get; set; }
 
        /// <summary>
        /// ָ��������ʱ��
        /// </summary>
        public int max_comm_comple_time { get; set; }
 
        /// <summary>
        /// ָ����������
        /// </summary>
        public int comm_appr_date { get; set; }
 
        /// <summary>
        /// ָ������ʱ��
        /// </summary>
        public int comm_appr_time { get; set; }
 
        /// <summary>
        /// ָ���������״̬
        /// </summary>
        public String comm_sum_approve_status { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public ulong basket_id { get; set; }
 
        /// <summary>
        /// ���붩������
        /// </summary>
        public double buy_order_qty { get; set; }
 
        /// <summary>
        /// ������������
        /// </summary>
        public double sell_order_qty { get; set; }
 
        /// <summary>
        /// ����ָ������
        /// </summary>
        public double buy_comm_qty { get; set; }
 
        /// <summary>
        /// ����ָ������
        /// </summary>
        public double sell_comm_qty { get; set; }
 
        /// <summary>
        /// ����ɽ�����
        /// </summary>
        public double buy_strike_qty { get; set; }
 
        /// <summary>
        /// �����ɽ�����
        /// </summary>
        public double sell_strike_qty { get; set; }
 
        /// <summary>
        /// ����ɽ����
        /// </summary>
        public double buy_strike_amt { get; set; }
 
        /// <summary>
        /// �����ɽ����
        /// </summary>
        public double sell_strike_amt { get; set; }
 
        /// <summary>
        /// ����ָ����
        /// </summary>
        public double buy_comm_amt { get; set; }
 
        /// <summary>
        /// ����ָ����
        /// </summary>
        public double sell_comm_amt { get; set; }
 
        /// <summary>
        /// ָ�������ʽ
        /// </summary>
        public String comm_oper_way { get; set; }
 
        /// <summary>
        /// ����ָ���־
        /// </summary>
        public int exter_comm_flag { get; set; }
 
        /// <summary>
        /// ���ױ���
        /// </summary>
        public String exch_crncy_type { get; set; }
 
        /// <summary>
        /// ��Ч����
        /// </summary>
        public double valid_aver_price { get; set; }
 
        /// <summary>
        /// ȫ����Ч����
        /// </summary>
        public double valid_aver_price_allday { get; set; }
 
        /// <summary>
        /// ִ�м۲�
        /// </summary>
        public double exec_price_diff { get; set; }
 
        /// <summary>
        /// ȫ��ִ�м۲�
        /// </summary>
        public double exec_price_diff_allday { get; set; }
 
        /// <summary>
        /// ��Чռ��
        /// </summary>
        public double valid_ratio { get; set; }
 
        /// <summary>
        /// ȫ����Чռ��
        /// </summary>
        public double valid_ratio_allday { get; set; }
 
        /// <summary>
        /// ��Ч����
        /// </summary>
        public double valid_qty { get; set; }
 
        /// <summary>
        /// ȫ����Ч����
        /// </summary>
        public double valid_qty_allday { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
        /// <summary>
        /// ָ�ע��Ϣ
        /// </summary>
        public String comm_remark_info { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ά_��ѯָ����ܿ�����ʷ
   public class FunctdsecuL_10_62Model : BaseModel
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
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// �ʲ�����
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// ָ���´���
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// ָ��ִ����
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// ָ��ʱ��
        /// </summary>
        public int comm_time { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// ָ���
        /// </summary>
        public int comm_dir { get; set; }
 
        /// <summary>
        /// ָ���޼�
        /// </summary>
        public double comm_limit_price { get; set; }
 
        /// <summary>
        /// ָ��ʵ���޼�
        /// </summary>
        public double limit_actual_price { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public double comm_qty { get; set; }
 
        /// <summary>
        /// ָ����
        /// </summary>
        public double comm_amt { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// ָ�������
        /// </summary>
        public double comm_cancel_qty { get; set; }
 
        /// <summary>
        /// �ɽ����
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// ���۱�־
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// Ʊ����ֵ
        /// </summary>
        public double par_value { get; set; }
 
        /// <summary>
        /// ծȯ������Ϣ
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// �ɽ�״̬
        /// </summary>
        public String strike_status { get; set; }
 
        /// <summary>
        /// ָ�����״̬
        /// </summary>
        public String comm_sum_status { get; set; }
 
        /// <summary>
        /// ָ�ʼ����
        /// </summary>
        public int comm_begin_date { get; set; }
 
        /// <summary>
        /// ָ���������
        /// </summary>
        public int comm_end_date { get; set; }
 
        /// <summary>
        /// ָ�ʼʱ��
        /// </summary>
        public int comm_begin_time { get; set; }
 
        /// <summary>
        /// ָ�����ʱ��
        /// </summary>
        public int comm_end_time { get; set; }
 
        /// <summary>
        /// ָ���������
        /// </summary>
        public int comm_comple_date { get; set; }
 
        /// <summary>
        /// ָ�����ʱ��
        /// </summary>
        public int comm_comple_time { get; set; }
 
        /// <summary>
        /// ָ������������
        /// </summary>
        public int max_comm_comple_date { get; set; }
 
        /// <summary>
        /// ָ��������ʱ��
        /// </summary>
        public int max_comm_comple_time { get; set; }
 
        /// <summary>
        /// ָ����������
        /// </summary>
        public int comm_appr_date { get; set; }
 
        /// <summary>
        /// ָ������ʱ��
        /// </summary>
        public int comm_appr_time { get; set; }
 
        /// <summary>
        /// ָ���������״̬
        /// </summary>
        public String comm_sum_approve_status { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public ulong basket_id { get; set; }
 
        /// <summary>
        /// ���붩������
        /// </summary>
        public double buy_order_qty { get; set; }
 
        /// <summary>
        /// ������������
        /// </summary>
        public double sell_order_qty { get; set; }
 
        /// <summary>
        /// ����ָ������
        /// </summary>
        public double buy_comm_qty { get; set; }
 
        /// <summary>
        /// ����ָ������
        /// </summary>
        public double sell_comm_qty { get; set; }
 
        /// <summary>
        /// ����ɽ�����
        /// </summary>
        public double buy_strike_qty { get; set; }
 
        /// <summary>
        /// �����ɽ�����
        /// </summary>
        public double sell_strike_qty { get; set; }
 
        /// <summary>
        /// ����ɽ����
        /// </summary>
        public double buy_strike_amt { get; set; }
 
        /// <summary>
        /// �����ɽ����
        /// </summary>
        public double sell_strike_amt { get; set; }
 
        /// <summary>
        /// ����ָ����
        /// </summary>
        public double buy_comm_amt { get; set; }
 
        /// <summary>
        /// ����ָ����
        /// </summary>
        public double sell_comm_amt { get; set; }
 
        /// <summary>
        /// ָ�������ʽ
        /// </summary>
        public String comm_oper_way { get; set; }
 
        /// <summary>
        /// ����ָ���־
        /// </summary>
        public int exter_comm_flag { get; set; }
 
        /// <summary>
        /// ��Ч����
        /// </summary>
        public double valid_aver_price { get; set; }
 
        /// <summary>
        /// ȫ����Ч����
        /// </summary>
        public double valid_aver_price_allday { get; set; }
 
        /// <summary>
        /// ִ�м۲�
        /// </summary>
        public double exec_price_diff { get; set; }
 
        /// <summary>
        /// ȫ��ִ�м۲�
        /// </summary>
        public double exec_price_diff_allday { get; set; }
 
        /// <summary>
        /// ��Чռ��
        /// </summary>
        public double valid_ratio { get; set; }
 
        /// <summary>
        /// ȫ����Чռ��
        /// </summary>
        public double valid_ratio_allday { get; set; }
 
        /// <summary>
        /// ��Ч����
        /// </summary>
        public double valid_qty { get; set; }
 
        /// <summary>
        /// ȫ����Ч����
        /// </summary>
        public double valid_qty_allday { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
        /// <summary>
        /// ָ�ע��Ϣ
        /// </summary>
        public String comm_remark_info { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ά_��ѯ����ָ�����
   public class FunctdsecuL_10_64Model : BaseModel
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
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// �ʲ�����
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// ָ���´���
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// ָ��ִ����
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// ָ��ʱ��
        /// </summary>
        public int comm_time { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// ָ���
        /// </summary>
        public int comm_dir { get; set; }
 
        /// <summary>
        /// ָ���޼�
        /// </summary>
        public double comm_limit_price { get; set; }
 
        /// <summary>
        /// ָ��ʵ���޼�
        /// </summary>
        public double limit_actual_price { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public double comm_qty { get; set; }
 
        /// <summary>
        /// ָ����
        /// </summary>
        public double comm_amt { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// ָ�������
        /// </summary>
        public double comm_cancel_qty { get; set; }
 
        /// <summary>
        /// �ɽ����
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// ���۱�־
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// Ʊ����ֵ
        /// </summary>
        public double par_value { get; set; }
 
        /// <summary>
        /// ծȯ������Ϣ
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// �ɽ�״̬
        /// </summary>
        public String strike_status { get; set; }
 
        /// <summary>
        /// ָ�����״̬
        /// </summary>
        public String comm_sum_status { get; set; }
 
        /// <summary>
        /// ָ�ʼ����
        /// </summary>
        public int comm_begin_date { get; set; }
 
        /// <summary>
        /// ָ���������
        /// </summary>
        public int comm_end_date { get; set; }
 
        /// <summary>
        /// ָ�ʼʱ��
        /// </summary>
        public int comm_begin_time { get; set; }
 
        /// <summary>
        /// ָ�����ʱ��
        /// </summary>
        public int comm_end_time { get; set; }
 
        /// <summary>
        /// ָ���������
        /// </summary>
        public int comm_comple_date { get; set; }
 
        /// <summary>
        /// ָ�����ʱ��
        /// </summary>
        public int comm_comple_time { get; set; }
 
        /// <summary>
        /// ָ������������
        /// </summary>
        public int max_comm_comple_date { get; set; }
 
        /// <summary>
        /// ָ��������ʱ��
        /// </summary>
        public int max_comm_comple_time { get; set; }
 
        /// <summary>
        /// ָ����������
        /// </summary>
        public int comm_appr_date { get; set; }
 
        /// <summary>
        /// ָ������ʱ��
        /// </summary>
        public int comm_appr_time { get; set; }
 
        /// <summary>
        /// ָ���������״̬
        /// </summary>
        public String comm_sum_approve_status { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public ulong basket_id { get; set; }
 
        /// <summary>
        /// ���붩������
        /// </summary>
        public double buy_order_qty { get; set; }
 
        /// <summary>
        /// ������������
        /// </summary>
        public double sell_order_qty { get; set; }
 
        /// <summary>
        /// ����ָ������
        /// </summary>
        public double buy_comm_qty { get; set; }
 
        /// <summary>
        /// ����ָ������
        /// </summary>
        public double sell_comm_qty { get; set; }
 
        /// <summary>
        /// ����ɽ�����
        /// </summary>
        public double buy_strike_qty { get; set; }
 
        /// <summary>
        /// �����ɽ�����
        /// </summary>
        public double sell_strike_qty { get; set; }
 
        /// <summary>
        /// ����ɽ����
        /// </summary>
        public double buy_strike_amt { get; set; }
 
        /// <summary>
        /// �����ɽ����
        /// </summary>
        public double sell_strike_amt { get; set; }
 
        /// <summary>
        /// ����ָ����
        /// </summary>
        public double buy_comm_amt { get; set; }
 
        /// <summary>
        /// ����ָ����
        /// </summary>
        public double sell_comm_amt { get; set; }
 
        /// <summary>
        /// ָ�������ʽ
        /// </summary>
        public String comm_oper_way { get; set; }
 
        /// <summary>
        /// ����ָ���־
        /// </summary>
        public int exter_comm_flag { get; set; }
 
        /// <summary>
        /// ���ױ���
        /// </summary>
        public String exch_crncy_type { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
        /// <summary>
        /// ָ�ע��Ϣ
        /// </summary>
        public String comm_remark_info { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ά_��ѯ��ά�����ر�
   public class FunctdsecuL_10_65Model : BaseModel
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
        /// ��ʼ������
        /// </summary>
        public int init_date { get; set; }
 
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
        /// �ɶ�����
        /// </summary>
        public String stock_acco { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
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
        /// ��������
        /// </summary>
        public int order_date { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public ulong order_id { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// �����۸�
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// �۸�����
        /// </summary>
        public int price_type { get; set; }
 
        /// <summary>
        /// �����ر�״̬
        /// </summary>
        public String order_rsp_status { get; set; }
 
        /// <summary>
        /// �ر���Ϣ
        /// </summary>
        public String rsp_info { get; set; }
 
        /// <summary>
        /// ����״̬
        /// </summary>
        public String deal_status { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ά_��ѯ��ά�ɽ��ر�
   public class FunctdsecuL_10_66Model : BaseModel
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
        /// ��ʼ������
        /// </summary>
        public int init_date { get; set; }
 
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
        /// �ɶ�����
        /// </summary>
        public String stock_acco { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public int strike_date { get; set; }
 
        /// <summary>
        /// �ɽ�ʱ��
        /// </summary>
        public int strike_time { get; set; }
 
        /// <summary>
        /// �ɽ����
        /// </summary>
        public String strike_no { get; set; }
 
        /// <summary>
        /// �걨���
        /// </summary>
        public String report_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// �ɽ��۸�
        /// </summary>
        public double strike_price { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// �ɽ����
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// �ɽ�����ʽ
        /// </summary>
        public int strike_deal_type { get; set; }
 
        /// <summary>
        /// �ر���Ϣ
        /// </summary>
        public String rsp_info { get; set; }
 
        /// <summary>
        /// ����״̬
        /// </summary>
        public String deal_status { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
        /// <summary>
        /// �걨����
        /// </summary>
        public int report_date { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ά_��ѯ��ά�ɽ���ϸ
   public class FunctdsecuL_10_67Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
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
        /// �ⲿ�˺�
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// �ɶ�������
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// ָ�����
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public int strike_date { get; set; }
 
        /// <summary>
        /// �ɽ�ʱ��
        /// </summary>
        public int strike_time { get; set; }
 
        /// <summary>
        /// �ɽ����
        /// </summary>
        public String strike_no { get; set; }
 
        /// <summary>
        /// �걨����
        /// </summary>
        public int report_date { get; set; }
 
        /// <summary>
        /// �걨���
        /// </summary>
        public String report_no { get; set; }
 
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
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// �����۸�
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double order_qty { get; set; }
 
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
        /// ȫ������
        /// </summary>
        public double all_fee { get; set; }
 
        /// <summary>
        /// ӡ��˰
        /// </summary>
        public double stamp_tax { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double trans_fee { get; set; }
 
        /// <summary>
        /// ���ַ�
        /// </summary>
        public double brkage_fee { get; set; }
 
        /// <summary>
        /// ֤�ܷ�
        /// </summary>
        public double SEC_charges { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double other_fee { get; set; }
 
        /// <summary>
        /// ����Ӷ��
        /// </summary>
        public double trade_commis { get; set; }
 
        /// <summary>
        /// ����Ӷ��
        /// </summary>
        public double other_commis { get; set; }
 
        /// <summary>
        /// ծȯ������Ϣ
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// �ɽ�ծȯ������Ϣ
        /// </summary>
        public double strike_bond_accr_intrst { get; set; }
 
        /// <summary>
        /// ���۱�־
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// ����������ʽ
        /// </summary>
        public String order_oper_way { get; set; }
 
        /// <summary>
        /// ����ָ���־
        /// </summary>
        public int exter_comm_flag { get; set; }
 
        /// <summary>
        /// ��¼��Ч��־
        /// </summary>
        public int record_valid_flag { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ά_��ѯ������Ϣ
   public class FunctdsecuL_10_68Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public String offer_type { get; set; }
 
        /// <summary>
        /// ���̱�ʶ
        /// </summary>
        public String offer_name { get; set; }
 
        /// <summary>
        /// ���̷���������
        /// </summary>
        public String offer_server_name { get; set; }
 
        /// <summary>
        /// ���̷�����IP
        /// </summary>
        public String offer_server_ip { get; set; }
 
        /// <summary>
        /// ���̷������˿�
        /// </summary>
        public int offer_server_port { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ά_��ѯ��ά������ˮ
   public class FunctdsecuL_10_69Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
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
        /// �ⲿ�˺�
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// ���ױ���
        /// </summary>
        public String exch_crncy_type { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// �ɶ�������
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// �ɶ�����
        /// </summary>
        public String stock_acco { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// �ⲿ���
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int wtdraw_batch_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int wtdraw_date { get; set; }
 
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int wtdraw_time { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_date { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public ulong order_id { get; set; }
 
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
        /// ����״̬
        /// </summary>
        public String wtdraw_status { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double wtdraw_qty { get; set; }
 
        /// <summary>
        /// ����˵��
        /// </summary>
        public String wtdraw_remark { get; set; }
 
        /// <summary>
        /// �����۸�
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ά_��ѯ�������ɽ��ر���
   public class FunctdsecuL_10_71Model : BaseModel
   {
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
        /// �ɶ�����
        /// </summary>
        public String stock_acco { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// �걨����
        /// </summary>
        public int report_date { get; set; }
 
        /// <summary>
        /// �걨���
        /// </summary>
        public String report_no { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public int strike_date { get; set; }
 
        /// <summary>
        /// �ɽ�ʱ��
        /// </summary>
        public int strike_time { get; set; }
 
        /// <summary>
        /// �ɽ����
        /// </summary>
        public String strike_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// �ɽ��۸�
        /// </summary>
        public double strike_price { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// �ɽ����
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// �ɽ�����ʽ
        /// </summary>
        public int strike_deal_type { get; set; }
 
        /// <summary>
        /// �ر���Ϣ
        /// </summary>
        public String rsp_info { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ά_��ѯ���н�����ֲ�
   public class FunctdsecuL_10_73Model : BaseModel
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
        /// ��������
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// �ɶ�������
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// �ڳ�����
        /// </summary>
        public double begin_qty { get; set; }
 
        /// <summary>
        /// ��ǰ����
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double frozen_qty { get; set; }
 
        /// <summary>
        /// �ⶳ����
        /// </summary>
        public double unfroz_qty { get; set; }
 
        /// <summary>
        /// ָ�������
        /// </summary>
        public double comm_frozen_qty { get; set; }
 
        /// <summary>
        /// ָ��ⶳ����
        /// </summary>
        public double comm_unfroz_qty { get; set; }
 
        /// <summary>
        /// ָ��ռ������
        /// </summary>
        public double comm_capt_qty { get; set; }
 
        /// <summary>
        /// ָ���ͷ�����
        /// </summary>
        public double comm_releas_qty { get; set; }
 
        /// <summary>
        /// ���׶�������
        /// </summary>
        public double trade_frozen_qty { get; set; }
 
        /// <summary>
        /// ���׽ⶳ����
        /// </summary>
        public double trade_unfroz_qty { get; set; }
 
        /// <summary>
        /// ����ռ������
        /// </summary>
        public double trade_capt_qty { get; set; }
 
        /// <summary>
        /// �����ͷ�����
        /// </summary>
        public double trade_releas_qty { get; set; }
 
        /// <summary>
        /// �ɽ�ռ������
        /// </summary>
        public double strike_capt_qty { get; set; }
 
        /// <summary>
        /// �ɽ��ͷ�����
        /// </summary>
        public double strike_releas_qty { get; set; }
 
        /// <summary>
        /// �ɽ���������
        /// </summary>
        public double strike_frozen_qty { get; set; }
 
        /// <summary>
        /// �ɽ��ⶳ����
        /// </summary>
        public double strike_unfroz_qty { get; set; }
 
        /// <summary>
        /// �ɱ����
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// ��Ϣ�ɱ����
        /// </summary>
        public double intrst_cost_amt { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
        /// <summary>
        /// ʵ��ӯ��
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// ��Ϣ����
        /// </summary>
        public double intrst_pandl { get; set; }
 
   }
 
}

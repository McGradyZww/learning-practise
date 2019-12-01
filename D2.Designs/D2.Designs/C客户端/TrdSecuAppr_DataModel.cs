using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //�߼�_����֤ȯ_ָ��_����ָ��
   public class FunctdsecuL_3_1Model : BaseModel
   {
        /// <summary>
        /// ָ�����
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_batch_no { get; set; }
 
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
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// ָ���
        /// </summary>
        public int comm_dir { get; set; }
 
        /// <summary>
        /// ָ���޼�
        /// </summary>
        public double comm_limit_price { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public double comm_qty { get; set; }
 
        /// <summary>
        /// ָ����
        /// </summary>
        public double comm_amt { get; set; }
 
        /// <summary>
        /// ָ��״̬
        /// </summary>
        public String comm_status { get; set; }
 
        /// <summary>
        /// ָ������״̬
        /// </summary>
        public String comm_appr_status { get; set; }
 
   }
 
   //�߼�_����֤ȯ_ָ��_����ָ��
   public class FunctdsecuL_3_4Model : BaseModel
   {
        /// <summary>
        /// ָ��״̬
        /// </summary>
        public String comm_status { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public ulong order_id { get; set; }
 
   }
 
   //�߼�_����֤ȯ_ָ��_�ַ�ָ��
   public class FunctdsecuL_3_5Model : BaseModel
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
        /// �ɶ�������
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// ָ���´���
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// ָ���
        /// </summary>
        public int comm_dir { get; set; }
 
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
        /// ָ��״̬
        /// </summary>
        public String comm_status { get; set; }
 
        /// <summary>
        /// �ɽ�״̬
        /// </summary>
        public String strike_status { get; set; }
 
   }
 
   //�߼�_����֤ȯ_ָ��_������������ָ��
   public class FunctdsecuL_3_6Model : BaseModel
   {
        /// <summary>
        /// ָ����Ŵ�
        /// </summary>
        public String comm_id_str { get; set; }
 
        /// <summary>
        /// ָ������״̬��
        /// </summary>
        public String comm_appr_status_str { get; set; }
 
   }
 
   //�߼�_����֤ȯ_ָ��_��������ָ��
   public class FunctdsecuL_3_8Model : BaseModel
   {
        /// <summary>
        /// ָ����Ŵ�
        /// </summary>
        public String comm_id_str { get; set; }
 
        /// <summary>
        /// ָ������״̬��
        /// </summary>
        public String comm_appr_status_str { get; set; }
 
   }
 
   //�߼�_����֤ȯ_ָ��_�������ָ��
   public class FunctdsecuL_3_9Model : BaseModel
   {
        /// <summary>
        /// ����Ա���
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// ����վ��
        /// </summary>
        public String oper_statn { get; set; }
 
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
        /// ��������
        /// </summary>
        public int order_date { get; set; }
 
        /// <summary>
        /// ������Ŵ�
        /// </summary>
        public String order_id_str { get; set; }
 
        /// <summary>
        /// ����״̬��
        /// </summary>
        public String order_status_str { get; set; }
 
        /// <summary>
        /// �Ϲ津�����
        /// </summary>
        public ulong compli_trig_id { get; set; }
 
   }
 
   //�߼�_����֤ȯ_ָ��_��ѯָ��
   public class FunctdsecuL_3_51Model : BaseModel
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
        /// ���ױ���
        /// </summary>
        public String exch_crncy_type { get; set; }
 
        /// <summary>
        /// ����ռ������
        /// </summary>
        public double strategy_capt_qty { get; set; }
 
        /// <summary>
        /// ���Զ�������
        /// </summary>
        public double strategy_order_qty { get; set; }
 
        /// <summary>
        /// ��ϴ���
        /// </summary>
        public String combo_code { get; set; }
 
        /// <summary>
        /// ��ͬ���
        /// </summary>
        public String contra_no { get; set; }
 
        /// <summary>
        /// �ַ�����Ա
        /// </summary>
        public int disp_opor { get; set; }
 
        /// <summary>
        /// �ַ�״̬
        /// </summary>
        public int disp_status { get; set; }
 
        /// <summary>
        /// �Ѷ����
        /// </summary>
        public int read_flag { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
        /// <summary>
        /// ָ�ע��Ϣ
        /// </summary>
        public String comm_remark_info { get; set; }
 
   }
 
   //�߼�_����֤ȯ_ָ��_��ѯָ����ʷ
   public class FunctdsecuL_3_52Model : BaseModel
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
        /// ����ռ������
        /// </summary>
        public double strategy_capt_qty { get; set; }
 
        /// <summary>
        /// ���Զ�������
        /// </summary>
        public double strategy_order_qty { get; set; }
 
        /// <summary>
        /// ��ͬ���
        /// </summary>
        public String contra_no { get; set; }
 
        /// <summary>
        /// �ַ�����Ա
        /// </summary>
        public int disp_opor { get; set; }
 
        /// <summary>
        /// �ַ�״̬
        /// </summary>
        public int disp_status { get; set; }
 
        /// <summary>
        /// �Ѷ����
        /// </summary>
        public int read_flag { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
        /// <summary>
        /// ָ�ע��Ϣ
        /// </summary>
        public String comm_remark_info { get; set; }
 
   }
 
   //�߼�_����֤ȯ_ָ��_��ѯָ��ַ�
   public class FunctdsecuL_3_53Model : BaseModel
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
        /// ָ������
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// ָ�����
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// ָ���
        /// </summary>
        public int comm_dir { get; set; }
 
        /// <summary>
        /// ָ��״̬
        /// </summary>
        public String comm_status { get; set; }
 
        /// <summary>
        /// ָ���´���
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// �ַ�����
        /// </summary>
        public int disp_date { get; set; }
 
        /// <summary>
        /// �ַ�ʱ��
        /// </summary>
        public int disp_time { get; set; }
 
        /// <summary>
        /// ǰָ��ִ����
        /// </summary>
        public int before_comm_executor { get; set; }
 
        /// <summary>
        /// ָ��ִ����
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// �Ƿ񳷵�
        /// </summary>
        public int is_withdraw { get; set; }
 
        /// <summary>
        /// �ַ���ʽ
        /// </summary>
        public int disp_flag { get; set; }
 
        /// <summary>
        /// �ַ�˵��
        /// </summary>
        public String disp_remark { get; set; }
 
        /// <summary>
        /// ����ָ���־
        /// </summary>
        public int exter_comm_flag { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //�߼�_����֤ȯ_ָ��_��ѯָ��ַ���ʷ
   public class FunctdsecuL_3_54Model : BaseModel
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
        /// ָ������
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// ָ�����
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// ָ���
        /// </summary>
        public int comm_dir { get; set; }
 
        /// <summary>
        /// ָ��״̬
        /// </summary>
        public String comm_status { get; set; }
 
        /// <summary>
        /// ָ���´���
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// �ַ�����
        /// </summary>
        public int disp_date { get; set; }
 
        /// <summary>
        /// �ַ�ʱ��
        /// </summary>
        public int disp_time { get; set; }
 
        /// <summary>
        /// ǰָ��ִ����
        /// </summary>
        public int before_comm_executor { get; set; }
 
        /// <summary>
        /// ָ��ִ����
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// �Ƿ񳷵�
        /// </summary>
        public int is_withdraw { get; set; }
 
        /// <summary>
        /// �ַ���ʽ
        /// </summary>
        public int disp_flag { get; set; }
 
        /// <summary>
        /// �ַ�˵��
        /// </summary>
        public String disp_remark { get; set; }
 
        /// <summary>
        /// ����ָ���־
        /// </summary>
        public int exter_comm_flag { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //�߼�_����֤ȯ_ָ��_��ѯָ������
   public class FunctdsecuL_3_55Model : BaseModel
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
        /// ָ����������
        /// </summary>
        public int comm_appr_date { get; set; }
 
        /// <summary>
        /// ָ������ʱ��
        /// </summary>
        public int comm_appr_time { get; set; }
 
        /// <summary>
        /// ָ����������Ա���
        /// </summary>
        public int comm_appr_oper_no { get; set; }
 
        /// <summary>
        /// ָ����������Ա
        /// </summary>
        public int comm_appr_oper { get; set; }
 
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
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// �ʲ�����
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// ָ�����
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// ָ���´���
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// ָ���
        /// </summary>
        public int comm_dir { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public double comm_qty { get; set; }
 
        /// <summary>
        /// ָ���޼�
        /// </summary>
        public double comm_limit_price { get; set; }
 
        /// <summary>
        /// ָ��ʵ���޼�
        /// </summary>
        public double limit_actual_price { get; set; }
 
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
        /// ָ������״̬
        /// </summary>
        public String comm_appr_status { get; set; }
 
        /// <summary>
        /// ָ������˵��
        /// </summary>
        public String comm_appr_remark { get; set; }
 
        /// <summary>
        /// ����ָ���־
        /// </summary>
        public int exter_comm_flag { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //�߼�_����֤ȯ_ָ��_��ѯָ��������ʷ
   public class FunctdsecuL_3_56Model : BaseModel
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
        /// ָ����������
        /// </summary>
        public int comm_appr_date { get; set; }
 
        /// <summary>
        /// ָ������ʱ��
        /// </summary>
        public int comm_appr_time { get; set; }
 
        /// <summary>
        /// ָ����������Ա���
        /// </summary>
        public int comm_appr_oper_no { get; set; }
 
        /// <summary>
        /// ָ����������Ա
        /// </summary>
        public int comm_appr_oper { get; set; }
 
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
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// �ʲ�����
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// ָ�����
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// ָ���´���
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// ָ���
        /// </summary>
        public int comm_dir { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public double comm_qty { get; set; }
 
        /// <summary>
        /// ָ���޼�
        /// </summary>
        public double comm_limit_price { get; set; }
 
        /// <summary>
        /// ָ��ʵ���޼�
        /// </summary>
        public double limit_actual_price { get; set; }
 
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
        /// ָ������״̬
        /// </summary>
        public String comm_appr_status { get; set; }
 
        /// <summary>
        /// ָ������˵��
        /// </summary>
        public String comm_appr_remark { get; set; }
 
        /// <summary>
        /// ����ָ���־
        /// </summary>
        public int exter_comm_flag { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //�߼�_����֤ȯ_ָ��_��ѯ����ָ��
   public class FunctdsecuL_3_57Model : BaseModel
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
 
        /// <summary>
        /// �Ѷ����
        /// </summary>
        public int read_flag { get; set; }
 
        /// <summary>
        /// �˻�ƴ����Ϣ
        /// </summary>
        public String acco_concat_info { get; set; }
 
   }
 
   //�߼�_����֤ȯ_ָ��_��ѯ����ָ����ʷ
   public class FunctdsecuL_3_58Model : BaseModel
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
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
        /// <summary>
        /// ָ�ע��Ϣ
        /// </summary>
        public String comm_remark_info { get; set; }
 
        /// <summary>
        /// �Ѷ����
        /// </summary>
        public int read_flag { get; set; }
 
        /// <summary>
        /// �˻�ƴ����Ϣ
        /// </summary>
        public String acco_concat_info { get; set; }
 
   }
 
   //�߼�_����֤ȯ_ָ��_����ת��ָ��
   public class FunctdsecuL_3_64Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ָ�����
        /// </summary>
        public ulong comm_id { get; set; }
 
   }
 
   //�߼�_����֤ȯ_ָ��_��ѯת������ָ��
   public class FunctdsecuL_3_65Model : BaseModel
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
        /// ���ױ���
        /// </summary>
        public String exch_crncy_type { get; set; }
 
        /// <summary>
        /// ָ��ת������״̬
        /// </summary>
        public String comm_dispense_appr_status { get; set; }
 
        /// <summary>
        /// ָ��ת����������Ա
        /// </summary>
        public int comm_dispense_appr_opor { get; set; }
 
        /// <summary>
        /// ָ��ת����������
        /// </summary>
        public int comm_dispense_appr_date { get; set; }
 
        /// <summary>
        /// ָ��ת������ʱ��
        /// </summary>
        public int comm_dispense_appr_time { get; set; }
 
        /// <summary>
        /// ָ��ת������˵��
        /// </summary>
        public String comm_dispense_appr_remark { get; set; }
 
        /// <summary>
        /// �ַ�˵��
        /// </summary>
        public String disp_remark { get; set; }
 
        /// <summary>
        /// ǰָ��ִ����
        /// </summary>
        public int before_comm_executor { get; set; }
 
        /// <summary>
        /// �Ƿ񳷵�
        /// </summary>
        public int is_withdraw { get; set; }
 
   }
 
   //�߼�_����֤ȯ_ָ��_������ȯ����ָ��
   public class FunctdsecuL_3_66Model : BaseModel
   {
        /// <summary>
        /// ָ�����
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_batch_no { get; set; }
 
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
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// ָ���
        /// </summary>
        public int comm_dir { get; set; }
 
        /// <summary>
        /// ָ���޼�
        /// </summary>
        public double comm_limit_price { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public double comm_qty { get; set; }
 
        /// <summary>
        /// ָ����
        /// </summary>
        public double comm_amt { get; set; }
 
        /// <summary>
        /// ָ��״̬
        /// </summary>
        public String comm_status { get; set; }
 
        /// <summary>
        /// ָ������״̬
        /// </summary>
        public String comm_appr_status { get; set; }
 
   }
 
   //�߼�_����֤ȯ_ָ��_������ȯ����ָ��
   public class FunctdsecuL_3_68Model : BaseModel
   {
        /// <summary>
        /// ָ��״̬
        /// </summary>
        public String comm_status { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public ulong order_id { get; set; }
 
   }
 
   //�߼�_����֤ȯ_ָ��_�·ַ�ָ��
   public class FunctdsecuL_3_69Model : BaseModel
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
        /// �ɶ�������
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// ָ���´���
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// ָ���
        /// </summary>
        public int comm_dir { get; set; }
 
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
        /// ָ��״̬
        /// </summary>
        public String comm_status { get; set; }
 
        /// <summary>
        /// �ɽ�״̬
        /// </summary>
        public String strike_status { get; set; }
 
   }
 
   //�߼�_����֤ȯ_ָ��_������ϲ���ָ��
   public class FunctdsecuL_3_70Model : BaseModel
   {
        /// <summary>
        /// ָ�����
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_batch_no { get; set; }
 
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
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// ָ���
        /// </summary>
        public int comm_dir { get; set; }
 
        /// <summary>
        /// ָ���޼�
        /// </summary>
        public double comm_limit_price { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public double comm_qty { get; set; }
 
        /// <summary>
        /// ָ����
        /// </summary>
        public double comm_amt { get; set; }
 
        /// <summary>
        /// ָ��״̬
        /// </summary>
        public String comm_status { get; set; }
 
        /// <summary>
        /// ָ������״̬
        /// </summary>
        public String comm_appr_status { get; set; }
 
   }
 
}

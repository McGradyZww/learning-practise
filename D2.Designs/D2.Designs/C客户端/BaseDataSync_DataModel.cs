using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //�߼�_����_��������ͬ��_��ѯ�¹���Ϣ��
   public class FuncpubL_28_101Model : BaseModel
   {
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// ���״���
        /// </summary>
        public String trade_code { get; set; }
 
        /// <summary>
        /// ��Ĵ���
        /// </summary>
        public String target_code { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// ���״�����
        /// </summary>
        public int trade_code_no { get; set; }
 
        /// <summary>
        /// ��Ĵ�����
        /// </summary>
        public int target_code_no { get; set; }
 
        /// <summary>
        /// �깺����
        /// </summary>
        public int apply_date { get; set; }
 
        /// <summary>
        /// �깺����
        /// </summary>
        public double apply_limit { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int begin_trade_date { get; set; }
 
        /// <summary>
        /// ���м�
        /// </summary>
        public double issue_price { get; set; }
 
   }
 
   //�߼�_����_��������ͬ��_��ѯ֤ȯ������Ϣ��
   public class FuncpubL_28_111Model : BaseModel
   {
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// ƴ�����
        /// </summary>
        public String pinyin_short { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// �ʲ�����
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// Ʊ����ֵ
        /// </summary>
        public double par_value { get; set; }
 
        /// <summary>
        /// ���ұ���
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// ���ױ���
        /// </summary>
        public String exch_crncy_type { get; set; }
 
        /// <summary>
        /// �ܹɱ�
        /// </summary>
        public double total_stock_issue { get; set; }
 
        /// <summary>
        /// ��ͨ�ɱ�
        /// </summary>
        public double circl_stock_capit { get; set; }
 
        /// <summary>
        /// �ʽ��ת����
        /// </summary>
        public int capit_reback_days { get; set; }
 
        /// <summary>
        /// �ֲֻ�ת����
        /// </summary>
        public int posi_reback_days { get; set; }
 
        /// <summary>
        /// ���͵�λ
        /// </summary>
        public int type_unit { get; set; }
 
        /// <summary>
        /// �걨��λ
        /// </summary>
        public int report_unit { get; set; }
 
        /// <summary>
        /// ��С��λ
        /// </summary>
        public int min_unit { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public double max_qty { get; set; }
 
        /// <summary>
        /// ��С����
        /// </summary>
        public double min_qty { get; set; }
 
        /// <summary>
        /// ���ֶ��������־
        /// </summary>
        public int is_order_dir_flag { get; set; }
 
        /// <summary>
        /// �۸�����
        /// </summary>
        public double price_up { get; set; }
 
        /// <summary>
        /// �۸�����
        /// </summary>
        public double price_down { get; set; }
 
        /// <summary>
        /// ��С�۲�
        /// </summary>
        public double step_price { get; set; }
 
        /// <summary>
        /// ���ʼ۸�
        /// </summary>
        public double fair_price { get; set; }
 
        /// <summary>
        /// ͣ�Ʊ�־
        /// </summary>
        public String stop_status { get; set; }
 
        /// <summary>
        /// �۹�ͨ���
        /// </summary>
        public int hk_stock_flag { get; set; }
 
        /// <summary>
        /// ʱ���
        /// </summary>
        public int time_stamp { get; set; }
 
   }
 
   //�߼�_����_��������ͬ��_��ѯծȯ������Ϣ��
   public class FuncpubL_28_121Model : BaseModel
   {
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// ���״���
        /// </summary>
        public String trade_code { get; set; }
 
        /// <summary>
        /// ��Ĵ���
        /// </summary>
        public String target_code { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// ���״�����
        /// </summary>
        public int trade_code_no { get; set; }
 
        /// <summary>
        /// ��Ĵ�����
        /// </summary>
        public int target_code_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int issue_date { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int end_date { get; set; }
 
        /// <summary>
        /// ��Ϣ����
        /// </summary>
        public int value_date { get; set; }
 
        /// <summary>
        /// ��һ��Ϣ����
        /// </summary>
        public int next_value_date { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int begin_trade_date { get; set; }
 
        /// <summary>
        /// ծȯ����
        /// </summary>
        public double bond_limit { get; set; }
 
        /// <summary>
        /// ���м�
        /// </summary>
        public double issue_price { get; set; }
 
        /// <summary>
        /// Ʊ����ֵ
        /// </summary>
        public double par_value { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double intrst_ratio { get; set; }
 
        /// <summary>
        /// ��Ϣ����
        /// </summary>
        public int intrst_days { get; set; }
 
        /// <summary>
        /// ��Ϣ���
        /// </summary>
        public int pay_inteval { get; set; }
 
        /// <summary>
        /// ծȯ������Ϣ
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// ծȯ��������
        /// </summary>
        public int bond_rate_type { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int inteval_days { get; set; }
 
        /// <summary>
        /// ���۱�־
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int last_trade_date { get; set; }
 
        /// <summary>
        /// Ȩ������
        /// </summary>
        public int rights_type { get; set; }
 
        /// <summary>
        /// ת�ɿ�ʼ����
        /// </summary>
        public int trans_begin_date { get; set; }
 
        /// <summary>
        /// ת�ɽ�������
        /// </summary>
        public int trans_end_date { get; set; }
 
        /// <summary>
        /// ��Ȩ��ʼ����
        /// </summary>
        public int exec_begin_date { get; set; }
 
        /// <summary>
        /// ��Ȩ��������
        /// </summary>
        public int exec_end_date { get; set; }
 
        /// <summary>
        /// ��Ѻ����
        /// </summary>
        public double impawn_ratio { get; set; }
 
        /// <summary>
        /// ��Ϣ��־
        /// </summary>
        public int pay_intrst_flag { get; set; }
 
        /// <summary>
        /// ʱ���
        /// </summary>
        public int time_stamp { get; set; }
 
   }
 
   //�߼�_����_��������ͬ��_��ѯ֤ȯ�����
   public class FuncpubL_28_131Model : BaseModel
   {
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// ��ͣ��
        /// </summary>
        public double up_limit_price { get; set; }
 
        /// <summary>
        /// ��ͣ��
        /// </summary>
        public double down_limit_price { get; set; }
 
        /// <summary>
        /// ���¼�
        /// </summary>
        public double last_price { get; set; }
 
        /// <summary>
        /// �����̼�
        /// </summary>
        public double pre_close_price { get; set; }
 
        /// <summary>
        /// ���̼�
        /// </summary>
        public double today_open_price { get; set; }
 
        /// <summary>
        /// �����̼�
        /// </summary>
        public double today_close_price { get; set; }
 
        /// <summary>
        /// ����߼�
        /// </summary>
        public double today_max_price { get; set; }
 
        /// <summary>
        /// ����ͼ�
        /// </summary>
        public double today_min_price { get; set; }
 
        /// <summary>
        /// ��һ��
        /// </summary>
        public double buy_price_1 { get; set; }
 
        /// <summary>
        /// ��һ��
        /// </summary>
        public double buy_qty_1 { get; set; }
 
        /// <summary>
        /// �����
        /// </summary>
        public double buy_price_2 { get; set; }
 
        /// <summary>
        /// �����
        /// </summary>
        public double buy_qty_2 { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double buy_price_3 { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double buy_qty_3 { get; set; }
 
        /// <summary>
        /// ���ļ�
        /// </summary>
        public double buy_price_4 { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double buy_qty_4 { get; set; }
 
        /// <summary>
        /// �����
        /// </summary>
        public double buy_price_5 { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double buy_qty_5 { get; set; }
 
        /// <summary>
        /// ��һ��
        /// </summary>
        public double sell_price_1 { get; set; }
 
        /// <summary>
        /// ��һ��
        /// </summary>
        public double sell_qty_1 { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double sell_price_2 { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double sell_qty_2 { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double sell_price_3 { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double sell_qty_3 { get; set; }
 
        /// <summary>
        /// ���ļ�
        /// </summary>
        public double sell_price_4 { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double sell_qty_4 { get; set; }
 
        /// <summary>
        /// �����
        /// </summary>
        public double sell_price_5 { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double sell_qty_5 { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// �ɽ����
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// ��ӯ��
        /// </summary>
        public double pe_ratio { get; set; }
 
        /// <summary>
        /// ʱ���
        /// </summary>
        public int time_stamp { get; set; }
 
   }
 
   //�߼�_����_��������ͬ��_��ѯ����ӳ���
   public class FuncpubL_28_141Model : BaseModel
   {
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ���״���
        /// </summary>
        public String trade_code { get; set; }
 
        /// <summary>
        /// ��Ĵ���
        /// </summary>
        public String target_code { get; set; }
 
        /// <summary>
        /// ʱ���
        /// </summary>
        public int time_stamp { get; set; }
 
   }
 
   //�߼�_����_��������ͬ��_��ѯ֤ȯ���붩�������
   public class FuncpubL_28_151Model : BaseModel
   {
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// �ʽ𶳽᷽ʽ
        /// </summary>
        public int cash_frozen_type { get; set; }
 
        /// <summary>
        /// ����������ֱ�־
        /// </summary>
        public int order_split_flag { get; set; }
 
        /// <summary>
        /// ��С��λ
        /// </summary>
        public int min_unit { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public double max_qty { get; set; }
 
        /// <summary>
        /// ��С����
        /// </summary>
        public double min_qty { get; set; }
 
        /// <summary>
        /// ʱ���
        /// </summary>
        public int time_stamp { get; set; }
 
   }
 
   //�߼�_����_��������ͬ��_��ѯ�۹�ͨ���ʱ�
   public class FuncpubL_28_161Model : BaseModel
   {
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ��ұ���
        /// </summary>
        public String for_crncy_type { get; set; }
 
        /// <summary>
        /// ���ұ���
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// ����ο�����
        /// </summary>
        public double buy_ref_rate { get; set; }
 
        /// <summary>
        /// �����ο�����
        /// </summary>
        public double sell_ref_rate { get; set; }
 
        /// <summary>
        /// ����������
        /// </summary>
        public double settle_buy_rate { get; set; }
 
        /// <summary>
        /// �����������
        /// </summary>
        public double settle_sell_rate { get; set; }
 
        /// <summary>
        /// �й����л���
        /// </summary>
        public double pboc_rate { get; set; }
 
   }
 
   //�߼�_����_��������ͬ��_��ѯ�Զ�ͬ�����ñ�
   public class FuncpubL_28_201Model : BaseModel
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
        /// ��ά���Զ�ͬ������
        /// </summary>
        public int auto_sync_type { get; set; }
 
        /// <summary>
        /// �ʽ���������Χ
        /// </summary>
        public int capital_batch_deal_range { get; set; }
 
        /// <summary>
        /// �ֲ���������Χ
        /// </summary>
        public int posi_batch_deal_range { get; set; }
 
        /// <summary>
        /// ��ʼʱ��
        /// </summary>
        public int begin_time { get; set; }
 
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int end_time { get; set; }
 
        /// <summary>
        /// �Ƿ���������
        /// </summary>
        public int is_batch_deal { get; set; }
 
        /// <summary>
        /// �Զ�ͬ�������־
        /// </summary>
        public int auto_sync_deal_flag { get; set; }
 
        /// <summary>
        /// �����Զ�ͬ���Ƿ��ڲ��˶�
        /// </summary>
        public int is_inner_check { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //�߼�_����_��������ͬ��_��ѯ�Զ�ͬ����־��
   public class FuncpubL_28_106Model : BaseModel
   {
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ����������
        /// </summary>
        public String process_type_name { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public String process_name { get; set; }
 
        /// <summary>
        /// �¼���Ϣ����
        /// </summary>
        public String event_msg_content { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //�߼�_����_�����ѯ_��ѯ������Ʒ������
   public class FuncrptL_3_1Model : BaseModel
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
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int found_date { get; set; }
 
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int runtime { get; set; }
 
        /// <summary>
        /// ��λ��ֵ
        /// </summary>
        public double unit_nav { get; set; }
 
        /// <summary>
        /// ����������
        /// </summary>
        public double daily_pandl_ratio { get; set; }
 
        /// <summary>
        /// �����껯������
        /// </summary>
        public double daily_pandl_ratio_year { get; set; }
 
        /// <summary>
        /// �ۼƵ�λ��ֵ
        /// </summary>
        public double total_unit_nav { get; set; }
 
        /// <summary>
        /// �ۼ�������
        /// </summary>
        public double total_realiz_pandl_ratio { get; set; }
 
        /// <summary>
        /// �ۼ��껯������
        /// </summary>
        public double total_realize_pandl_ratio_year { get; set; }
 
        /// <summary>
        /// �����껯����
        /// </summary>
        public double excess_earning_year { get; set; }
 
        /// <summary>
        /// ÿ�ջس�
        /// </summary>
        public double day_retracement { get; set; }
 
        /// <summary>
        /// �����س�����
        /// </summary>
        public double day_continue_retracement { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ���������ʷ���
   public class FuncrptL_3_2Model : BaseModel
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
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// ��λ��ֵ
        /// </summary>
        public double unit_nav { get; set; }
 
        /// <summary>
        /// ����������
        /// </summary>
        public double daily_pandl_ratio { get; set; }
 
        /// <summary>
        /// �ۼ��껯������
        /// </summary>
        public double total_realize_pandl_ratio_year { get; set; }
 
        /// <summary>
        /// ���ձ���
        /// </summary>
        public double sharpe_ration { get; set; }
 
        /// <summary>
        /// ���س�
        /// </summary>
        public double max_retracement { get; set; }
 
        /// <summary>
        /// ��ǰ������ֵ
        /// </summary>
        public double market_value_sh { get; set; }
 
        /// <summary>
        /// ƽ��������ֵ
        /// </summary>
        public double market_value_avg_sh { get; set; }
 
        /// <summary>
        /// ����������ǧ����ʣ����
        /// </summary>
        public int sh_remainday_two { get; set; }
 
        /// <summary>
        /// ����������ǧ����ʣ����
        /// </summary>
        public int sh_remainday_three { get; set; }
 
        /// <summary>
        /// ����������ǧ����ʣ����
        /// </summary>
        public int sh_remainday_five { get; set; }
 
        /// <summary>
        /// ��ǰ������ֵ
        /// </summary>
        public double market_value_sz { get; set; }
 
        /// <summary>
        /// ƽ��������ֵ
        /// </summary>
        public double market_value_avg_sz { get; set; }
 
        /// <summary>
        /// ����������ǧ����ʣ����
        /// </summary>
        public int sz_remainday_two { get; set; }
 
        /// <summary>
        /// ����������ǧ����ʣ����
        /// </summary>
        public int sz_remainday_three { get; set; }
 
        /// <summary>
        /// ����������ǧ����ʣ����
        /// </summary>
        public int sz_remainday_five { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ�����Ʒ�ʲ���¼
   public class FuncrptL_3_3Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int mach_date { get; set; }
 
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// ���ұ���
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// ��Ʒ��ǰ�ݶ�
        /// </summary>
        public double pd_curr_share { get; set; }
 
        /// <summary>
        /// ��λ��ֵ
        /// </summary>
        public double unit_nav { get; set; }
 
        /// <summary>
        /// ���ʲ�
        /// </summary>
        public double nav_asset { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ�����Ʒ��ֵ�ر���
   public class FuncrptL_3_4Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ��ѯ������
        /// </summary>
        public int region_no { get; set; }
 
        /// <summary>
        /// ��ѯ��������
        /// </summary>
        public String region_name { get; set; }
 
        /// <summary>
        /// �ر���
        /// </summary>
        public double product_return_rate { get; set; }
 
        /// <summary>
        /// ����Ƿ�
        /// </summary>
        public double max_product_increase { get; set; }
 
        /// <summary>
        /// ��Իر�
        /// </summary>
        public double cmp_product_return_rate { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ�����Ʒ�ʲ���ϸ����ͳ����ʷ��¼
   public class FuncrptL_3_6Model : BaseModel
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
        /// ��Ʒ�ʲ�����
        /// </summary>
        public int pd_asset_type { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// ���ұ���
        /// </summary>
        public String crncy_type { get; set; }
 
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
        /// ���¼�
        /// </summary>
        public double last_price { get; set; }
 
        /// <summary>
        /// ��ǰ����
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// �ɱ����
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// ͣ�Ʊ�־
        /// </summary>
        public String stop_status { get; set; }
 
        /// <summary>
        /// ��ͨ��־
        /// </summary>
        public int circl_flag { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double today_pandl { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ�ܾ�ֵ�۱䱨��
   public class FuncrptL_3_7Model : BaseModel
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
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// ���ұ���
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// ���ʲ�
        /// </summary>
        public double total_asset { get; set; }
 
        /// <summary>
        /// ��Ʊ��ֵ
        /// </summary>
        public double stock_market_value { get; set; }
 
        /// <summary>
        /// ��Ʒ�ݶ�
        /// </summary>
        public double pd_share { get; set; }
 
        /// <summary>
        /// ��λ��ֵ
        /// </summary>
        public double unit_nav { get; set; }
 
        /// <summary>
        /// �ܾ�ֵ�۱�
        /// </summary>
        public double week_nav_change { get; set; }
 
        /// <summary>
        /// �վ�ֵ�۱�
        /// </summary>
        public double day_nav_change { get; set; }
 
        /// <summary>
        /// �ֽ��ʲ�
        /// </summary>
        public double cash_asset { get; set; }
 
        /// <summary>
        /// �ֽ���ռ��ֵ��
        /// </summary>
        public double cash_nav_ratio { get; set; }
 
        /// <summary>
        /// ��Ʊ�ʲ�ռ��
        /// </summary>
        public double stock_asset_ratio { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ��Ʒ������Ϣ
   public class FuncrptL_3_8Model : BaseModel
   {
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// ��λ��ֵ
        /// </summary>
        public double unit_nav { get; set; }
 
        /// <summary>
        /// ����������
        /// </summary>
        public double daily_pandl_ratio { get; set; }
 
        /// <summary>
        /// �����껯������
        /// </summary>
        public double daily_pandl_ratio_year { get; set; }
 
        /// <summary>
        /// ��ֵ����
        /// </summary>
        public double nav_fluct { get; set; }
 
        /// <summary>
        /// ���س�
        /// </summary>
        public double max_retracement { get; set; }
 
        /// <summary>
        /// ��ǰ�ݶ�
        /// </summary>
        public double curr_share { get; set; }
 
        /// <summary>
        /// ���ʲ�
        /// </summary>
        public double total_asset { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ��Ͷ����
   public class FuncrptL_3_10Model : BaseModel
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
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// ���վ�ֵ����
        /// </summary>
        public double net_performance { get; set; }
 
        /// <summary>
        /// �ۼƵ�λ��ֵ
        /// </summary>
        public double total_unit_nav { get; set; }
 
        /// <summary>
        /// ��ֵ��λռ��
        /// </summary>
        public double market_value_posi_ratio { get; set; }
 
        /// <summary>
        /// ��Ʒ������
        /// </summary>
        public String pd_manager { get; set; }
 
        /// <summary>
        /// ���ʲ�
        /// </summary>
        public double nav_asset { get; set; }
 
        /// <summary>
        /// �ֽ��ʲ�
        /// </summary>
        public double cash_asset { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double profit_year { get; set; }
 
        /// <summary>
        /// ����������
        /// </summary>
        public double profit_year_ratio { get; set; }
 
        /// <summary>
        /// ��Ͷ�ݶ�
        /// </summary>
        public double follow_share { get; set; }
 
        /// <summary>
        /// ��Ͷ�ʲ���ֵ
        /// </summary>
        public double follow_nav_asset { get; set; }
 
        /// <summary>
        /// ��Ͷ�ʲ���������
        /// </summary>
        public double follow_income_year { get; set; }
 
        /// <summary>
        /// ��Ͷ�ʲ�������
        /// </summary>
        public double follow_income_total { get; set; }
 
        /// <summary>
        /// ��Ͷ�ʲ���������
        /// </summary>
        public double follow_profit_ratio { get; set; }
 
        /// <summary>
        /// Ԥ��ֵ
        /// </summary>
        public double warn_value { get; set; }
 
        /// <summary>
        /// ֹ��ֵ
        /// </summary>
        public double stop_value { get; set; }
 
        /// <summary>
        /// ��ǰ�ݶ�
        /// </summary>
        public double curr_share { get; set; }
 
        /// <summary>
        /// ���س�
        /// </summary>
        public double max_retracement { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int found_date { get; set; }
 
        /// <summary>
        /// ���꾻ֵ
        /// </summary>
        public double last_year_nav { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯӯ������
   public class FuncrptL_3_11Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ��ʼ����
        /// </summary>
        public int begin_date { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int end_date { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// ���ʲ�
        /// </summary>
        public double nav_asset { get; set; }
 
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value { get; set; }
 
        /// <summary>
        /// �ֽ��ʲ�
        /// </summary>
        public double cash_asset { get; set; }
 
        /// <summary>
        /// �ر���
        /// </summary>
        public double product_return_rate { get; set; }
 
        /// <summary>
        /// ��׼�ر�
        /// </summary>
        public double standard_return { get; set; }
 
        /// <summary>
        /// ��ǰ�ݶ�
        /// </summary>
        public double curr_share { get; set; }
 
        /// <summary>
        /// ��λ��ֵ
        /// </summary>
        public double unit_nav { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double interval_pandl { get; set; }
 
        /// <summary>
        /// �ۼ�������
        /// </summary>
        public double total_realiz_pandl_ratio { get; set; }
 
        /// <summary>
        /// ��Իر�
        /// </summary>
        public double cmp_product_return_rate { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ�ر�ͳ��
   public class FuncrptL_3_12Model : BaseModel
   {
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// �ر���
        /// </summary>
        public double product_return_rate { get; set; }
 
        /// <summary>
        /// ���ʲ�
        /// </summary>
        public double total_asset { get; set; }
 
        /// <summary>
        /// ��׼�ر�
        /// </summary>
        public double standard_return { get; set; }
 
        /// <summary>
        /// ��Իر�
        /// </summary>
        public double cmp_product_return_rate { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ�������
   public class FuncrptL_3_13Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ��ʼ����
        /// </summary>
        public int begin_date { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int end_date { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// �ʲ���ֵ
        /// </summary>
        public double asset_market_value { get; set; }
 
        /// <summary>
        /// Ȩ�ر���
        /// </summary>
        public double weight_ratio { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double interval_pandl { get; set; }
 
        /// <summary>
        /// �ر���
        /// </summary>
        public double product_return_rate { get; set; }
 
        /// <summary>
        /// �ر�����
        /// </summary>
        public double return_rate { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ�ʲ�����
   public class FuncrptL_3_14Model : BaseModel
   {
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// �ʲ���ֵ
        /// </summary>
        public double asset_market_value { get; set; }
 
        /// <summary>
        /// Ȩ�ر���
        /// </summary>
        public double weight_ratio { get; set; }
 
        /// <summary>
        /// �ʲ����
        /// </summary>
        public int asset_kind { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double interval_pandl { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ�ֲַ���
   public class FuncrptL_3_15Model : BaseModel
   {
        /// <summary>
        /// ��ʼ����
        /// </summary>
        public int begin_date { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int end_date { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// ���¼�
        /// </summary>
        public double last_price { get; set; }
 
        /// <summary>
        /// �ֲ�����
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// �ʲ���ֵ
        /// </summary>
        public double asset_market_value { get; set; }
 
        /// <summary>
        /// Ȩ�ر���
        /// </summary>
        public double weight_ratio { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double interval_pandl { get; set; }
 
        /// <summary>
        /// �ر���
        /// </summary>
        public double product_return_rate { get; set; }
 
        /// <summary>
        /// �ر�����
        /// </summary>
        public double return_rate { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ��ҵ����
   public class FuncrptL_3_16Model : BaseModel
   {
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// һ����ҵ����
        /// </summary>
        public String first_indu_code { get; set; }
 
        /// <summary>
        /// �ʲ���ֵ
        /// </summary>
        public double asset_market_value { get; set; }
 
        /// <summary>
        /// Ȩ�ر���
        /// </summary>
        public double weight_ratio { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double interval_pandl { get; set; }
 
        /// <summary>
        /// �ر���
        /// </summary>
        public double product_return_rate { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ��ҵ�ֲַ���
   public class FuncrptL_3_17Model : BaseModel
   {
        /// <summary>
        /// ��ʼ����
        /// </summary>
        public int begin_date { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int end_date { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// ���¼�
        /// </summary>
        public double last_price { get; set; }
 
        /// <summary>
        /// �ֲ�����
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// �ʲ���ֵ
        /// </summary>
        public double asset_market_value { get; set; }
 
        /// <summary>
        /// Ȩ�ر���
        /// </summary>
        public double weight_ratio { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double interval_pandl { get; set; }
 
        /// <summary>
        /// �ر���
        /// </summary>
        public double product_return_rate { get; set; }
 
        /// <summary>
        /// �ر�����
        /// </summary>
        public double return_rate { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ��Ʒ�ֲ�
   public class FuncrptL_3_18Model : BaseModel
   {
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// ֤ȯ��ֵ
        /// </summary>
        public double stock_asset_value { get; set; }
 
        /// <summary>
        /// �ɱ���
        /// </summary>
        public double cost_price { get; set; }
 
        /// <summary>
        /// �ֲ�����
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// �ɱ����
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double float_pandl { get; set; }
 
        /// <summary>
        /// Ȩ�ر���
        /// </summary>
        public double weight_ratio { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ��Ʒ�ֲֶԱ�
   public class FuncrptL_3_19Model : BaseModel
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
        /// ���¼�
        /// </summary>
        public double last_price { get; set; }
 
        /// <summary>
        /// �ֲ�����
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// ֤ȯ��ֵ
        /// </summary>
        public double stock_asset_value { get; set; }
 
        /// <summary>
        /// �ɱ���
        /// </summary>
        public double cost_price { get; set; }
 
        /// <summary>
        /// Ȩ�ر���
        /// </summary>
        public double weight_ratio { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double float_pandl { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ�ֲ�֤ȯ��Ʒ
   public class FuncrptL_3_20Model : BaseModel
   {
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// ��Ʒ������
        /// </summary>
        public String pd_manager { get; set; }
 
        /// <summary>
        /// �ֲ�����
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// ֤ȯ��ֵ
        /// </summary>
        public double stock_asset_value { get; set; }
 
        /// <summary>
        /// �ɱ���
        /// </summary>
        public double cost_price { get; set; }
 
        /// <summary>
        /// Ȩ�ر���
        /// </summary>
        public double weight_ratio { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double float_pandl { get; set; }
 
        /// <summary>
        /// �ʲ���ֵ
        /// </summary>
        public double asset_market_value { get; set; }
 
        /// <summary>
        /// �ʲ�����
        /// </summary>
        public double asset_ratio { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_�ֲַ�����ѯ����֤ȯ����
   public class FuncrptL_3_21Model : BaseModel
   {
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
        /// �ڳ�����
        /// </summary>
        public double begin_qty { get; set; }
 
        /// <summary>
        /// ��ǰ����
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// �ɱ����
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// ʵ��ӯ��
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// ��Ϣ�ɱ����
        /// </summary>
        public double intrst_cost_amt { get; set; }
 
        /// <summary>
        /// ��Ϣ����
        /// </summary>
        public double intrst_pandl { get; set; }
 
        /// <summary>
        /// �ɱ���
        /// </summary>
        public double cost_price { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double float_pandl { get; set; }
 
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value { get; set; }
 
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
        /// ��������
        /// </summary>
        public double buy_qty { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double buy_amt { get; set; }
 
        /// <summary>
        /// ����ɽ���
        /// </summary>
        public double buy_strike_price { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double sell_qty { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public double sellout_amt { get; set; }
 
        /// <summary>
        /// �����ɽ���
        /// </summary>
        public double sell_strike_price { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public double diff_qty { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_�ֲַ�����ѯ�����г�
   public class FuncrptL_3_22Model : BaseModel
   {
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
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
        /// ֤ȯ��ֵ
        /// </summary>
        public double stock_asset_value { get; set; }
 
        /// <summary>
        /// �ɱ���
        /// </summary>
        public double cost_price { get; set; }
 
        /// <summary>
        /// �ֲ�����
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// �ɱ����
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double float_pandl { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_�ֲַ�����ѯ����֤ȯ���
   public class FuncrptL_3_23Model : BaseModel
   {
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
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
        /// ֤ȯ��ֵ
        /// </summary>
        public double stock_asset_value { get; set; }
 
        /// <summary>
        /// �ɱ���
        /// </summary>
        public double cost_price { get; set; }
 
        /// <summary>
        /// �ֲ�����
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// �ɱ����
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double float_pandl { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_�ֲַ�����ѯ���ܲ�Ʒ����
   public class FuncrptL_3_24Model : BaseModel
   {
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
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
        /// ֤ȯ��ֵ
        /// </summary>
        public double stock_asset_value { get; set; }
 
        /// <summary>
        /// �ɱ���
        /// </summary>
        public double cost_price { get; set; }
 
        /// <summary>
        /// �ֲ�����
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// �ɱ����
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double float_pandl { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_�ֲַ�����ѯ��ϸ�ֲ�
   public class FuncrptL_3_25Model : BaseModel
   {
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
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
        /// ֤ȯ��ֵ
        /// </summary>
        public double stock_asset_value { get; set; }
 
        /// <summary>
        /// �ɱ���
        /// </summary>
        public double cost_price { get; set; }
 
        /// <summary>
        /// �ֲ�����
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// �ɱ����
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double float_pandl { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_ծȯ������ѯ��ϸ
   public class FuncrptL_3_26Model : BaseModel
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
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ծȯ����
        /// </summary>
        public String bond_code { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// ���¼�
        /// </summary>
        public double last_price { get; set; }
 
        /// <summary>
        /// �ֲ�����
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// ֤ȯ��ֵ
        /// </summary>
        public double stock_asset_value { get; set; }
 
        /// <summary>
        /// �ɱ���
        /// </summary>
        public double cost_price { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public String rating_agency { get; set; }
 
        /// <summary>
        /// ծȯ�ȼ�
        /// </summary>
        public int bond_level { get; set; }
 
        /// <summary>
        /// ծȯ������Ϣ
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// ����ȫ��
        /// </summary>
        public double value_dirty_price { get; set; }
 
        /// <summary>
        /// ���۾���
        /// </summary>
        public double value_net_price { get; set; }
 
        /// <summary>
        /// ����������
        /// </summary>
        public double value_price_yield { get; set; }
 
        /// <summary>
        /// ������������
        /// </summary>
        public double value_price_modi_dur { get; set; }
 
        /// <summary>
        /// ����͹��
        /// </summary>
        public double value_price_conve { get; set; }
 
        /// <summary>
        /// ���ۻ����ֵ
        /// </summary>
        public double value_price_point_value { get; set; }
 
        /// <summary>
        /// �������ʾ���
        /// </summary>
        public double value_price_intrst_dur { get; set; }
 
        /// <summary>
        /// ��������͹��
        /// </summary>
        public double value_price_intrst_conve { get; set; }
 
        /// <summary>
        /// �����������
        /// </summary>
        public double value_price_spread_dur { get; set; }
 
        /// <summary>
        /// ��������͹��
        /// </summary>
        public double value_price_spread_Conve { get; set; }
 
        /// <summary>
        /// ��Ȩƽ������ȫ��
        /// </summary>
        public double true_dirty_price { get; set; }
 
        /// <summary>
        /// ��Ȩƽ�����㾻��
        /// </summary>
        public double true_net_price { get; set; }
 
        /// <summary>
        /// ��Ȩƽ�������������
        /// </summary>
        public double true_yield { get; set; }
 
        /// <summary>
        /// ʵ�ʴ�����
        /// </summary>
        public double true_remain_limit { get; set; }
 
        /// <summary>
        /// ��Ȩƽ���������������
        /// </summary>
        public double true_avg_modi_dur { get; set; }
 
        /// <summary>
        /// ��Ȩƽ�������͹��
        /// </summary>
        public double true_conve { get; set; }
 
        /// <summary>
        /// ��Ȩƽ������ۻ����ֵ
        /// </summary>
        public double true_point_value { get; set; }
 
        /// <summary>
        /// ��Ȩƽ����������ʾ���
        /// </summary>
        public double true_intrst_dur { get; set; }
 
        /// <summary>
        /// ��Ȩƽ�����������͹��
        /// </summary>
        public double true_intrst_conve { get; set; }
 
        /// <summary>
        /// ��Ȩƽ��������������
        /// </summary>
        public double true_spread_dur { get; set; }
 
        /// <summary>
        /// ��Ȩƽ�����������͹��
        /// </summary>
        public double true_spread_conve { get; set; }
 
        /// <summary>
        /// ����������ϵ��
        /// </summary>
        public double abs_liq_coeffi { get; set; }
 
        /// <summary>
        /// λ�ðٷֱ�
        /// </summary>
        public double pstion_per { get; set; }
 
        /// <summary>
        /// ���������ϵ��
        /// </summary>
        public double rela_liq_coeffi { get; set; }
 
        /// <summary>
        /// ���������ȡֵ
        /// </summary>
        public double rela_liq_num { get; set; }
 
        /// <summary>
        /// ���չ���ȫ��
        /// </summary>
        public double sett_value_dirty_rice { get; set; }
 
        /// <summary>
        /// ����Ӧ����Ϣ
        /// </summary>
        public double sett_accr_intrst { get; set; }
 
        /// <summary>
        /// ʣ�౾��
        /// </summary>
        public double remain_capit { get; set; }
 
        /// <summary>
        /// ���������
        /// </summary>
        public double point_spread_yield { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_ծȯ������ѯ��ҵȨ��
   public class FuncrptL_3_27Model : BaseModel
   {
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int end_date { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// һ����ҵ����
        /// </summary>
        public String first_indu_code { get; set; }
 
        /// <summary>
        /// ������Ȩ��
        /// </summary>
        public double end_date_weight { get; set; }
 
        /// <summary>
        /// �����ջر�
        /// </summary>
        public double end_date_revenue { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double clean_price_profit { get; set; }
 
        /// <summary>
        /// �����ܻر�
        /// </summary>
        public double clean_price_revenue { get; set; }
 
        /// <summary>
        /// �ܻر�
        /// </summary>
        public double total_return { get; set; }
 
        /// <summary>
        /// ��Ϣ������
        /// </summary>
        public double interest_revenue_total { get; set; }
 
        /// <summary>
        /// ���
        /// </summary>
        public double face_value { get; set; }
 
        /// <summary>
        /// ������ֵ
        /// </summary>
        public double clean_price_market_value { get; set; }
 
        /// <summary>
        /// ȫ����ֵ
        /// </summary>
        public double dirty_price_market_value { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_�ڻ��ֲֲ�ѯ��ϸ
   public class FuncrptL_3_29Model : BaseModel
   {
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
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
        /// ֤ȯ��ֵ
        /// </summary>
        public double stock_asset_value { get; set; }
 
        /// <summary>
        /// �ɱ���
        /// </summary>
        public double cost_price { get; set; }
 
        /// <summary>
        /// �ֲ�����
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// �ɱ����
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double float_pandl { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_�ڻ���֤�����
   public class FuncrptL_3_30Model : BaseModel
   {
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
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
        /// ֤ȯ��ֵ
        /// </summary>
        public double stock_asset_value { get; set; }
 
        /// <summary>
        /// �ɱ���
        /// </summary>
        public double cost_price { get; set; }
 
        /// <summary>
        /// �ֲ�����
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// �ɱ����
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double float_pandl { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_�ڻ��ֲֲ�Ʒ�ֲ�
   public class FuncrptL_3_31Model : BaseModel
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
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public ulong product_id { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public String contrc_name { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public String contrc_code { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value { get; set; }
 
        /// <summary>
        /// �ɶ�����
        /// </summary>
        public String stock_acco { get; set; }
 
        /// <summary>
        /// ���ױ���
        /// </summary>
        public String futu_acco { get; set; }
 
        /// <summary>
        /// �ʲ��˻�
        /// </summary>
        public String asset_acco { get; set; }
 
        /// <summary>
        /// Ͷ������
        /// </summary>
        public int invest_type { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int lngsht_type { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_unit { get; set; }
 
        /// <summary>
        /// �ױ���־
        /// </summary>
        public int hedge_type { get; set; }
 
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
        /// �������������
        /// </summary>
        public double buy_pre_sett_qty { get; set; }
 
        /// <summary>
        /// ��������������
        /// </summary>
        public double sell_pre_sett_qty { get; set; }
 
        /// <summary>
        /// Ӧ�ձ�֤��
        /// </summary>
        public double rece_margin { get; set; }
 
        /// <summary>
        /// ʵ��ӯ��
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double avail_qty { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_�ڻ��ֲֲ�Ʒ�ֲ���ϸ
   public class FuncrptL_3_32Model : BaseModel
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
        /// ��ϸ�ֲ����
        /// </summary>
        public ulong detail_posi_id { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public ulong product_id { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_type { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public String contrc_code { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// �ʲ��˻�
        /// </summary>
        public String asset_acco { get; set; }
 
        /// <summary>
        /// ���ױ���
        /// </summary>
        public String futu_acco { get; set; }
 
        /// <summary>
        /// Ͷ������
        /// </summary>
        public int invest_type { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int lngsht_type { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int open_posi_date { get; set; }
 
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int open_posi_time { get; set; }
 
        /// <summary>
        /// �ɽ����
        /// </summary>
        public String strike_no { get; set; }
 
        /// <summary>
        /// ���ּ۸�
        /// </summary>
        public double open_posi_price { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double open_posi_qty { get; set; }
 
        /// <summary>
        /// ����ռ������
        /// </summary>
        public double trade_capt_qty { get; set; }
 
        /// <summary>
        /// �ɽ�ռ������
        /// </summary>
        public double strike_capt_qty { get; set; }
 
        /// <summary>
        /// ���ַ���
        /// </summary>
        public double open_posi_fee { get; set; }
 
        /// <summary>
        /// ƽ�ַ���
        /// </summary>
        public double close_posi_fee { get; set; }
 
        /// <summary>
        /// ���н���۸�
        /// </summary>
        public double marked_sett_price { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double marked_pandl { get; set; }
 
        /// <summary>
        /// ƽ��ӯ��
        /// </summary>
        public double close_pandl { get; set; }
 
        /// <summary>
        /// Ӧ�ձ�֤��
        /// </summary>
        public double rece_margin { get; set; }
 
        /// <summary>
        /// �ױ���־
        /// </summary>
        public int hedge_type { get; set; }
 
        /// <summary>
        /// ���ֽ��
        /// </summary>
        public double open_amount { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ��Ʒ����ָ��
   public class FuncrptL_3_34Model : BaseModel
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
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// ��λ��ֵ
        /// </summary>
        public double unit_nav { get; set; }
 
        /// <summary>
        /// ���ʲ�
        /// </summary>
        public double nav_asset { get; set; }
 
        /// <summary>
        /// ����ݶ��ܶ�
        /// </summary>
        public double fund_share_total { get; set; }
 
        /// <summary>
        /// ����������
        /// </summary>
        public double daily_pandl_ratio { get; set; }
 
        /// <summary>
        /// �ۼ��껯������
        /// </summary>
        public double total_realize_pandl_ratio_year { get; set; }
 
        /// <summary>
        /// ���������
        /// </summary>
        public String fund_manager { get; set; }
 
        /// <summary>
        /// ��׼�ر�
        /// </summary>
        public double standard_return { get; set; }
 
        /// <summary>
        /// ��Իر�
        /// </summary>
        public double cmp_product_return_rate { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int trade_days { get; set; }
 
        /// <summary>
        /// �����껯����
        /// </summary>
        public double excess_earning_year { get; set; }
 
        /// <summary>
        /// �껯������
        /// </summary>
        public double annual_yield { get; set; }
 
        /// <summary>
        /// ���س�
        /// </summary>
        public double max_retracement { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public double max_rise_range { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double volatility { get; set; }
 
        /// <summary>
        /// �껯������
        /// </summary>
        public double volatility_yearly { get; set; }
 
        /// <summary>
        /// ���ձ���
        /// </summary>
        public double sharpe_ration { get; set; }
 
        /// <summary>
        /// ���з���
        /// </summary>
        public double down_risk { get; set; }
 
        /// <summary>
        /// Sortino����
        /// </summary>
        public double sortino_ratio { get; set; }
 
        /// <summary>
        /// ղɭָ��
        /// </summary>
        public double jensen_index { get; set; }
 
        /// <summary>
        /// Beta
        /// </summary>
        public double beta_ratio { get; set; }
 
        /// <summary>
        /// ��Ϣ����
        /// </summary>
        public double info_ratio { get; set; }
 
        /// <summary>
        /// �����
        /// </summary>
        public double kamabi { get; set; }
 
        /// <summary>
        /// ��ʱ����
        /// </summary>
        public double timing_ability { get; set; }
 
        /// <summary>
        /// ѡ������
        /// </summary>
        public double stock_selection_ability { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ��Ʒ����ЧӦ
   public class FuncrptL_3_35Model : BaseModel
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
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// ���������
        /// </summary>
        public String fund_manager { get; set; }
 
        /// <summary>
        /// �껯������
        /// </summary>
        public double annual_yield { get; set; }
 
        /// <summary>
        /// ��׼�ر�
        /// </summary>
        public double standard_return { get; set; }
 
        /// <summary>
        /// ����ЧӦ
        /// </summary>
        public double distributional_effect_rate { get; set; }
 
        /// <summary>
        /// ѡ��ЧӦ
        /// </summary>
        public double selection_effect_rate { get; set; }
 
        /// <summary>
        /// ����ЧӦ
        /// </summary>
        public double interaction_effect_rate { get; set; }
 
        /// <summary>
        /// ȫ��ЧӦ
        /// </summary>
        public double all_effect_rate { get; set; }
 
        /// <summary>
        /// ��Իر�
        /// </summary>
        public double cmp_product_return_rate { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ��Ʒ���佻��ͳ��
   public class FuncrptL_3_36Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ��ʼ����
        /// </summary>
        public int begin_date { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int end_date { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// ���׸�����
        /// </summary>
        public int trade_stock_cnt { get; set; }
 
        /// <summary>
        /// ��ӯ��
        /// </summary>
        public double profit_total { get; set; }
 
        /// <summary>
        /// ӯ����
        /// </summary>
        public int profit_stock_cnt { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public int loss_stock_cnt { get; set; }
 
        /// <summary>
        /// ӯ�����
        /// </summary>
        public double profit_balance { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double loss_balance { get; set; }
 
        /// <summary>
        /// ʤ��
        /// </summary>
        public double win_rate { get; set; }
 
        /// <summary>
        /// ӯ����
        /// </summary>
        public double profit_loss_ratio { get; set; }
 
        /// <summary>
        /// ǰ10���Ʊ��ֵռ��
        /// </summary>
        public double max_stock_10_ratio { get; set; }
 
        /// <summary>
        /// ǰ10��ƽ���ֲ�ʱ��
        /// </summary>
        public int max_stock_10_avg_days { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double tnover_rate { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ��Ʒծȯ�¶ȳֲ�ͳ��
   public class FuncrptL_3_37Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ��ǰ�·�
        /// </summary>
        public int curr_month { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int trade_days { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// ծȯ����
        /// </summary>
        public String bond_code { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// ��ǰ����
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double intrst_ratio { get; set; }
 
        /// <summary>
        /// ��ʼ����
        /// </summary>
        public int begin_date { get; set; }
 
        /// <summary>
        /// �ڳ���ֵ
        /// </summary>
        public double begin_value { get; set; }
 
        /// <summary>
        /// �ڳ�����
        /// </summary>
        public double begin_net_price { get; set; }
 
        /// <summary>
        /// �ڳ�ȫ��
        /// </summary>
        public double begin_full_price { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int end_date { get; set; }
 
        /// <summary>
        /// ��ĩ��ֵ
        /// </summary>
        public double end_value { get; set; }
 
        /// <summary>
        /// ��ĩ����
        /// </summary>
        public double end_net_price { get; set; }
 
        /// <summary>
        /// ��ĩȫ��
        /// </summary>
        public double end_full_price { get; set; }
 
        /// <summary>
        /// �ڼ䷢����Ϣ
        /// </summary>
        public double pay_interest_term { get; set; }
 
        /// <summary>
        /// �ʱ�����
        /// </summary>
        public double profit_from_capital { get; set; }
 
        /// <summary>
        /// ƱϢ����
        /// </summary>
        public double coupon_yield { get; set; }
 
        /// <summary>
        /// ��ծ����
        /// </summary>
        public double cb_profit { get; set; }
 
        /// <summary>
        /// ծȯƷ��
        /// </summary>
        public int bond_kind { get; set; }
 
        /// <summary>
        /// ���ű���
        /// </summary>
        public double recover_capital { get; set; }
 
        /// <summary>
        /// ������������
        /// </summary>
        public double value_price_modi_dur { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ��Ʒծȯ�¶Ƚ�����ϸ
   public class FuncrptL_3_38Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ��ǰ�·�
        /// </summary>
        public int curr_month { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ծȯ����
        /// </summary>
        public String bond_code { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double trade_qty { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int trade_date { get; set; }
 
        /// <summary>
        /// ���׶���
        /// </summary>
        public String bank_ib_member { get; set; }
 
        /// <summary>
        /// ��ֵ������
        /// </summary>
        public double value_yield { get; set; }
 
        /// <summary>
        /// ���۾���
        /// </summary>
        public double value_net_price { get; set; }
 
        /// <summary>
        /// ����������
        /// </summary>
        public double trade_yield { get; set; }
 
        /// <summary>
        /// ���׾���
        /// </summary>
        public double trade_net_price { get; set; }
 
        /// <summary>
        /// ����
        /// </summary>
        public double profit { get; set; }
 
        /// <summary>
        /// ծȯƷ��
        /// </summary>
        public int bond_kind { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ��Ʒծȯ�¶Ƚ��׻���
   public class FuncrptL_3_39Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ��ǰ�·�
        /// </summary>
        public int curr_month { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ծȯ����
        /// </summary>
        public String bond_code { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// ծȯ����
        /// </summary>
        public int bond_type { get; set; }
 
        /// <summary>
        /// ƽ��Ͷ�ʱ���
        /// </summary>
        public double avg_invest_ratio { get; set; }
 
        /// <summary>
        /// ƽ��������
        /// </summary>
        public double avg_yield { get; set; }
 
        /// <summary>
        /// �����ʹ���
        /// </summary>
        public double yield_ratio { get; set; }
 
        /// <summary>
        /// �ֲ�ӯ��
        /// </summary>
        public double holder_profit { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double trade_profit { get; set; }
 
        /// <summary>
        /// �ϼ�ӯ��
        /// </summary>
        public double total_profit { get; set; }
 
        /// <summary>
        /// ծ������
        /// </summary>
        public double bond_cr_level { get; set; }
 
        /// <summary>
        /// ʣ������
        /// </summary>
        public double rem_per { get; set; }
 
        /// <summary>
        /// ծȯ����
        /// </summary>
        public double bond_limit { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ��Ʒծȯ�¶��ʲ�ͳ��
   public class FuncrptL_3_40Model : BaseModel
   {
        /// <summary>
        /// ��ǰ�·�
        /// </summary>
        public int curr_month { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// ���ұ���
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// �ʲ�����
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// �ڳ�Ͷ�ʱ���
        /// </summary>
        public double begin_invest_ratio { get; set; }
 
        /// <summary>
        /// ��ĩͶ�ʱ���
        /// </summary>
        public double end_invest_ratio { get; set; }
 
        /// <summary>
        /// ƽ��Ͷ�ʱ���
        /// </summary>
        public double avg_invest_ratio { get; set; }
 
        /// <summary>
        /// ƽ��Ͷ��������
        /// </summary>
        public double return_on_investment { get; set; }
 
        /// <summary>
        /// �����ʹ���
        /// </summary>
        public double yield_ratio { get; set; }
 
        /// <summary>
        /// ��׼������
        /// </summary>
        public double cmp_ytm { get; set; }
 
        /// <summary>
        /// �����껯����
        /// </summary>
        public double excess_earning_year { get; set; }
 
        /// <summary>
        /// �ڳ���ֵ
        /// </summary>
        public double begin_market_value { get; set; }
 
        /// <summary>
        /// ��ĩ��ֵ
        /// </summary>
        public double end_market_value { get; set; }
 
        /// <summary>
        /// ƽ���ֲ�
        /// </summary>
        public double avg_market_value { get; set; }
 
        /// <summary>
        /// �ֲ�ӯ��
        /// </summary>
        public double holder_profit { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double trade_profit { get; set; }
 
        /// <summary>
        /// �ϼ�ӯ��
        /// </summary>
        public double total_profit { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ��Ʒ�ֲ���ϸ
   public class FuncrptL_3_61Model : BaseModel
   {
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// ֤ȯ��ֵ
        /// </summary>
        public double stock_asset_value { get; set; }
 
        /// <summary>
        /// �ɱ���
        /// </summary>
        public double cost_price { get; set; }
 
        /// <summary>
        /// �ֲ�����
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// �ɱ����
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double float_pandl { get; set; }
 
        /// <summary>
        /// Ȩ�ر���
        /// </summary>
        public double weight_ratio { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ��Ʒ������ϸ
   public class FuncrptL_3_62Model : BaseModel
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
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
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
        /// ���ұ���
        /// </summary>
        public String crncy_type { get; set; }
 
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
        /// ����������
        /// </summary>
        public double order_frozen_amt { get; set; }
 
        /// <summary>
        /// �ɽ����
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// �ʲ�����
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ��Ʒ���׻��ܷ���
   public class FuncrptL_3_63Model : BaseModel
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
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// ���ұ���
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// ����������
        /// </summary>
        public double order_frozen_amt { get; set; }
 
        /// <summary>
        /// �ɽ����
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// �ʲ�����
        /// </summary>
        public int asset_type { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ��Ʒ���׻���֤ȯ����
   public class FuncrptL_3_64Model : BaseModel
   {
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
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// ���ұ���
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// ����������
        /// </summary>
        public double order_frozen_amt { get; set; }
 
        /// <summary>
        /// �ɽ����
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// �ʲ�����
        /// </summary>
        public int asset_type { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ��Ʒ�ֲֻ���
   public class FuncrptL_3_66Model : BaseModel
   {
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
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
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// ������������
        /// </summary>
        public double today_buy_qty { get; set; }
 
        /// <summary>
        /// ������������
        /// </summary>
        public double today_sell_qty { get; set; }
 
        /// <summary>
        /// �ֲ�����
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// �ɱ���
        /// </summary>
        public double cost_price { get; set; }
 
        /// <summary>
        /// �����̼�
        /// </summary>
        public double today_close_price { get; set; }
 
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ�����ֲֻ���
   public class FuncrptL_3_67Model : BaseModel
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
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// ������������
        /// </summary>
        public double today_buy_qty { get; set; }
 
        /// <summary>
        /// ������������
        /// </summary>
        public double today_sell_qty { get; set; }
 
        /// <summary>
        /// �ֲ�����
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// �����̼�
        /// </summary>
        public double today_close_price { get; set; }
 
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value { get; set; }
 
        /// <summary>
        /// �ֲ־�ֵռ��
        /// </summary>
        public double posi_nav_ratio { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ��Ʒ�ֲֽ��׻���
   public class FuncrptL_3_68Model : BaseModel
   {
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name { get; set; }
 
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
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// ���ճֲ�����
        /// </summary>
        public double pre_holding_qty { get; set; }
 
        /// <summary>
        /// ������������
        /// </summary>
        public double today_buy_qty { get; set; }
 
        /// <summary>
        /// ����������
        /// </summary>
        public double today_buy_amt { get; set; }
 
        /// <summary>
        /// ��������۸�
        /// </summary>
        public double today_buy_price { get; set; }
 
        /// <summary>
        /// ���뿪ʼʱ��
        /// </summary>
        public int buy_begin_time { get; set; }
 
        /// <summary>
        /// �������ʱ��
        /// </summary>
        public int buy_end_time { get; set; }
 
        /// <summary>
        /// ������������
        /// </summary>
        public double today_sell_qty { get; set; }
 
        /// <summary>
        /// �����������
        /// </summary>
        public double today_sell_amt { get; set; }
 
        /// <summary>
        /// ���������۸�
        /// </summary>
        public double today_sell_price { get; set; }
 
        /// <summary>
        /// ������ʼʱ��
        /// </summary>
        public int sell_begin_time { get; set; }
 
        /// <summary>
        /// ��������ʱ��
        /// </summary>
        public int sell_end_time { get; set; }
 
        /// <summary>
        /// �ֲ�����
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// �����̼�
        /// </summary>
        public double today_close_price { get; set; }
 
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ�������ʲ��ֲָ�������
   public class FuncrptL_3_81Model : BaseModel
   {
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// �������Ʒ�ݶ�
        /// </summary>
        public double exch_group_pd_share { get; set; }
 
        /// <summary>
        /// ��λ��ֵ
        /// </summary>
        public double unit_nav { get; set; }
 
        /// <summary>
        /// ���վ�ֵ
        /// </summary>
        public double pre_nav { get; set; }
 
        /// <summary>
        /// ���ʲ�
        /// </summary>
        public double nav_asset { get; set; }
 
        /// <summary>
        /// ��ֵ����
        /// </summary>
        public double nav_fluct { get; set; }
 
        /// <summary>
        /// �ֹɱ���
        /// </summary>
        public double posi_ratio { get; set; }
 
        /// <summary>
        /// ֤ȯռ��
        /// </summary>
        public double securities_ratio { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double float_pandl { get; set; }
 
        /// <summary>
        /// ʵ��ӯ��
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// �ۼƷֺ���
        /// </summary>
        public double total_divi_amt { get; set; }
 
        /// <summary>
        /// ԭʼ�ʲ�
        /// </summary>
        public double first_asset { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int strategy_type { get; set; }
 
        /// <summary>
        /// �ۼƼ������
        /// </summary>
        public double total_pre_fee { get; set; }
 
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value { get; set; }
 
        /// <summary>
        /// �ֽ��ʲ�
        /// </summary>
        public double cash_asset { get; set; }
 
        /// <summary>
        /// ��Ʊ�ʲ�
        /// </summary>
        public double stock_asset { get; set; }
 
        /// <summary>
        /// ծȯ�ʲ�
        /// </summary>
        public double bond_asset { get; set; }
 
        /// <summary>
        /// �����ʲ�
        /// </summary>
        public double fund_asset { get; set; }
 
        /// <summary>
        /// �ع��ʲ�
        /// </summary>
        public double repo_asset { get; set; }
 
        /// <summary>
        /// �����ʲ�
        /// </summary>
        public double other_asset { get; set; }
 
        /// <summary>
        /// �ۼ�Ӧ�����
        /// </summary>
        public double total_payab_amt { get; set; }
 
        /// <summary>
        /// �ۼ�Ӧ�ս��
        /// </summary>
        public double total_rece_amt { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ����֤ȯ�ֲֳɽ�
   public class FuncrptL_3_82Model : BaseModel
   {
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value { get; set; }
 
        /// <summary>
        /// �ɽ����
        /// </summary>
        public double strike_amt { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ������֤ȯ�ֲ���ϸ
   public class FuncrptL_3_83Model : BaseModel
   {
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value { get; set; }
 
        /// <summary>
        /// �ֹɱ���
        /// </summary>
        public double posi_ratio { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double float_pandl { get; set; }
 
        /// <summary>
        /// ��ǰ����
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// �ɱ����
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// ʵ��ӯ��
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// �ɱ���
        /// </summary>
        public double cost_price { get; set; }
 
        /// <summary>
        /// ���¼�
        /// </summary>
        public double last_price { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ������ֲ�����ӯ��
   public class FuncrptL_3_101Model : BaseModel
   {
        /// <summary>
        /// ��ʼ����
        /// </summary>
        public int begin_date { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int end_date { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int exch_group_no { get; set; }
 
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
        /// �ڳ����̼�
        /// </summary>
        public double begin_close_price { get; set; }
 
        /// <summary>
        /// �ڳ�����
        /// </summary>
        public double begin_qty { get; set; }
 
        /// <summary>
        /// �ڳ��ɱ�
        /// </summary>
        public double begin_cost_amt { get; set; }
 
        /// <summary>
        /// �ڳ��ֲ���ֵ
        /// </summary>
        public double begin_posi_market_value { get; set; }
 
        /// <summary>
        /// �ڳ�ʵ��ӯ��
        /// </summary>
        public double begin_realize_pandl { get; set; }
 
        /// <summary>
        /// ��ĩ���̼�
        /// </summary>
        public double end_close_price { get; set; }
 
        /// <summary>
        /// ��ĩ����
        /// </summary>
        public int end_cur_qty { get; set; }
 
        /// <summary>
        /// ��ĩ�ɱ�
        /// </summary>
        public double end_cost_amt { get; set; }
 
        /// <summary>
        /// ��ĩ�ֲ���ֵ
        /// </summary>
        public double end_posi_market_value { get; set; }
 
        /// <summary>
        /// ��ĩʵ��ӯ��
        /// </summary>
        public double end_realize_pandl { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double float_pandl { get; set; }
 
        /// <summary>
        /// ����ʵ��ӯ��
        /// </summary>
        public double interval_realize_pandl { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double interval_pandl { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ������ֲ�����ӯ����ҵ
   public class FuncrptL_3_102Model : BaseModel
   {
        /// <summary>
        /// ��ʼ����
        /// </summary>
        public int begin_date { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int end_date { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// Ȩ�ر���
        /// </summary>
        public double weight_ratio { get; set; }
 
        /// <summary>
        /// �ڳ��ɱ�
        /// </summary>
        public double begin_cost_amt { get; set; }
 
        /// <summary>
        /// �ڳ��ֲ���ֵ
        /// </summary>
        public double begin_posi_market_value { get; set; }
 
        /// <summary>
        /// �ڳ�ʵ��ӯ��
        /// </summary>
        public double begin_realize_pandl { get; set; }
 
        /// <summary>
        /// ��ĩ�ɱ�
        /// </summary>
        public double end_cost_amt { get; set; }
 
        /// <summary>
        /// ��ĩ�ֲ���ֵ
        /// </summary>
        public double end_posi_market_value { get; set; }
 
        /// <summary>
        /// ��ĩʵ��ӯ��
        /// </summary>
        public double end_realize_pandl { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double float_pandl { get; set; }
 
        /// <summary>
        /// ����ʵ��ӯ��
        /// </summary>
        public double interval_realize_pandl { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double interval_pandl { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯ��Ʒ�ֲ�����ӯ��
   public class FuncrptL_3_103Model : BaseModel
   {
        /// <summary>
        /// ��ʼ����
        /// </summary>
        public int begin_date { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int end_date { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
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
        /// �ڳ����̼�
        /// </summary>
        public double begin_close_price { get; set; }
 
        /// <summary>
        /// �ڳ�����
        /// </summary>
        public double begin_qty { get; set; }
 
        /// <summary>
        /// �ڳ��ɱ�
        /// </summary>
        public double begin_cost_amt { get; set; }
 
        /// <summary>
        /// �ڳ��ֲ���ֵ
        /// </summary>
        public double begin_posi_market_value { get; set; }
 
        /// <summary>
        /// �ڳ�ʵ��ӯ��
        /// </summary>
        public double begin_realize_pandl { get; set; }
 
        /// <summary>
        /// ��ĩ���̼�
        /// </summary>
        public double end_close_price { get; set; }
 
        /// <summary>
        /// ��ĩ����
        /// </summary>
        public int end_cur_qty { get; set; }
 
        /// <summary>
        /// ��ĩ�ɱ�
        /// </summary>
        public double end_cost_amt { get; set; }
 
        /// <summary>
        /// ��ĩ�ֲ���ֵ
        /// </summary>
        public double end_posi_market_value { get; set; }
 
        /// <summary>
        /// ��ĩʵ��ӯ��
        /// </summary>
        public double end_realize_pandl { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double float_pandl { get; set; }
 
        /// <summary>
        /// ����ʵ��ӯ��
        /// </summary>
        public double interval_realize_pandl { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double interval_pandl { get; set; }
 
        /// <summary>
        /// ���ֲ���ֵ
        /// </summary>
        public double max_posi_market_value { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯƽ̨��Ʒ���ձ���
   public class FuncrptL_3_201Model : BaseModel
   {
        /// <summary>
        /// ��ʼ����
        /// </summary>
        public int begin_date { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int end_date { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// �ݶֵ
        /// </summary>
        public double share_net { get; set; }
 
        /// <summary>
        /// �ݶ��ۼƾ�ֵ
        /// </summary>
        public double share_net_total { get; set; }
 
        /// <summary>
        /// ���ձ���
        /// </summary>
        public double sharpe_ration { get; set; }
 
        /// <summary>
        /// ���س�
        /// </summary>
        public double max_retracement { get; set; }
 
        /// <summary>
        /// �껯������
        /// </summary>
        public double annual_yield { get; set; }
 
        /// <summary>
        /// ��ֵ�����ʱ�׼��
        /// </summary>
        public double net_growth_rate_stdev { get; set; }
 
        /// <summary>
        /// ҵ���Ƚϻ�׼������
        /// </summary>
        public double achi_compa_pandl_ratio { get; set; }
 
        /// <summary>
        /// ����������
        /// </summary>
        public double profit_year_ratio { get; set; }
 
   }
 
   //�߼�_����_�����ѯ_��ѯƽ̨��Ʒ��������
   public class FuncrptL_3_202Model : BaseModel
   {
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// �ݶ��ۼƾ�ֵ
        /// </summary>
        public double share_net_total { get; set; }
 
        /// <summary>
        /// ���վ�ֵ
        /// </summary>
        public double pre_nav { get; set; }
 
        /// <summary>
        /// ҵ������
        /// </summary>
        public int busin_date { get; set; }
 
        /// <summary>
        /// һ����������
        /// </summary>
        public double return_ratio_in_single_month { get; set; }
 
   }
 
}

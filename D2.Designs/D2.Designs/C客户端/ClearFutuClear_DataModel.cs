using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //�߼�_�����ڻ�_����_����׼��
   public class FuncclfutuL_2_1Model : BaseModel
   {
        /// <summary>
        /// ��¼����
        /// </summary>
        public int record_count { get; set; }
 
        /// <summary>
        /// ������Ϣ
        /// </summary>
        public String deal_info { get; set; }
 
   }
 
   //�߼�_�����ڻ�_����_ת��ֲּ�¼
   public class FuncclfutuL_2_2Model : BaseModel
   {
        /// <summary>
        /// ��¼����
        /// </summary>
        public int record_count { get; set; }
 
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ������Ϣ
        /// </summary>
        public String deal_info { get; set; }
 
   }
 
   //�߼�_�����ڻ�_����_ת�붩����¼
   public class FuncclfutuL_2_6Model : BaseModel
   {
        /// <summary>
        /// ��¼����
        /// </summary>
        public int record_count { get; set; }
 
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ������Ϣ
        /// </summary>
        public String deal_info { get; set; }
 
   }
 
   //�߼�_�����ڻ�_����_��ѯ������¼
   public class FuncclfutuL_2_9Model : BaseModel
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
        /// ���ұ���
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// ���ױ���
        /// </summary>
        public String exch_crncy_type { get; set; }
 
        /// <summary>
        /// ����
        /// </summary>
        public double exch_rate { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ���ױ�����
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// ��Լ������
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_type { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_unit { get; set; }
 
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
        public int order_date { get; set; }
 
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int order_time { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int order_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_batch_no { get; set; }
 
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
        /// �걨����
        /// </summary>
        public double report_fee { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double wtdraw_fee { get; set; }
 
        /// <summary>
        /// ����״̬
        /// </summary>
        public String order_status { get; set; }
 
        /// <summary>
        /// �����־
        /// </summary>
        public int deal_flag { get; set; }
 
   }
 
   //�߼�_�����ڻ�_����_ת��ɽ���¼
   public class FuncclfutuL_2_21Model : BaseModel
   {
        /// <summary>
        /// ��¼����
        /// </summary>
        public int record_count { get; set; }
 
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ������Ϣ
        /// </summary>
        public String deal_info { get; set; }
 
   }
 
   //�߼�_�����ڻ�_����_��ѯ�ɽ���¼
   public class FuncclfutuL_2_24Model : BaseModel
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
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// �ⲿ�˺�
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// ���ұ���
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// ���ױ���
        /// </summary>
        public String exch_crncy_type { get; set; }
 
        /// <summary>
        /// ����
        /// </summary>
        public double exch_rate { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ���ױ�����
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// ��Լ������
        /// </summary>
        public int contrc_code_no { get; set; }
 
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
        /// ����ʱ��
        /// </summary>
        public int order_time { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int order_no { get; set; }
 
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
        /// Ӧ�ձ�֤��
        /// </summary>
        public double rece_margin { get; set; }
 
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
        public double service_fee { get; set; }
 
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
        /// �ⲿ�걨����
        /// </summary>
        public double out_report_fee { get; set; }
 
        /// <summary>
        /// �ⲿ��������
        /// </summary>
        public double out_cancel_fee { get; set; }
 
        /// <summary>
        /// �ⲿ�������
        /// </summary>
        public double out_deli_fee { get; set; }
 
        /// <summary>
        /// �ⲿ��������
        /// </summary>
        public double out_service_fee { get; set; }
 
        /// <summary>
        /// �ⲿ��������
        /// </summary>
        public double out_other_fee { get; set; }
 
        /// <summary>
        /// �ⲿ����Ӷ��
        /// </summary>
        public double out_brkage_commis { get; set; }
 
        /// <summary>
        /// �ⲿ����Ӷ��
        /// </summary>
        public double out_other_commis { get; set; }
 
        /// <summary>
        /// �ʽ��ת����
        /// </summary>
        public int capit_reback_days { get; set; }
 
        /// <summary>
        /// �ֲֻ�ת����
        /// </summary>
        public int posi_reback_days { get; set; }
 
        /// <summary>
        /// ������������
        /// </summary>
        public int clear_entry_type { get; set; }
 
        /// <summary>
        /// �����־
        /// </summary>
        public int deal_flag { get; set; }
 
   }
 
   //�߼�_�����ڻ�_����_���㴦��
   public class FuncclfutuL_2_37Model : BaseModel
   {
        /// <summary>
        /// ��¼����
        /// </summary>
        public int record_count { get; set; }
 
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ������Ϣ
        /// </summary>
        public String deal_info { get; set; }
 
   }
 
   //�߼�_�����ڻ�_����_�������ô���
   public class FuncclfutuL_2_38Model : BaseModel
   {
        /// <summary>
        /// ��¼����
        /// </summary>
        public int record_count { get; set; }
 
        /// <summary>
        /// ������Ϣ
        /// </summary>
        public String deal_info { get; set; }
 
   }
 
   //�߼�_�����ڻ�_����_��ѯ�����˼�¼
   public class FuncclfutuL_2_58Model : BaseModel
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
        /// ���ұ���
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// ���ױ���
        /// </summary>
        public String exch_crncy_type { get; set; }
 
        /// <summary>
        /// ����
        /// </summary>
        public double exch_rate { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ���ױ�����
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// ��Լ������
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_type { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_unit { get; set; }
 
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
        /// ����ʱ��
        /// </summary>
        public int order_time { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int order_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// ��ƽ����
        /// </summary>
        public int contrc_dir { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int lngsht_type { get; set; }
 
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
        /// ������
        /// </summary>
        public double pre_settle_price { get; set; }
 
        /// <summary>
        /// �����
        /// </summary>
        public double sett_price { get; set; }
 
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
        /// �ɽ�����
        /// </summary>
        public int strike_num { get; set; }
 
        /// <summary>
        /// ����������
        /// </summary>
        public double pre_entry_qty { get; set; }
 
        /// <summary>
        /// �����˽��
        /// </summary>
        public double pre_entry_amt { get; set; }
 
        /// <summary>
        /// Ӧ�ձ�֤��
        /// </summary>
        public double rece_margin { get; set; }
 
        /// <summary>
        /// ��ϱ���
        /// </summary>
        public String comb_code { get; set; }
 
        /// <summary>
        /// ����ƽ��ӯ��
        /// </summary>
        public double sett_close_pandl { get; set; }
 
        /// <summary>
        /// ȫ������
        /// </summary>
        public double all_fee { get; set; }
 
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
        public double service_fee { get; set; }
 
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
        /// �ⲿȫ������
        /// </summary>
        public double out_all_fee { get; set; }
 
        /// <summary>
        /// �ⲿ�걨����
        /// </summary>
        public double out_report_fee { get; set; }
 
        /// <summary>
        /// �ⲿ��������
        /// </summary>
        public double out_cancel_fee { get; set; }
 
        /// <summary>
        /// �ⲿ�������
        /// </summary>
        public double out_deli_fee { get; set; }
 
        /// <summary>
        /// �ⲿ��������
        /// </summary>
        public double out_service_fee { get; set; }
 
        /// <summary>
        /// �ⲿ��������
        /// </summary>
        public double out_other_fee { get; set; }
 
        /// <summary>
        /// �ⲿ����Ӷ��
        /// </summary>
        public double out_brkage_commis { get; set; }
 
        /// <summary>
        /// �ⲿ����Ӷ��
        /// </summary>
        public double out_other_commis { get; set; }
 
        /// <summary>
        /// ҵ���־
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// ����״̬
        /// </summary>
        public String entry_status { get; set; }
 
        /// <summary>
        /// �ع�״̬
        /// </summary>
        public String undo_status { get; set; }
 
        /// <summary>
        /// �����ʽ���ˮ��
        /// </summary>
        public ulong entry_money_jour_no { get; set; }
 
        /// <summary>
        /// �����ʲ��˻��ֲ���ˮ��
        /// </summary>
        public ulong entry_asac_posi_jour_no { get; set; }
 
        /// <summary>
        /// ������ˮ��
        /// </summary>
        public ulong deli_jour_no { get; set; }
 
   }
 
   //�߼�_�����ڻ�_����_���˴���
   public class FuncclfutuL_2_61Model : BaseModel
   {
        /// <summary>
        /// ��¼����
        /// </summary>
        public int record_count { get; set; }
 
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ������Ϣ
        /// </summary>
        public String deal_info { get; set; }
 
   }
 
   //�߼�_�����ڻ�_����_����׼����ʱ����
   public class FuncclfutuL_2_101Model : BaseModel
   {
        /// <summary>
        /// ����ִ��״̬
        /// </summary>
        public String task_strike_status { get; set; }
 
   }
 
   //�߼�_�����ڻ�_����_���㴦��ʱ����
   public class FuncclfutuL_2_103Model : BaseModel
   {
        /// <summary>
        /// ����ִ��״̬
        /// </summary>
        public String task_strike_status { get; set; }
 
   }
 
   //�߼�_�����ڻ�_����_���˴���ʱ����
   public class FuncclfutuL_2_104Model : BaseModel
   {
        /// <summary>
        /// ����ִ��״̬
        /// </summary>
        public String task_strike_status { get; set; }
 
   }
 
   //�߼�_�����ڻ�_����_��ȡ����ͳ��ֵ
   public class FuncclfutuL_2_107Model : BaseModel
   {
        /// <summary>
        /// ��ת��ɽ���
        /// </summary>
        public double pre_switch_strike_qty { get; set; }
 
        /// <summary>
        /// ��ת��ɽ���
        /// </summary>
        public double alr_switch_strike_qty { get; set; }
 
        /// <summary>
        /// ������ɽ���
        /// </summary>
        public double pre_clr_strike_qty { get; set; }
 
        /// <summary>
        /// ������ɽ���
        /// </summary>
        public double alr_clr_strike_qty { get; set; }
 
        /// <summary>
        /// �����˼�¼��
        /// </summary>
        public double pre_entry_record_qty { get; set; }
 
        /// <summary>
        /// �����˼�¼��
        /// </summary>
        public double alr_entry_record_qty { get; set; }
 
   }
 
   //�߼�_�����ڻ�_����_��ѯ������ֲ����
   public class FuncclfutuL_2_108Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //�߼�_�����ڻ�_����_��ѯ�ɽ��ر����
   public class FuncclfutuL_2_109Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //�߼�_�����ڻ�_����_��ѯ�ɽ����
   public class FuncclfutuL_2_110Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //�߼�_�����ڻ�_����_��ѯ�����˼�¼���
   public class FuncclfutuL_2_111Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //�߼�_����֤ȯ_������ȯ����_ת��ɽ���¼
   public class FuncclsecuL_21_1Model : BaseModel
   {
        /// <summary>
        /// ��¼����
        /// </summary>
        public int record_count { get; set; }
 
        /// <summary>
        /// ������Ϣ
        /// </summary>
        public String deal_info { get; set; }
 
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ȯ����_��ѯ�ɽ���¼
   public class FuncclsecuL_21_3Model : BaseModel
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
        public String stock_code { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
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
        /// ���۱�־
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// ��Ϣ����
        /// </summary>
        public int intrst_days { get; set; }
 
        /// <summary>
        /// Ʊ����ֵ
        /// </summary>
        public double par_value { get; set; }
 
        /// <summary>
        /// ծȯ������Ϣ
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// ������������
        /// </summary>
        public int clear_entry_type { get; set; }
 
        /// <summary>
        /// �����־
        /// </summary>
        public int deal_flag { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ȯ����_��ѯת��ɽ���¼
   public class FuncclsecuL_21_4Model : BaseModel
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
        /// �ɽ�ʱ��
        /// </summary>
        public int strike_time { get; set; }
 
        /// <summary>
        /// �ɽ����
        /// </summary>
        public String strike_no { get; set; }
 
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
        public int order_dir { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// ��������־
        /// </summary>
        public int sett_flag { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ȯ����_���㴦��
   public class FuncclsecuL_21_11Model : BaseModel
   {
        /// <summary>
        /// ��¼����
        /// </summary>
        public int record_count { get; set; }
 
        /// <summary>
        /// ������Ϣ
        /// </summary>
        public String deal_info { get; set; }
 
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ȯ����_��ѯ�ϲ������¼
   public class FuncclsecuL_21_13Model : BaseModel
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
        public int strike_num { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_aver_price { get; set; }
 
        /// <summary>
        /// ����������
        /// </summary>
        public double pre_entry_qty { get; set; }
 
        /// <summary>
        /// �����˽��
        /// </summary>
        public double pre_entry_amt { get; set; }
 
        /// <summary>
        /// �ֱ��ۼƳɽ�����
        /// </summary>
        public double split_strike_qty { get; set; }
 
        /// <summary>
        /// �ֱ��ۼƳɽ����
        /// </summary>
        public double split_strike_amt { get; set; }
 
        /// <summary>
        /// �ֱ��ۼ�ӡ��˰
        /// </summary>
        public double split_stamp_tax { get; set; }
 
        /// <summary>
        /// �ֱ��ۼƹ�����
        /// </summary>
        public double split_trans_fee { get; set; }
 
        /// <summary>
        /// �ֱ��ۼƾ��ַ�
        /// </summary>
        public double split_brkage { get; set; }
 
        /// <summary>
        /// �ֱ��ۼ�֤�ܷ�
        /// </summary>
        public double split_SEC_charges { get; set; }
 
        /// <summary>
        /// �ֱ��ۼ���������
        /// </summary>
        public double split_other_fee { get; set; }
 
        /// <summary>
        /// �ֱ��ۼƽ���Ӷ��
        /// </summary>
        public double split_brkage_commis { get; set; }
 
        /// <summary>
        /// �ֱ��ۼ�����Ӷ��
        /// </summary>
        public double split_chann_commis { get; set; }
 
        /// <summary>
        /// �ֱ��ۼƷֳ�Ӷ��
        /// </summary>
        public double split_divi_commis { get; set; }
 
        /// <summary>
        /// �ֱ��ۼ�����Ӷ��
        /// </summary>
        public double split_other_commis { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// ���۱�־
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// ��Ϣ����
        /// </summary>
        public int intrst_days { get; set; }
 
        /// <summary>
        /// Ʊ����ֵ
        /// </summary>
        public double par_value { get; set; }
 
        /// <summary>
        /// ծȯ������Ϣ
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// ������������
        /// </summary>
        public int clear_entry_type { get; set; }
 
        /// <summary>
        /// ҵ���־
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// �����־
        /// </summary>
        public int deal_flag { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ȯ����_�ϲ����㴦��
   public class FuncclsecuL_21_15Model : BaseModel
   {
        /// <summary>
        /// ��¼����
        /// </summary>
        public int record_count { get; set; }
 
        /// <summary>
        /// ������Ϣ
        /// </summary>
        public String deal_info { get; set; }
 
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ȯ����_��ѯ�����˼�¼
   public class FuncclsecuL_21_23Model : BaseModel
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
        /// ��ծ����
        /// </summary>
        public double debt_qty { get; set; }
 
        /// <summary>
        /// ��ծ���
        /// </summary>
        public double debt_amt { get; set; }
 
        /// <summary>
        /// ��ծ����
        /// </summary>
        public int debt_type { get; set; }
 
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
        /// �ɽ���ˮ��
        /// </summary>
        public ulong busi_jour_no { get; set; }
 
        /// <summary>
        /// �����ʽ���ˮ��
        /// </summary>
        public ulong entry_money_jour_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// ��Ϣ����
        /// </summary>
        public int intrst_days { get; set; }
 
        /// <summary>
        /// ծȯ������Ϣ
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ȯ����_���˴���
   public class FuncclsecuL_21_24Model : BaseModel
   {
        /// <summary>
        /// ��¼����
        /// </summary>
        public int record_count { get; set; }
 
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ȯ����_�ɽ�ת�붨ʱ����
   public class FuncclsecuL_21_151Model : BaseModel
   {
        /// <summary>
        /// ����ִ��״̬
        /// </summary>
        public String task_strike_status { get; set; }
 
        /// <summary>
        /// ��ѯ���
        /// </summary>
        public int qry_no { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ȯ����_���㴦��ʱ����
   public class FuncclsecuL_21_153Model : BaseModel
   {
        /// <summary>
        /// ����ִ��״̬
        /// </summary>
        public String task_strike_status { get; set; }
 
        /// <summary>
        /// ��ѯ���
        /// </summary>
        public int qry_no { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ȯ����_���˴���ʱ����
   public class FuncclsecuL_21_154Model : BaseModel
   {
        /// <summary>
        /// ����ִ��״̬
        /// </summary>
        public String task_strike_status { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ȯ����_��ѯͳ������
   public class FuncclsecuL_21_202Model : BaseModel
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
        /// ҵ���־
        /// </summary>
        public int busi_flag { get; set; }
 
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
        /// �������
        /// </summary>
        public int clear_num { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public int strike_num { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_aver_price { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// �ɽ����
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double entry_qty { get; set; }
 
        /// <summary>
        /// ���˽��
        /// </summary>
        public double entry_amt { get; set; }
 
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
        public double chann_commis { get; set; }
 
        /// <summary>
        /// �ֳ�Ӷ��
        /// </summary>
        public double divi_commis { get; set; }
 
        /// <summary>
        /// ����Ӷ��
        /// </summary>
        public double other_commis { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ȯ����_��ȡ����ͳ��ֵ
   public class FuncclsecuL_21_203Model : BaseModel
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
 
   //�߼�_����֤ȯ_������ȯ����_��ѯ�ɽ���¼���
   public class FuncclsecuL_21_204Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ȯ����_��ѯ����ɽ���¼���
   public class FuncclsecuL_21_205Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ȯ����_��ѯ�ϲ������¼���
   public class FuncclsecuL_21_206Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //�߼�_����֤ȯ_������ȯ����_��ѯ�����˼�¼���
   public class FuncclsecuL_21_207Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
}

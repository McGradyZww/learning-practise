using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //�߼�_����_�����ͻ���_��ȡ��������ʱ��
   public class FuncpubL_17_8Model : BaseModel
   {
        /// <summary>
        /// ��������
        /// </summary>
        public int mach_date { get; set; }
 
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int mach_time { get; set; }
 
   }
 
   //�߼�_����_�����ͻ���_��ѯ������Ϣ
   public class FuncpubL_17_18Model : BaseModel
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
        /// ��������
        /// </summary>
        public String co_name { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int co_type { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int create_date { get; set; }
 
        /// <summary>
        /// ��ϵ��ַ
        /// </summary>
        public String conta_addr { get; set; }
 
        /// <summary>
        /// ��ϵ��
        /// </summary>
        public String conta_name { get; set; }
 
        /// <summary>
        /// �绰
        /// </summary>
        public String phone_number { get; set; }
 
        /// <summary>
        /// ��Ʒ��������
        /// </summary>
        public int pd_qty_max { get; set; }
 
        /// <summary>
        /// �˻���������
        /// </summary>
        public int max_acco_count { get; set; }
 
        /// <summary>
        /// ����Ա��������
        /// </summary>
        public int opor_qty_max { get; set; }
 
        /// <summary>
        /// ����״̬
        /// </summary>
        public String co_status { get; set; }
 
        /// <summary>
        /// ����Ͷ���г�
        /// </summary>
        public String allow_exch { get; set; }
 
        /// <summary>
        /// �������֤ȯ����
        /// </summary>
        public String allow_stock_type { get; set; }
 
        /// <summary>
        /// ҵ��������ô�
        /// </summary>
        public String busi_config_str { get; set; }
 
        /// <summary>
        /// ָ����������Ա
        /// </summary>
        public int comm_appr_oper { get; set; }
 
        /// <summary>
        /// �м۶��ḡ������
        /// </summary>
        public double market_price_ratio { get; set; }
 
        /// <summary>
        /// ���˻����׷�������
        /// </summary>
        public String mul_acco_trd_assign_set { get; set; }
 
        /// <summary>
        /// ���˻������˻�ѡ��
        /// </summary>
        public int mul_acco_trd_choice { get; set; }
 
        /// <summary>
        /// ���˻�������������
        /// </summary>
        public String mul_acco_trd_qty_set { get; set; }
 
        /// <summary>
        /// �����㷨��������
        /// </summary>
        public String genus_algo_strategy_set { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public String base_crncy_type { get; set; }
 
   }
 
   //�߼�_����_�����ͻ���_��ѯϵͳ����
   public class FuncpubL_17_32Model : BaseModel
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
        /// ���ñ��
        /// </summary>
        public ulong config_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public String config_name { get; set; }
 
        /// <summary>
        /// ����ѡ��ģʽ
        /// </summary>
        public int config_choice_type { get; set; }
 
        /// <summary>
        /// ����ֵ
        /// </summary>
        public String config_value { get; set; }
 
        /// <summary>
        /// �ֵ��ֶ���
        /// </summary>
        public String dict_field_name { get; set; }
 
        /// <summary>
        /// ����˵��
        /// </summary>
        public String config_memo { get; set; }
 
   }
 
   //�߼�_����_�����ͻ���_��ѯ��������
   public class FuncpubL_17_38Model : BaseModel
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
        /// ��ұ���
        /// </summary>
        public String for_crncy_type { get; set; }
 
        /// <summary>
        /// ���ұ���
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public double buy_exch_rate { get; set; }
 
        /// <summary>
        /// �ۻ����
        /// </summary>
        public double sale_exch_rate { get; set; }
 
   }
 
   //�߼�_����_�����ͻ���_����ͨ��
   public class FuncpubL_17_154Model : BaseModel
   {
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
   }
 
   //�߼�_����_�����ͻ���_����ͨ��
   public class FuncpubL_17_155Model : BaseModel
   {
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
   }
 
   //�߼�_����_�����ͻ���_��ȡ�۹�ͨ������Ϣ
   public class FuncpubL_17_117Model : BaseModel
   {
        /// <summary>
        /// ����ͨ����ο�����
        /// </summary>
        public double sh_hk_buy_ref_rate { get; set; }
 
        /// <summary>
        /// ����ͨ�����ο�����
        /// </summary>
        public double sh_hk_sell_ref_rate { get; set; }
 
        /// <summary>
        /// ����ͨ����������
        /// </summary>
        public double sh_hk_settle_buy_rate { get; set; }
 
        /// <summary>
        /// ����ͨ�����������
        /// </summary>
        public double sh_hk_settle_sell_rate { get; set; }
 
        /// <summary>
        /// ���ͨ����ο�����
        /// </summary>
        public double sz_hk_buy_ref_rate { get; set; }
 
        /// <summary>
        /// ���ͨ�����ο�����
        /// </summary>
        public double sz_hk_sell_ref_rate { get; set; }
 
        /// <summary>
        /// ���ͨ����������
        /// </summary>
        public double sz_hk_settle_buy_rate { get; set; }
 
        /// <summary>
        /// ���ͨ�����������
        /// </summary>
        public double sz_hksettle_sell_rate { get; set; }
 
   }
 
   //�߼�_����_�����ͻ���_���¸۹�ͨ�����Ϣ
   public class FuncpubL_17_118Model : BaseModel
   {
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //�߼�_����_�����ͻ���_��ѯ�۹�ͨ�����Ϣ
   public class FuncpubL_17_119Model : BaseModel
   {
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ���ճ�ʼ���
        /// </summary>
        public double begin_limit { get; set; }
 
        /// <summary>
        /// ����ʣ����
        /// </summary>
        public double remain_limit { get; set; }
 
        /// <summary>
        /// ���״̬
        /// </summary>
        public int limit_status { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //�߼�_����_�����ͻ���_��ѯ�����ֵ�
   public class FuncpubL_17_180Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// �ֵ���
        /// </summary>
        public int dict_no { get; set; }
 
        /// <summary>
        /// �ֵ�����
        /// </summary>
        public String dict_name { get; set; }
 
        /// <summary>
        /// �ֵ��ֶ���
        /// </summary>
        public String dict_field_name { get; set; }
 
        /// <summary>
        /// �ֵ�������
        /// </summary>
        public String dict_item_name { get; set; }
 
        /// <summary>
        /// �ֵ���ֵ
        /// </summary>
        public String dict_item_value { get; set; }
 
        /// <summary>
        /// ʱ���
        /// </summary>
        public int time_stamp { get; set; }
 
   }
 
   //�߼�_����_�����ͻ���_��ѯҵ���־
   public class FuncpubL_17_181Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ҵ�����
        /// </summary>
        public int busi_type { get; set; }
 
        /// <summary>
        /// ҵ������
        /// </summary>
        public int busi_sub_type { get; set; }
 
        /// <summary>
        /// ҵ���־
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// ҵ������
        /// </summary>
        public String busi_name { get; set; }
 
        /// <summary>
        /// ʱ���
        /// </summary>
        public int time_stamp { get; set; }
 
   }
 
   //�߼�_����_�����ͻ���_��ȡ����֤ȯ����
   public class FuncpubL_17_182Model : BaseModel
   {
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
 
   }
 
   //�߼�_����_�����ͻ���_��ȡ����۹�ͨ������Ϣ
   public class FuncpubL_17_120Model : BaseModel
   {
        /// <summary>
        /// ����ͨ����ο�����
        /// </summary>
        public double sh_hk_buy_ref_rate { get; set; }
 
        /// <summary>
        /// ����ͨ�����ο�����
        /// </summary>
        public double sh_hk_sell_ref_rate { get; set; }
 
        /// <summary>
        /// ����ͨ����������
        /// </summary>
        public double sh_hk_settle_buy_rate { get; set; }
 
        /// <summary>
        /// ����ͨ�����������
        /// </summary>
        public double sh_hk_settle_sell_rate { get; set; }
 
        /// <summary>
        /// ���ͨ����ο�����
        /// </summary>
        public double sz_hk_buy_ref_rate { get; set; }
 
        /// <summary>
        /// ���ͨ�����ο�����
        /// </summary>
        public double sz_hk_sell_ref_rate { get; set; }
 
        /// <summary>
        /// ���ͨ����������
        /// </summary>
        public double sz_hk_settle_buy_rate { get; set; }
 
        /// <summary>
        /// ���ͨ�����������
        /// </summary>
        public double sz_hksettle_sell_rate { get; set; }
 
        /// <summary>
        /// ҵ������
        /// </summary>
        public int busin_date { get; set; }
 
        /// <summary>
        /// �й����л���
        /// </summary>
        public double pboc_rate { get; set; }
 
   }
 
   //�߼�_����_�����ͻ���_��ѯ�Գ�������Ϣ�����
   public class FuncpubL_17_126Model : BaseModel
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
        /// ��¼����
        /// </summary>
        public int record_batch_no { get; set; }
 
        /// <summary>
        /// ָ��ױ�־
        /// </summary>
        public int comm_trd_type { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public ulong basket_id { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public String basket_name { get; set; }
 
        /// <summary>
        /// �ڻ�����
        /// </summary>
        public double futu_qty { get; set; }
 
        /// <summary>
        /// �ֻ�����
        /// </summary>
        public double spot_qty { get; set; }
 
        /// <summary>
        /// ���ӷ���
        /// </summary>
        public double basket_copies { get; set; }
 
        /// <summary>
        /// ����ʣ�����
        /// </summary>
        public double remain_copies { get; set; }
 
        /// <summary>
        /// �ֽ�������
        /// </summary>
        public double cash_replace_amt { get; set; }
 
        /// <summary>
        /// �Գ��̿�
        /// </summary>
        public double hedging_pankou { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public double name_base_diff { get; set; }
 
        /// <summary>
        /// ���ӻ���
        /// </summary>
        public double basket_base_diff { get; set; }
 
        /// <summary>
        /// ���ٻ���
        /// </summary>
        public double track_base_diff { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //�߼�_����_�����ͻ���_��ѯ��ʷ�Գ�������Ϣ�����
   public class FuncpubL_17_127Model : BaseModel
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
        /// ��¼����
        /// </summary>
        public int record_batch_no { get; set; }
 
        /// <summary>
        /// ָ��ױ�־
        /// </summary>
        public int comm_trd_type { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public ulong basket_id { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public String basket_name { get; set; }
 
        /// <summary>
        /// �ڻ�����
        /// </summary>
        public double futu_qty { get; set; }
 
        /// <summary>
        /// �ֻ�����
        /// </summary>
        public double spot_qty { get; set; }
 
        /// <summary>
        /// ���ӷ���
        /// </summary>
        public double basket_copies { get; set; }
 
        /// <summary>
        /// ����ʣ�����
        /// </summary>
        public double remain_copies { get; set; }
 
        /// <summary>
        /// �ֽ�������
        /// </summary>
        public double cash_replace_amt { get; set; }
 
        /// <summary>
        /// �Գ��̿�
        /// </summary>
        public double hedging_pankou { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public double name_base_diff { get; set; }
 
        /// <summary>
        /// ���ӻ���
        /// </summary>
        public double basket_base_diff { get; set; }
 
        /// <summary>
        /// ���ٻ���
        /// </summary>
        public double track_base_diff { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
   }
 
}

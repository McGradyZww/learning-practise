using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //�߼�_��Ʒ_�ʽ���ά_��ѯ��Ʒ�ʽ�
   public class FuncprodL_4_1Model : BaseModel
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
        /// ���ұ���
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// �ڳ����
        /// </summary>
        public double begin_amt { get; set; }
 
        /// <summary>
        /// ԭʼ���
        /// </summary>
        public double first_amt { get; set; }
 
        /// <summary>
        /// ��ǰ���
        /// </summary>
        public double curr_amt { get; set; }
 
        /// <summary>
        /// ��Ʒ�ѷ�����
        /// </summary>
        public double pd_dist_amt { get; set; }
 
        /// <summary>
        /// ��Ʒ����Ȩ���
        /// </summary>
        public double pd_auth_amt { get; set; }
 
        /// <summary>
        /// ���˶Բ��
        /// </summary>
        public double amt_check_diff { get; set; }
 
        /// <summary>
        /// �����ս��
        /// </summary>
        public double pre_settle_amt { get; set; }
 
        /// <summary>
        /// �ۼ����ֽ��
        /// </summary>
        public double total_cash_divide { get; set; }
 
        /// <summary>
        /// �ۼƼ������
        /// </summary>
        public double total_pre_fee { get; set; }
 
        /// <summary>
        /// �ۼ�Ӧ�ս��
        /// </summary>
        public double total_rece_amt { get; set; }
 
        /// <summary>
        /// �ۼ�Ӧ�����
        /// </summary>
        public double total_payab_amt { get; set; }
 
        /// <summary>
        /// Ԥ����Ϣ
        /// </summary>
        public double intrst_cacl_amt { get; set; }
 
        /// <summary>
        /// ��������Ϣ
        /// </summary>
        public double pre_entry_intrst_amt { get; set; }
 
   }
 
   //�߼�_��Ʒ_�ʽ���ά_��ѯ��ʷ��Ʒ�ʽ�
   public class FuncprodL_4_2Model : BaseModel
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
        /// ���ұ���
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// �ڳ����
        /// </summary>
        public double begin_amt { get; set; }
 
        /// <summary>
        /// ԭʼ���
        /// </summary>
        public double first_amt { get; set; }
 
        /// <summary>
        /// ��ǰ���
        /// </summary>
        public double curr_amt { get; set; }
 
        /// <summary>
        /// ��Ʒ�ѷ�����
        /// </summary>
        public double pd_dist_amt { get; set; }
 
        /// <summary>
        /// ��Ʒ����Ȩ���
        /// </summary>
        public double pd_auth_amt { get; set; }
 
        /// <summary>
        /// ���˶Բ��
        /// </summary>
        public double amt_check_diff { get; set; }
 
        /// <summary>
        /// �����ս��
        /// </summary>
        public double pre_settle_amt { get; set; }
 
        /// <summary>
        /// �ۼ����ֽ��
        /// </summary>
        public double total_cash_divide { get; set; }
 
        /// <summary>
        /// �ۼƼ������
        /// </summary>
        public double total_pre_fee { get; set; }
 
        /// <summary>
        /// �ۼ�Ӧ�ս��
        /// </summary>
        public double total_rece_amt { get; set; }
 
        /// <summary>
        /// �ۼ�Ӧ�����
        /// </summary>
        public double total_payab_amt { get; set; }
 
        /// <summary>
        /// Ԥ����Ϣ
        /// </summary>
        public double intrst_cacl_amt { get; set; }
 
        /// <summary>
        /// ��������Ϣ
        /// </summary>
        public double pre_entry_intrst_amt { get; set; }
 
   }
 
   //�߼�_��Ʒ_�ʽ���ά_��ѯ��Ʒ�ʽ���ˮ
   public class FuncprodL_4_5Model : BaseModel
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
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// ���ұ���
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// ҵ���־
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// �䶯���
        /// </summary>
        public double occur_amt { get; set; }
 
        /// <summary>
        /// �䶯����
        /// </summary>
        public double occur_end_amt { get; set; }
 
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
 
   //�߼�_��Ʒ_�ʽ���ά_��ѯ��ʷ��Ʒ�ʽ���ˮ
   public class FuncprodL_4_6Model : BaseModel
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
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// ���ұ���
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// ҵ���־
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// �䶯���
        /// </summary>
        public double occur_amt { get; set; }
 
        /// <summary>
        /// �䶯����
        /// </summary>
        public double occur_end_amt { get; set; }
 
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
 
   //�߼�_��Ʒ_�ʽ���ά_��ѯ��Ʒ�ʲ�
   public class FuncprodL_4_7Model : BaseModel
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
        /// ���ұ���
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// �ڳ����ʲ�
        /// </summary>
        public double begin_NAV { get; set; }
 
        /// <summary>
        /// ���ʲ�
        /// </summary>
        public double nav_asset { get; set; }
 
        /// <summary>
        /// ���ֽ��ʲ�
        /// </summary>
        public double total_cash_asset { get; set; }
 
        /// <summary>
        /// ֤ȯ�ֽ��ʲ�
        /// </summary>
        public double stock_cash_asset { get; set; }
 
        /// <summary>
        /// �ڻ��ֽ��ʲ�
        /// </summary>
        public double futu_cash_asset { get; set; }
 
        /// <summary>
        /// ��Ʊ�ʲ�
        /// </summary>
        public double stock_asset { get; set; }
 
        /// <summary>
        /// �����ʲ�
        /// </summary>
        public double fund_asset { get; set; }
 
        /// <summary>
        /// ծȯ�ʲ�
        /// </summary>
        public double bond_asset { get; set; }
 
        /// <summary>
        /// �ڻ��ʲ�
        /// </summary>
        public double futu_asset { get; set; }
 
        /// <summary>
        /// �ع��ʲ�
        /// </summary>
        public double repo_asset { get; set; }
 
        /// <summary>
        /// �����ʲ�
        /// </summary>
        public double other_asset { get; set; }
 
        /// <summary>
        /// �۹�ͨ�ʲ�
        /// </summary>
        public double hk_thrgh_stock_asset { get; set; }
 
   }
 
   //�߼�_��Ʒ_�ʽ���ά_��ѯ��ʷ��Ʒ�ʲ�
   public class FuncprodL_4_8Model : BaseModel
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
        /// ���ұ���
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// �ڳ����ʲ�
        /// </summary>
        public double begin_NAV { get; set; }
 
        /// <summary>
        /// ���ʲ�
        /// </summary>
        public double nav_asset { get; set; }
 
        /// <summary>
        /// ���ֽ��ʲ�
        /// </summary>
        public double total_cash_asset { get; set; }
 
        /// <summary>
        /// ֤ȯ�ֽ��ʲ�
        /// </summary>
        public double stock_cash_asset { get; set; }
 
        /// <summary>
        /// �ڻ��ֽ��ʲ�
        /// </summary>
        public double futu_cash_asset { get; set; }
 
        /// <summary>
        /// ��Ʊ�ʲ�
        /// </summary>
        public double stock_asset { get; set; }
 
        /// <summary>
        /// �����ʲ�
        /// </summary>
        public double fund_asset { get; set; }
 
        /// <summary>
        /// ծȯ�ʲ�
        /// </summary>
        public double bond_asset { get; set; }
 
        /// <summary>
        /// �ڻ��ʲ�
        /// </summary>
        public double futu_asset { get; set; }
 
        /// <summary>
        /// �ع��ʲ�
        /// </summary>
        public double repo_asset { get; set; }
 
        /// <summary>
        /// �����ʲ�
        /// </summary>
        public double other_asset { get; set; }
 
        /// <summary>
        /// �۹�ͨ�ʲ�
        /// </summary>
        public double hk_thrgh_stock_asset { get; set; }
 
   }
 
}

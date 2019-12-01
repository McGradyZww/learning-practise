using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //�߼�_��Ʒ_�˻���ά_��ѯȫ����Ʒ
   public class FuncprodL_5_1Model : BaseModel
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
        /// ��Ʒ״̬
        /// </summary>
        public String pd_status { get; set; }
 
   }
 
   //�߼�_��Ʒ_�˻���ά_��ѯȫ���ʲ��˻�
   public class FuncprodL_5_2Model : BaseModel
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
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// �ʲ��˻�
        /// </summary>
        public String asset_acco { get; set; }
 
        /// <summary>
        /// �ʲ��˻�����
        /// </summary>
        public String asset_acco_name { get; set; }
 
        /// <summary>
        /// �ʲ��˻�״̬
        /// </summary>
        public String asset_acco_status { get; set; }
 
        /// <summary>
        /// �ⲿ�˺�
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// Ӫҵ��
        /// </summary>
        public String busi_depart { get; set; }
 
   }
 
   //�߼�_��Ʒ_�˻���ά_��ѯ��Ʒ��Ϣ
   public class FuncprodL_5_4Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
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
        /// ��Ʒȫ��
        /// </summary>
        public String pd_flname { get; set; }
 
        /// <summary>
        /// ��Ʒ������
        /// </summary>
        public String pd_manager { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int found_date { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public int pd_type { get; set; }
 
        /// <summary>
        /// ļ������
        /// </summary>
        public String apply_currency { get; set; }
 
        /// <summary>
        /// ���ұ���
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// ԭʼ�ʲ�
        /// </summary>
        public double first_asset { get; set; }
 
        /// <summary>
        /// ԭʼ���
        /// </summary>
        public double first_amt { get; set; }
 
        /// <summary>
        /// ��Ʒ�ܷݶ�
        /// </summary>
        public double pd_all_share { get; set; }
 
        /// <summary>
        /// ��ǰ�ݶ�
        /// </summary>
        public double curr_share { get; set; }
 
        /// <summary>
        /// ���շݶ�
        /// </summary>
        public double pre_share { get; set; }
 
        /// <summary>
        /// ��ʷ��ߵ�λ��ֵ
        /// </summary>
        public double his_max_per_nav { get; set; }
 
        /// <summary>
        /// ���վ�ֵ
        /// </summary>
        public double pre_nav { get; set; }
 
        /// <summary>
        /// �����й���ȫ��
        /// </summary>
        public String coust_full_name { get; set; }
 
        /// <summary>
        /// �����й��˻�
        /// </summary>
        public String coust_acco { get; set; }
 
        /// <summary>
        /// �����й��˻���
        /// </summary>
        public String coust_acco_name { get; set; }
 
        /// <summary>
        /// �ɱ����㷽ʽ
        /// </summary>
        public int cost_calc_type { get; set; }
 
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
        /// ��ֹ��������
        /// </summary>
        public String forbid_order_dir { get; set; }
 
        /// <summary>
        /// Ԥ����
        /// </summary>
        public double warn_posi_value { get; set; }
 
        /// <summary>
        /// ƽ����
        /// </summary>
        public double close_posi_value { get; set; }
 
        /// <summary>
        /// Ŀ���λ
        /// </summary>
        public double target_posi_ratio { get; set; }
 
        /// <summary>
        /// betaϵ��
        /// </summary>
        public double beta_coeffi { get; set; }
 
        /// <summary>
        /// �Զ����Ʒ����
        /// </summary>
        public String custom_pd_class { get; set; }
 
        /// <summary>
        /// ��Ʒ״̬
        /// </summary>
        public String pd_status { get; set; }
 
        /// <summary>
        /// ����ֵ
        /// </summary>
        public int index_value { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //�߼�_��Ʒ_�˻���ά_��ѯ�ʲ��˻���Ϣ
   public class FuncprodL_5_6Model : BaseModel
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
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// �ʲ��˻�
        /// </summary>
        public String asset_acco { get; set; }
 
        /// <summary>
        /// �ʲ��˻�����
        /// </summary>
        public String asset_acco_name { get; set; }
 
        /// <summary>
        /// �ʲ��˻�����
        /// </summary>
        public int asset_acco_type { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public String trade_pwd { get; set; }
 
        /// <summary>
        /// �ʲ��˻�״̬
        /// </summary>
        public String asset_acco_status { get; set; }
 
        /// <summary>
        /// ҵ��������ô�
        /// </summary>
        public String busi_config_str { get; set; }
 
        /// <summary>
        /// �м۶��ḡ������
        /// </summary>
        public double market_price_ratio { get; set; }
 
        /// <summary>
        /// ����Ͷ���г�
        /// </summary>
        public String allow_exch { get; set; }
 
        /// <summary>
        /// �������֤ȯ����
        /// </summary>
        public String allow_stock_type { get; set; }
 
        /// <summary>
        /// �ֱʷ������ʹ�
        /// </summary>
        public String split_fee_typr_str { get; set; }
 
        /// <summary>
        /// ҵ�����ƴ�
        /// </summary>
        public String busi_limit_str { get; set; }
 
        /// <summary>
        /// ����ָ���־
        /// </summary>
        public int exter_comm_flag { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //�߼�_��Ʒ_�˻���ά_��ѯ֤ȯͬ�������ʲ��˻���Ϣ
   public class FuncprodL_5_8Model : BaseModel
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
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// �ʲ��˻�
        /// </summary>
        public String asset_acco { get; set; }
 
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// �ⲿ�˺�
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// ����״̬
        /// </summary>
        public int online_status { get; set; }
 
   }
 
   //�߼�_��Ʒ_�˻���ά_��ѯȫ���ʲ��˻�ͨ����Ϣ
   public class FuncprodL_5_74Model : BaseModel
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
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// ͨ������
        /// </summary>
        public int pass_type { get; set; }
 
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// �ⲿ�˺�
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// ����״̬
        /// </summary>
        public int online_status { get; set; }
 
        /// <summary>
        /// �������ô�
        /// </summary>
        public String config_str { get; set; }
 
        /// <summary>
        /// �Ѷ����
        /// </summary>
        public int read_flag { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //�߼�_��Ʒ_�˻���ά_��ѯ�����ʲ��ʻ����͵Ĳ�Ʒ
   public class FuncprodL_5_76Model : BaseModel
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
        /// ��Ʒ״̬
        /// </summary>
        public String pd_status { get; set; }
 
   }
 
   //�߼�_��Ʒ_�˻���ά_��ѯ���̻�дͨ����Ϣ
   public class FuncprodL_5_77Model : BaseModel
   {
        /// <summary>
        /// MAC��ַ
        /// </summary>
        public String mac_addr { get; set; }
 
        /// <summary>
        /// ���̱�ʶ
        /// </summary>
        public String offer_name { get; set; }
 
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// ���̷���������
        /// </summary>
        public String offer_server_name { get; set; }
 
        /// <summary>
        /// ���̷�����IP
        /// </summary>
        public String offer_server_ip { get; set; }
 
        /// <summary>
        /// ��������ʱ��
        /// </summary>
        public int software_start_time { get; set; }
 
        /// <summary>
        /// ͨ��״̬
        /// </summary>
        public String pass_status { get; set; }
 
        /// <summary>
        /// �����ֶ�1
        /// </summary>
        public String bkup_field_1 { get; set; }
 
        /// <summary>
        /// �����ֶ�2
        /// </summary>
        public int bkup_field_2 { get; set; }
 
        /// <summary>
        /// �����ֶ�3
        /// </summary>
        public double bkup_field_3 { get; set; }
 
   }
 
   //�߼�_��Ʒ_�˻���ά_��ѯ��Ʒ������Ϣ
   public class FuncprodL_5_82Model : BaseModel
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
        /// �ɱ����㷽ʽ
        /// </summary>
        public int cost_calc_type { get; set; }
 
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
        /// ��ֹ��������
        /// </summary>
        public String forbid_order_dir { get; set; }
 
        /// <summary>
        /// ��Ʒ״̬
        /// </summary>
        public String pd_status { get; set; }
 
        /// <summary>
        /// ָ��޼۸�������
        /// </summary>
        public double comm_no_limit_price_ratio { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //�߼�_��Ʒ_�˻���ά_������Ʒ��Ϣ
   public class FuncprodL_5_83Model : BaseModel
   {
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
   }
 
   //�߼�_��Ʒ_�˻���ά_�����Ʒ��Ϣ
   public class FuncprodL_5_84Model : BaseModel
   {
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
   }
 
   //�߼�_��Ʒ_�˻���ά_�����ʲ��˻���Ϣ
   public class FuncprodL_5_86Model : BaseModel
   {
        /// <summary>
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no { get; set; }
 
   }
 
   //�߼�_��Ʒ_�˻���ά_��ѯ���в�Ʒ��Ϣ
   public class FuncprodL_5_93Model : BaseModel
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
        /// ��Ʒȫ��
        /// </summary>
        public String pd_flname { get; set; }
 
        /// <summary>
        /// ���𱸰����
        /// </summary>
        public String fund_reg_code { get; set; }
 
        /// <summary>
        /// ��Ʒ������
        /// </summary>
        public String pd_manager { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int found_date { get; set; }
 
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public int pd_type { get; set; }
 
        /// <summary>
        /// ļ������
        /// </summary>
        public String apply_currency { get; set; }
 
        /// <summary>
        /// ���ұ���
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// ԭʼ�ʲ�
        /// </summary>
        public double first_asset { get; set; }
 
        /// <summary>
        /// ԭʼ���
        /// </summary>
        public double first_amt { get; set; }
 
        /// <summary>
        /// ��Ʒ�ܷݶ�
        /// </summary>
        public double pd_all_share { get; set; }
 
        /// <summary>
        /// ��ǰ�ݶ�
        /// </summary>
        public double curr_share { get; set; }
 
        /// <summary>
        /// ���շݶ�
        /// </summary>
        public double pre_share { get; set; }
 
        /// <summary>
        /// ��ʷ��ߵ�λ��ֵ
        /// </summary>
        public double his_max_per_nav { get; set; }
 
        /// <summary>
        /// ���վ�ֵ
        /// </summary>
        public double pre_nav { get; set; }
 
        /// <summary>
        /// �����й���ȫ��
        /// </summary>
        public String coust_full_name { get; set; }
 
        /// <summary>
        /// �����й��˻�
        /// </summary>
        public String coust_acco { get; set; }
 
        /// <summary>
        /// �����й��˻���
        /// </summary>
        public String coust_acco_name { get; set; }
 
        /// <summary>
        /// Ԥ����
        /// </summary>
        public double warn_posi_value { get; set; }
 
        /// <summary>
        /// ƽ����
        /// </summary>
        public double close_posi_value { get; set; }
 
        /// <summary>
        /// Ŀ���λ
        /// </summary>
        public double target_posi_ratio { get; set; }
 
        /// <summary>
        /// betaϵ��
        /// </summary>
        public double beta_coeffi { get; set; }
 
        /// <summary>
        /// �Զ����Ʒ����
        /// </summary>
        public String custom_pd_class { get; set; }
 
        /// <summary>
        /// ��Ʒ״̬
        /// </summary>
        public String pd_status { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// ����ֵ
        /// </summary>
        public int index_value { get; set; }
 
   }
 
}

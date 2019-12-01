using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //�߼�_��Ʒ֤ȯ_�ֲ�_��ѯ������ֲ�
   public class FuncpdsecuL_3_21Model : BaseModel
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
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// Ͷ������
        /// </summary>
        public int invest_type { get; set; }
 
        /// <summary>
        /// �ڳ�����
        /// </summary>
        public double begin_qty { get; set; }
 
        /// <summary>
        /// ��ǰ����
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// ����������
        /// </summary>
        public double pre_settle_qty { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double frozen_qty { get; set; }
 
        /// <summary>
        /// �ⶳ����
        /// </summary>
        public double unfroz_qty { get; set; }
 
        /// <summary>
        /// �ֲֺ˶Բ��
        /// </summary>
        public double posi_qty_check_diff { get; set; }
 
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
 
   }
 
   //�߼�_��Ʒ֤ȯ_�ֲ�_��ѯ��ʷ������ֲ�
   public class FuncpdsecuL_3_22Model : BaseModel
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
        /// Ͷ������
        /// </summary>
        public int invest_type { get; set; }
 
        /// <summary>
        /// �ڳ�����
        /// </summary>
        public double begin_qty { get; set; }
 
        /// <summary>
        /// ��ǰ����
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// ����������
        /// </summary>
        public double pre_settle_qty { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double frozen_qty { get; set; }
 
        /// <summary>
        /// �ⶳ����
        /// </summary>
        public double unfroz_qty { get; set; }
 
        /// <summary>
        /// �ֲֺ˶Բ��
        /// </summary>
        public double posi_qty_check_diff { get; set; }
 
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
 
   }
 
   //�߼�_��Ʒ֤ȯ_�ֲ�_��ѯ������ֲ���ˮ
   public class FuncpdsecuL_3_31Model : BaseModel
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
        /// �����˵�
        /// </summary>
        public int oper_menu_no { get; set; }
 
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
        /// ҵ���־
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// �䶯����
        /// </summary>
        public double occur_qty { get; set; }
 
        /// <summary>
        /// �䶯������
        /// </summary>
        public double occur_end_qty { get; set; }
 
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
 
        /// <summary>
        /// Ͷ������
        /// </summary>
        public int invest_type { get; set; }
 
   }
 
   //�߼�_��Ʒ֤ȯ_�ֲ�_��ѯ��ʷ������ֲ���ˮ
   public class FuncpdsecuL_3_32Model : BaseModel
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
        /// �����˵�
        /// </summary>
        public int oper_menu_no { get; set; }
 
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
        /// ҵ���־
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// �䶯����
        /// </summary>
        public double occur_qty { get; set; }
 
        /// <summary>
        /// �䶯������
        /// </summary>
        public double occur_end_qty { get; set; }
 
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
 
        /// <summary>
        /// Ͷ������
        /// </summary>
        public int invest_type { get; set; }
 
   }
 
   //�߼�_��Ʒ֤ȯ_�ֲ�_��ѯ������ֲֶ���ⶳ��ˮ
   public class FuncpdsecuL_3_34Model : BaseModel
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
        /// ����ⶳ����
        /// </summary>
        public int frozen_type { get; set; }
 
        /// <summary>
        /// �䶯����
        /// </summary>
        public double occur_qty { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int expire_date { get; set; }
 
        /// <summary>
        /// ��ˮ״̬
        /// </summary>
        public String jour_status { get; set; }
 
        /// <summary>
        /// ������ע
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //�߼�_��Ʒ֤ȯ_�ֲ�_��ѯ��ʷ������ֲֶ���ⶳ��ˮ
   public class FuncpdsecuL_3_35Model : BaseModel
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
        /// ����ⶳ����
        /// </summary>
        public int frozen_type { get; set; }
 
        /// <summary>
        /// �䶯����
        /// </summary>
        public double occur_qty { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int expire_date { get; set; }
 
        /// <summary>
        /// ��ˮ״̬
        /// </summary>
        public String jour_status { get; set; }
 
        /// <summary>
        /// ������ע
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //�߼�_��Ʒ֤ȯ_�ֲ�_��ѯծȯ��Ѻ������ֲ�
   public class FuncpdsecuL_3_36Model : BaseModel
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
        /// ����Ѻ����
        /// </summary>
        public double avail_impawn_qty { get; set; }
 
   }
 
   //�߼�_��Ʒ֤ȯ_�ֲ�_��ѯծȯת����Ѻ��Ѻ��Ϣ
   public class FuncpdsecuL_3_37Model : BaseModel
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
        /// ��Ѻ����
        /// </summary>
        public double impawn_qty { get; set; }
 
   }
 
   //�߼�_��Ʒ֤ȯ_�ֲ�_��ѯ�������׼ȯ����
   public class FuncpdsecuL_3_38Model : BaseModel
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
        /// ��������
        /// </summary>
        public double avail_qty { get; set; }
 
   }
 
   //�߼�_��Ʒ֤ȯ_�ֲ�_��ѯծȯ�ع�
   public class FuncpdsecuL_3_39Model : BaseModel
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
        /// ��Ĵ�����
        /// </summary>
        public int target_code_no { get; set; }
 
        /// <summary>
        /// ��Ĵ���
        /// </summary>
        public String target_code { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// �ع�����
        /// </summary>
        public double repo_qty { get; set; }
 
        /// <summary>
        /// �ع����
        /// </summary>
        public double repo_amt { get; set; }
 
        /// <summary>
        /// �ع�����
        /// </summary>
        public double repo_rate { get; set; }
 
        /// <summary>
        /// �ع���������
        /// </summary>
        public int repo_trade_date { get; set; }
 
        /// <summary>
        /// �ع�ί�����
        /// </summary>
        public ulong repo_order_id { get; set; }
 
        /// <summary>
        /// �ع��ɽ����
        /// </summary>
        public ulong repo_strike_id { get; set; }
 
        /// <summary>
        /// �ع�����
        /// </summary>
        public int repo_days { get; set; }
 
        /// <summary>
        /// �ع�ʵ������
        /// </summary>
        public int repo_cale_days { get; set; }
 
        /// <summary>
        /// �ع���������
        /// </summary>
        public int repo_back_date { get; set; }
 
        /// <summary>
        /// �ع����ؽ��
        /// </summary>
        public double repo_back_amt { get; set; }
 
        /// <summary>
        /// �ع�������Ϣ
        /// </summary>
        public double repo_back_intrst { get; set; }
 
        /// <summary>
        /// ʵ�ʻع���������
        /// </summary>
        public int repo_back_trade_date { get; set; }
 
        /// <summary>
        /// �ع�����״̬
        /// </summary>
        public String repo_status { get; set; }
 
   }
 
   //�߼�_��Ʒ֤ȯ_�ֲ�_��ѯ������ծȯ��Ѻ
   public class FuncpdsecuL_3_41Model : BaseModel
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
        /// �ύ��Ѻ����
        /// </summary>
        public double put_impawn_qty { get; set; }
 
        /// <summary>
        /// ת����Ѻ����
        /// </summary>
        public double get_impawn_qty { get; set; }
 
   }
 
   //�߼�_��Ʒ֤ȯ_�ֲ�_��ѯ�ʲ��˻��ֲ�
   public class FuncpdsecuL_3_71Model : BaseModel
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
        /// Ͷ������
        /// </summary>
        public int invest_type { get; set; }
 
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
        /// ����������
        /// </summary>
        public double pre_settle_qty { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double frozen_qty { get; set; }
 
        /// <summary>
        /// �ⶳ����
        /// </summary>
        public double unfroz_qty { get; set; }
 
        /// <summary>
        /// �ֲֺ˶Բ��
        /// </summary>
        public double posi_qty_check_diff { get; set; }
 
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
 
   }
 
   //�߼�_��Ʒ֤ȯ_�ֲ�_��ѯ��ʷ�ʲ��˻��ֲ�
   public class FuncpdsecuL_3_72Model : BaseModel
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
        /// Ͷ������
        /// </summary>
        public int invest_type { get; set; }
 
        /// <summary>
        /// �ڳ�����
        /// </summary>
        public double begin_qty { get; set; }
 
        /// <summary>
        /// ��ǰ����
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// ����������
        /// </summary>
        public double pre_settle_qty { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double frozen_qty { get; set; }
 
        /// <summary>
        /// �ⶳ����
        /// </summary>
        public double unfroz_qty { get; set; }
 
        /// <summary>
        /// �ֲֺ˶Բ��
        /// </summary>
        public double posi_qty_check_diff { get; set; }
 
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
 
   }
 
   //�߼�_��Ʒ֤ȯ_�ֲ�_��ѯ�ʲ��˻��ֲ���ˮ
   public class FuncpdsecuL_3_81Model : BaseModel
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
        /// ҵ���־
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// �䶯����
        /// </summary>
        public double occur_qty { get; set; }
 
        /// <summary>
        /// �䶯������
        /// </summary>
        public double occur_end_qty { get; set; }
 
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
 
        /// <summary>
        /// Ͷ������
        /// </summary>
        public int invest_type { get; set; }
 
   }
 
   //�߼�_��Ʒ֤ȯ_�ֲ�_��ѯ��ʷ�ʲ��˻��ֲ���ˮ
   public class FuncpdsecuL_3_82Model : BaseModel
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
        /// ҵ���־
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// �䶯����
        /// </summary>
        public double occur_qty { get; set; }
 
        /// <summary>
        /// �䶯������
        /// </summary>
        public double occur_end_qty { get; set; }
 
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
 
        /// <summary>
        /// Ͷ������
        /// </summary>
        public int invest_type { get; set; }
 
   }
 
   //�߼�_��Ʒ֤ȯ_�ֲ�_��ѯ�ʲ��˻��ֲֶ���ⶳ��ˮ
   public class FuncpdsecuL_3_84Model : BaseModel
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
        /// ����ⶳ����
        /// </summary>
        public int frozen_type { get; set; }
 
        /// <summary>
        /// �䶯����
        /// </summary>
        public double occur_qty { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int expire_date { get; set; }
 
        /// <summary>
        /// ��ˮ״̬
        /// </summary>
        public String jour_status { get; set; }
 
        /// <summary>
        /// ������ע
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //�߼�_��Ʒ֤ȯ_�ֲ�_��ѯ��ʷ�ʲ��˻��ֲֶ���ⶳ��ˮ
   public class FuncpdsecuL_3_85Model : BaseModel
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
        /// ����ⶳ����
        /// </summary>
        public int frozen_type { get; set; }
 
        /// <summary>
        /// �䶯����
        /// </summary>
        public double occur_qty { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int expire_date { get; set; }
 
        /// <summary>
        /// ��ˮ״̬
        /// </summary>
        public String jour_status { get; set; }
 
        /// <summary>
        /// ������ע
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //�߼�_��Ʒ֤ȯ_�ֲ�_��ѯ�Զ�����֤ȯ�˻��б�
   public class FuncpdsecuL_3_91Model : BaseModel
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
        /// �ɶ�������
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// �ɶ�����
        /// </summary>
        public String stock_acco { get; set; }
 
        /// <summary>
        /// �ɶ���������
        /// </summary>
        public String stock_acco_name { get; set; }
 
        /// <summary>
        /// �깺����
        /// </summary>
        public double apply_limit { get; set; }
 
        /// <summary>
        /// ����Ա���
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// ��ʼʱ��
        /// </summary>
        public int begin_time { get; set; }
 
   }
 
   //�߼�_��Ʒ֤ȯ_�ֲ�_ת���ⲿ֤ȯ�ֲּ�¼
   public class FuncpdsecuL_3_171Model : BaseModel
   {
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// �ⲿ�˺�
        /// </summary>
        public String out_acco { get; set; }
 
   }
 
   //�߼�_��Ʒ֤ȯ_�ֲ�_ת���ⲿ��Ѻ��ϸ
   public class FuncpdsecuL_3_181Model : BaseModel
   {
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// �ⲿ�˺�
        /// </summary>
        public String out_acco { get; set; }
 
   }
 
   //�߼�_��Ʒ֤ȯ_�ֲ�_ת���ⲿ�¹��깺���
   public class FuncpdsecuL_3_191Model : BaseModel
   {
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// �ⲿ�˺�
        /// </summary>
        public String out_acco { get; set; }
 
   }
 
   //�߼�_��Ʒ֤ȯ_�ֲ�_��ѯ�¹��깺���
   public class FuncpdsecuL_3_192Model : BaseModel
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
        /// �ɶ�����
        /// </summary>
        public String stock_acco { get; set; }
 
        /// <summary>
        /// �깺����
        /// </summary>
        public double apply_limit { get; set; }
 
   }
 
   //�߼�_��Ʒ֤ȯ_�ֲ�_��ѯ���ڽ��׳ֲ�
   public class FuncpdsecuL_3_507Model : BaseModel
   {
        /// <summary>
        /// �ֲ����
        /// </summary>
        public ulong posi_id { get; set; }
 
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
        /// ��������
        /// </summary>
        public int exch_group_no { get; set; }
 
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
        public double strike_qty { get; set; }
 
        /// <summary>
        /// �ɽ��۸�
        /// </summary>
        public double strike_price { get; set; }
 
        /// <summary>
        /// ���ʼ۸�
        /// </summary>
        public double fair_price { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public int strike_date { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int release_date { get; set; }
 
        /// <summary>
        /// ����״̬
        /// </summary>
        public String deal_status { get; set; }
 
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //�߼�_��Ʒ֤ȯ_�ֲ�_��ѯ��ʷ���ڽ��׳ֲ�
   public class FuncpdsecuL_3_508Model : BaseModel
   {
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// �ֲ����
        /// </summary>
        public ulong posi_id { get; set; }
 
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
        /// ��������
        /// </summary>
        public int exch_group_no { get; set; }
 
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
        public double strike_qty { get; set; }
 
        /// <summary>
        /// �ɽ��۸�
        /// </summary>
        public double strike_price { get; set; }
 
        /// <summary>
        /// ���ʼ۸�
        /// </summary>
        public double fair_price { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public int strike_date { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int release_date { get; set; }
 
        /// <summary>
        /// ����״̬
        /// </summary>
        public String deal_status { get; set; }
 
   }
 
   //�߼�_��Ʒ֤ȯ_�ֲ�_ת���ⲿ�ʲ��˻��ֲּ�¼
   public class FuncpdsecuL_3_604Model : BaseModel
   {
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// �ⲿ�˺�
        /// </summary>
        public String out_acco { get; set; }
 
   }
 
   //�߼�_��Ʒ֤ȯ_�ֲ�_���ݲ���Ա��ѯ������ֲ�
   public class FuncpdsecuL_3_700Model : BaseModel
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
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// Ͷ������
        /// </summary>
        public int invest_type { get; set; }
 
        /// <summary>
        /// �ڳ�����
        /// </summary>
        public double begin_qty { get; set; }
 
        /// <summary>
        /// ��ǰ����
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// ����������
        /// </summary>
        public double pre_settle_qty { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double frozen_qty { get; set; }
 
        /// <summary>
        /// �ⶳ����
        /// </summary>
        public double unfroz_qty { get; set; }
 
        /// <summary>
        /// �ֲֺ˶Բ��
        /// </summary>
        public double posi_qty_check_diff { get; set; }
 
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
 
   }
 
   //�߼�_��Ʒ֤ȯ_�ֲ�_��ѯ�ʲ��˻�����ֲֲ����¼
   public class FuncpdsecuL_3_701Model : BaseModel
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
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int exch_group_no { get; set; }
 
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
        /// ֤ȯ����
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// �ⲿ�ɱ���
        /// </summary>
        public double out_cost_price { get; set; }
 
        /// <summary>
        /// �˻���ǰ����
        /// </summary>
        public double acco_curr_qty { get; set; }
 
        /// <summary>
        /// �˻���������
        /// </summary>
        public double acco_avail_qty { get; set; }
 
        /// <summary>
        /// �ⲿ��ǰ����
        /// </summary>
        public double out_curr_qty { get; set; }
 
        /// <summary>
        /// �ⲿ��������
        /// </summary>
        public double out_enable_qty { get; set; }
 
        /// <summary>
        /// �˻���ǰ�������
        /// </summary>
        public double acco_curr_qty_diff { get; set; }
 
        /// <summary>
        /// �˻������������
        /// </summary>
        public double acco_avail_qty_diff { get; set; }
 
        /// <summary>
        /// �ⲿ��Ѻ����
        /// </summary>
        public double out_impawn_qty { get; set; }
 
        /// <summary>
        /// �����־
        /// </summary>
        public int deal_flag { get; set; }
 
        /// <summary>
        /// �ʲ��Ƿ�ͬ��
        /// </summary>
        public int asset_sync_flag { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //�߼�_��Ʒ֤ȯ_�ֲ�_ת��ƴ����ⲿ�¹��깺���
   public class FuncpdsecuL_3_193Model : BaseModel
   {
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// �ⲿ�˺�
        /// </summary>
        public String out_acco { get; set; }
 
   }
 
   //�߼�_��Ʒ֤ȯ_�ֲ�_��ѯ�ƴ����¹��깺���
   public class FuncpdsecuL_3_194Model : BaseModel
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
        /// �ɶ�����
        /// </summary>
        public String stock_acco { get; set; }
 
        /// <summary>
        /// �깺����
        /// </summary>
        public double apply_limit { get; set; }
 
   }
 
}

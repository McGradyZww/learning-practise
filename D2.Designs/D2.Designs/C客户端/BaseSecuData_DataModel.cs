using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //�߼�_����_֤ȯ��������_��ѯ֤ȯģ��
   public class FuncpubL_1_6Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ģ������
        /// </summary>
        public String model_name { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ��������
        /// </summary>
        public String stock_code_feature { get; set; }
 
        /// <summary>
        /// ֤ȯ��������
        /// </summary>
        public String stock_name_feature { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
   }
 
   //�߼�_����_֤ȯ��������_��ѯ֤ȯ����
   public class FuncpubL_1_14Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// ֤ȯ���ͼ��
        /// </summary>
        public String stock_type_name { get; set; }
 
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
        /// ʱ���
        /// </summary>
        public int time_stamp { get; set; }
 
   }
 
   //�߼�_����_֤ȯ��������_��ѯ֤ȯ������ˮ
   public class FuncpubL_1_15Model : BaseModel
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
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
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
 
   //�߼�_����_֤ȯ��������_��ѯ��ʷ֤ȯ������ˮ
   public class FuncpubL_1_16Model : BaseModel
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
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
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
 
   //�߼�_����_֤ȯ��������_��ѯ֤ȯ���Ͷ�������
   public class FuncpubL_1_24Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
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
        /// ��С����
        /// </summary>
        public double min_qty { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public double max_qty { get; set; }
 
        /// <summary>
        /// ʱ���
        /// </summary>
        public int time_stamp { get; set; }
 
   }
 
   //�߼�_����_֤ȯ��������_����֤ȯ������Ϣ
   public class FuncpubL_1_41Model : BaseModel
   {
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
   }
 
   //�߼�_����_֤ȯ��������_��ѯ֤ȯ��Ϣ
   public class FuncpubL_1_43Model : BaseModel
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
 
   }
 
   //�߼�_����_֤ȯ��������_��ѯ֤ȯ������Ϣ
   public class FuncpubL_1_44Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
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
 
   //�߼�_����_֤ȯ��������_��ѯ֤ȯ������Ϣ��ˮ
   public class FuncpubL_1_45Model : BaseModel
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
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
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
 
   //�߼�_����_֤ȯ��������_��ѯ��ʷ֤ȯ������Ϣ��ˮ
   public class FuncpubL_1_46Model : BaseModel
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
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
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
 
   //�߼�_����_֤ȯ��������_��ѯ֤ȯ�����б�
   public class FuncpubL_1_47Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
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
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// �ʲ�����
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// �۹�ͨ���
        /// </summary>
        public int hk_stock_flag { get; set; }
 
   }
 
   //�߼�_����_֤ȯ��������_��ѯ�ͻ���֤ȯ������Ϣ
   public class FuncpubL_1_49Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
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
        /// ���ұ���
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// �ʽ��ת����
        /// </summary>
        public int capit_reback_days { get; set; }
 
        /// <summary>
        /// �ֲֻ�ת����
        /// </summary>
        public int posi_reback_days { get; set; }
 
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
        /// ��С�۲�
        /// </summary>
        public double step_price { get; set; }
 
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
 
   //�߼�_����_֤ȯ��������_��ѯ֤ȯ���붩������
   public class FuncpubL_1_54Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
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
        /// ��С����
        /// </summary>
        public double min_qty { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public double max_qty { get; set; }
 
        /// <summary>
        /// ʱ���
        /// </summary>
        public int time_stamp { get; set; }
 
   }
 
   //�߼�_����_֤ȯ��������_��ѯ֤ȯ���붩��������ˮ
   public class FuncpubL_1_55Model : BaseModel
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
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
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
 
   //�߼�_����_֤ȯ��������_��ѯ��ʷ֤ȯ���붩��������ˮ
   public class FuncpubL_1_56Model : BaseModel
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
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
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
 
   //�߼�_����_֤ȯ��������_��ѯ֤ȯ����ӳ��
   public class FuncpubL_1_64Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
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
 
   //�߼�_����_֤ȯ��������_��ѯ֤ȯ����ӳ����ˮ
   public class FuncpubL_1_65Model : BaseModel
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
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
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
        /// ������ע
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //�߼�_����_֤ȯ��������_��ѯ��ʷ֤ȯ����ӳ����ˮ
   public class FuncpubL_1_66Model : BaseModel
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
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
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
        /// ������ע
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //�߼�_����_֤ȯ��������_��ѯ�¹���Ϣ
   public class FuncpubL_1_34Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
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
 
   //�߼�_����_֤ȯ��������_��ѯ�����¹���Ϣ
   public class FuncpubL_1_35Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
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
 
   //�߼�_����_֤ȯ��������_��ѯ��תծ��Ϣ
   public class FuncpubL_1_36Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
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
 
   //�߼�_����_֤ȯ��������_��ѯ���տ�תծ��Ϣ
   public class FuncpubL_1_37Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
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
 
   //�߼�_����_֤ȯ��������_��ѯ֤ȯ����
   public class FuncpubL_1_74Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
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
 
   //�߼�_����_֤ȯ��������_������ȡ֤ȯ����
   public class FuncpubL_1_77Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
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
 
   //�߼�_����_֤ȯ��������_��ȡ֤ȯ����
   public class FuncpubL_1_78Model : BaseModel
   {
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
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
 
   }
 
   //�߼�_����_֤ȯ��������_��ѯ֤ȯ������ˮ
   public class FuncpubL_1_75Model : BaseModel
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
 
   //�߼�_����_֤ȯ��������_��ѯ��ʷ֤ȯ������ˮ
   public class FuncpubL_1_76Model : BaseModel
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
 
   //�߼�_����_֤ȯ��������_֤ȯ����鵵��ʱ����
   public class FuncpubL_1_79Model : BaseModel
   {
        /// <summary>
        /// ����ִ��״̬
        /// </summary>
        public String task_strike_status { get; set; }
 
   }
 
   //�߼�_����_֤ȯ��������_��ѯծȯ������Ϣ
   public class FuncpubL_1_84Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
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
 
   //�߼�_����_֤ȯ��������_��ȡծȯ����
   public class FuncpubL_1_88Model : BaseModel
   {
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
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
        /// ���״���
        /// </summary>
        public String trade_code { get; set; }
 
        /// <summary>
        /// ��Ĵ���
        /// </summary>
        public String target_code { get; set; }
 
   }
 
   //�߼�_����_֤ȯ��������_��ѯծȯ������ˮ
   public class FuncpubL_1_85Model : BaseModel
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
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
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
 
   //�߼�_����_֤ȯ��������_��ѯ��ʷծȯ������ˮ
   public class FuncpubL_1_86Model : BaseModel
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
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
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
 
   //�߼�_����_֤ȯ��������_��ѯծȯ��Ѻ��Ϣ
   public class FuncpubL_1_87Model : BaseModel
   {
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// ��Ѻ������
        /// </summary>
        public int impawn_code_no { get; set; }
 
        /// <summary>
        /// ��Ѻ����
        /// </summary>
        public String impawn_code { get; set; }
 
        /// <summary>
        /// ��Ѻ����
        /// </summary>
        public double impawn_ratio { get; set; }
 
   }
 
   //�߼�_����_֤ȯ��������_��ѯծȯ����
   public class FuncpubL_1_94Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ���ʿ�ʼ����
        /// </summary>
        public int intrst_begin_date { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double intrst_ratio { get; set; }
 
        /// <summary>
        /// ʱ���
        /// </summary>
        public int time_stamp { get; set; }
 
   }
 
   //�߼�_����_֤ȯ��������_��ѯծȯ������ˮ
   public class FuncpubL_1_95Model : BaseModel
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
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ���ʿ�ʼ����
        /// </summary>
        public int intrst_begin_date { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double intrst_ratio { get; set; }
 
        /// <summary>
        /// ������ע
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //�߼�_����_֤ȯ��������_��ѯ��ʷծȯ������ˮ
   public class FuncpubL_1_96Model : BaseModel
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
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ���ʿ�ʼ����
        /// </summary>
        public int intrst_begin_date { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double intrst_ratio { get; set; }
 
        /// <summary>
        /// ������ע
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //�߼�_����_֤ȯ��������_��ѯծȯ������Ϣ
   public class FuncpubL_1_104Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public String rating_agency { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ծȯ�ȼ�
        /// </summary>
        public int bond_level { get; set; }
 
        /// <summary>
        /// ʱ���
        /// </summary>
        public int time_stamp { get; set; }
 
   }
 
   //�߼�_����_֤ȯ��������_��ѯծȯ������ˮ
   public class FuncpubL_1_105Model : BaseModel
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
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public String rating_agency { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ծȯ�ȼ�
        /// </summary>
        public int bond_level { get; set; }
 
        /// <summary>
        /// ������ע
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //�߼�_����_֤ȯ��������_��ѯ��ʷծȯ������ˮ
   public class FuncpubL_1_106Model : BaseModel
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
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public String rating_agency { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ծȯ�ȼ�
        /// </summary>
        public int bond_level { get; set; }
 
        /// <summary>
        /// ������ע
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //�߼�_����_֤ȯ��������_��ѯ�ع�������Ϣ
   public class FuncpubL_1_130Model : BaseModel
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
        public int stock_type { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// �ع�����
        /// </summary>
        public int repo_days { get; set; }
 
        /// <summary>
        /// �ʽ�ռ������
        /// </summary>
        public int cash_capt_days { get; set; }
 
        /// <summary>
        /// ���¼�
        /// </summary>
        public double last_price { get; set; }
 
   }
 
   //�߼�_����_֤ȯ��������_��ع���ȡ���������Ϣ
   public class FuncpubL_1_131Model : BaseModel
   {
        /// <summary>
        /// ��������
        /// </summary>
        public String amt_ratio_str { get; set; }
 
        /// <summary>
        /// ���̶��
        /// </summary>
        public String amt_value_str { get; set; }
 
        /// <summary>
        /// ��߷��ô�
        /// </summary>
        public String max_fee_str { get; set; }
 
        /// <summary>
        /// ��ͷ��ô�
        /// </summary>
        public String min_fee_str { get; set; }
 
        /// <summary>
        /// Ʊ����ֵ
        /// </summary>
        public double par_value { get; set; }
 
   }
 
   //�߼�_����_֤ȯ��������_��ѯ�۹ɼ�λ
   public class FuncpubL_1_140Model : BaseModel
   {
        /// <summary>
        /// ��ʼ��λ
        /// </summary>
        public double begin_price { get; set; }
 
        /// <summary>
        /// ������λ
        /// </summary>
        public double end_price { get; set; }
 
        /// <summary>
        /// ��С�۲�
        /// </summary>
        public double step_price { get; set; }
 
   }
 
   //�߼�_����_֤ȯ��������_��Ż�ȡ֤ȯ��Ϣ
   public class FuncpubL_1_141Model : BaseModel
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
 
   }
 
   //�߼�_����_֤ȯ��������_��ѯ����������Ϣ
   public class FuncpubL_1_145Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int fund_kind { get; set; }
 
        /// <summary>
        /// ���������
        /// </summary>
        public String fund_manager { get; set; }
 
        /// <summary>
        /// �����й���
        /// </summary>
        public String fund_trustee { get; set; }
 
        /// <summary>
        /// ���й�ģ
        /// </summary>
        public double distribution_scale { get; set; }
 
        /// <summary>
        /// �շѷ�ʽ
        /// </summary>
        public int charging_method { get; set; }
 
        /// <summary>
        /// Ĭ�Ϸֺ췽ʽ
        /// </summary>
        public int default_divide_type { get; set; }
 
        /// <summary>
        /// �����������
        /// </summary>
        public int fund_found_date { get; set; }
 
        /// <summary>
        /// ����������
        /// </summary>
        public int fund_expire_date { get; set; }
 
        /// <summary>
        /// �Ϲ����ױ�־
        /// </summary>
        public int subscription_trade_mark { get; set; }
 
        /// <summary>
        /// �깺���ױ�־
        /// </summary>
        public int purchase_trade_mark { get; set; }
 
        /// <summary>
        /// ��ؽ��ױ�־
        /// </summary>
        public int rede_trade_mark { get; set; }
 
        /// <summary>
        /// �״���ͽ��
        /// </summary>
        public double first_minimum_amt { get; set; }
 
        /// <summary>
        /// ����Ϲ����
        /// </summary>
        public double minimum_subscription_amt { get; set; }
 
        /// <summary>
        /// ����깺���
        /// </summary>
        public double minimum_purchase_amt { get; set; }
 
        /// <summary>
        /// �����طݶ�
        /// </summary>
        public double minimum_rede_share { get; set; }
 
        /// <summary>
        /// ��ͳ��зݶ�
        /// </summary>
        public double minimum_holding_share { get; set; }
 
        /// <summary>
        /// ���ת���ݶ�
        /// </summary>
        public double minimum_turning_out_share { get; set; }
 
        /// <summary>
        /// ��ؿ������
        /// </summary>
        public int rede_money_to_account_days { get; set; }
 
        /// <summary>
        /// �Ǽǻ���
        /// </summary>
        public String registration_agency { get; set; }
 
        /// <summary>
        /// ʱ���
        /// </summary>
        public int time_stamp { get; set; }
 
   }
 
   //�߼�_����_֤ȯ��������_��ȡ��������
   public class FuncpubL_1_146Model : BaseModel
   {
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int fund_kind { get; set; }
 
        /// <summary>
        /// ���������
        /// </summary>
        public String fund_manager { get; set; }
 
        /// <summary>
        /// �����й���
        /// </summary>
        public String fund_trustee { get; set; }
 
        /// <summary>
        /// ���й�ģ
        /// </summary>
        public double distribution_scale { get; set; }
 
        /// <summary>
        /// �շѷ�ʽ
        /// </summary>
        public int charging_method { get; set; }
 
        /// <summary>
        /// Ĭ�Ϸֺ췽ʽ
        /// </summary>
        public int default_divide_type { get; set; }
 
        /// <summary>
        /// �����������
        /// </summary>
        public int fund_found_date { get; set; }
 
        /// <summary>
        /// ����������
        /// </summary>
        public int fund_expire_date { get; set; }
 
        /// <summary>
        /// �Ϲ����ױ�־
        /// </summary>
        public int subscription_trade_mark { get; set; }
 
        /// <summary>
        /// �깺���ױ�־
        /// </summary>
        public int purchase_trade_mark { get; set; }
 
        /// <summary>
        /// ��ؽ��ױ�־
        /// </summary>
        public int rede_trade_mark { get; set; }
 
        /// <summary>
        /// �״���ͽ��
        /// </summary>
        public double first_minimum_amt { get; set; }
 
        /// <summary>
        /// ����Ϲ����
        /// </summary>
        public double minimum_subscription_amt { get; set; }
 
        /// <summary>
        /// ����깺���
        /// </summary>
        public double minimum_purchase_amt { get; set; }
 
        /// <summary>
        /// �����طݶ�
        /// </summary>
        public double minimum_rede_share { get; set; }
 
        /// <summary>
        /// ��ͳ��зݶ�
        /// </summary>
        public double minimum_holding_share { get; set; }
 
        /// <summary>
        /// ���ת���ݶ�
        /// </summary>
        public double minimum_turning_out_share { get; set; }
 
        /// <summary>
        /// ��ؿ������
        /// </summary>
        public int rede_money_to_account_days { get; set; }
 
        /// <summary>
        /// �Ǽǻ���
        /// </summary>
        public String registration_agency { get; set; }
 
        /// <summary>
        /// ʱ���
        /// </summary>
        public int time_stamp { get; set; }
 
   }
 
   //�߼�_����_֤ȯ��������_��ѯ����������ˮ
   public class FuncpubL_1_147Model : BaseModel
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
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
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
 
   //�߼�_����_֤ȯ��������_��ѯ��ʷ����������ˮ
   public class FuncpubL_1_148Model : BaseModel
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
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
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
 
   //�߼�_����_֤ȯ��������_��ѯ�¹ɿ�������Ϣ
   public class FuncpubL_1_151Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
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
 
        /// <summary>
        /// �����ɽ���
        /// </summary>
        public double warn_trade_amount { get; set; }
 
        /// <summary>
        /// ������һ����
        /// </summary>
        public double warn_buy_amount { get; set; }
 
        /// <summary>
        /// �����Ƿ��Զ�����
        /// </summary>
        public int warn_auto_sell { get; set; }
 
        /// <summary>
        /// �Ƿ񴥾�
        /// </summary>
        public int is_warn { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int stock_open_date { get; set; }
 
        /// <summary>
        /// ����۸�
        /// </summary>
        public double stock_open_price { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// ��һ��
        /// </summary>
        public double buy_qty_1 { get; set; }
 
        /// <summary>
        /// ��ͣ��
        /// </summary>
        public double up_limit_price { get; set; }
 
        /// <summary>
        /// ���¼�
        /// </summary>
        public double last_price { get; set; }
 
   }
 
   //�߼�_����_֤ȯ��������_��ѯ�����¹���Ϣ
   public class FuncpubL_1_155Model : BaseModel
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
        /// �����ɽ���
        /// </summary>
        public double warn_trade_amount { get; set; }
 
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// ������һ����
        /// </summary>
        public double warn_buy_amount { get; set; }
 
        /// <summary>
        /// ��һ��
        /// </summary>
        public double buy_qty_1 { get; set; }
 
        /// <summary>
        /// ��ͣ��
        /// </summary>
        public double up_limit_price { get; set; }
 
        /// <summary>
        /// ���¼�
        /// </summary>
        public double last_price { get; set; }
 
   }
 
   //�߼�_����_֤ȯ��������_��ѯ�����¹���Ϣ
   public class FuncpubL_1_157Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
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
 
   //�߼�_����_֤ȯ��������_��ѯ�����Ʒ���չ�ϵ
   public class FuncpubL_1_160Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
   }
 
   //�߼�_����_֤ȯ��������_��ѯ����֤ȯ������㵥λ
   public class FuncpubL_1_164Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// ������㵥λ
        /// </summary>
        public double quot_calc_unit { get; set; }
 
   }
 
   //�߼�_����_֤ȯ��������_��ѯ֤ȯ���̼�
   public class FuncpubL_1_177Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
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
 
   }
 
}

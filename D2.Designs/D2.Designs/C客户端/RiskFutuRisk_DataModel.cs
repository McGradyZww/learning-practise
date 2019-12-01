using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //�߼�_����ڻ�_���_��ѯ�ͻ����չ����¼
   public class FuncrkfutuL_3_3Model : BaseModel
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
        /// ģ�����
        /// </summary>
        public ulong model_id { get; set; }
 
        /// <summary>
        /// ģ������
        /// </summary>
        public String model_name { get; set; }
 
        /// <summary>
        /// ������Ŀ���
        /// </summary>
        public int risk_item_id { get; set; }
 
        /// <summary>
        /// ������Ŀ����
        /// </summary>
        public String risk_item_name { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public String order_dir_str { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_type { get; set; }
 
        /// <summary>
        /// �����׶�����
        /// </summary>
        public int trig_stage_type { get; set; }
 
        /// <summary>
        /// �Ϲ����㼶
        /// </summary>
        public int compli_calc_level { get; set; }
 
        /// <summary>
        /// ��λ��ֵ��־
        /// </summary>
        public int unit_nav_flag { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int trig_type { get; set; }
 
        /// <summary>
        /// ���չ������
        /// </summary>
        public int risk_rule_id { get; set; }
 
        /// <summary>
        /// ���չ������
        /// </summary>
        public int risk_rule_type { get; set; }
 
        /// <summary>
        /// ���չ�������
        /// </summary>
        public String risk_rule_name { get; set; }
 
        /// <summary>
        /// ���չ������
        /// </summary>
        public String risk_rule_code { get; set; }
 
        /// <summary>
        /// ����Ҫ�ش�
        /// </summary>
        public String risk_param_str { get; set; }
 
        /// <summary>
        /// ���չ���ֵ��
        /// </summary>
        public String risk_rule_value_str { get; set; }
 
        /// <summary>
        /// ��Ӧ���
        /// </summary>
        public String corrsp_plug { get; set; }
 
        /// <summary>
        /// ���ղ�ȡ��Ϊ
        /// </summary>
        public String risk_rule_action { get; set; }
 
        /// <summary>
        /// ��ʼʱ��
        /// </summary>
        public int begin_time { get; set; }
 
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int end_time { get; set; }
 
        /// <summary>
        /// ���ñ�־
        /// </summary>
        public int rule_flag { get; set; }
 
   }
 
   //�߼�_����ڻ�_���_��ȡ�ͻ�����Ҫ��
   public class FuncrkfutuL_3_4Model : BaseModel
   {
        /// <summary>
        /// ����Ҫ�ش�
        /// </summary>
        public String risk_param_str { get; set; }
 
   }
 
   //�߼�_����ڻ�_���_�ͻ����մ�����ˮ��ѯ
   public class FuncrkfutuL_3_6Model : BaseModel
   {
        /// <summary>
        /// ��������
        /// </summary>
        public int create_date { get; set; }
 
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int create_time { get; set; }
 
        /// <summary>
        /// �ͻ����չ������
        /// </summary>
        public int client_risk_rule_id { get; set; }
 
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
        /// ��������
        /// </summary>
        public String order_dir_str { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_type { get; set; }
 
        /// <summary>
        /// �����׶�����
        /// </summary>
        public int trig_stage_type { get; set; }
 
        /// <summary>
        /// �Ϲ����㼶
        /// </summary>
        public int compli_calc_level { get; set; }
 
        /// <summary>
        /// ��λ��ֵ��־
        /// </summary>
        public int unit_nav_flag { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int trig_type { get; set; }
 
        /// <summary>
        /// �Ϲ����˵��
        /// </summary>
        public String compli_rules_remark { get; set; }
 
        /// <summary>
        /// ���ղ�ȡ��Ϊ
        /// </summary>
        public String risk_rule_action { get; set; }
 
        /// <summary>
        /// ���չ������
        /// </summary>
        public int risk_rule_type { get; set; }
 
        /// <summary>
        /// ���չ���ֵ��
        /// </summary>
        public String risk_rule_value_str { get; set; }
 
        /// <summary>
        /// ��ش���ֵ
        /// </summary>
        public double risk_trig_value { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //�߼�_����ڻ�_���_ģ���ѯ�ͻ���Ʒ������
   public class FuncrkfutuL_3_7Model : BaseModel
   {
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int exch_group_no { get; set; }
 
   }
 
   //�߼�_����ڻ�_���_�ͻ����մ�����ʷ��ˮ��ѯ
   public class FuncrkfutuL_3_8Model : BaseModel
   {
        /// <summary>
        /// ��������
        /// </summary>
        public int create_date { get; set; }
 
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int create_time { get; set; }
 
        /// <summary>
        /// �ͻ����չ������
        /// </summary>
        public int client_risk_rule_id { get; set; }
 
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
        /// ��������
        /// </summary>
        public String order_dir_str { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_type { get; set; }
 
        /// <summary>
        /// �����׶�����
        /// </summary>
        public int trig_stage_type { get; set; }
 
        /// <summary>
        /// �Ϲ����㼶
        /// </summary>
        public int compli_calc_level { get; set; }
 
        /// <summary>
        /// ��λ��ֵ��־
        /// </summary>
        public int unit_nav_flag { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int trig_type { get; set; }
 
        /// <summary>
        /// �Ϲ����˵��
        /// </summary>
        public String compli_rules_remark { get; set; }
 
        /// <summary>
        /// ���ղ�ȡ��Ϊ
        /// </summary>
        public String risk_rule_action { get; set; }
 
        /// <summary>
        /// ���չ������
        /// </summary>
        public int risk_rule_type { get; set; }
 
        /// <summary>
        /// ���չ���ֵ��
        /// </summary>
        public String risk_rule_value_str { get; set; }
 
        /// <summary>
        /// ��ش���ֵ
        /// </summary>
        public double risk_trig_value { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //�߼�_����ڻ�_���_����������ͻ�����
   public class FuncrkfutuL_3_9Model : BaseModel
   {
        /// <summary>
        /// �ͻ����չ������
        /// </summary>
        public int client_risk_rule_id { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// �Ϲ����˵��
        /// </summary>
        public String compli_rules_remark { get; set; }
 
        /// <summary>
        /// ���ղ�ȡ��Ϊ
        /// </summary>
        public String risk_rule_action { get; set; }
 
        /// <summary>
        /// ���չ���ֵ��
        /// </summary>
        public String risk_rule_value_str { get; set; }
 
        /// <summary>
        /// ���ռ���ֵ��
        /// </summary>
        public String risk_rule_calc_str { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
}

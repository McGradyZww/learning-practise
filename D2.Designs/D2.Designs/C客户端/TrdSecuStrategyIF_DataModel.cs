using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //�߼�_����֤ȯ_���Խӿ�_��ѯĸ��
   public class FunctdsecuL_11_101Model : BaseModel
   {
        /// <summary>
        /// ָ���´���
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// ĸ�����
        /// </summary>
        public ulong algo_order_id { get; set; }
 
        /// <summary>
        /// �ڶ�ĸ�����
        /// </summary>
        public ulong seco_algo_order_id { get; set; }
 
        /// <summary>
        /// ����ִ����
        /// </summary>
        public String algo_exec_broker { get; set; }
 
        /// <summary>
        /// ����ִ��ָ�
        /// </summary>
        public String algo_exec_comm_str { get; set; }
 
        /// <summary>
        /// ����ִ�з�ʽ
        /// </summary>
        public int algo_exec_kind { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ����ҵ�����
        /// </summary>
        public String algo_busi_type { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// �ʽ𶩵�����
        /// </summary>
        public double cash_order_qty { get; set; }
 
        /// <summary>
        /// �����۸�
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// �۸�����
        /// </summary>
        public int price_type { get; set; }
 
        /// <summary>
        /// ������Ч����
        /// </summary>
        public int algo_valid_type { get; set; }
 
        /// <summary>
        /// ���Թ���ʽ
        /// </summary>
        public String algo_rule_way { get; set; }
 
        /// <summary>
        /// ���ױ���
        /// </summary>
        public String exch_crncy_type { get; set; }
 
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// ĸ��ʱ��
        /// </summary>
        public int algo_order_time { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ҵ�����Ա���
        /// </summary>
        public int busi_opor_no { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// ���ý��׷�ʽ
        /// </summary>
        public int margin_trade_type { get; set; }
 
        /// <summary>
        /// Ŀ���������
        /// </summary>
        public String target_strategy_type { get; set; }
 
        /// <summary>
        /// Ŀ����Բ���
        /// </summary>
        public String target_strategy_param { get; set; }
 
        /// <summary>
        /// �ⲿ���
        /// </summary>
        public int external_no { get; set; }
 
        /// <summary>
        /// ָ�����
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int order_batch_no { get; set; }
 
        /// <summary>
        /// ����������ʽ
        /// </summary>
        public String order_oper_way { get; set; }
 
   }
 
}

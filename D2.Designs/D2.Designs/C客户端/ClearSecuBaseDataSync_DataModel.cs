using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //�߼�_����֤ȯ_��������ͬ��_��ѯ��˾��Ϊ��
   public class FuncclsecuL_4_101Model : BaseModel
   {
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
        /// ���ұ���
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// Ʊ����ֵ
        /// </summary>
        public double par_value { get; set; }
 
        /// <summary>
        /// ��Ϊ��λ
        /// </summary>
        public int divi_cacl_num { get; set; }
 
        /// <summary>
        /// �ֺ���
        /// </summary>
        public double divi_amt { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public double divi_qty { get; set; }
 
        /// <summary>
        /// ת������
        /// </summary>
        public double equity_trans_qty { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public double rights_issue_qty { get; set; }
 
        /// <summary>
        /// ��ɼ۸�
        /// </summary>
        public double placement_price { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int notice_date { get; set; }
 
        /// <summary>
        /// �Ǽ�����
        /// </summary>
        public int reg_date { get; set; }
 
        /// <summary>
        /// ��Ȩ����
        /// </summary>
        public int ex_date { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int arrive_date { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int begin_trade_date { get; set; }
 
        /// <summary>
        /// �����־
        /// </summary>
        public int deal_flag { get; set; }
 
        /// <summary>
        /// ҵ���־
        /// </summary>
        public int busi_flag { get; set; }
 
   }
 
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //�߼�_����֤ȯ_����_��ѯ��������ͳ������
   public class FuncclsecuL_1_43Model : BaseModel
   {
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// ���㲽��
        /// </summary>
        public int sett_flow_step { get; set; }
 
        /// <summary>
        /// �ܼ�¼��
        /// </summary>
        public int total_count { get; set; }
 
        /// <summary>
        /// �ܽ��
        /// </summary>
        public double total_amt { get; set; }
 
        /// <summary>
        /// �Ѵ����¼��
        /// </summary>
        public int total_succ_count { get; set; }
 
        /// <summary>
        /// �Ѵ�����
        /// </summary>
        public double total_succ_amt { get; set; }
 
        /// <summary>
        /// δ�����¼��
        /// </summary>
        public int total_fail_count { get; set; }
 
        /// <summary>
        /// δ������
        /// </summary>
        public double total_fail_amt { get; set; }
 
   }
 
   //�߼�_����֤ȯ_����_���ݹ���ʷ��ʱ����
   public class FuncclsecuL_1_51Model : BaseModel
   {
        /// <summary>
        /// ����ִ��״̬
        /// </summary>
        public String task_strike_status { get; set; }
 
   }
 
}

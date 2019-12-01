using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //�߼�_����_������ȯ��������_�����ɳ�ֱ�֤��֤ȯ��
   public class FuncpubL_29_1Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //�߼�_����_������ȯ��������_��ѯ�ɳ�ֱ�֤��֤ȯ��
   public class FuncpubL_29_4Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
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
        public String stock_code { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double discount_rate { get; set; }
 
        /// <summary>
        /// ���״̬
        /// </summary>
        public int offset_status { get; set; }
 
   }
 
   //�߼�_����_������ȯ��������_����������ȯ���ñ�
   public class FuncpubL_29_5Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //�߼�_����_������ȯ��������_��ѯ������ȯ���ñ�
   public class FuncpubL_29_8Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ����������
        /// </summary>
        public double fina_year_intrst_rate { get; set; }
 
        /// <summary>
        /// ��ȯ������
        /// </summary>
        public double secu_loan_year_intrst_rate { get; set; }
 
        /// <summary>
        /// ���ʷ�Ϣ����
        /// </summary>
        public double fina_pen_intrst_rate { get; set; }
 
        /// <summary>
        /// ��ȯ��Ϣ����
        /// </summary>
        public double secu_loan_pen_intrst_rate { get; set; }
 
        /// <summary>
        /// ��Ϣ����
        /// </summary>
        public int intrst_sett_day { get; set; }
 
   }
 
   //�߼�_����_������ȯ��������_����������ȯ���֤ȯ��
   public class FuncpubL_29_9Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //�߼�_����_������ȯ��������_��ѯ������ȯ���֤ȯ��
   public class FuncpubL_29_12Model : BaseModel
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
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ����״̬
        /// </summary>
        public String fina_status { get; set; }
 
        /// <summary>
        /// ��ȯ״̬
        /// </summary>
        public String secu_loan_status { get; set; }
 
   }
 
   //�߼�_����_������ȯ��������_����������ȯȯ�̽�ֹ���֤ȯ��
   public class FuncpubL_29_13Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //�߼�_����_������ȯ��������_��ѯ������ȯȯ�̽�ֹ���֤ȯ��
   public class FuncpubL_29_16Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ����״̬
        /// </summary>
        public String fina_status { get; set; }
 
        /// <summary>
        /// ��ȯ״̬
        /// </summary>
        public String secu_loan_status { get; set; }
 
   }
 
   //�߼�_����_������ȯ��������_����������ȯ��֤��������ñ�
   public class FuncpubL_29_17Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //�߼�_����_������ȯ��������_��ѯ������ȯ��֤��������ñ�
   public class FuncpubL_29_20Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// ���ʱ�֤�����
        /// </summary>
        public double fina_marg_ratio { get; set; }
 
        /// <summary>
        /// ��ȯ��֤�����
        /// </summary>
        public double secu_loan_marg_ratio { get; set; }
 
        /// <summary>
        /// ��ȯ�۸�����
        /// </summary>
        public double secu_loan_price_limit { get; set; }
 
   }
 
   //�߼�_����_������ȯ��������_��ȡ������ȯ��֤���������
   public class FuncpubL_29_21Model : BaseModel
   {
        /// <summary>
        /// ���ʱ�֤�����
        /// </summary>
        public double fina_marg_ratio { get; set; }
 
        /// <summary>
        /// ��ȯ��֤�����
        /// </summary>
        public double secu_loan_marg_ratio { get; set; }
 
        /// <summary>
        /// ��ȯ�۸�����
        /// </summary>
        public double secu_loan_price_limit { get; set; }
 
   }
 
   //�߼�_����_������ȯ��������_��ȡ�ɳ�ֱ�֤��֤ȯ��
   public class FuncpubL_29_22Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
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
        public String stock_code { get; set; }
 
        /// <summary>
        /// ������
        /// </summary>
        public double discount_rate { get; set; }
 
        /// <summary>
        /// ���״̬
        /// </summary>
        public int offset_status { get; set; }
 
   }
 
   //�߼�_����_������ȯ��������_��ѯ����������ȯ��֤�����
   public class FuncpubL_29_23Model : BaseModel
   {
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// ���ʱ�֤�����
        /// </summary>
        public double fina_marg_ratio { get; set; }
 
        /// <summary>
        /// ��ȯ��֤�����
        /// </summary>
        public double secu_loan_marg_ratio { get; set; }
 
        /// <summary>
        /// ��ȯ�۸�����
        /// </summary>
        public double secu_loan_price_limit { get; set; }
 
   }
 
}

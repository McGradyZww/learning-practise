using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class tdfutuL_3_1_Info : ObservableObject
    {

        private ulong _comm_id;
        /// <summary>
        /// ָ�����
        /// </summary>
        public ulong comm_id
        {
            get { return _comm_id; }

            set
            {
                _comm_id = value;
                RaisePropertyChanged(() => comm_id);
            }
        }

        private int _comm_batch_no;
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_batch_no
        {
            get { return _comm_batch_no; }

            set
            {
                _comm_batch_no = value;
                RaisePropertyChanged(() => comm_batch_no);
            }
        }

        private int _co_no;
        /// <summary>
        /// �������
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _exch_group_no;
        /// <summary>
        /// ��������
        /// </summary>
        public int exch_group_no
        {
            get { return _exch_group_no; }

            set
            {
                _exch_group_no = value;
                RaisePropertyChanged(() => exch_group_no);
            }
        }

        private int _asset_acco_no;
        /// <summary>
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private int _exch_no;
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no
        {
            get { return _exch_no; }

            set
            {
                _exch_no = value;
                RaisePropertyChanged(() => exch_no);
            }
        }

        private String _stock_code;
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code
        {
            get { return _stock_code; }

            set
            {
                _stock_code = value;
                RaisePropertyChanged(() => stock_code);
            }
        }

        private int _comm_dir;
        /// <summary>
        /// ָ���
        /// </summary>
        public int comm_dir
        {
            get { return _comm_dir; }

            set
            {
                _comm_dir = value;
                RaisePropertyChanged(() => comm_dir);
            }
        }

        private double _comm_limit_price;
        /// <summary>
        /// ָ���޼�
        /// </summary>
        public double comm_limit_price
        {
            get { return _comm_limit_price; }

            set
            {
                _comm_limit_price = value;
                RaisePropertyChanged(() => comm_limit_price);
            }
        }

        private double _comm_qty;
        /// <summary>
        /// ָ������
        /// </summary>
        public double comm_qty
        {
            get { return _comm_qty; }

            set
            {
                _comm_qty = value;
                RaisePropertyChanged(() => comm_qty);
            }
        }

        private double _comm_amt;
        /// <summary>
        /// ָ����
        /// </summary>
        public double comm_amt
        {
            get { return _comm_amt; }

            set
            {
                _comm_amt = value;
                RaisePropertyChanged(() => comm_amt);
            }
        }

        private String _comm_status;
        /// <summary>
        /// ָ��״̬
        /// </summary>
        public String comm_status
        {
            get { return _comm_status; }

            set
            {
                _comm_status = value;
                RaisePropertyChanged(() => comm_status);
            }
        }

        private String _comm_appr_status;
        /// <summary>
        /// ָ������״̬
        /// </summary>
        public String comm_appr_status
        {
            get { return _comm_appr_status; }

            set
            {
                _comm_appr_status = value;
                RaisePropertyChanged(() => comm_appr_status);
            }
        }
    }

    public class tdfutuL_3_2_Info : ObservableObject
    {
    }

    public class tdfutuL_3_3_Info : ObservableObject
    {
    }

    public class tdfutuL_3_4_Info : ObservableObject
    {

        private String _comm_status;
        /// <summary>
        /// ָ��״̬
        /// </summary>
        public String comm_status
        {
            get { return _comm_status; }

            set
            {
                _comm_status = value;
                RaisePropertyChanged(() => comm_status);
            }
        }

        private ulong _order_id;
        /// <summary>
        /// �������
        /// </summary>
        public ulong order_id
        {
            get { return _order_id; }

            set
            {
                _order_id = value;
                RaisePropertyChanged(() => order_id);
            }
        }
    }

    public class tdfutuL_3_5_Info : ObservableObject
    {

        private int _co_no;
        /// <summary>
        /// �������
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _exch_group_no;
        /// <summary>
        /// ��������
        /// </summary>
        public int exch_group_no
        {
            get { return _exch_group_no; }

            set
            {
                _exch_group_no = value;
                RaisePropertyChanged(() => exch_group_no);
            }
        }

        private int _asset_acco_no;
        /// <summary>
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private int _comm_opor;
        /// <summary>
        /// ָ���´���
        /// </summary>
        public int comm_opor
        {
            get { return _comm_opor; }

            set
            {
                _comm_opor = value;
                RaisePropertyChanged(() => comm_opor);
            }
        }

        private int _comm_date;
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_date
        {
            get { return _comm_date; }

            set
            {
                _comm_date = value;
                RaisePropertyChanged(() => comm_date);
            }
        }

        private int _comm_batch_no;
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_batch_no
        {
            get { return _comm_batch_no; }

            set
            {
                _comm_batch_no = value;
                RaisePropertyChanged(() => comm_batch_no);
            }
        }

        private int _comm_dir;
        /// <summary>
        /// ָ���
        /// </summary>
        public int comm_dir
        {
            get { return _comm_dir; }

            set
            {
                _comm_dir = value;
                RaisePropertyChanged(() => comm_dir);
            }
        }

        private double _comm_qty;
        /// <summary>
        /// ָ������
        /// </summary>
        public double comm_qty
        {
            get { return _comm_qty; }

            set
            {
                _comm_qty = value;
                RaisePropertyChanged(() => comm_qty);
            }
        }

        private double _comm_amt;
        /// <summary>
        /// ָ����
        /// </summary>
        public double comm_amt
        {
            get { return _comm_amt; }

            set
            {
                _comm_amt = value;
                RaisePropertyChanged(() => comm_amt);
            }
        }

        private double _order_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double order_qty
        {
            get { return _order_qty; }

            set
            {
                _order_qty = value;
                RaisePropertyChanged(() => order_qty);
            }
        }

        private double _comm_cancel_qty;
        /// <summary>
        /// ָ�������
        /// </summary>
        public double comm_cancel_qty
        {
            get { return _comm_cancel_qty; }

            set
            {
                _comm_cancel_qty = value;
                RaisePropertyChanged(() => comm_cancel_qty);
            }
        }

        private String _comm_status;
        /// <summary>
        /// ָ��״̬
        /// </summary>
        public String comm_status
        {
            get { return _comm_status; }

            set
            {
                _comm_status = value;
                RaisePropertyChanged(() => comm_status);
            }
        }

        private String _strike_status;
        /// <summary>
        /// �ɽ�״̬
        /// </summary>
        public String strike_status
        {
            get { return _strike_status; }

            set
            {
                _strike_status = value;
                RaisePropertyChanged(() => strike_status);
            }
        }
    }

    public class tdfutuL_3_6_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _opor_co_no;
        /// <summary>
        /// ����Ա�������
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
            }
        }

        private int _opor_no;
        /// <summary>
        /// ����Ա���
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private String _oper_mac;
        /// <summary>
        /// ����MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// ����IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// ������Ϣ
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// ������ʽ
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// ��������
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

        private int _init_date;
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_date
        {
            get { return _init_date; }

            set
            {
                _init_date = value;
                RaisePropertyChanged(() => init_date);
            }
        }

        private int _co_no;
        /// <summary>
        /// �������
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _exch_group_no;
        /// <summary>
        /// ��������
        /// </summary>
        public int exch_group_no
        {
            get { return _exch_group_no; }

            set
            {
                _exch_group_no = value;
                RaisePropertyChanged(() => exch_group_no);
            }
        }

        private int _asset_acco_no;
        /// <summary>
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private int _pass_no;
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no
        {
            get { return _pass_no; }

            set
            {
                _pass_no = value;
                RaisePropertyChanged(() => pass_no);
            }
        }

        private String _out_acco;
        /// <summary>
        /// �ⲿ�˺�
        /// </summary>
        public String out_acco
        {
            get { return _out_acco; }

            set
            {
                _out_acco = value;
                RaisePropertyChanged(() => out_acco);
            }
        }

        private String _exch_crncy_type;
        /// <summary>
        /// ���ױ���
        /// </summary>
        public String exch_crncy_type
        {
            get { return _exch_crncy_type; }

            set
            {
                _exch_crncy_type = value;
                RaisePropertyChanged(() => exch_crncy_type);
            }
        }

        private int _exch_no;
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no
        {
            get { return _exch_no; }

            set
            {
                _exch_no = value;
                RaisePropertyChanged(() => exch_no);
            }
        }

        private int _futu_acco_no;
        /// <summary>
        /// ���ױ�����
        /// </summary>
        public int futu_acco_no
        {
            get { return _futu_acco_no; }

            set
            {
                _futu_acco_no = value;
                RaisePropertyChanged(() => futu_acco_no);
            }
        }

        private int _contrc_code_no;
        /// <summary>
        /// ��Լ������
        /// </summary>
        public int contrc_code_no
        {
            get { return _contrc_code_no; }

            set
            {
                _contrc_code_no = value;
                RaisePropertyChanged(() => contrc_code_no);
            }
        }

        private String _contrc_code;
        /// <summary>
        /// ��Լ����
        /// </summary>
        public String contrc_code
        {
            get { return _contrc_code; }

            set
            {
                _contrc_code = value;
                RaisePropertyChanged(() => contrc_code);
            }
        }

        private int _contrc_type;
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_type
        {
            get { return _contrc_type; }

            set
            {
                _contrc_type = value;
                RaisePropertyChanged(() => contrc_type);
            }
        }

        private int _asset_type;
        /// <summary>
        /// �ʲ�����
        /// </summary>
        public int asset_type
        {
            get { return _asset_type; }

            set
            {
                _asset_type = value;
                RaisePropertyChanged(() => asset_type);
            }
        }

        private int _contrc_dir;
        /// <summary>
        /// ��ƽ����
        /// </summary>
        public int contrc_dir
        {
            get { return _contrc_dir; }

            set
            {
                _contrc_dir = value;
                RaisePropertyChanged(() => contrc_dir);
            }
        }

        private int _hedge_type;
        /// <summary>
        /// �ױ���־
        /// </summary>
        public int hedge_type
        {
            get { return _hedge_type; }

            set
            {
                _hedge_type = value;
                RaisePropertyChanged(() => hedge_type);
            }
        }

        private int _comm_date;
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_date
        {
            get { return _comm_date; }

            set
            {
                _comm_date = value;
                RaisePropertyChanged(() => comm_date);
            }
        }

        private int _comm_time;
        /// <summary>
        /// ָ��ʱ��
        /// </summary>
        public int comm_time
        {
            get { return _comm_time; }

            set
            {
                _comm_time = value;
                RaisePropertyChanged(() => comm_time);
            }
        }

        private int _comm_batch_no;
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_batch_no
        {
            get { return _comm_batch_no; }

            set
            {
                _comm_batch_no = value;
                RaisePropertyChanged(() => comm_batch_no);
            }
        }

        private int _comm_opor;
        /// <summary>
        /// ָ���´���
        /// </summary>
        public int comm_opor
        {
            get { return _comm_opor; }

            set
            {
                _comm_opor = value;
                RaisePropertyChanged(() => comm_opor);
            }
        }

        private int _comm_executor;
        /// <summary>
        /// ָ��ִ����
        /// </summary>
        public int comm_executor
        {
            get { return _comm_executor; }

            set
            {
                _comm_executor = value;
                RaisePropertyChanged(() => comm_executor);
            }
        }

        private int _comm_dir;
        /// <summary>
        /// ָ���
        /// </summary>
        public int comm_dir
        {
            get { return _comm_dir; }

            set
            {
                _comm_dir = value;
                RaisePropertyChanged(() => comm_dir);
            }
        }

        private double _comm_limit_price;
        /// <summary>
        /// ָ���޼�
        /// </summary>
        public double comm_limit_price
        {
            get { return _comm_limit_price; }

            set
            {
                _comm_limit_price = value;
                RaisePropertyChanged(() => comm_limit_price);
            }
        }

        private double _limit_actual_price;
        /// <summary>
        /// ָ��ʵ���޼�
        /// </summary>
        public double limit_actual_price
        {
            get { return _limit_actual_price; }

            set
            {
                _limit_actual_price = value;
                RaisePropertyChanged(() => limit_actual_price);
            }
        }

        private double _comm_qty;
        /// <summary>
        /// ָ������
        /// </summary>
        public double comm_qty
        {
            get { return _comm_qty; }

            set
            {
                _comm_qty = value;
                RaisePropertyChanged(() => comm_qty);
            }
        }

        private double _comm_amt;
        /// <summary>
        /// ָ����
        /// </summary>
        public double comm_amt
        {
            get { return _comm_amt; }

            set
            {
                _comm_amt = value;
                RaisePropertyChanged(() => comm_amt);
            }
        }

        private double _order_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double order_qty
        {
            get { return _order_qty; }

            set
            {
                _order_qty = value;
                RaisePropertyChanged(() => order_qty);
            }
        }

        private double _comm_cancel_qty;
        /// <summary>
        /// ָ�������
        /// </summary>
        public double comm_cancel_qty
        {
            get { return _comm_cancel_qty; }

            set
            {
                _comm_cancel_qty = value;
                RaisePropertyChanged(() => comm_cancel_qty);
            }
        }

        private double _strike_amt;
        /// <summary>
        /// �ɽ����
        /// </summary>
        public double strike_amt
        {
            get { return _strike_amt; }

            set
            {
                _strike_amt = value;
                RaisePropertyChanged(() => strike_amt);
            }
        }

        private double _strike_qty;
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_qty
        {
            get { return _strike_qty; }

            set
            {
                _strike_qty = value;
                RaisePropertyChanged(() => strike_qty);
            }
        }

        private double _comm_frozen_qty;
        /// <summary>
        /// ָ�������
        /// </summary>
        public double comm_frozen_qty
        {
            get { return _comm_frozen_qty; }

            set
            {
                _comm_frozen_qty = value;
                RaisePropertyChanged(() => comm_frozen_qty);
            }
        }

        private double _rece_margin;
        /// <summary>
        /// Ӧ�ձ�֤��
        /// </summary>
        public double rece_margin
        {
            get { return _rece_margin; }

            set
            {
                _rece_margin = value;
                RaisePropertyChanged(() => rece_margin);
            }
        }

        private int _capit_reback_days;
        /// <summary>
        /// �ʽ��ת����
        /// </summary>
        public int capit_reback_days
        {
            get { return _capit_reback_days; }

            set
            {
                _capit_reback_days = value;
                RaisePropertyChanged(() => capit_reback_days);
            }
        }

        private int _posi_reback_days;
        /// <summary>
        /// �ֲֻ�ת����
        /// </summary>
        public int posi_reback_days
        {
            get { return _posi_reback_days; }

            set
            {
                _posi_reback_days = value;
                RaisePropertyChanged(() => posi_reback_days);
            }
        }

        private String _strike_status;
        /// <summary>
        /// �ɽ�״̬
        /// </summary>
        public String strike_status
        {
            get { return _strike_status; }

            set
            {
                _strike_status = value;
                RaisePropertyChanged(() => strike_status);
            }
        }

        private String _comm_status;
        /// <summary>
        /// ָ��״̬
        /// </summary>
        public String comm_status
        {
            get { return _comm_status; }

            set
            {
                _comm_status = value;
                RaisePropertyChanged(() => comm_status);
            }
        }

        private int _comm_begin_date;
        /// <summary>
        /// ָ�ʼ����
        /// </summary>
        public int comm_begin_date
        {
            get { return _comm_begin_date; }

            set
            {
                _comm_begin_date = value;
                RaisePropertyChanged(() => comm_begin_date);
            }
        }

        private int _comm_end_date;
        /// <summary>
        /// ָ���������
        /// </summary>
        public int comm_end_date
        {
            get { return _comm_end_date; }

            set
            {
                _comm_end_date = value;
                RaisePropertyChanged(() => comm_end_date);
            }
        }

        private int _comm_begin_time;
        /// <summary>
        /// ָ�ʼʱ��
        /// </summary>
        public int comm_begin_time
        {
            get { return _comm_begin_time; }

            set
            {
                _comm_begin_time = value;
                RaisePropertyChanged(() => comm_begin_time);
            }
        }

        private int _comm_end_time;
        /// <summary>
        /// ָ�����ʱ��
        /// </summary>
        public int comm_end_time
        {
            get { return _comm_end_time; }

            set
            {
                _comm_end_time = value;
                RaisePropertyChanged(() => comm_end_time);
            }
        }

        private int _comm_comple_date;
        /// <summary>
        /// ָ���������
        /// </summary>
        public int comm_comple_date
        {
            get { return _comm_comple_date; }

            set
            {
                _comm_comple_date = value;
                RaisePropertyChanged(() => comm_comple_date);
            }
        }

        private int _comm_comple_time;
        /// <summary>
        /// ָ�����ʱ��
        /// </summary>
        public int comm_comple_time
        {
            get { return _comm_comple_time; }

            set
            {
                _comm_comple_time = value;
                RaisePropertyChanged(() => comm_comple_time);
            }
        }

        private int _comm_appr_date;
        /// <summary>
        /// ָ����������
        /// </summary>
        public int comm_appr_date
        {
            get { return _comm_appr_date; }

            set
            {
                _comm_appr_date = value;
                RaisePropertyChanged(() => comm_appr_date);
            }
        }

        private int _comm_appr_time;
        /// <summary>
        /// ָ������ʱ��
        /// </summary>
        public int comm_appr_time
        {
            get { return _comm_appr_time; }

            set
            {
                _comm_appr_time = value;
                RaisePropertyChanged(() => comm_appr_time);
            }
        }

        private String _comm_appr_status;
        /// <summary>
        /// ָ������״̬
        /// </summary>
        public String comm_appr_status
        {
            get { return _comm_appr_status; }

            set
            {
                _comm_appr_status = value;
                RaisePropertyChanged(() => comm_appr_status);
            }
        }

        private int _comm_appr_oper_no;
        /// <summary>
        /// ָ����������Ա���
        /// </summary>
        public int comm_appr_oper_no
        {
            get { return _comm_appr_oper_no; }

            set
            {
                _comm_appr_oper_no = value;
                RaisePropertyChanged(() => comm_appr_oper_no);
            }
        }

        private int _comm_appr_oper;
        /// <summary>
        /// ָ����������Ա
        /// </summary>
        public int comm_appr_oper
        {
            get { return _comm_appr_oper; }

            set
            {
                _comm_appr_oper = value;
                RaisePropertyChanged(() => comm_appr_oper);
            }
        }

        private String _comm_appr_remark;
        /// <summary>
        /// ָ������˵��
        /// </summary>
        public String comm_appr_remark
        {
            get { return _comm_appr_remark; }

            set
            {
                _comm_appr_remark = value;
                RaisePropertyChanged(() => comm_appr_remark);
            }
        }

        private ulong _external_no;
        /// <summary>
        /// �ⲿ���
        /// </summary>
        public ulong external_no
        {
            get { return _external_no; }

            set
            {
                _external_no = value;
                RaisePropertyChanged(() => external_no);
            }
        }

        private String _comb_code;
        /// <summary>
        /// ��ϱ���
        /// </summary>
        public String comb_code
        {
            get { return _comb_code; }

            set
            {
                _comb_code = value;
                RaisePropertyChanged(() => comb_code);
            }
        }

        private String _comm_oper_way;
        /// <summary>
        /// ָ�������ʽ
        /// </summary>
        public String comm_oper_way
        {
            get { return _comm_oper_way; }

            set
            {
                _comm_oper_way = value;
                RaisePropertyChanged(() => comm_oper_way);
            }
        }

        private String _remark_info;
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info
        {
            get { return _remark_info; }

            set
            {
                _remark_info = value;
                RaisePropertyChanged(() => remark_info);
            }
        }

        private int _comm_comple_flag;
        /// <summary>
        /// ָ����ɱ�־
        /// </summary>
        public int comm_comple_flag
        {
            get { return _comm_comple_flag; }

            set
            {
                _comm_comple_flag = value;
                RaisePropertyChanged(() => comm_comple_flag);
            }
        }

        private int _update_times;
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times
        {
            get { return _update_times; }

            set
            {
                _update_times = value;
                RaisePropertyChanged(() => update_times);
            }
        }
    }

    public class tdfutuL_3_7_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _opor_co_no;
        /// <summary>
        /// ����Ա�������
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
            }
        }

        private int _opor_no;
        /// <summary>
        /// ����Ա���
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private String _oper_mac;
        /// <summary>
        /// ����MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// ����IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// ������Ϣ
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// ������ʽ
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// ��������
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

        private int _init_date;
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_date
        {
            get { return _init_date; }

            set
            {
                _init_date = value;
                RaisePropertyChanged(() => init_date);
            }
        }

        private int _co_no;
        /// <summary>
        /// �������
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _exch_group_no;
        /// <summary>
        /// ��������
        /// </summary>
        public int exch_group_no
        {
            get { return _exch_group_no; }

            set
            {
                _exch_group_no = value;
                RaisePropertyChanged(() => exch_group_no);
            }
        }

        private int _asset_acco_no;
        /// <summary>
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private int _pass_no;
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no
        {
            get { return _pass_no; }

            set
            {
                _pass_no = value;
                RaisePropertyChanged(() => pass_no);
            }
        }

        private String _out_acco;
        /// <summary>
        /// �ⲿ�˺�
        /// </summary>
        public String out_acco
        {
            get { return _out_acco; }

            set
            {
                _out_acco = value;
                RaisePropertyChanged(() => out_acco);
            }
        }

        private String _exch_crncy_type;
        /// <summary>
        /// ���ױ���
        /// </summary>
        public String exch_crncy_type
        {
            get { return _exch_crncy_type; }

            set
            {
                _exch_crncy_type = value;
                RaisePropertyChanged(() => exch_crncy_type);
            }
        }

        private int _exch_no;
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no
        {
            get { return _exch_no; }

            set
            {
                _exch_no = value;
                RaisePropertyChanged(() => exch_no);
            }
        }

        private int _futu_acco_no;
        /// <summary>
        /// ���ױ�����
        /// </summary>
        public int futu_acco_no
        {
            get { return _futu_acco_no; }

            set
            {
                _futu_acco_no = value;
                RaisePropertyChanged(() => futu_acco_no);
            }
        }

        private int _contrc_code_no;
        /// <summary>
        /// ��Լ������
        /// </summary>
        public int contrc_code_no
        {
            get { return _contrc_code_no; }

            set
            {
                _contrc_code_no = value;
                RaisePropertyChanged(() => contrc_code_no);
            }
        }

        private String _contrc_code;
        /// <summary>
        /// ��Լ����
        /// </summary>
        public String contrc_code
        {
            get { return _contrc_code; }

            set
            {
                _contrc_code = value;
                RaisePropertyChanged(() => contrc_code);
            }
        }

        private int _contrc_type;
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_type
        {
            get { return _contrc_type; }

            set
            {
                _contrc_type = value;
                RaisePropertyChanged(() => contrc_type);
            }
        }

        private int _asset_type;
        /// <summary>
        /// �ʲ�����
        /// </summary>
        public int asset_type
        {
            get { return _asset_type; }

            set
            {
                _asset_type = value;
                RaisePropertyChanged(() => asset_type);
            }
        }

        private int _contrc_dir;
        /// <summary>
        /// ��ƽ����
        /// </summary>
        public int contrc_dir
        {
            get { return _contrc_dir; }

            set
            {
                _contrc_dir = value;
                RaisePropertyChanged(() => contrc_dir);
            }
        }

        private int _hedge_type;
        /// <summary>
        /// �ױ���־
        /// </summary>
        public int hedge_type
        {
            get { return _hedge_type; }

            set
            {
                _hedge_type = value;
                RaisePropertyChanged(() => hedge_type);
            }
        }

        private int _comm_date;
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_date
        {
            get { return _comm_date; }

            set
            {
                _comm_date = value;
                RaisePropertyChanged(() => comm_date);
            }
        }

        private int _comm_time;
        /// <summary>
        /// ָ��ʱ��
        /// </summary>
        public int comm_time
        {
            get { return _comm_time; }

            set
            {
                _comm_time = value;
                RaisePropertyChanged(() => comm_time);
            }
        }

        private int _comm_batch_no;
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_batch_no
        {
            get { return _comm_batch_no; }

            set
            {
                _comm_batch_no = value;
                RaisePropertyChanged(() => comm_batch_no);
            }
        }

        private int _comm_opor;
        /// <summary>
        /// ָ���´���
        /// </summary>
        public int comm_opor
        {
            get { return _comm_opor; }

            set
            {
                _comm_opor = value;
                RaisePropertyChanged(() => comm_opor);
            }
        }

        private int _comm_executor;
        /// <summary>
        /// ָ��ִ����
        /// </summary>
        public int comm_executor
        {
            get { return _comm_executor; }

            set
            {
                _comm_executor = value;
                RaisePropertyChanged(() => comm_executor);
            }
        }

        private int _comm_dir;
        /// <summary>
        /// ָ���
        /// </summary>
        public int comm_dir
        {
            get { return _comm_dir; }

            set
            {
                _comm_dir = value;
                RaisePropertyChanged(() => comm_dir);
            }
        }

        private double _comm_limit_price;
        /// <summary>
        /// ָ���޼�
        /// </summary>
        public double comm_limit_price
        {
            get { return _comm_limit_price; }

            set
            {
                _comm_limit_price = value;
                RaisePropertyChanged(() => comm_limit_price);
            }
        }

        private double _limit_actual_price;
        /// <summary>
        /// ָ��ʵ���޼�
        /// </summary>
        public double limit_actual_price
        {
            get { return _limit_actual_price; }

            set
            {
                _limit_actual_price = value;
                RaisePropertyChanged(() => limit_actual_price);
            }
        }

        private double _comm_qty;
        /// <summary>
        /// ָ������
        /// </summary>
        public double comm_qty
        {
            get { return _comm_qty; }

            set
            {
                _comm_qty = value;
                RaisePropertyChanged(() => comm_qty);
            }
        }

        private double _comm_amt;
        /// <summary>
        /// ָ����
        /// </summary>
        public double comm_amt
        {
            get { return _comm_amt; }

            set
            {
                _comm_amt = value;
                RaisePropertyChanged(() => comm_amt);
            }
        }

        private double _order_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double order_qty
        {
            get { return _order_qty; }

            set
            {
                _order_qty = value;
                RaisePropertyChanged(() => order_qty);
            }
        }

        private double _comm_cancel_qty;
        /// <summary>
        /// ָ�������
        /// </summary>
        public double comm_cancel_qty
        {
            get { return _comm_cancel_qty; }

            set
            {
                _comm_cancel_qty = value;
                RaisePropertyChanged(() => comm_cancel_qty);
            }
        }

        private double _strike_amt;
        /// <summary>
        /// �ɽ����
        /// </summary>
        public double strike_amt
        {
            get { return _strike_amt; }

            set
            {
                _strike_amt = value;
                RaisePropertyChanged(() => strike_amt);
            }
        }

        private double _strike_qty;
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_qty
        {
            get { return _strike_qty; }

            set
            {
                _strike_qty = value;
                RaisePropertyChanged(() => strike_qty);
            }
        }

        private double _comm_frozen_qty;
        /// <summary>
        /// ָ�������
        /// </summary>
        public double comm_frozen_qty
        {
            get { return _comm_frozen_qty; }

            set
            {
                _comm_frozen_qty = value;
                RaisePropertyChanged(() => comm_frozen_qty);
            }
        }

        private double _rece_margin;
        /// <summary>
        /// Ӧ�ձ�֤��
        /// </summary>
        public double rece_margin
        {
            get { return _rece_margin; }

            set
            {
                _rece_margin = value;
                RaisePropertyChanged(() => rece_margin);
            }
        }

        private int _capit_reback_days;
        /// <summary>
        /// �ʽ��ת����
        /// </summary>
        public int capit_reback_days
        {
            get { return _capit_reback_days; }

            set
            {
                _capit_reback_days = value;
                RaisePropertyChanged(() => capit_reback_days);
            }
        }

        private int _posi_reback_days;
        /// <summary>
        /// �ֲֻ�ת����
        /// </summary>
        public int posi_reback_days
        {
            get { return _posi_reback_days; }

            set
            {
                _posi_reback_days = value;
                RaisePropertyChanged(() => posi_reback_days);
            }
        }

        private String _strike_status;
        /// <summary>
        /// �ɽ�״̬
        /// </summary>
        public String strike_status
        {
            get { return _strike_status; }

            set
            {
                _strike_status = value;
                RaisePropertyChanged(() => strike_status);
            }
        }

        private String _comm_status;
        /// <summary>
        /// ָ��״̬
        /// </summary>
        public String comm_status
        {
            get { return _comm_status; }

            set
            {
                _comm_status = value;
                RaisePropertyChanged(() => comm_status);
            }
        }

        private int _comm_begin_date;
        /// <summary>
        /// ָ�ʼ����
        /// </summary>
        public int comm_begin_date
        {
            get { return _comm_begin_date; }

            set
            {
                _comm_begin_date = value;
                RaisePropertyChanged(() => comm_begin_date);
            }
        }

        private int _comm_end_date;
        /// <summary>
        /// ָ���������
        /// </summary>
        public int comm_end_date
        {
            get { return _comm_end_date; }

            set
            {
                _comm_end_date = value;
                RaisePropertyChanged(() => comm_end_date);
            }
        }

        private int _comm_begin_time;
        /// <summary>
        /// ָ�ʼʱ��
        /// </summary>
        public int comm_begin_time
        {
            get { return _comm_begin_time; }

            set
            {
                _comm_begin_time = value;
                RaisePropertyChanged(() => comm_begin_time);
            }
        }

        private int _comm_end_time;
        /// <summary>
        /// ָ�����ʱ��
        /// </summary>
        public int comm_end_time
        {
            get { return _comm_end_time; }

            set
            {
                _comm_end_time = value;
                RaisePropertyChanged(() => comm_end_time);
            }
        }

        private int _comm_comple_date;
        /// <summary>
        /// ָ���������
        /// </summary>
        public int comm_comple_date
        {
            get { return _comm_comple_date; }

            set
            {
                _comm_comple_date = value;
                RaisePropertyChanged(() => comm_comple_date);
            }
        }

        private int _comm_comple_time;
        /// <summary>
        /// ָ�����ʱ��
        /// </summary>
        public int comm_comple_time
        {
            get { return _comm_comple_time; }

            set
            {
                _comm_comple_time = value;
                RaisePropertyChanged(() => comm_comple_time);
            }
        }

        private int _comm_appr_date;
        /// <summary>
        /// ָ����������
        /// </summary>
        public int comm_appr_date
        {
            get { return _comm_appr_date; }

            set
            {
                _comm_appr_date = value;
                RaisePropertyChanged(() => comm_appr_date);
            }
        }

        private int _comm_appr_time;
        /// <summary>
        /// ָ������ʱ��
        /// </summary>
        public int comm_appr_time
        {
            get { return _comm_appr_time; }

            set
            {
                _comm_appr_time = value;
                RaisePropertyChanged(() => comm_appr_time);
            }
        }

        private String _comm_appr_status;
        /// <summary>
        /// ָ������״̬
        /// </summary>
        public String comm_appr_status
        {
            get { return _comm_appr_status; }

            set
            {
                _comm_appr_status = value;
                RaisePropertyChanged(() => comm_appr_status);
            }
        }

        private int _comm_appr_oper_no;
        /// <summary>
        /// ָ����������Ա���
        /// </summary>
        public int comm_appr_oper_no
        {
            get { return _comm_appr_oper_no; }

            set
            {
                _comm_appr_oper_no = value;
                RaisePropertyChanged(() => comm_appr_oper_no);
            }
        }

        private int _comm_appr_oper;
        /// <summary>
        /// ָ����������Ա
        /// </summary>
        public int comm_appr_oper
        {
            get { return _comm_appr_oper; }

            set
            {
                _comm_appr_oper = value;
                RaisePropertyChanged(() => comm_appr_oper);
            }
        }

        private String _comm_appr_remark;
        /// <summary>
        /// ָ������˵��
        /// </summary>
        public String comm_appr_remark
        {
            get { return _comm_appr_remark; }

            set
            {
                _comm_appr_remark = value;
                RaisePropertyChanged(() => comm_appr_remark);
            }
        }

        private ulong _external_no;
        /// <summary>
        /// �ⲿ���
        /// </summary>
        public ulong external_no
        {
            get { return _external_no; }

            set
            {
                _external_no = value;
                RaisePropertyChanged(() => external_no);
            }
        }

        private String _comb_code;
        /// <summary>
        /// ��ϱ���
        /// </summary>
        public String comb_code
        {
            get { return _comb_code; }

            set
            {
                _comb_code = value;
                RaisePropertyChanged(() => comb_code);
            }
        }

        private String _comm_oper_way;
        /// <summary>
        /// ָ�������ʽ
        /// </summary>
        public String comm_oper_way
        {
            get { return _comm_oper_way; }

            set
            {
                _comm_oper_way = value;
                RaisePropertyChanged(() => comm_oper_way);
            }
        }

        private String _remark_info;
        /// <summary>
        /// ��ע��Ϣ
        /// </summary>
        public String remark_info
        {
            get { return _remark_info; }

            set
            {
                _remark_info = value;
                RaisePropertyChanged(() => remark_info);
            }
        }

        private int _comm_comple_flag;
        /// <summary>
        /// ָ����ɱ�־
        /// </summary>
        public int comm_comple_flag
        {
            get { return _comm_comple_flag; }

            set
            {
                _comm_comple_flag = value;
                RaisePropertyChanged(() => comm_comple_flag);
            }
        }

        private int _update_times;
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times
        {
            get { return _update_times; }

            set
            {
                _update_times = value;
                RaisePropertyChanged(() => update_times);
            }
        }
    }

    public class tdfutuL_3_8_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _opor_co_no;
        /// <summary>
        /// ����Ա�������
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
            }
        }

        private int _opor_no;
        /// <summary>
        /// ����Ա���
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private String _oper_mac;
        /// <summary>
        /// ����MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// ����IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// ������Ϣ
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// ������ʽ
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// ��������
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

        private int _init_date;
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_date
        {
            get { return _init_date; }

            set
            {
                _init_date = value;
                RaisePropertyChanged(() => init_date);
            }
        }

        private int _co_no;
        /// <summary>
        /// �������
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _exch_group_no;
        /// <summary>
        /// ��������
        /// </summary>
        public int exch_group_no
        {
            get { return _exch_group_no; }

            set
            {
                _exch_group_no = value;
                RaisePropertyChanged(() => exch_group_no);
            }
        }

        private int _exch_no;
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no
        {
            get { return _exch_no; }

            set
            {
                _exch_no = value;
                RaisePropertyChanged(() => exch_no);
            }
        }

        private int _contrc_code_no;
        /// <summary>
        /// ��Լ������
        /// </summary>
        public int contrc_code_no
        {
            get { return _contrc_code_no; }

            set
            {
                _contrc_code_no = value;
                RaisePropertyChanged(() => contrc_code_no);
            }
        }

        private int _contrc_type;
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_type
        {
            get { return _contrc_type; }

            set
            {
                _contrc_type = value;
                RaisePropertyChanged(() => contrc_type);
            }
        }

        private int _comm_date;
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_date
        {
            get { return _comm_date; }

            set
            {
                _comm_date = value;
                RaisePropertyChanged(() => comm_date);
            }
        }

        private ulong _comm_id;
        /// <summary>
        /// ָ�����
        /// </summary>
        public ulong comm_id
        {
            get { return _comm_id; }

            set
            {
                _comm_id = value;
                RaisePropertyChanged(() => comm_id);
            }
        }

        private int _comm_batch_no;
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_batch_no
        {
            get { return _comm_batch_no; }

            set
            {
                _comm_batch_no = value;
                RaisePropertyChanged(() => comm_batch_no);
            }
        }

        private int _comm_dir;
        /// <summary>
        /// ָ���
        /// </summary>
        public int comm_dir
        {
            get { return _comm_dir; }

            set
            {
                _comm_dir = value;
                RaisePropertyChanged(() => comm_dir);
            }
        }

        private String _comm_status;
        /// <summary>
        /// ָ��״̬
        /// </summary>
        public String comm_status
        {
            get { return _comm_status; }

            set
            {
                _comm_status = value;
                RaisePropertyChanged(() => comm_status);
            }
        }

        private int _comm_opor;
        /// <summary>
        /// ָ���´���
        /// </summary>
        public int comm_opor
        {
            get { return _comm_opor; }

            set
            {
                _comm_opor = value;
                RaisePropertyChanged(() => comm_opor);
            }
        }

        private int _disp_date;
        /// <summary>
        /// �ַ�����
        /// </summary>
        public int disp_date
        {
            get { return _disp_date; }

            set
            {
                _disp_date = value;
                RaisePropertyChanged(() => disp_date);
            }
        }

        private int _disp_time;
        /// <summary>
        /// �ַ�ʱ��
        /// </summary>
        public int disp_time
        {
            get { return _disp_time; }

            set
            {
                _disp_time = value;
                RaisePropertyChanged(() => disp_time);
            }
        }

        private int _before_comm_executor;
        /// <summary>
        /// ǰָ��ִ����
        /// </summary>
        public int before_comm_executor
        {
            get { return _before_comm_executor; }

            set
            {
                _before_comm_executor = value;
                RaisePropertyChanged(() => before_comm_executor);
            }
        }

        private int _comm_executor;
        /// <summary>
        /// ָ��ִ����
        /// </summary>
        public int comm_executor
        {
            get { return _comm_executor; }

            set
            {
                _comm_executor = value;
                RaisePropertyChanged(() => comm_executor);
            }
        }

        private int _is_withdraw;
        /// <summary>
        /// �Ƿ񳷵�
        /// </summary>
        public int is_withdraw
        {
            get { return _is_withdraw; }

            set
            {
                _is_withdraw = value;
                RaisePropertyChanged(() => is_withdraw);
            }
        }

        private int _disp_flag;
        /// <summary>
        /// �ַ���ʽ
        /// </summary>
        public int disp_flag
        {
            get { return _disp_flag; }

            set
            {
                _disp_flag = value;
                RaisePropertyChanged(() => disp_flag);
            }
        }

        private String _disp_remark;
        /// <summary>
        /// �ַ�˵��
        /// </summary>
        public String disp_remark
        {
            get { return _disp_remark; }

            set
            {
                _disp_remark = value;
                RaisePropertyChanged(() => disp_remark);
            }
        }

        private int _update_times;
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times
        {
            get { return _update_times; }

            set
            {
                _update_times = value;
                RaisePropertyChanged(() => update_times);
            }
        }
    }

    public class tdfutuL_3_9_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _opor_co_no;
        /// <summary>
        /// ����Ա�������
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
            }
        }

        private int _opor_no;
        /// <summary>
        /// ����Ա���
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private String _oper_mac;
        /// <summary>
        /// ����MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// ����IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// ������Ϣ
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// ������ʽ
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// ��������
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

        private int _init_date;
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_date
        {
            get { return _init_date; }

            set
            {
                _init_date = value;
                RaisePropertyChanged(() => init_date);
            }
        }

        private int _co_no;
        /// <summary>
        /// �������
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _exch_group_no;
        /// <summary>
        /// ��������
        /// </summary>
        public int exch_group_no
        {
            get { return _exch_group_no; }

            set
            {
                _exch_group_no = value;
                RaisePropertyChanged(() => exch_group_no);
            }
        }

        private int _exch_no;
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no
        {
            get { return _exch_no; }

            set
            {
                _exch_no = value;
                RaisePropertyChanged(() => exch_no);
            }
        }

        private int _contrc_code_no;
        /// <summary>
        /// ��Լ������
        /// </summary>
        public int contrc_code_no
        {
            get { return _contrc_code_no; }

            set
            {
                _contrc_code_no = value;
                RaisePropertyChanged(() => contrc_code_no);
            }
        }

        private int _contrc_type;
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_type
        {
            get { return _contrc_type; }

            set
            {
                _contrc_type = value;
                RaisePropertyChanged(() => contrc_type);
            }
        }

        private int _comm_date;
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_date
        {
            get { return _comm_date; }

            set
            {
                _comm_date = value;
                RaisePropertyChanged(() => comm_date);
            }
        }

        private ulong _comm_id;
        /// <summary>
        /// ָ�����
        /// </summary>
        public ulong comm_id
        {
            get { return _comm_id; }

            set
            {
                _comm_id = value;
                RaisePropertyChanged(() => comm_id);
            }
        }

        private int _comm_batch_no;
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_batch_no
        {
            get { return _comm_batch_no; }

            set
            {
                _comm_batch_no = value;
                RaisePropertyChanged(() => comm_batch_no);
            }
        }

        private int _comm_dir;
        /// <summary>
        /// ָ���
        /// </summary>
        public int comm_dir
        {
            get { return _comm_dir; }

            set
            {
                _comm_dir = value;
                RaisePropertyChanged(() => comm_dir);
            }
        }

        private String _comm_status;
        /// <summary>
        /// ָ��״̬
        /// </summary>
        public String comm_status
        {
            get { return _comm_status; }

            set
            {
                _comm_status = value;
                RaisePropertyChanged(() => comm_status);
            }
        }

        private int _comm_opor;
        /// <summary>
        /// ָ���´���
        /// </summary>
        public int comm_opor
        {
            get { return _comm_opor; }

            set
            {
                _comm_opor = value;
                RaisePropertyChanged(() => comm_opor);
            }
        }

        private int _disp_date;
        /// <summary>
        /// �ַ�����
        /// </summary>
        public int disp_date
        {
            get { return _disp_date; }

            set
            {
                _disp_date = value;
                RaisePropertyChanged(() => disp_date);
            }
        }

        private int _disp_time;
        /// <summary>
        /// �ַ�ʱ��
        /// </summary>
        public int disp_time
        {
            get { return _disp_time; }

            set
            {
                _disp_time = value;
                RaisePropertyChanged(() => disp_time);
            }
        }

        private int _before_comm_executor;
        /// <summary>
        /// ǰָ��ִ����
        /// </summary>
        public int before_comm_executor
        {
            get { return _before_comm_executor; }

            set
            {
                _before_comm_executor = value;
                RaisePropertyChanged(() => before_comm_executor);
            }
        }

        private int _comm_executor;
        /// <summary>
        /// ָ��ִ����
        /// </summary>
        public int comm_executor
        {
            get { return _comm_executor; }

            set
            {
                _comm_executor = value;
                RaisePropertyChanged(() => comm_executor);
            }
        }

        private int _is_withdraw;
        /// <summary>
        /// �Ƿ񳷵�
        /// </summary>
        public int is_withdraw
        {
            get { return _is_withdraw; }

            set
            {
                _is_withdraw = value;
                RaisePropertyChanged(() => is_withdraw);
            }
        }

        private int _disp_flag;
        /// <summary>
        /// �ַ���ʽ
        /// </summary>
        public int disp_flag
        {
            get { return _disp_flag; }

            set
            {
                _disp_flag = value;
                RaisePropertyChanged(() => disp_flag);
            }
        }

        private String _disp_remark;
        /// <summary>
        /// �ַ�˵��
        /// </summary>
        public String disp_remark
        {
            get { return _disp_remark; }

            set
            {
                _disp_remark = value;
                RaisePropertyChanged(() => disp_remark);
            }
        }

        private int _update_times;
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times
        {
            get { return _update_times; }

            set
            {
                _update_times = value;
                RaisePropertyChanged(() => update_times);
            }
        }
    }

    public class tdfutuL_3_10_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _opor_co_no;
        /// <summary>
        /// ����Ա�������
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
            }
        }

        private int _opor_no;
        /// <summary>
        /// ����Ա���
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private String _oper_mac;
        /// <summary>
        /// ����MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// ����IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// ������Ϣ
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// ������ʽ
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// ��������
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

        private int _init_date;
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_date
        {
            get { return _init_date; }

            set
            {
                _init_date = value;
                RaisePropertyChanged(() => init_date);
            }
        }

        private int _comm_appr_date;
        /// <summary>
        /// ָ����������
        /// </summary>
        public int comm_appr_date
        {
            get { return _comm_appr_date; }

            set
            {
                _comm_appr_date = value;
                RaisePropertyChanged(() => comm_appr_date);
            }
        }

        private int _comm_appr_time;
        /// <summary>
        /// ָ������ʱ��
        /// </summary>
        public int comm_appr_time
        {
            get { return _comm_appr_time; }

            set
            {
                _comm_appr_time = value;
                RaisePropertyChanged(() => comm_appr_time);
            }
        }

        private int _comm_appr_oper_no;
        /// <summary>
        /// ָ����������Ա���
        /// </summary>
        public int comm_appr_oper_no
        {
            get { return _comm_appr_oper_no; }

            set
            {
                _comm_appr_oper_no = value;
                RaisePropertyChanged(() => comm_appr_oper_no);
            }
        }

        private int _comm_appr_oper;
        /// <summary>
        /// ָ����������Ա
        /// </summary>
        public int comm_appr_oper
        {
            get { return _comm_appr_oper; }

            set
            {
                _comm_appr_oper = value;
                RaisePropertyChanged(() => comm_appr_oper);
            }
        }

        private int _co_no;
        /// <summary>
        /// �������
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _exch_group_no;
        /// <summary>
        /// ��������
        /// </summary>
        public int exch_group_no
        {
            get { return _exch_group_no; }

            set
            {
                _exch_group_no = value;
                RaisePropertyChanged(() => exch_group_no);
            }
        }

        private int _asset_acco_no;
        /// <summary>
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private int _exch_no;
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no
        {
            get { return _exch_no; }

            set
            {
                _exch_no = value;
                RaisePropertyChanged(() => exch_no);
            }
        }

        private int _futu_acco_no;
        /// <summary>
        /// ���ױ�����
        /// </summary>
        public int futu_acco_no
        {
            get { return _futu_acco_no; }

            set
            {
                _futu_acco_no = value;
                RaisePropertyChanged(() => futu_acco_no);
            }
        }

        private int _contrc_code_no;
        /// <summary>
        /// ��Լ������
        /// </summary>
        public int contrc_code_no
        {
            get { return _contrc_code_no; }

            set
            {
                _contrc_code_no = value;
                RaisePropertyChanged(() => contrc_code_no);
            }
        }

        private int _contrc_type;
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_type
        {
            get { return _contrc_type; }

            set
            {
                _contrc_type = value;
                RaisePropertyChanged(() => contrc_type);
            }
        }

        private int _comm_date;
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_date
        {
            get { return _comm_date; }

            set
            {
                _comm_date = value;
                RaisePropertyChanged(() => comm_date);
            }
        }

        private ulong _comm_id;
        /// <summary>
        /// ָ�����
        /// </summary>
        public ulong comm_id
        {
            get { return _comm_id; }

            set
            {
                _comm_id = value;
                RaisePropertyChanged(() => comm_id);
            }
        }

        private int _comm_opor;
        /// <summary>
        /// ָ���´���
        /// </summary>
        public int comm_opor
        {
            get { return _comm_opor; }

            set
            {
                _comm_opor = value;
                RaisePropertyChanged(() => comm_opor);
            }
        }

        private int _comm_dir;
        /// <summary>
        /// ָ���
        /// </summary>
        public int comm_dir
        {
            get { return _comm_dir; }

            set
            {
                _comm_dir = value;
                RaisePropertyChanged(() => comm_dir);
            }
        }

        private double _comm_qty;
        /// <summary>
        /// ָ������
        /// </summary>
        public double comm_qty
        {
            get { return _comm_qty; }

            set
            {
                _comm_qty = value;
                RaisePropertyChanged(() => comm_qty);
            }
        }

        private double _comm_limit_price;
        /// <summary>
        /// ָ���޼�
        /// </summary>
        public double comm_limit_price
        {
            get { return _comm_limit_price; }

            set
            {
                _comm_limit_price = value;
                RaisePropertyChanged(() => comm_limit_price);
            }
        }

        private double _limit_actual_price;
        /// <summary>
        /// ָ��ʵ���޼�
        /// </summary>
        public double limit_actual_price
        {
            get { return _limit_actual_price; }

            set
            {
                _limit_actual_price = value;
                RaisePropertyChanged(() => limit_actual_price);
            }
        }

        private int _comm_begin_date;
        /// <summary>
        /// ָ�ʼ����
        /// </summary>
        public int comm_begin_date
        {
            get { return _comm_begin_date; }

            set
            {
                _comm_begin_date = value;
                RaisePropertyChanged(() => comm_begin_date);
            }
        }

        private int _comm_end_date;
        /// <summary>
        /// ָ���������
        /// </summary>
        public int comm_end_date
        {
            get { return _comm_end_date; }

            set
            {
                _comm_end_date = value;
                RaisePropertyChanged(() => comm_end_date);
            }
        }

        private int _comm_begin_time;
        /// <summary>
        /// ָ�ʼʱ��
        /// </summary>
        public int comm_begin_time
        {
            get { return _comm_begin_time; }

            set
            {
                _comm_begin_time = value;
                RaisePropertyChanged(() => comm_begin_time);
            }
        }

        private int _comm_end_time;
        /// <summary>
        /// ָ�����ʱ��
        /// </summary>
        public int comm_end_time
        {
            get { return _comm_end_time; }

            set
            {
                _comm_end_time = value;
                RaisePropertyChanged(() => comm_end_time);
            }
        }

        private String _comm_appr_status;
        /// <summary>
        /// ָ������״̬
        /// </summary>
        public String comm_appr_status
        {
            get { return _comm_appr_status; }

            set
            {
                _comm_appr_status = value;
                RaisePropertyChanged(() => comm_appr_status);
            }
        }

        private String _comm_appr_remark;
        /// <summary>
        /// ָ������˵��
        /// </summary>
        public String comm_appr_remark
        {
            get { return _comm_appr_remark; }

            set
            {
                _comm_appr_remark = value;
                RaisePropertyChanged(() => comm_appr_remark);
            }
        }

        private int _update_times;
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times
        {
            get { return _update_times; }

            set
            {
                _update_times = value;
                RaisePropertyChanged(() => update_times);
            }
        }
    }

    public class tdfutuL_3_11_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _opor_co_no;
        /// <summary>
        /// ����Ա�������
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
            }
        }

        private int _opor_no;
        /// <summary>
        /// ����Ա���
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private String _oper_mac;
        /// <summary>
        /// ����MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// ����IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// ������Ϣ
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// ������ʽ
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// ��������
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

        private int _init_date;
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_date
        {
            get { return _init_date; }

            set
            {
                _init_date = value;
                RaisePropertyChanged(() => init_date);
            }
        }

        private int _comm_appr_date;
        /// <summary>
        /// ָ����������
        /// </summary>
        public int comm_appr_date
        {
            get { return _comm_appr_date; }

            set
            {
                _comm_appr_date = value;
                RaisePropertyChanged(() => comm_appr_date);
            }
        }

        private int _comm_appr_time;
        /// <summary>
        /// ָ������ʱ��
        /// </summary>
        public int comm_appr_time
        {
            get { return _comm_appr_time; }

            set
            {
                _comm_appr_time = value;
                RaisePropertyChanged(() => comm_appr_time);
            }
        }

        private int _comm_appr_oper_no;
        /// <summary>
        /// ָ����������Ա���
        /// </summary>
        public int comm_appr_oper_no
        {
            get { return _comm_appr_oper_no; }

            set
            {
                _comm_appr_oper_no = value;
                RaisePropertyChanged(() => comm_appr_oper_no);
            }
        }

        private int _comm_appr_oper;
        /// <summary>
        /// ָ����������Ա
        /// </summary>
        public int comm_appr_oper
        {
            get { return _comm_appr_oper; }

            set
            {
                _comm_appr_oper = value;
                RaisePropertyChanged(() => comm_appr_oper);
            }
        }

        private int _co_no;
        /// <summary>
        /// �������
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _exch_group_no;
        /// <summary>
        /// ��������
        /// </summary>
        public int exch_group_no
        {
            get { return _exch_group_no; }

            set
            {
                _exch_group_no = value;
                RaisePropertyChanged(() => exch_group_no);
            }
        }

        private int _asset_acco_no;
        /// <summary>
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private int _exch_no;
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no
        {
            get { return _exch_no; }

            set
            {
                _exch_no = value;
                RaisePropertyChanged(() => exch_no);
            }
        }

        private int _futu_acco_no;
        /// <summary>
        /// ���ױ�����
        /// </summary>
        public int futu_acco_no
        {
            get { return _futu_acco_no; }

            set
            {
                _futu_acco_no = value;
                RaisePropertyChanged(() => futu_acco_no);
            }
        }

        private int _contrc_type;
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_type
        {
            get { return _contrc_type; }

            set
            {
                _contrc_type = value;
                RaisePropertyChanged(() => contrc_type);
            }
        }

        private int _comm_date;
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_date
        {
            get { return _comm_date; }

            set
            {
                _comm_date = value;
                RaisePropertyChanged(() => comm_date);
            }
        }

        private ulong _comm_id;
        /// <summary>
        /// ָ�����
        /// </summary>
        public ulong comm_id
        {
            get { return _comm_id; }

            set
            {
                _comm_id = value;
                RaisePropertyChanged(() => comm_id);
            }
        }

        private int _comm_opor;
        /// <summary>
        /// ָ���´���
        /// </summary>
        public int comm_opor
        {
            get { return _comm_opor; }

            set
            {
                _comm_opor = value;
                RaisePropertyChanged(() => comm_opor);
            }
        }

        private int _comm_dir;
        /// <summary>
        /// ָ���
        /// </summary>
        public int comm_dir
        {
            get { return _comm_dir; }

            set
            {
                _comm_dir = value;
                RaisePropertyChanged(() => comm_dir);
            }
        }

        private double _comm_qty;
        /// <summary>
        /// ָ������
        /// </summary>
        public double comm_qty
        {
            get { return _comm_qty; }

            set
            {
                _comm_qty = value;
                RaisePropertyChanged(() => comm_qty);
            }
        }

        private double _comm_limit_price;
        /// <summary>
        /// ָ���޼�
        /// </summary>
        public double comm_limit_price
        {
            get { return _comm_limit_price; }

            set
            {
                _comm_limit_price = value;
                RaisePropertyChanged(() => comm_limit_price);
            }
        }

        private double _limit_actual_price;
        /// <summary>
        /// ָ��ʵ���޼�
        /// </summary>
        public double limit_actual_price
        {
            get { return _limit_actual_price; }

            set
            {
                _limit_actual_price = value;
                RaisePropertyChanged(() => limit_actual_price);
            }
        }

        private int _comm_begin_date;
        /// <summary>
        /// ָ�ʼ����
        /// </summary>
        public int comm_begin_date
        {
            get { return _comm_begin_date; }

            set
            {
                _comm_begin_date = value;
                RaisePropertyChanged(() => comm_begin_date);
            }
        }

        private int _comm_end_date;
        /// <summary>
        /// ָ���������
        /// </summary>
        public int comm_end_date
        {
            get { return _comm_end_date; }

            set
            {
                _comm_end_date = value;
                RaisePropertyChanged(() => comm_end_date);
            }
        }

        private int _comm_begin_time;
        /// <summary>
        /// ָ�ʼʱ��
        /// </summary>
        public int comm_begin_time
        {
            get { return _comm_begin_time; }

            set
            {
                _comm_begin_time = value;
                RaisePropertyChanged(() => comm_begin_time);
            }
        }

        private int _comm_end_time;
        /// <summary>
        /// ָ�����ʱ��
        /// </summary>
        public int comm_end_time
        {
            get { return _comm_end_time; }

            set
            {
                _comm_end_time = value;
                RaisePropertyChanged(() => comm_end_time);
            }
        }

        private String _comm_appr_status;
        /// <summary>
        /// ָ������״̬
        /// </summary>
        public String comm_appr_status
        {
            get { return _comm_appr_status; }

            set
            {
                _comm_appr_status = value;
                RaisePropertyChanged(() => comm_appr_status);
            }
        }

        private String _comm_appr_remark;
        /// <summary>
        /// ָ������˵��
        /// </summary>
        public String comm_appr_remark
        {
            get { return _comm_appr_remark; }

            set
            {
                _comm_appr_remark = value;
                RaisePropertyChanged(() => comm_appr_remark);
            }
        }

        private int _update_times;
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times
        {
            get { return _update_times; }

            set
            {
                _update_times = value;
                RaisePropertyChanged(() => update_times);
            }
        }
    }

    public class tdfutuL_3_12_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _opor_co_no;
        /// <summary>
        /// ����Ա�������
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
            }
        }

        private int _opor_no;
        /// <summary>
        /// ����Ա���
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private String _oper_mac;
        /// <summary>
        /// ����MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// ����IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// ������Ϣ
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// ������ʽ
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// ��������
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

        private int _init_date;
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_date
        {
            get { return _init_date; }

            set
            {
                _init_date = value;
                RaisePropertyChanged(() => init_date);
            }
        }

        private int _co_no;
        /// <summary>
        /// �������
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _exch_group_no;
        /// <summary>
        /// ��������
        /// </summary>
        public int exch_group_no
        {
            get { return _exch_group_no; }

            set
            {
                _exch_group_no = value;
                RaisePropertyChanged(() => exch_group_no);
            }
        }

        private int _asset_acco_no;
        /// <summary>
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private int _exch_no;
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no
        {
            get { return _exch_no; }

            set
            {
                _exch_no = value;
                RaisePropertyChanged(() => exch_no);
            }
        }

        private int _contrc_code_no;
        /// <summary>
        /// ��Լ������
        /// </summary>
        public int contrc_code_no
        {
            get { return _contrc_code_no; }

            set
            {
                _contrc_code_no = value;
                RaisePropertyChanged(() => contrc_code_no);
            }
        }

        private int _asset_type;
        /// <summary>
        /// �ʲ�����
        /// </summary>
        public int asset_type
        {
            get { return _asset_type; }

            set
            {
                _asset_type = value;
                RaisePropertyChanged(() => asset_type);
            }
        }

        private int _comm_opor;
        /// <summary>
        /// ָ���´���
        /// </summary>
        public int comm_opor
        {
            get { return _comm_opor; }

            set
            {
                _comm_opor = value;
                RaisePropertyChanged(() => comm_opor);
            }
        }

        private int _comm_executor;
        /// <summary>
        /// ָ��ִ����
        /// </summary>
        public int comm_executor
        {
            get { return _comm_executor; }

            set
            {
                _comm_executor = value;
                RaisePropertyChanged(() => comm_executor);
            }
        }

        private int _comm_date;
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_date
        {
            get { return _comm_date; }

            set
            {
                _comm_date = value;
                RaisePropertyChanged(() => comm_date);
            }
        }

        private int _comm_time;
        /// <summary>
        /// ָ��ʱ��
        /// </summary>
        public int comm_time
        {
            get { return _comm_time; }

            set
            {
                _comm_time = value;
                RaisePropertyChanged(() => comm_time);
            }
        }

        private int _comm_batch_no;
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_batch_no
        {
            get { return _comm_batch_no; }

            set
            {
                _comm_batch_no = value;
                RaisePropertyChanged(() => comm_batch_no);
            }
        }

        private int _comm_dir;
        /// <summary>
        /// ָ���
        /// </summary>
        public int comm_dir
        {
            get { return _comm_dir; }

            set
            {
                _comm_dir = value;
                RaisePropertyChanged(() => comm_dir);
            }
        }

        private int _contrc_dir;
        /// <summary>
        /// ��ƽ����
        /// </summary>
        public int contrc_dir
        {
            get { return _contrc_dir; }

            set
            {
                _contrc_dir = value;
                RaisePropertyChanged(() => contrc_dir);
            }
        }

        private double _comm_limit_price;
        /// <summary>
        /// ָ���޼�
        /// </summary>
        public double comm_limit_price
        {
            get { return _comm_limit_price; }

            set
            {
                _comm_limit_price = value;
                RaisePropertyChanged(() => comm_limit_price);
            }
        }

        private double _limit_actual_price;
        /// <summary>
        /// ָ��ʵ���޼�
        /// </summary>
        public double limit_actual_price
        {
            get { return _limit_actual_price; }

            set
            {
                _limit_actual_price = value;
                RaisePropertyChanged(() => limit_actual_price);
            }
        }

        private double _comm_qty;
        /// <summary>
        /// ָ������
        /// </summary>
        public double comm_qty
        {
            get { return _comm_qty; }

            set
            {
                _comm_qty = value;
                RaisePropertyChanged(() => comm_qty);
            }
        }

        private double _comm_amt;
        /// <summary>
        /// ָ����
        /// </summary>
        public double comm_amt
        {
            get { return _comm_amt; }

            set
            {
                _comm_amt = value;
                RaisePropertyChanged(() => comm_amt);
            }
        }

        private double _order_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double order_qty
        {
            get { return _order_qty; }

            set
            {
                _order_qty = value;
                RaisePropertyChanged(() => order_qty);
            }
        }

        private double _comm_cancel_qty;
        /// <summary>
        /// ָ�������
        /// </summary>
        public double comm_cancel_qty
        {
            get { return _comm_cancel_qty; }

            set
            {
                _comm_cancel_qty = value;
                RaisePropertyChanged(() => comm_cancel_qty);
            }
        }

        private double _strike_amt;
        /// <summary>
        /// �ɽ����
        /// </summary>
        public double strike_amt
        {
            get { return _strike_amt; }

            set
            {
                _strike_amt = value;
                RaisePropertyChanged(() => strike_amt);
            }
        }

        private double _strike_qty;
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_qty
        {
            get { return _strike_qty; }

            set
            {
                _strike_qty = value;
                RaisePropertyChanged(() => strike_qty);
            }
        }

        private String _strike_status;
        /// <summary>
        /// �ɽ�״̬
        /// </summary>
        public String strike_status
        {
            get { return _strike_status; }

            set
            {
                _strike_status = value;
                RaisePropertyChanged(() => strike_status);
            }
        }

        private String _comm_sum_status;
        /// <summary>
        /// ָ�����״̬
        /// </summary>
        public String comm_sum_status
        {
            get { return _comm_sum_status; }

            set
            {
                _comm_sum_status = value;
                RaisePropertyChanged(() => comm_sum_status);
            }
        }

        private int _comm_begin_date;
        /// <summary>
        /// ָ�ʼ����
        /// </summary>
        public int comm_begin_date
        {
            get { return _comm_begin_date; }

            set
            {
                _comm_begin_date = value;
                RaisePropertyChanged(() => comm_begin_date);
            }
        }

        private int _comm_end_date;
        /// <summary>
        /// ָ���������
        /// </summary>
        public int comm_end_date
        {
            get { return _comm_end_date; }

            set
            {
                _comm_end_date = value;
                RaisePropertyChanged(() => comm_end_date);
            }
        }

        private int _comm_begin_time;
        /// <summary>
        /// ָ�ʼʱ��
        /// </summary>
        public int comm_begin_time
        {
            get { return _comm_begin_time; }

            set
            {
                _comm_begin_time = value;
                RaisePropertyChanged(() => comm_begin_time);
            }
        }

        private int _comm_end_time;
        /// <summary>
        /// ָ�����ʱ��
        /// </summary>
        public int comm_end_time
        {
            get { return _comm_end_time; }

            set
            {
                _comm_end_time = value;
                RaisePropertyChanged(() => comm_end_time);
            }
        }

        private int _comm_comple_date;
        /// <summary>
        /// ָ���������
        /// </summary>
        public int comm_comple_date
        {
            get { return _comm_comple_date; }

            set
            {
                _comm_comple_date = value;
                RaisePropertyChanged(() => comm_comple_date);
            }
        }

        private int _comm_comple_time;
        /// <summary>
        /// ָ�����ʱ��
        /// </summary>
        public int comm_comple_time
        {
            get { return _comm_comple_time; }

            set
            {
                _comm_comple_time = value;
                RaisePropertyChanged(() => comm_comple_time);
            }
        }

        private int _max_comm_comple_date;
        /// <summary>
        /// ָ������������
        /// </summary>
        public int max_comm_comple_date
        {
            get { return _max_comm_comple_date; }

            set
            {
                _max_comm_comple_date = value;
                RaisePropertyChanged(() => max_comm_comple_date);
            }
        }

        private int _max_comm_comple_time;
        /// <summary>
        /// ָ��������ʱ��
        /// </summary>
        public int max_comm_comple_time
        {
            get { return _max_comm_comple_time; }

            set
            {
                _max_comm_comple_time = value;
                RaisePropertyChanged(() => max_comm_comple_time);
            }
        }

        private int _comm_appr_date;
        /// <summary>
        /// ָ����������
        /// </summary>
        public int comm_appr_date
        {
            get { return _comm_appr_date; }

            set
            {
                _comm_appr_date = value;
                RaisePropertyChanged(() => comm_appr_date);
            }
        }

        private int _comm_appr_time;
        /// <summary>
        /// ָ������ʱ��
        /// </summary>
        public int comm_appr_time
        {
            get { return _comm_appr_time; }

            set
            {
                _comm_appr_time = value;
                RaisePropertyChanged(() => comm_appr_time);
            }
        }

        private String _comm_sum_approve_status;
        /// <summary>
        /// ָ���������״̬
        /// </summary>
        public String comm_sum_approve_status
        {
            get { return _comm_sum_approve_status; }

            set
            {
                _comm_sum_approve_status = value;
                RaisePropertyChanged(() => comm_sum_approve_status);
            }
        }

        private double _buy_order_qty;
        /// <summary>
        /// ���붩������
        /// </summary>
        public double buy_order_qty
        {
            get { return _buy_order_qty; }

            set
            {
                _buy_order_qty = value;
                RaisePropertyChanged(() => buy_order_qty);
            }
        }

        private double _sell_order_qty;
        /// <summary>
        /// ������������
        /// </summary>
        public double sell_order_qty
        {
            get { return _sell_order_qty; }

            set
            {
                _sell_order_qty = value;
                RaisePropertyChanged(() => sell_order_qty);
            }
        }

        private double _buy_comm_qty;
        /// <summary>
        /// ����ָ������
        /// </summary>
        public double buy_comm_qty
        {
            get { return _buy_comm_qty; }

            set
            {
                _buy_comm_qty = value;
                RaisePropertyChanged(() => buy_comm_qty);
            }
        }

        private double _sell_comm_qty;
        /// <summary>
        /// ����ָ������
        /// </summary>
        public double sell_comm_qty
        {
            get { return _sell_comm_qty; }

            set
            {
                _sell_comm_qty = value;
                RaisePropertyChanged(() => sell_comm_qty);
            }
        }

        private double _buy_strike_qty;
        /// <summary>
        /// ����ɽ�����
        /// </summary>
        public double buy_strike_qty
        {
            get { return _buy_strike_qty; }

            set
            {
                _buy_strike_qty = value;
                RaisePropertyChanged(() => buy_strike_qty);
            }
        }

        private double _sell_strike_qty;
        /// <summary>
        /// �����ɽ�����
        /// </summary>
        public double sell_strike_qty
        {
            get { return _sell_strike_qty; }

            set
            {
                _sell_strike_qty = value;
                RaisePropertyChanged(() => sell_strike_qty);
            }
        }

        private double _buy_strike_amt;
        /// <summary>
        /// ����ɽ����
        /// </summary>
        public double buy_strike_amt
        {
            get { return _buy_strike_amt; }

            set
            {
                _buy_strike_amt = value;
                RaisePropertyChanged(() => buy_strike_amt);
            }
        }

        private double _sell_strike_amt;
        /// <summary>
        /// �����ɽ����
        /// </summary>
        public double sell_strike_amt
        {
            get { return _sell_strike_amt; }

            set
            {
                _sell_strike_amt = value;
                RaisePropertyChanged(() => sell_strike_amt);
            }
        }

        private double _buy_comm_amt;
        /// <summary>
        /// ����ָ����
        /// </summary>
        public double buy_comm_amt
        {
            get { return _buy_comm_amt; }

            set
            {
                _buy_comm_amt = value;
                RaisePropertyChanged(() => buy_comm_amt);
            }
        }

        private double _sell_comm_amt;
        /// <summary>
        /// ����ָ����
        /// </summary>
        public double sell_comm_amt
        {
            get { return _sell_comm_amt; }

            set
            {
                _sell_comm_amt = value;
                RaisePropertyChanged(() => sell_comm_amt);
            }
        }

        private String _comm_oper_way;
        /// <summary>
        /// ָ�������ʽ
        /// </summary>
        public String comm_oper_way
        {
            get { return _comm_oper_way; }

            set
            {
                _comm_oper_way = value;
                RaisePropertyChanged(() => comm_oper_way);
            }
        }

        private String _exch_crncy_type;
        /// <summary>
        /// ���ױ���
        /// </summary>
        public String exch_crncy_type
        {
            get { return _exch_crncy_type; }

            set
            {
                _exch_crncy_type = value;
                RaisePropertyChanged(() => exch_crncy_type);
            }
        }

        private double _rece_margin;
        /// <summary>
        /// Ӧ�ձ�֤��
        /// </summary>
        public double rece_margin
        {
            get { return _rece_margin; }

            set
            {
                _rece_margin = value;
                RaisePropertyChanged(() => rece_margin);
            }
        }

        private int _hedge_type;
        /// <summary>
        /// �ױ���־
        /// </summary>
        public int hedge_type
        {
            get { return _hedge_type; }

            set
            {
                _hedge_type = value;
                RaisePropertyChanged(() => hedge_type);
            }
        }

        private int _update_times;
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times
        {
            get { return _update_times; }

            set
            {
                _update_times = value;
                RaisePropertyChanged(() => update_times);
            }
        }
    }

    public class tdfutuL_3_13_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// ��¼���
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _opor_co_no;
        /// <summary>
        /// ����Ա�������
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
            }
        }

        private int _opor_no;
        /// <summary>
        /// ����Ա���
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private String _oper_mac;
        /// <summary>
        /// ����MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// ����IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// ������Ϣ
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// ������ʽ
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// ��������
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

        private int _init_date;
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_date
        {
            get { return _init_date; }

            set
            {
                _init_date = value;
                RaisePropertyChanged(() => init_date);
            }
        }

        private int _co_no;
        /// <summary>
        /// �������
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _exch_group_no;
        /// <summary>
        /// ��������
        /// </summary>
        public int exch_group_no
        {
            get { return _exch_group_no; }

            set
            {
                _exch_group_no = value;
                RaisePropertyChanged(() => exch_group_no);
            }
        }

        private int _asset_acco_no;
        /// <summary>
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private int _exch_no;
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no
        {
            get { return _exch_no; }

            set
            {
                _exch_no = value;
                RaisePropertyChanged(() => exch_no);
            }
        }

        private int _contrc_code_no;
        /// <summary>
        /// ��Լ������
        /// </summary>
        public int contrc_code_no
        {
            get { return _contrc_code_no; }

            set
            {
                _contrc_code_no = value;
                RaisePropertyChanged(() => contrc_code_no);
            }
        }

        private int _asset_type;
        /// <summary>
        /// �ʲ�����
        /// </summary>
        public int asset_type
        {
            get { return _asset_type; }

            set
            {
                _asset_type = value;
                RaisePropertyChanged(() => asset_type);
            }
        }

        private int _comm_opor;
        /// <summary>
        /// ָ���´���
        /// </summary>
        public int comm_opor
        {
            get { return _comm_opor; }

            set
            {
                _comm_opor = value;
                RaisePropertyChanged(() => comm_opor);
            }
        }

        private int _comm_executor;
        /// <summary>
        /// ָ��ִ����
        /// </summary>
        public int comm_executor
        {
            get { return _comm_executor; }

            set
            {
                _comm_executor = value;
                RaisePropertyChanged(() => comm_executor);
            }
        }

        private int _comm_date;
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_date
        {
            get { return _comm_date; }

            set
            {
                _comm_date = value;
                RaisePropertyChanged(() => comm_date);
            }
        }

        private int _comm_time;
        /// <summary>
        /// ָ��ʱ��
        /// </summary>
        public int comm_time
        {
            get { return _comm_time; }

            set
            {
                _comm_time = value;
                RaisePropertyChanged(() => comm_time);
            }
        }

        private int _comm_batch_no;
        /// <summary>
        /// ָ������
        /// </summary>
        public int comm_batch_no
        {
            get { return _comm_batch_no; }

            set
            {
                _comm_batch_no = value;
                RaisePropertyChanged(() => comm_batch_no);
            }
        }

        private int _comm_dir;
        /// <summary>
        /// ָ���
        /// </summary>
        public int comm_dir
        {
            get { return _comm_dir; }

            set
            {
                _comm_dir = value;
                RaisePropertyChanged(() => comm_dir);
            }
        }

        private int _contrc_dir;
        /// <summary>
        /// ��ƽ����
        /// </summary>
        public int contrc_dir
        {
            get { return _contrc_dir; }

            set
            {
                _contrc_dir = value;
                RaisePropertyChanged(() => contrc_dir);
            }
        }

        private double _comm_limit_price;
        /// <summary>
        /// ָ���޼�
        /// </summary>
        public double comm_limit_price
        {
            get { return _comm_limit_price; }

            set
            {
                _comm_limit_price = value;
                RaisePropertyChanged(() => comm_limit_price);
            }
        }

        private double _limit_actual_price;
        /// <summary>
        /// ָ��ʵ���޼�
        /// </summary>
        public double limit_actual_price
        {
            get { return _limit_actual_price; }

            set
            {
                _limit_actual_price = value;
                RaisePropertyChanged(() => limit_actual_price);
            }
        }

        private double _comm_qty;
        /// <summary>
        /// ָ������
        /// </summary>
        public double comm_qty
        {
            get { return _comm_qty; }

            set
            {
                _comm_qty = value;
                RaisePropertyChanged(() => comm_qty);
            }
        }

        private double _comm_amt;
        /// <summary>
        /// ָ����
        /// </summary>
        public double comm_amt
        {
            get { return _comm_amt; }

            set
            {
                _comm_amt = value;
                RaisePropertyChanged(() => comm_amt);
            }
        }

        private double _order_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double order_qty
        {
            get { return _order_qty; }

            set
            {
                _order_qty = value;
                RaisePropertyChanged(() => order_qty);
            }
        }

        private double _comm_cancel_qty;
        /// <summary>
        /// ָ�������
        /// </summary>
        public double comm_cancel_qty
        {
            get { return _comm_cancel_qty; }

            set
            {
                _comm_cancel_qty = value;
                RaisePropertyChanged(() => comm_cancel_qty);
            }
        }

        private double _strike_amt;
        /// <summary>
        /// �ɽ����
        /// </summary>
        public double strike_amt
        {
            get { return _strike_amt; }

            set
            {
                _strike_amt = value;
                RaisePropertyChanged(() => strike_amt);
            }
        }

        private double _strike_qty;
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_qty
        {
            get { return _strike_qty; }

            set
            {
                _strike_qty = value;
                RaisePropertyChanged(() => strike_qty);
            }
        }

        private String _strike_status;
        /// <summary>
        /// �ɽ�״̬
        /// </summary>
        public String strike_status
        {
            get { return _strike_status; }

            set
            {
                _strike_status = value;
                RaisePropertyChanged(() => strike_status);
            }
        }

        private String _comm_sum_status;
        /// <summary>
        /// ָ�����״̬
        /// </summary>
        public String comm_sum_status
        {
            get { return _comm_sum_status; }

            set
            {
                _comm_sum_status = value;
                RaisePropertyChanged(() => comm_sum_status);
            }
        }

        private int _comm_begin_date;
        /// <summary>
        /// ָ�ʼ����
        /// </summary>
        public int comm_begin_date
        {
            get { return _comm_begin_date; }

            set
            {
                _comm_begin_date = value;
                RaisePropertyChanged(() => comm_begin_date);
            }
        }

        private int _comm_end_date;
        /// <summary>
        /// ָ���������
        /// </summary>
        public int comm_end_date
        {
            get { return _comm_end_date; }

            set
            {
                _comm_end_date = value;
                RaisePropertyChanged(() => comm_end_date);
            }
        }

        private int _comm_begin_time;
        /// <summary>
        /// ָ�ʼʱ��
        /// </summary>
        public int comm_begin_time
        {
            get { return _comm_begin_time; }

            set
            {
                _comm_begin_time = value;
                RaisePropertyChanged(() => comm_begin_time);
            }
        }

        private int _comm_end_time;
        /// <summary>
        /// ָ�����ʱ��
        /// </summary>
        public int comm_end_time
        {
            get { return _comm_end_time; }

            set
            {
                _comm_end_time = value;
                RaisePropertyChanged(() => comm_end_time);
            }
        }

        private int _comm_comple_date;
        /// <summary>
        /// ָ���������
        /// </summary>
        public int comm_comple_date
        {
            get { return _comm_comple_date; }

            set
            {
                _comm_comple_date = value;
                RaisePropertyChanged(() => comm_comple_date);
            }
        }

        private int _comm_comple_time;
        /// <summary>
        /// ָ�����ʱ��
        /// </summary>
        public int comm_comple_time
        {
            get { return _comm_comple_time; }

            set
            {
                _comm_comple_time = value;
                RaisePropertyChanged(() => comm_comple_time);
            }
        }

        private int _max_comm_comple_date;
        /// <summary>
        /// ָ������������
        /// </summary>
        public int max_comm_comple_date
        {
            get { return _max_comm_comple_date; }

            set
            {
                _max_comm_comple_date = value;
                RaisePropertyChanged(() => max_comm_comple_date);
            }
        }

        private int _max_comm_comple_time;
        /// <summary>
        /// ָ��������ʱ��
        /// </summary>
        public int max_comm_comple_time
        {
            get { return _max_comm_comple_time; }

            set
            {
                _max_comm_comple_time = value;
                RaisePropertyChanged(() => max_comm_comple_time);
            }
        }

        private int _comm_appr_date;
        /// <summary>
        /// ָ����������
        /// </summary>
        public int comm_appr_date
        {
            get { return _comm_appr_date; }

            set
            {
                _comm_appr_date = value;
                RaisePropertyChanged(() => comm_appr_date);
            }
        }

        private int _comm_appr_time;
        /// <summary>
        /// ָ������ʱ��
        /// </summary>
        public int comm_appr_time
        {
            get { return _comm_appr_time; }

            set
            {
                _comm_appr_time = value;
                RaisePropertyChanged(() => comm_appr_time);
            }
        }

        private String _comm_sum_approve_status;
        /// <summary>
        /// ָ���������״̬
        /// </summary>
        public String comm_sum_approve_status
        {
            get { return _comm_sum_approve_status; }

            set
            {
                _comm_sum_approve_status = value;
                RaisePropertyChanged(() => comm_sum_approve_status);
            }
        }

        private double _buy_order_qty;
        /// <summary>
        /// ���붩������
        /// </summary>
        public double buy_order_qty
        {
            get { return _buy_order_qty; }

            set
            {
                _buy_order_qty = value;
                RaisePropertyChanged(() => buy_order_qty);
            }
        }

        private double _sell_order_qty;
        /// <summary>
        /// ������������
        /// </summary>
        public double sell_order_qty
        {
            get { return _sell_order_qty; }

            set
            {
                _sell_order_qty = value;
                RaisePropertyChanged(() => sell_order_qty);
            }
        }

        private double _buy_comm_qty;
        /// <summary>
        /// ����ָ������
        /// </summary>
        public double buy_comm_qty
        {
            get { return _buy_comm_qty; }

            set
            {
                _buy_comm_qty = value;
                RaisePropertyChanged(() => buy_comm_qty);
            }
        }

        private double _sell_comm_qty;
        /// <summary>
        /// ����ָ������
        /// </summary>
        public double sell_comm_qty
        {
            get { return _sell_comm_qty; }

            set
            {
                _sell_comm_qty = value;
                RaisePropertyChanged(() => sell_comm_qty);
            }
        }

        private double _buy_strike_qty;
        /// <summary>
        /// ����ɽ�����
        /// </summary>
        public double buy_strike_qty
        {
            get { return _buy_strike_qty; }

            set
            {
                _buy_strike_qty = value;
                RaisePropertyChanged(() => buy_strike_qty);
            }
        }

        private double _sell_strike_qty;
        /// <summary>
        /// �����ɽ�����
        /// </summary>
        public double sell_strike_qty
        {
            get { return _sell_strike_qty; }

            set
            {
                _sell_strike_qty = value;
                RaisePropertyChanged(() => sell_strike_qty);
            }
        }

        private double _buy_strike_amt;
        /// <summary>
        /// ����ɽ����
        /// </summary>
        public double buy_strike_amt
        {
            get { return _buy_strike_amt; }

            set
            {
                _buy_strike_amt = value;
                RaisePropertyChanged(() => buy_strike_amt);
            }
        }

        private double _sell_strike_amt;
        /// <summary>
        /// �����ɽ����
        /// </summary>
        public double sell_strike_amt
        {
            get { return _sell_strike_amt; }

            set
            {
                _sell_strike_amt = value;
                RaisePropertyChanged(() => sell_strike_amt);
            }
        }

        private double _buy_comm_amt;
        /// <summary>
        /// ����ָ����
        /// </summary>
        public double buy_comm_amt
        {
            get { return _buy_comm_amt; }

            set
            {
                _buy_comm_amt = value;
                RaisePropertyChanged(() => buy_comm_amt);
            }
        }

        private double _sell_comm_amt;
        /// <summary>
        /// ����ָ����
        /// </summary>
        public double sell_comm_amt
        {
            get { return _sell_comm_amt; }

            set
            {
                _sell_comm_amt = value;
                RaisePropertyChanged(() => sell_comm_amt);
            }
        }

        private String _comm_oper_way;
        /// <summary>
        /// ָ�������ʽ
        /// </summary>
        public String comm_oper_way
        {
            get { return _comm_oper_way; }

            set
            {
                _comm_oper_way = value;
                RaisePropertyChanged(() => comm_oper_way);
            }
        }

        private double _rece_margin;
        /// <summary>
        /// Ӧ�ձ�֤��
        /// </summary>
        public double rece_margin
        {
            get { return _rece_margin; }

            set
            {
                _rece_margin = value;
                RaisePropertyChanged(() => rece_margin);
            }
        }

        private int _hedge_type;
        /// <summary>
        /// �ױ���־
        /// </summary>
        public int hedge_type
        {
            get { return _hedge_type; }

            set
            {
                _hedge_type = value;
                RaisePropertyChanged(() => hedge_type);
            }
        }

        private int _update_times;
        /// <summary>
        /// ���´���
        /// </summary>
        public int update_times
        {
            get { return _update_times; }

            set
            {
                _update_times = value;
                RaisePropertyChanged(() => update_times);
            }
        }
    }

}

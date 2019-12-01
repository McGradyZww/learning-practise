using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class tdsecuL_11_1_Info : ObservableObject
    {

        private String _strategy_plugin_status;
        /// <summary>
        /// ���Բ��״̬
        /// </summary>
        public String strategy_plugin_status
        {
            get { return _strategy_plugin_status; }

            set
            {
                _strategy_plugin_status = value;
                RaisePropertyChanged(() => strategy_plugin_status);
            }
        }
    }

    public class tdsecuL_11_2_Info : ObservableObject
    {

        private String _strategy_plugin_status;
        /// <summary>
        /// ���Բ��״̬
        /// </summary>
        public String strategy_plugin_status
        {
            get { return _strategy_plugin_status; }

            set
            {
                _strategy_plugin_status = value;
                RaisePropertyChanged(() => strategy_plugin_status);
            }
        }
    }

    public class tdsecuL_11_11_Info : ObservableObject
    {

        private ulong _strategy_id;
        /// <summary>
        /// �������
        /// </summary>
        public ulong strategy_id
        {
            get { return _strategy_id; }

            set
            {
                _strategy_id = value;
                RaisePropertyChanged(() => strategy_id);
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

        private int _strategy_dir;
        /// <summary>
        /// ���Է���
        /// </summary>
        public int strategy_dir
        {
            get { return _strategy_dir; }

            set
            {
                _strategy_dir = value;
                RaisePropertyChanged(() => strategy_dir);
            }
        }

        private int _price_type;
        /// <summary>
        /// �۸�����
        /// </summary>
        public int price_type
        {
            get { return _price_type; }

            set
            {
                _price_type = value;
                RaisePropertyChanged(() => price_type);
            }
        }

        private int _strategy_time;
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int strategy_time
        {
            get { return _strategy_time; }

            set
            {
                _strategy_time = value;
                RaisePropertyChanged(() => strategy_time);
            }
        }

        private String _target_strategy_type;
        /// <summary>
        /// Ŀ���������
        /// </summary>
        public String target_strategy_type
        {
            get { return _target_strategy_type; }

            set
            {
                _target_strategy_type = value;
                RaisePropertyChanged(() => target_strategy_type);
            }
        }

        private String _target_strategy_param;
        /// <summary>
        /// Ŀ����Բ���
        /// </summary>
        public String target_strategy_param
        {
            get { return _target_strategy_param; }

            set
            {
                _target_strategy_param = value;
                RaisePropertyChanged(() => target_strategy_param);
            }
        }

        private int _order_batch_no;
        /// <summary>
        /// ��������
        /// </summary>
        public int order_batch_no
        {
            get { return _order_batch_no; }

            set
            {
                _order_batch_no = value;
                RaisePropertyChanged(() => order_batch_no);
            }
        }

        private String _strategy_oper_way;
        /// <summary>
        /// ���Բ�����ʽ
        /// </summary>
        public String strategy_oper_way
        {
            get { return _strategy_oper_way; }

            set
            {
                _strategy_oper_way = value;
                RaisePropertyChanged(() => strategy_oper_way);
            }
        }
    }

    public class tdsecuL_11_12_Info : ObservableObject
    {

        private ulong _strategy_id;
        /// <summary>
        /// �������
        /// </summary>
        public ulong strategy_id
        {
            get { return _strategy_id; }

            set
            {
                _strategy_id = value;
                RaisePropertyChanged(() => strategy_id);
            }
        }

        private ulong _orig_strategy_id;
        /// <summary>
        /// ԭ�������
        /// </summary>
        public ulong orig_strategy_id
        {
            get { return _orig_strategy_id; }

            set
            {
                _orig_strategy_id = value;
                RaisePropertyChanged(() => orig_strategy_id);
            }
        }

        private int _strategy_time;
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int strategy_time
        {
            get { return _strategy_time; }

            set
            {
                _strategy_time = value;
                RaisePropertyChanged(() => strategy_time);
            }
        }

        private String _target_strategy_type;
        /// <summary>
        /// Ŀ���������
        /// </summary>
        public String target_strategy_type
        {
            get { return _target_strategy_type; }

            set
            {
                _target_strategy_type = value;
                RaisePropertyChanged(() => target_strategy_type);
            }
        }

        private String _target_strategy_param;
        /// <summary>
        /// Ŀ����Բ���
        /// </summary>
        public String target_strategy_param
        {
            get { return _target_strategy_param; }

            set
            {
                _target_strategy_param = value;
                RaisePropertyChanged(() => target_strategy_param);
            }
        }

        private String _strategy_contr_comm;
        /// <summary>
        /// ���Կ���ָ��
        /// </summary>
        public String strategy_contr_comm
        {
            get { return _strategy_contr_comm; }

            set
            {
                _strategy_contr_comm = value;
                RaisePropertyChanged(() => strategy_contr_comm);
            }
        }
    }

    public class tdsecuL_11_13_Info : ObservableObject
    {

        private ulong _strategy_id;
        /// <summary>
        /// �������
        /// </summary>
        public ulong strategy_id
        {
            get { return _strategy_id; }

            set
            {
                _strategy_id = value;
                RaisePropertyChanged(() => strategy_id);
            }
        }

        private ulong _orig_strategy_id;
        /// <summary>
        /// ԭ�������
        /// </summary>
        public ulong orig_strategy_id
        {
            get { return _orig_strategy_id; }

            set
            {
                _orig_strategy_id = value;
                RaisePropertyChanged(() => orig_strategy_id);
            }
        }

        private int _strategy_time;
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int strategy_time
        {
            get { return _strategy_time; }

            set
            {
                _strategy_time = value;
                RaisePropertyChanged(() => strategy_time);
            }
        }

        private String _target_strategy_type;
        /// <summary>
        /// Ŀ���������
        /// </summary>
        public String target_strategy_type
        {
            get { return _target_strategy_type; }

            set
            {
                _target_strategy_type = value;
                RaisePropertyChanged(() => target_strategy_type);
            }
        }

        private String _target_strategy_param;
        /// <summary>
        /// Ŀ����Բ���
        /// </summary>
        public String target_strategy_param
        {
            get { return _target_strategy_param; }

            set
            {
                _target_strategy_param = value;
                RaisePropertyChanged(() => target_strategy_param);
            }
        }

        private String _strategy_contr_comm;
        /// <summary>
        /// ���Կ���ָ��
        /// </summary>
        public String strategy_contr_comm
        {
            get { return _strategy_contr_comm; }

            set
            {
                _strategy_contr_comm = value;
                RaisePropertyChanged(() => strategy_contr_comm);
            }
        }
    }

    public class tdsecuL_11_14_Info : ObservableObject
    {

        private ulong _strategy_id;
        /// <summary>
        /// �������
        /// </summary>
        public ulong strategy_id
        {
            get { return _strategy_id; }

            set
            {
                _strategy_id = value;
                RaisePropertyChanged(() => strategy_id);
            }
        }

        private ulong _orig_strategy_id;
        /// <summary>
        /// ԭ�������
        /// </summary>
        public ulong orig_strategy_id
        {
            get { return _orig_strategy_id; }

            set
            {
                _orig_strategy_id = value;
                RaisePropertyChanged(() => orig_strategy_id);
            }
        }

        private int _strategy_time;
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int strategy_time
        {
            get { return _strategy_time; }

            set
            {
                _strategy_time = value;
                RaisePropertyChanged(() => strategy_time);
            }
        }

        private String _target_strategy_type;
        /// <summary>
        /// Ŀ���������
        /// </summary>
        public String target_strategy_type
        {
            get { return _target_strategy_type; }

            set
            {
                _target_strategy_type = value;
                RaisePropertyChanged(() => target_strategy_type);
            }
        }

        private String _target_strategy_param;
        /// <summary>
        /// Ŀ����Բ���
        /// </summary>
        public String target_strategy_param
        {
            get { return _target_strategy_param; }

            set
            {
                _target_strategy_param = value;
                RaisePropertyChanged(() => target_strategy_param);
            }
        }
    }

    public class tdsecuL_11_15_Info : ObservableObject
    {

        private ulong _strategy_id;
        /// <summary>
        /// �������
        /// </summary>
        public ulong strategy_id
        {
            get { return _strategy_id; }

            set
            {
                _strategy_id = value;
                RaisePropertyChanged(() => strategy_id);
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

        private int _strategy_dir;
        /// <summary>
        /// ���Է���
        /// </summary>
        public int strategy_dir
        {
            get { return _strategy_dir; }

            set
            {
                _strategy_dir = value;
                RaisePropertyChanged(() => strategy_dir);
            }
        }

        private String _strategy_oper_way;
        /// <summary>
        /// ���Բ�����ʽ
        /// </summary>
        public String strategy_oper_way
        {
            get { return _strategy_oper_way; }

            set
            {
                _strategy_oper_way = value;
                RaisePropertyChanged(() => strategy_oper_way);
            }
        }
    }

    public class tdsecuL_11_16_Info : ObservableObject
    {

        private ulong _orig_strategy_id;
        /// <summary>
        /// ԭ�������
        /// </summary>
        public ulong orig_strategy_id
        {
            get { return _orig_strategy_id; }

            set
            {
                _orig_strategy_id = value;
                RaisePropertyChanged(() => orig_strategy_id);
            }
        }

        private ulong _strategy_id;
        /// <summary>
        /// �������
        /// </summary>
        public ulong strategy_id
        {
            get { return _strategy_id; }

            set
            {
                _strategy_id = value;
                RaisePropertyChanged(() => strategy_id);
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

        private int _strategy_dir;
        /// <summary>
        /// ���Է���
        /// </summary>
        public int strategy_dir
        {
            get { return _strategy_dir; }

            set
            {
                _strategy_dir = value;
                RaisePropertyChanged(() => strategy_dir);
            }
        }

        private String _strategy_status;
        /// <summary>
        /// ����״̬
        /// </summary>
        public String strategy_status
        {
            get { return _strategy_status; }

            set
            {
                _strategy_status = value;
                RaisePropertyChanged(() => strategy_status);
            }
        }

        private String _strategy_oper_way;
        /// <summary>
        /// ���Բ�����ʽ
        /// </summary>
        public String strategy_oper_way
        {
            get { return _strategy_oper_way; }

            set
            {
                _strategy_oper_way = value;
                RaisePropertyChanged(() => strategy_oper_way);
            }
        }
    }

    public class tdsecuL_11_101_Info : ObservableObject
    {

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

        private ulong _strategy_id;
        /// <summary>
        /// �������
        /// </summary>
        public ulong strategy_id
        {
            get { return _strategy_id; }

            set
            {
                _strategy_id = value;
                RaisePropertyChanged(() => strategy_id);
            }
        }

        private ulong _orig_strategy_id;
        /// <summary>
        /// ԭ�������
        /// </summary>
        public ulong orig_strategy_id
        {
            get { return _orig_strategy_id; }

            set
            {
                _orig_strategy_id = value;
                RaisePropertyChanged(() => orig_strategy_id);
            }
        }

        private String _strategy_exec_broker;
        /// <summary>
        /// ����ִ����
        /// </summary>
        public String strategy_exec_broker
        {
            get { return _strategy_exec_broker; }

            set
            {
                _strategy_exec_broker = value;
                RaisePropertyChanged(() => strategy_exec_broker);
            }
        }

        private int _strategy_exec_kind;
        /// <summary>
        /// ����ִ�з�ʽ
        /// </summary>
        public int strategy_exec_kind
        {
            get { return _strategy_exec_kind; }

            set
            {
                _strategy_exec_kind = value;
                RaisePropertyChanged(() => strategy_exec_kind);
            }
        }

        private String _strategy_exec_comm_str;
        /// <summary>
        /// ����ִ��ָ�
        /// </summary>
        public String strategy_exec_comm_str
        {
            get { return _strategy_exec_comm_str; }

            set
            {
                _strategy_exec_comm_str = value;
                RaisePropertyChanged(() => strategy_exec_comm_str);
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

        private int _stock_acco_no;
        /// <summary>
        /// �ɶ�������
        /// </summary>
        public int stock_acco_no
        {
            get { return _stock_acco_no; }

            set
            {
                _stock_acco_no = value;
                RaisePropertyChanged(() => stock_acco_no);
            }
        }

        private String _stock_acco;
        /// <summary>
        /// �ɶ�����
        /// </summary>
        public String stock_acco
        {
            get { return _stock_acco; }

            set
            {
                _stock_acco = value;
                RaisePropertyChanged(() => stock_acco);
            }
        }

        private int _stock_type;
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type
        {
            get { return _stock_type; }

            set
            {
                _stock_type = value;
                RaisePropertyChanged(() => stock_type);
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

        private int _stock_code_no;
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no
        {
            get { return _stock_code_no; }

            set
            {
                _stock_code_no = value;
                RaisePropertyChanged(() => stock_code_no);
            }
        }

        private int _strategy_dir;
        /// <summary>
        /// ���Է���
        /// </summary>
        public int strategy_dir
        {
            get { return _strategy_dir; }

            set
            {
                _strategy_dir = value;
                RaisePropertyChanged(() => strategy_dir);
            }
        }

        private double _strategy_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double strategy_qty
        {
            get { return _strategy_qty; }

            set
            {
                _strategy_qty = value;
                RaisePropertyChanged(() => strategy_qty);
            }
        }

        private double _cash_strategy_qty;
        /// <summary>
        /// �ʽ��������
        /// </summary>
        public double cash_strategy_qty
        {
            get { return _cash_strategy_qty; }

            set
            {
                _cash_strategy_qty = value;
                RaisePropertyChanged(() => cash_strategy_qty);
            }
        }

        private double _strategy_price;
        /// <summary>
        /// ���Լ۸�
        /// </summary>
        public double strategy_price
        {
            get { return _strategy_price; }

            set
            {
                _strategy_price = value;
                RaisePropertyChanged(() => strategy_price);
            }
        }

        private int _price_type;
        /// <summary>
        /// �۸�����
        /// </summary>
        public int price_type
        {
            get { return _price_type; }

            set
            {
                _price_type = value;
                RaisePropertyChanged(() => price_type);
            }
        }

        private int _strategy_valid_type;
        /// <summary>
        /// ������Ч����
        /// </summary>
        public int strategy_valid_type
        {
            get { return _strategy_valid_type; }

            set
            {
                _strategy_valid_type = value;
                RaisePropertyChanged(() => strategy_valid_type);
            }
        }

        private String _strategy_rule_way;
        /// <summary>
        /// ���Թ���ʽ
        /// </summary>
        public String strategy_rule_way
        {
            get { return _strategy_rule_way; }

            set
            {
                _strategy_rule_way = value;
                RaisePropertyChanged(() => strategy_rule_way);
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

        private int _strategy_time;
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int strategy_time
        {
            get { return _strategy_time; }

            set
            {
                _strategy_time = value;
                RaisePropertyChanged(() => strategy_time);
            }
        }

        private int _margin_trade_type;
        /// <summary>
        /// ���ý��׷�ʽ
        /// </summary>
        public int margin_trade_type
        {
            get { return _margin_trade_type; }

            set
            {
                _margin_trade_type = value;
                RaisePropertyChanged(() => margin_trade_type);
            }
        }

        private String _target_strategy_type;
        /// <summary>
        /// Ŀ���������
        /// </summary>
        public String target_strategy_type
        {
            get { return _target_strategy_type; }

            set
            {
                _target_strategy_type = value;
                RaisePropertyChanged(() => target_strategy_type);
            }
        }

        private String _target_strategy_param;
        /// <summary>
        /// Ŀ����Բ���
        /// </summary>
        public String target_strategy_param
        {
            get { return _target_strategy_param; }

            set
            {
                _target_strategy_param = value;
                RaisePropertyChanged(() => target_strategy_param);
            }
        }

        private String _strategy_contr_comm;
        /// <summary>
        /// ���Կ���ָ��
        /// </summary>
        public String strategy_contr_comm
        {
            get { return _strategy_contr_comm; }

            set
            {
                _strategy_contr_comm = value;
                RaisePropertyChanged(() => strategy_contr_comm);
            }
        }

        private String _strategy_status;
        /// <summary>
        /// ����״̬
        /// </summary>
        public String strategy_status
        {
            get { return _strategy_status; }

            set
            {
                _strategy_status = value;
                RaisePropertyChanged(() => strategy_status);
            }
        }

        private String _strategy_deal_status;
        /// <summary>
        /// ���Դ���״̬
        /// </summary>
        public String strategy_deal_status
        {
            get { return _strategy_deal_status; }

            set
            {
                _strategy_deal_status = value;
                RaisePropertyChanged(() => strategy_deal_status);
            }
        }

        private int _strategy_deal_kind;
        /// <summary>
        /// ���Դ���ʽ
        /// </summary>
        public int strategy_deal_kind
        {
            get { return _strategy_deal_kind; }

            set
            {
                _strategy_deal_kind = value;
                RaisePropertyChanged(() => strategy_deal_kind);
            }
        }

        private double _strategy_amt;
        /// <summary>
        /// ���Խ��
        /// </summary>
        public double strategy_amt
        {
            get { return _strategy_amt; }

            set
            {
                _strategy_amt = value;
                RaisePropertyChanged(() => strategy_amt);
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

        private double _order_amt;
        /// <summary>
        /// �������
        /// </summary>
        public double order_amt
        {
            get { return _order_amt; }

            set
            {
                _order_amt = value;
                RaisePropertyChanged(() => order_amt);
            }
        }

        private double _wtdraw_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double wtdraw_qty
        {
            get { return _wtdraw_qty; }

            set
            {
                _wtdraw_qty = value;
                RaisePropertyChanged(() => wtdraw_qty);
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

        private int _order_batch_no;
        /// <summary>
        /// ��������
        /// </summary>
        public int order_batch_no
        {
            get { return _order_batch_no; }

            set
            {
                _order_batch_no = value;
                RaisePropertyChanged(() => order_batch_no);
            }
        }

        private String _strategy_oper_way;
        /// <summary>
        /// ���Բ�����ʽ
        /// </summary>
        public String strategy_oper_way
        {
            get { return _strategy_oper_way; }

            set
            {
                _strategy_oper_way = value;
                RaisePropertyChanged(() => strategy_oper_way);
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

        private int _strategy_batch_no;
        /// <summary>
        /// ��������
        /// </summary>
        public int strategy_batch_no
        {
            get { return _strategy_batch_no; }

            set
            {
                _strategy_batch_no = value;
                RaisePropertyChanged(() => strategy_batch_no);
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
    }

    public class tdsecuL_11_102_Info : ObservableObject
    {

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

        private ulong _strategy_id;
        /// <summary>
        /// �������
        /// </summary>
        public ulong strategy_id
        {
            get { return _strategy_id; }

            set
            {
                _strategy_id = value;
                RaisePropertyChanged(() => strategy_id);
            }
        }

        private ulong _orig_strategy_id;
        /// <summary>
        /// ԭ�������
        /// </summary>
        public ulong orig_strategy_id
        {
            get { return _orig_strategy_id; }

            set
            {
                _orig_strategy_id = value;
                RaisePropertyChanged(() => orig_strategy_id);
            }
        }

        private String _strategy_exec_broker;
        /// <summary>
        /// ����ִ����
        /// </summary>
        public String strategy_exec_broker
        {
            get { return _strategy_exec_broker; }

            set
            {
                _strategy_exec_broker = value;
                RaisePropertyChanged(() => strategy_exec_broker);
            }
        }

        private int _strategy_exec_kind;
        /// <summary>
        /// ����ִ�з�ʽ
        /// </summary>
        public int strategy_exec_kind
        {
            get { return _strategy_exec_kind; }

            set
            {
                _strategy_exec_kind = value;
                RaisePropertyChanged(() => strategy_exec_kind);
            }
        }

        private String _strategy_exec_comm_str;
        /// <summary>
        /// ����ִ��ָ�
        /// </summary>
        public String strategy_exec_comm_str
        {
            get { return _strategy_exec_comm_str; }

            set
            {
                _strategy_exec_comm_str = value;
                RaisePropertyChanged(() => strategy_exec_comm_str);
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

        private int _stock_acco_no;
        /// <summary>
        /// �ɶ�������
        /// </summary>
        public int stock_acco_no
        {
            get { return _stock_acco_no; }

            set
            {
                _stock_acco_no = value;
                RaisePropertyChanged(() => stock_acco_no);
            }
        }

        private String _stock_acco;
        /// <summary>
        /// �ɶ�����
        /// </summary>
        public String stock_acco
        {
            get { return _stock_acco; }

            set
            {
                _stock_acco = value;
                RaisePropertyChanged(() => stock_acco);
            }
        }

        private int _stock_type;
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type
        {
            get { return _stock_type; }

            set
            {
                _stock_type = value;
                RaisePropertyChanged(() => stock_type);
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

        private int _stock_code_no;
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no
        {
            get { return _stock_code_no; }

            set
            {
                _stock_code_no = value;
                RaisePropertyChanged(() => stock_code_no);
            }
        }

        private int _strategy_dir;
        /// <summary>
        /// ���Է���
        /// </summary>
        public int strategy_dir
        {
            get { return _strategy_dir; }

            set
            {
                _strategy_dir = value;
                RaisePropertyChanged(() => strategy_dir);
            }
        }

        private double _strategy_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double strategy_qty
        {
            get { return _strategy_qty; }

            set
            {
                _strategy_qty = value;
                RaisePropertyChanged(() => strategy_qty);
            }
        }

        private double _cash_strategy_qty;
        /// <summary>
        /// �ʽ��������
        /// </summary>
        public double cash_strategy_qty
        {
            get { return _cash_strategy_qty; }

            set
            {
                _cash_strategy_qty = value;
                RaisePropertyChanged(() => cash_strategy_qty);
            }
        }

        private double _strategy_price;
        /// <summary>
        /// ���Լ۸�
        /// </summary>
        public double strategy_price
        {
            get { return _strategy_price; }

            set
            {
                _strategy_price = value;
                RaisePropertyChanged(() => strategy_price);
            }
        }

        private int _price_type;
        /// <summary>
        /// �۸�����
        /// </summary>
        public int price_type
        {
            get { return _price_type; }

            set
            {
                _price_type = value;
                RaisePropertyChanged(() => price_type);
            }
        }

        private int _strategy_valid_type;
        /// <summary>
        /// ������Ч����
        /// </summary>
        public int strategy_valid_type
        {
            get { return _strategy_valid_type; }

            set
            {
                _strategy_valid_type = value;
                RaisePropertyChanged(() => strategy_valid_type);
            }
        }

        private String _strategy_rule_way;
        /// <summary>
        /// ���Թ���ʽ
        /// </summary>
        public String strategy_rule_way
        {
            get { return _strategy_rule_way; }

            set
            {
                _strategy_rule_way = value;
                RaisePropertyChanged(() => strategy_rule_way);
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

        private int _strategy_time;
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int strategy_time
        {
            get { return _strategy_time; }

            set
            {
                _strategy_time = value;
                RaisePropertyChanged(() => strategy_time);
            }
        }

        private int _margin_trade_type;
        /// <summary>
        /// ���ý��׷�ʽ
        /// </summary>
        public int margin_trade_type
        {
            get { return _margin_trade_type; }

            set
            {
                _margin_trade_type = value;
                RaisePropertyChanged(() => margin_trade_type);
            }
        }

        private String _target_strategy_type;
        /// <summary>
        /// Ŀ���������
        /// </summary>
        public String target_strategy_type
        {
            get { return _target_strategy_type; }

            set
            {
                _target_strategy_type = value;
                RaisePropertyChanged(() => target_strategy_type);
            }
        }

        private String _target_strategy_param;
        /// <summary>
        /// Ŀ����Բ���
        /// </summary>
        public String target_strategy_param
        {
            get { return _target_strategy_param; }

            set
            {
                _target_strategy_param = value;
                RaisePropertyChanged(() => target_strategy_param);
            }
        }

        private String _strategy_contr_comm;
        /// <summary>
        /// ���Կ���ָ��
        /// </summary>
        public String strategy_contr_comm
        {
            get { return _strategy_contr_comm; }

            set
            {
                _strategy_contr_comm = value;
                RaisePropertyChanged(() => strategy_contr_comm);
            }
        }

        private String _strategy_status;
        /// <summary>
        /// ����״̬
        /// </summary>
        public String strategy_status
        {
            get { return _strategy_status; }

            set
            {
                _strategy_status = value;
                RaisePropertyChanged(() => strategy_status);
            }
        }

        private String _strategy_deal_status;
        /// <summary>
        /// ���Դ���״̬
        /// </summary>
        public String strategy_deal_status
        {
            get { return _strategy_deal_status; }

            set
            {
                _strategy_deal_status = value;
                RaisePropertyChanged(() => strategy_deal_status);
            }
        }

        private int _strategy_deal_kind;
        /// <summary>
        /// ���Դ���ʽ
        /// </summary>
        public int strategy_deal_kind
        {
            get { return _strategy_deal_kind; }

            set
            {
                _strategy_deal_kind = value;
                RaisePropertyChanged(() => strategy_deal_kind);
            }
        }

        private double _strategy_amt;
        /// <summary>
        /// ���Խ��
        /// </summary>
        public double strategy_amt
        {
            get { return _strategy_amt; }

            set
            {
                _strategy_amt = value;
                RaisePropertyChanged(() => strategy_amt);
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

        private double _order_amt;
        /// <summary>
        /// �������
        /// </summary>
        public double order_amt
        {
            get { return _order_amt; }

            set
            {
                _order_amt = value;
                RaisePropertyChanged(() => order_amt);
            }
        }

        private double _wtdraw_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double wtdraw_qty
        {
            get { return _wtdraw_qty; }

            set
            {
                _wtdraw_qty = value;
                RaisePropertyChanged(() => wtdraw_qty);
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

        private int _order_batch_no;
        /// <summary>
        /// ��������
        /// </summary>
        public int order_batch_no
        {
            get { return _order_batch_no; }

            set
            {
                _order_batch_no = value;
                RaisePropertyChanged(() => order_batch_no);
            }
        }

        private String _strategy_oper_way;
        /// <summary>
        /// ���Բ�����ʽ
        /// </summary>
        public String strategy_oper_way
        {
            get { return _strategy_oper_way; }

            set
            {
                _strategy_oper_way = value;
                RaisePropertyChanged(() => strategy_oper_way);
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

        private int _strategy_batch_no;
        /// <summary>
        /// ��������
        /// </summary>
        public int strategy_batch_no
        {
            get { return _strategy_batch_no; }

            set
            {
                _strategy_batch_no = value;
                RaisePropertyChanged(() => strategy_batch_no);
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

    public class tdsecuL_11_103_Info : ObservableObject
    {

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

        private int _strategy_batch_no;
        /// <summary>
        /// ��������
        /// </summary>
        public int strategy_batch_no
        {
            get { return _strategy_batch_no; }

            set
            {
                _strategy_batch_no = value;
                RaisePropertyChanged(() => strategy_batch_no);
            }
        }

        private String _strategy_exec_broker;
        /// <summary>
        /// ����ִ����
        /// </summary>
        public String strategy_exec_broker
        {
            get { return _strategy_exec_broker; }

            set
            {
                _strategy_exec_broker = value;
                RaisePropertyChanged(() => strategy_exec_broker);
            }
        }

        private int _strategy_exec_kind;
        /// <summary>
        /// ����ִ�з�ʽ
        /// </summary>
        public int strategy_exec_kind
        {
            get { return _strategy_exec_kind; }

            set
            {
                _strategy_exec_kind = value;
                RaisePropertyChanged(() => strategy_exec_kind);
            }
        }

        private String _strategy_exec_comm_str;
        /// <summary>
        /// ����ִ��ָ�
        /// </summary>
        public String strategy_exec_comm_str
        {
            get { return _strategy_exec_comm_str; }

            set
            {
                _strategy_exec_comm_str = value;
                RaisePropertyChanged(() => strategy_exec_comm_str);
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

        private int _stock_type;
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public int stock_type
        {
            get { return _stock_type; }

            set
            {
                _stock_type = value;
                RaisePropertyChanged(() => stock_type);
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

        private int _stock_code_no;
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no
        {
            get { return _stock_code_no; }

            set
            {
                _stock_code_no = value;
                RaisePropertyChanged(() => stock_code_no);
            }
        }

        private int _strategy_dir;
        /// <summary>
        /// ���Է���
        /// </summary>
        public int strategy_dir
        {
            get { return _strategy_dir; }

            set
            {
                _strategy_dir = value;
                RaisePropertyChanged(() => strategy_dir);
            }
        }

        private double _strategy_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double strategy_qty
        {
            get { return _strategy_qty; }

            set
            {
                _strategy_qty = value;
                RaisePropertyChanged(() => strategy_qty);
            }
        }

        private double _cash_strategy_qty;
        /// <summary>
        /// �ʽ��������
        /// </summary>
        public double cash_strategy_qty
        {
            get { return _cash_strategy_qty; }

            set
            {
                _cash_strategy_qty = value;
                RaisePropertyChanged(() => cash_strategy_qty);
            }
        }

        private double _strategy_price;
        /// <summary>
        /// ���Լ۸�
        /// </summary>
        public double strategy_price
        {
            get { return _strategy_price; }

            set
            {
                _strategy_price = value;
                RaisePropertyChanged(() => strategy_price);
            }
        }

        private int _price_type;
        /// <summary>
        /// �۸�����
        /// </summary>
        public int price_type
        {
            get { return _price_type; }

            set
            {
                _price_type = value;
                RaisePropertyChanged(() => price_type);
            }
        }

        private double _strategy_amt;
        /// <summary>
        /// ���Խ��
        /// </summary>
        public double strategy_amt
        {
            get { return _strategy_amt; }

            set
            {
                _strategy_amt = value;
                RaisePropertyChanged(() => strategy_amt);
            }
        }

        private int _strategy_valid_type;
        /// <summary>
        /// ������Ч����
        /// </summary>
        public int strategy_valid_type
        {
            get { return _strategy_valid_type; }

            set
            {
                _strategy_valid_type = value;
                RaisePropertyChanged(() => strategy_valid_type);
            }
        }

        private String _strategy_rule_way;
        /// <summary>
        /// ���Թ���ʽ
        /// </summary>
        public String strategy_rule_way
        {
            get { return _strategy_rule_way; }

            set
            {
                _strategy_rule_way = value;
                RaisePropertyChanged(() => strategy_rule_way);
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

        private int _strategy_date;
        /// <summary>
        /// ��������
        /// </summary>
        public int strategy_date
        {
            get { return _strategy_date; }

            set
            {
                _strategy_date = value;
                RaisePropertyChanged(() => strategy_date);
            }
        }

        private int _margin_trade_type;
        /// <summary>
        /// ���ý��׷�ʽ
        /// </summary>
        public int margin_trade_type
        {
            get { return _margin_trade_type; }

            set
            {
                _margin_trade_type = value;
                RaisePropertyChanged(() => margin_trade_type);
            }
        }

        private String _target_strategy_type;
        /// <summary>
        /// Ŀ���������
        /// </summary>
        public String target_strategy_type
        {
            get { return _target_strategy_type; }

            set
            {
                _target_strategy_type = value;
                RaisePropertyChanged(() => target_strategy_type);
            }
        }

        private String _target_strategy_param;
        /// <summary>
        /// Ŀ����Բ���
        /// </summary>
        public String target_strategy_param
        {
            get { return _target_strategy_param; }

            set
            {
                _target_strategy_param = value;
                RaisePropertyChanged(() => target_strategy_param);
            }
        }

        private String _strategy_contr_comm;
        /// <summary>
        /// ���Կ���ָ��
        /// </summary>
        public String strategy_contr_comm
        {
            get { return _strategy_contr_comm; }

            set
            {
                _strategy_contr_comm = value;
                RaisePropertyChanged(() => strategy_contr_comm);
            }
        }

        private String _strategy_sum_status;
        /// <summary>
        /// ���Ի���״̬
        /// </summary>
        public String strategy_sum_status
        {
            get { return _strategy_sum_status; }

            set
            {
                _strategy_sum_status = value;
                RaisePropertyChanged(() => strategy_sum_status);
            }
        }

        private String _strategy_deal_status;
        /// <summary>
        /// ���Դ���״̬
        /// </summary>
        public String strategy_deal_status
        {
            get { return _strategy_deal_status; }

            set
            {
                _strategy_deal_status = value;
                RaisePropertyChanged(() => strategy_deal_status);
            }
        }

        private int _strategy_deal_kind;
        /// <summary>
        /// ���Դ���ʽ
        /// </summary>
        public int strategy_deal_kind
        {
            get { return _strategy_deal_kind; }

            set
            {
                _strategy_deal_kind = value;
                RaisePropertyChanged(() => strategy_deal_kind);
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

        private double _valid_order_qty;
        /// <summary>
        /// ��Ч��������
        /// </summary>
        public double valid_order_qty
        {
            get { return _valid_order_qty; }

            set
            {
                _valid_order_qty = value;
                RaisePropertyChanged(() => valid_order_qty);
            }
        }

        private double _order_amt;
        /// <summary>
        /// �������
        /// </summary>
        public double order_amt
        {
            get { return _order_amt; }

            set
            {
                _order_amt = value;
                RaisePropertyChanged(() => order_amt);
            }
        }

        private double _wtdraw_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double wtdraw_qty
        {
            get { return _wtdraw_qty; }

            set
            {
                _wtdraw_qty = value;
                RaisePropertyChanged(() => wtdraw_qty);
            }
        }

        private double _valid_wtdraw_qty;
        /// <summary>
        /// ��Ч��������
        /// </summary>
        public double valid_wtdraw_qty
        {
            get { return _valid_wtdraw_qty; }

            set
            {
                _valid_wtdraw_qty = value;
                RaisePropertyChanged(() => valid_wtdraw_qty);
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

        private double _cancel_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double cancel_qty
        {
            get { return _cancel_qty; }

            set
            {
                _cancel_qty = value;
                RaisePropertyChanged(() => cancel_qty);
            }
        }

        private double _faild_qty;
        /// <summary>
        /// ʧ������
        /// </summary>
        public double faild_qty
        {
            get { return _faild_qty; }

            set
            {
                _faild_qty = value;
                RaisePropertyChanged(() => faild_qty);
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

        private int _order_batch_no;
        /// <summary>
        /// ��������
        /// </summary>
        public int order_batch_no
        {
            get { return _order_batch_no; }

            set
            {
                _order_batch_no = value;
                RaisePropertyChanged(() => order_batch_no);
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

        private String _strategy_oper_way;
        /// <summary>
        /// ���Բ�����ʽ
        /// </summary>
        public String strategy_oper_way
        {
            get { return _strategy_oper_way; }

            set
            {
                _strategy_oper_way = value;
                RaisePropertyChanged(() => strategy_oper_way);
            }
        }
    }

    public class tdsecuL_11_104_Info : ObservableObject
    {
    }

    public class tdsecuL_11_105_Info : ObservableObject
    {
    }

}

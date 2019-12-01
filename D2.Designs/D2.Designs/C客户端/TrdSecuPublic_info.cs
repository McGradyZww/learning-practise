using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class tdsecuL_1_1_Info : ObservableObject
    {
    }

    public class tdsecuL_1_11_Info : ObservableObject
    {

        private ulong _basket_id;
        /// <summary>
        /// �������
        /// </summary>
        public ulong basket_id
        {
            get { return _basket_id; }

            set
            {
                _basket_id = value;
                RaisePropertyChanged(() => basket_id);
            }
        }
    }

    public class tdsecuL_1_12_Info : ObservableObject
    {
    }

    public class tdsecuL_1_13_Info : ObservableObject
    {
    }

    public class tdsecuL_1_14_Info : ObservableObject
    {

        private String _basket_name;
        /// <summary>
        /// ��������
        /// </summary>
        public String basket_name
        {
            get { return _basket_name; }

            set
            {
                _basket_name = value;
                RaisePropertyChanged(() => basket_name);
            }
        }

        private int _weight_type;
        /// <summary>
        /// Ȩ������
        /// </summary>
        public int weight_type
        {
            get { return _weight_type; }

            set
            {
                _weight_type = value;
                RaisePropertyChanged(() => weight_type);
            }
        }

        private int _is_public;
        /// <summary>
        /// �Ƿ���
        /// </summary>
        public int is_public
        {
            get { return _is_public; }

            set
            {
                _is_public = value;
                RaisePropertyChanged(() => is_public);
            }
        }

        private int _compos_count;
        /// <summary>
        /// �ɷݹɸ���
        /// </summary>
        public int compos_count
        {
            get { return _compos_count; }

            set
            {
                _compos_count = value;
                RaisePropertyChanged(() => compos_count);
            }
        }

        private String _basket_status;
        /// <summary>
        /// ����״̬
        /// </summary>
        public String basket_status
        {
            get { return _basket_status; }

            set
            {
                _basket_status = value;
                RaisePropertyChanged(() => basket_status);
            }
        }

        private ulong _basket_id;
        /// <summary>
        /// �������
        /// </summary>
        public ulong basket_id
        {
            get { return _basket_id; }

            set
            {
                _basket_id = value;
                RaisePropertyChanged(() => basket_id);
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

        private double _cash_replace_amt;
        /// <summary>
        /// �ֽ�������
        /// </summary>
        public double cash_replace_amt
        {
            get { return _cash_replace_amt; }

            set
            {
                _cash_replace_amt = value;
                RaisePropertyChanged(() => cash_replace_amt);
            }
        }
    }

    public class tdsecuL_1_21_Info : ObservableObject
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
    }

    public class tdsecuL_1_22_Info : ObservableObject
    {
    }

    public class tdsecuL_1_23_Info : ObservableObject
    {
    }

    public class tdsecuL_1_24_Info : ObservableObject
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

        private ulong _basket_id;
        /// <summary>
        /// �������
        /// </summary>
        public ulong basket_id
        {
            get { return _basket_id; }

            set
            {
                _basket_id = value;
                RaisePropertyChanged(() => basket_id);
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

        private double _compos_qty;
        /// <summary>
        /// �ɷ�����
        /// </summary>
        public double compos_qty
        {
            get { return _compos_qty; }

            set
            {
                _compos_qty = value;
                RaisePropertyChanged(() => compos_qty);
            }
        }

        private double _compos_ratio;
        /// <summary>
        /// �ɷݱ���
        /// </summary>
        public double compos_ratio
        {
            get { return _compos_ratio; }

            set
            {
                _compos_ratio = value;
                RaisePropertyChanged(() => compos_ratio);
            }
        }

        private int _repl_stock_code_no;
        /// <summary>
        /// ���֤ȯ������
        /// </summary>
        public int repl_stock_code_no
        {
            get { return _repl_stock_code_no; }

            set
            {
                _repl_stock_code_no = value;
                RaisePropertyChanged(() => repl_stock_code_no);
            }
        }

        private double _repl_qty;
        /// <summary>
        /// �������
        /// </summary>
        public double repl_qty
        {
            get { return _repl_qty; }

            set
            {
                _repl_qty = value;
                RaisePropertyChanged(() => repl_qty);
            }
        }
    }

    public class tdsecuL_1_51_Info : ObservableObject
    {

        private String _task_strike_status;
        /// <summary>
        /// ����ִ��״̬
        /// </summary>
        public String task_strike_status
        {
            get { return _task_strike_status; }

            set
            {
                _task_strike_status = value;
                RaisePropertyChanged(() => task_strike_status);
            }
        }
    }

    public class tdsecuL_1_54_Info : ObservableObject
    {

        private String _task_strike_status;
        /// <summary>
        /// ����ִ��״̬
        /// </summary>
        public String task_strike_status
        {
            get { return _task_strike_status; }

            set
            {
                _task_strike_status = value;
                RaisePropertyChanged(() => task_strike_status);
            }
        }
    }

    public class tdsecuL_1_901_Info : ObservableObject
    {

        private ulong _curr_no;
        /// <summary>
        /// ��ǰ���
        /// </summary>
        public ulong curr_no
        {
            get { return _curr_no; }

            set
            {
                _curr_no = value;
                RaisePropertyChanged(() => curr_no);
            }
        }
    }

    public class tdsecuL_1_31_Info : ObservableObject
    {

        private ulong _combo_id;
        /// <summary>
        /// ������
        /// </summary>
        public ulong combo_id
        {
            get { return _combo_id; }

            set
            {
                _combo_id = value;
                RaisePropertyChanged(() => combo_id);
            }
        }
    }

    public class tdsecuL_1_32_Info : ObservableObject
    {
    }

    public class tdsecuL_1_33_Info : ObservableObject
    {
    }

    public class tdsecuL_1_34_Info : ObservableObject
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

        private String _combo_code;
        /// <summary>
        /// ��ϴ���
        /// </summary>
        public String combo_code
        {
            get { return _combo_code; }

            set
            {
                _combo_code = value;
                RaisePropertyChanged(() => combo_code);
            }
        }

        private String _comb_name;
        /// <summary>
        /// �������
        /// </summary>
        public String comb_name
        {
            get { return _comb_name; }

            set
            {
                _comb_name = value;
                RaisePropertyChanged(() => comb_name);
            }
        }

        private int _is_public;
        /// <summary>
        /// �Ƿ���
        /// </summary>
        public int is_public
        {
            get { return _is_public; }

            set
            {
                _is_public = value;
                RaisePropertyChanged(() => is_public);
            }
        }

        private int _create_failure_validity_date;
        /// <summary>
        /// ����ʧ����Ч��
        /// </summary>
        public int create_failure_validity_date
        {
            get { return _create_failure_validity_date; }

            set
            {
                _create_failure_validity_date = value;
                RaisePropertyChanged(() => create_failure_validity_date);
            }
        }

        private int _create_end_validity_date;
        /// <summary>
        /// ����������Ч��
        /// </summary>
        public int create_end_validity_date
        {
            get { return _create_end_validity_date; }

            set
            {
                _create_end_validity_date = value;
                RaisePropertyChanged(() => create_end_validity_date);
            }
        }

        private int _rebalance_failure_validity_date;
        /// <summary>
        /// ��ƽ��ʧ����Ч��
        /// </summary>
        public int rebalance_failure_validity_date
        {
            get { return _rebalance_failure_validity_date; }

            set
            {
                _rebalance_failure_validity_date = value;
                RaisePropertyChanged(() => rebalance_failure_validity_date);
            }
        }

        private int _rebalance_end_validity_date;
        /// <summary>
        /// ��ƽ�������Ч��
        /// </summary>
        public int rebalance_end_validity_date
        {
            get { return _rebalance_end_validity_date; }

            set
            {
                _rebalance_end_validity_date = value;
                RaisePropertyChanged(() => rebalance_end_validity_date);
            }
        }

        private int _repair_failure_validity_date;
        /// <summary>
        /// ����ʧ����Ч��
        /// </summary>
        public int repair_failure_validity_date
        {
            get { return _repair_failure_validity_date; }

            set
            {
                _repair_failure_validity_date = value;
                RaisePropertyChanged(() => repair_failure_validity_date);
            }
        }

        private int _repair_end_validity_date;
        /// <summary>
        /// ����������Ч��
        /// </summary>
        public int repair_end_validity_date
        {
            get { return _repair_end_validity_date; }

            set
            {
                _repair_end_validity_date = value;
                RaisePropertyChanged(() => repair_end_validity_date);
            }
        }

        private int _broke_validity_date;
        /// <summary>
        /// �ƻ���Ч��
        /// </summary>
        public int broke_validity_date
        {
            get { return _broke_validity_date; }

            set
            {
                _broke_validity_date = value;
                RaisePropertyChanged(() => broke_validity_date);
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

    public class tdsecuL_1_35_Info : ObservableObject
    {

        private ulong _combo_stock_id;
        /// <summary>
        /// ���֤ȯ���
        /// </summary>
        public ulong combo_stock_id
        {
            get { return _combo_stock_id; }

            set
            {
                _combo_stock_id = value;
                RaisePropertyChanged(() => combo_stock_id);
            }
        }
    }

    public class tdsecuL_1_36_Info : ObservableObject
    {
    }

    public class tdsecuL_1_37_Info : ObservableObject
    {
    }

    public class tdsecuL_1_38_Info : ObservableObject
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

        private String _combo_code;
        /// <summary>
        /// ��ϴ���
        /// </summary>
        public String combo_code
        {
            get { return _combo_code; }

            set
            {
                _combo_code = value;
                RaisePropertyChanged(() => combo_code);
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

        private double _combo_ratio;
        /// <summary>
        /// ��ϱ���
        /// </summary>
        public double combo_ratio
        {
            get { return _combo_ratio; }

            set
            {
                _combo_ratio = value;
                RaisePropertyChanged(() => combo_ratio);
            }
        }

        private double _combo_qty;
        /// <summary>
        /// �������
        /// </summary>
        public double combo_qty
        {
            get { return _combo_qty; }

            set
            {
                _combo_qty = value;
                RaisePropertyChanged(() => combo_qty);
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

    public class tdsecuL_1_39_Info : ObservableObject
    {
    }

    public class tdsecuL_1_56_Info : ObservableObject
    {

        private String _task_strike_status;
        /// <summary>
        /// ����ִ��״̬
        /// </summary>
        public String task_strike_status
        {
            get { return _task_strike_status; }

            set
            {
                _task_strike_status = value;
                RaisePropertyChanged(() => task_strike_status);
            }
        }
    }

    public class tdsecuL_1_40_Info : ObservableObject
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
    }

    public class tdsecuL_1_41_Info : ObservableObject
    {
    }

    public class tdsecuL_1_42_Info : ObservableObject
    {
    }

    public class tdsecuL_1_43_Info : ObservableObject
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

        private String _rule_name;
        /// <summary>
        /// ��������
        /// </summary>
        public String rule_name
        {
            get { return _rule_name; }

            set
            {
                _rule_name = value;
                RaisePropertyChanged(() => rule_name);
            }
        }

        private int _prior_type;
        /// <summary>
        /// ���ȼ�
        /// </summary>
        public int prior_type
        {
            get { return _prior_type; }

            set
            {
                _prior_type = value;
                RaisePropertyChanged(() => prior_type);
            }
        }

        private String _exch_group_no_str;
        /// <summary>
        /// �������Ŵ�
        /// </summary>
        public String exch_group_no_str
        {
            get { return _exch_group_no_str; }

            set
            {
                _exch_group_no_str = value;
                RaisePropertyChanged(() => exch_group_no_str);
            }
        }

        private String _exch_no_str;
        /// <summary>
        /// �г���Ŵ�
        /// </summary>
        public String exch_no_str
        {
            get { return _exch_no_str; }

            set
            {
                _exch_no_str = value;
                RaisePropertyChanged(() => exch_no_str);
            }
        }

        private String _stock_type_str;
        /// <summary>
        /// ֤ȯ���ʹ�
        /// </summary>
        public String stock_type_str
        {
            get { return _stock_type_str; }

            set
            {
                _stock_type_str = value;
                RaisePropertyChanged(() => stock_type_str);
            }
        }

        private String _stock_code_str;
        /// <summary>
        /// ֤ȯ���봮
        /// </summary>
        public String stock_code_str
        {
            get { return _stock_code_str; }

            set
            {
                _stock_code_str = value;
                RaisePropertyChanged(() => stock_code_str);
            }
        }

        private String _opor_no_str;
        /// <summary>
        /// ����Ա��Ŵ�
        /// </summary>
        public String opor_no_str
        {
            get { return _opor_no_str; }

            set
            {
                _opor_no_str = value;
                RaisePropertyChanged(() => opor_no_str);
            }
        }

        private int _distribute_last_trader;
        /// <summary>
        /// ָ���Զ��ַ�ͬȯ�ַ����ϴηַ��Ľ���Ա
        /// </summary>
        public int distribute_last_trader
        {
            get { return _distribute_last_trader; }

            set
            {
                _distribute_last_trader = value;
                RaisePropertyChanged(() => distribute_last_trader);
            }
        }

        private int _distribute_by_jobs;
        /// <summary>
        /// ָ���Զ��ַ����������ַ�
        /// </summary>
        public int distribute_by_jobs
        {
            get { return _distribute_by_jobs; }

            set
            {
                _distribute_by_jobs = value;
                RaisePropertyChanged(() => distribute_by_jobs);
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

    public class tdsecuL_1_60_Info : ObservableObject
    {
    }

    public class tdsecuL_1_61_Info : ObservableObject
    {
    }

    public class tdsecuL_1_62_Info : ObservableObject
    {
    }

    public class tdsecuL_1_63_Info : ObservableObject
    {
    }

    public class tdsecuL_1_64_Info : ObservableObject
    {
    }

    public class tdsecuL_1_65_Info : ObservableObject
    {
    }

    public class tdsecuL_1_66_Info : ObservableObject
    {
    }

    public class tdsecuL_1_67_Info : ObservableObject
    {
    }

}

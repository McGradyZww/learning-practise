using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class pdfutuL_10_1_Info : ObservableObject
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

        private String _crncy_type;
        /// <summary>
        /// ���ұ���
        /// </summary>
        public String crncy_type
        {
            get { return _crncy_type; }

            set
            {
                _crncy_type = value;
                RaisePropertyChanged(() => crncy_type);
            }
        }

        private double _acco_curr_amt;
        /// <summary>
        /// �˻���ǰ���
        /// </summary>
        public double acco_curr_amt
        {
            get { return _acco_curr_amt; }

            set
            {
                _acco_curr_amt = value;
                RaisePropertyChanged(() => acco_curr_amt);
            }
        }

        private double _acco_avail_amt;
        /// <summary>
        /// �˻����ý��
        /// </summary>
        public double acco_avail_amt
        {
            get { return _acco_avail_amt; }

            set
            {
                _acco_avail_amt = value;
                RaisePropertyChanged(() => acco_avail_amt);
            }
        }

        private double _act_capt_margin;
        /// <summary>
        /// �˻�ռ�ñ�֤��
        /// </summary>
        public double act_capt_margin
        {
            get { return _act_capt_margin; }

            set
            {
                _act_capt_margin = value;
                RaisePropertyChanged(() => act_capt_margin);
            }
        }

        private double _out_curr_amt;
        /// <summary>
        /// �ⲿ��ǰ���
        /// </summary>
        public double out_curr_amt
        {
            get { return _out_curr_amt; }

            set
            {
                _out_curr_amt = value;
                RaisePropertyChanged(() => out_curr_amt);
            }
        }

        private double _out_enable_amt;
        /// <summary>
        /// �ⲿ���ý��
        /// </summary>
        public double out_enable_amt
        {
            get { return _out_enable_amt; }

            set
            {
                _out_enable_amt = value;
                RaisePropertyChanged(() => out_enable_amt);
            }
        }

        private double _out_capt_margin;
        /// <summary>
        /// �ⲿռ�ñ�֤��
        /// </summary>
        public double out_capt_margin
        {
            get { return _out_capt_margin; }

            set
            {
                _out_capt_margin = value;
                RaisePropertyChanged(() => out_capt_margin);
            }
        }

        private double _acco_curr_amt_diff;
        /// <summary>
        /// �˻���ǰ�����
        /// </summary>
        public double acco_curr_amt_diff
        {
            get { return _acco_curr_amt_diff; }

            set
            {
                _acco_curr_amt_diff = value;
                RaisePropertyChanged(() => acco_curr_amt_diff);
            }
        }

        private double _acco_avail_amt_diff;
        /// <summary>
        /// �˻����ý����
        /// </summary>
        public double acco_avail_amt_diff
        {
            get { return _acco_avail_amt_diff; }

            set
            {
                _acco_avail_amt_diff = value;
                RaisePropertyChanged(() => acco_avail_amt_diff);
            }
        }

        private double _act_capt_margin_diff;
        /// <summary>
        /// �˻�ռ�ñ�֤����
        /// </summary>
        public double act_capt_margin_diff
        {
            get { return _act_capt_margin_diff; }

            set
            {
                _act_capt_margin_diff = value;
                RaisePropertyChanged(() => act_capt_margin_diff);
            }
        }

        private int _deal_flag;
        /// <summary>
        /// �����־
        /// </summary>
        public int deal_flag
        {
            get { return _deal_flag; }

            set
            {
                _deal_flag = value;
                RaisePropertyChanged(() => deal_flag);
            }
        }

        private int _asset_sync_flag;
        /// <summary>
        /// �ʲ��Ƿ�ͬ��
        /// </summary>
        public int asset_sync_flag
        {
            get { return _asset_sync_flag; }

            set
            {
                _asset_sync_flag = value;
                RaisePropertyChanged(() => asset_sync_flag);
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
    }

    public class pdfutuL_10_2_Info : ObservableObject
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
    }

    public class pdfutuL_10_11_Info : ObservableObject
    {
    }

    public class pdfutuL_10_13_Info : ObservableObject
    {
    }

    public class pdfutuL_10_12_Info : ObservableObject
    {
    }

    public class pdfutuL_10_14_Info : ObservableObject
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

        private int _create_date;
        /// <summary>
        /// ��������
        /// </summary>
        public int create_date
        {
            get { return _create_date; }

            set
            {
                _create_date = value;
                RaisePropertyChanged(() => create_date);
            }
        }

        private int _create_time;
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int create_time
        {
            get { return _create_time; }

            set
            {
                _create_time = value;
                RaisePropertyChanged(() => create_time);
            }
        }

        private int _update_date;
        /// <summary>
        /// ��������
        /// </summary>
        public int update_date
        {
            get { return _update_date; }

            set
            {
                _update_date = value;
                RaisePropertyChanged(() => update_date);
            }
        }

        private int _update_time;
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int update_time
        {
            get { return _update_time; }

            set
            {
                _update_time = value;
                RaisePropertyChanged(() => update_time);
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

        private String _crncy_type;
        /// <summary>
        /// ���ұ���
        /// </summary>
        public String crncy_type
        {
            get { return _crncy_type; }

            set
            {
                _crncy_type = value;
                RaisePropertyChanged(() => crncy_type);
            }
        }

        private double _begin_amt;
        /// <summary>
        /// �ڳ����
        /// </summary>
        public double begin_amt
        {
            get { return _begin_amt; }

            set
            {
                _begin_amt = value;
                RaisePropertyChanged(() => begin_amt);
            }
        }

        private double _curr_amt;
        /// <summary>
        /// ��ǰ���
        /// </summary>
        public double curr_amt
        {
            get { return _curr_amt; }

            set
            {
                _curr_amt = value;
                RaisePropertyChanged(() => curr_amt);
            }
        }

        private double _capt_margin;
        /// <summary>
        /// ռ�ñ�֤��
        /// </summary>
        public double capt_margin
        {
            get { return _capt_margin; }

            set
            {
                _capt_margin = value;
                RaisePropertyChanged(() => capt_margin);
            }
        }

        private double _frozen_amt;
        /// <summary>
        /// ������
        /// </summary>
        public double frozen_amt
        {
            get { return _frozen_amt; }

            set
            {
                _frozen_amt = value;
                RaisePropertyChanged(() => frozen_amt);
            }
        }

        private double _unfroz_amt;
        /// <summary>
        /// �ⶳ���
        /// </summary>
        public double unfroz_amt
        {
            get { return _unfroz_amt; }

            set
            {
                _unfroz_amt = value;
                RaisePropertyChanged(() => unfroz_amt);
            }
        }

        private double _total_rece_amt;
        /// <summary>
        /// �ۼ�Ӧ�ս��
        /// </summary>
        public double total_rece_amt
        {
            get { return _total_rece_amt; }

            set
            {
                _total_rece_amt = value;
                RaisePropertyChanged(() => total_rece_amt);
            }
        }

        private double _total_payab_amt;
        /// <summary>
        /// �ۼ�Ӧ�����
        /// </summary>
        public double total_payab_amt
        {
            get { return _total_payab_amt; }

            set
            {
                _total_payab_amt = value;
                RaisePropertyChanged(() => total_payab_amt);
            }
        }

        private double _intrst_rate;
        /// <summary>
        /// ����
        /// </summary>
        public double intrst_rate
        {
            get { return _intrst_rate; }

            set
            {
                _intrst_rate = value;
                RaisePropertyChanged(() => intrst_rate);
            }
        }

        private double _intrst_base_amt;
        /// <summary>
        /// ��Ϣ����
        /// </summary>
        public double intrst_base_amt
        {
            get { return _intrst_base_amt; }

            set
            {
                _intrst_base_amt = value;
                RaisePropertyChanged(() => intrst_base_amt);
            }
        }

        private double _pre_entry_intrst_amt;
        /// <summary>
        /// ��������Ϣ
        /// </summary>
        public double pre_entry_intrst_amt
        {
            get { return _pre_entry_intrst_amt; }

            set
            {
                _pre_entry_intrst_amt = value;
                RaisePropertyChanged(() => pre_entry_intrst_amt);
            }
        }
    }

    public class pdfutuL_10_15_Info : ObservableObject
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

        private int _create_date;
        /// <summary>
        /// ��������
        /// </summary>
        public int create_date
        {
            get { return _create_date; }

            set
            {
                _create_date = value;
                RaisePropertyChanged(() => create_date);
            }
        }

        private int _create_time;
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int create_time
        {
            get { return _create_time; }

            set
            {
                _create_time = value;
                RaisePropertyChanged(() => create_time);
            }
        }

        private int _update_date;
        /// <summary>
        /// ��������
        /// </summary>
        public int update_date
        {
            get { return _update_date; }

            set
            {
                _update_date = value;
                RaisePropertyChanged(() => update_date);
            }
        }

        private int _update_time;
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int update_time
        {
            get { return _update_time; }

            set
            {
                _update_time = value;
                RaisePropertyChanged(() => update_time);
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

        private String _crncy_type;
        /// <summary>
        /// ���ұ���
        /// </summary>
        public String crncy_type
        {
            get { return _crncy_type; }

            set
            {
                _crncy_type = value;
                RaisePropertyChanged(() => crncy_type);
            }
        }

        private double _begin_amt;
        /// <summary>
        /// �ڳ����
        /// </summary>
        public double begin_amt
        {
            get { return _begin_amt; }

            set
            {
                _begin_amt = value;
                RaisePropertyChanged(() => begin_amt);
            }
        }

        private double _curr_amt;
        /// <summary>
        /// ��ǰ���
        /// </summary>
        public double curr_amt
        {
            get { return _curr_amt; }

            set
            {
                _curr_amt = value;
                RaisePropertyChanged(() => curr_amt);
            }
        }

        private double _capt_margin;
        /// <summary>
        /// ռ�ñ�֤��
        /// </summary>
        public double capt_margin
        {
            get { return _capt_margin; }

            set
            {
                _capt_margin = value;
                RaisePropertyChanged(() => capt_margin);
            }
        }

        private double _frozen_amt;
        /// <summary>
        /// ������
        /// </summary>
        public double frozen_amt
        {
            get { return _frozen_amt; }

            set
            {
                _frozen_amt = value;
                RaisePropertyChanged(() => frozen_amt);
            }
        }

        private double _unfroz_amt;
        /// <summary>
        /// �ⶳ���
        /// </summary>
        public double unfroz_amt
        {
            get { return _unfroz_amt; }

            set
            {
                _unfroz_amt = value;
                RaisePropertyChanged(() => unfroz_amt);
            }
        }

        private double _total_rece_amt;
        /// <summary>
        /// �ۼ�Ӧ�ս��
        /// </summary>
        public double total_rece_amt
        {
            get { return _total_rece_amt; }

            set
            {
                _total_rece_amt = value;
                RaisePropertyChanged(() => total_rece_amt);
            }
        }

        private double _total_payab_amt;
        /// <summary>
        /// �ۼ�Ӧ�����
        /// </summary>
        public double total_payab_amt
        {
            get { return _total_payab_amt; }

            set
            {
                _total_payab_amt = value;
                RaisePropertyChanged(() => total_payab_amt);
            }
        }

        private double _intrst_rate;
        /// <summary>
        /// ����
        /// </summary>
        public double intrst_rate
        {
            get { return _intrst_rate; }

            set
            {
                _intrst_rate = value;
                RaisePropertyChanged(() => intrst_rate);
            }
        }

        private double _intrst_base_amt;
        /// <summary>
        /// ��Ϣ����
        /// </summary>
        public double intrst_base_amt
        {
            get { return _intrst_base_amt; }

            set
            {
                _intrst_base_amt = value;
                RaisePropertyChanged(() => intrst_base_amt);
            }
        }

        private double _pre_entry_intrst_amt;
        /// <summary>
        /// ��������Ϣ
        /// </summary>
        public double pre_entry_intrst_amt
        {
            get { return _pre_entry_intrst_amt; }

            set
            {
                _pre_entry_intrst_amt = value;
                RaisePropertyChanged(() => pre_entry_intrst_amt);
            }
        }
    }

    public class pdfutuL_10_16_Info : ObservableObject
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

        private int _create_date;
        /// <summary>
        /// ��������
        /// </summary>
        public int create_date
        {
            get { return _create_date; }

            set
            {
                _create_date = value;
                RaisePropertyChanged(() => create_date);
            }
        }

        private int _create_time;
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int create_time
        {
            get { return _create_time; }

            set
            {
                _create_time = value;
                RaisePropertyChanged(() => create_time);
            }
        }

        private int _update_date;
        /// <summary>
        /// ��������
        /// </summary>
        public int update_date
        {
            get { return _update_date; }

            set
            {
                _update_date = value;
                RaisePropertyChanged(() => update_date);
            }
        }

        private int _update_time;
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int update_time
        {
            get { return _update_time; }

            set
            {
                _update_time = value;
                RaisePropertyChanged(() => update_time);
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

        private int _oper_menu_no;
        /// <summary>
        /// �����˵�
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
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

        private String _crncy_type;
        /// <summary>
        /// ���ұ���
        /// </summary>
        public String crncy_type
        {
            get { return _crncy_type; }

            set
            {
                _crncy_type = value;
                RaisePropertyChanged(() => crncy_type);
            }
        }

        private int _busi_flag;
        /// <summary>
        /// ҵ���־
        /// </summary>
        public int busi_flag
        {
            get { return _busi_flag; }

            set
            {
                _busi_flag = value;
                RaisePropertyChanged(() => busi_flag);
            }
        }

        private double _occur_amt;
        /// <summary>
        /// �䶯���
        /// </summary>
        public double occur_amt
        {
            get { return _occur_amt; }

            set
            {
                _occur_amt = value;
                RaisePropertyChanged(() => occur_amt);
            }
        }

        private double _occur_end_amt;
        /// <summary>
        /// �䶯����
        /// </summary>
        public double occur_end_amt
        {
            get { return _occur_end_amt; }

            set
            {
                _occur_end_amt = value;
                RaisePropertyChanged(() => occur_end_amt);
            }
        }

        private String _jour_occur_field;
        /// <summary>
        /// ��ˮ�䶯�ֶ�
        /// </summary>
        public String jour_occur_field
        {
            get { return _jour_occur_field; }

            set
            {
                _jour_occur_field = value;
                RaisePropertyChanged(() => jour_occur_field);
            }
        }

        private String _jour_after_occur_info;
        /// <summary>
        /// ��ˮ����Ϣ
        /// </summary>
        public String jour_after_occur_info
        {
            get { return _jour_after_occur_info; }

            set
            {
                _jour_after_occur_info = value;
                RaisePropertyChanged(() => jour_after_occur_info);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// ������ע
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pdfutuL_10_17_Info : ObservableObject
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

        private int _create_date;
        /// <summary>
        /// ��������
        /// </summary>
        public int create_date
        {
            get { return _create_date; }

            set
            {
                _create_date = value;
                RaisePropertyChanged(() => create_date);
            }
        }

        private int _create_time;
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int create_time
        {
            get { return _create_time; }

            set
            {
                _create_time = value;
                RaisePropertyChanged(() => create_time);
            }
        }

        private int _update_date;
        /// <summary>
        /// ��������
        /// </summary>
        public int update_date
        {
            get { return _update_date; }

            set
            {
                _update_date = value;
                RaisePropertyChanged(() => update_date);
            }
        }

        private int _update_time;
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int update_time
        {
            get { return _update_time; }

            set
            {
                _update_time = value;
                RaisePropertyChanged(() => update_time);
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

        private int _oper_menu_no;
        /// <summary>
        /// �����˵�
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
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

        private String _crncy_type;
        /// <summary>
        /// ���ұ���
        /// </summary>
        public String crncy_type
        {
            get { return _crncy_type; }

            set
            {
                _crncy_type = value;
                RaisePropertyChanged(() => crncy_type);
            }
        }

        private int _busi_flag;
        /// <summary>
        /// ҵ���־
        /// </summary>
        public int busi_flag
        {
            get { return _busi_flag; }

            set
            {
                _busi_flag = value;
                RaisePropertyChanged(() => busi_flag);
            }
        }

        private double _occur_amt;
        /// <summary>
        /// �䶯���
        /// </summary>
        public double occur_amt
        {
            get { return _occur_amt; }

            set
            {
                _occur_amt = value;
                RaisePropertyChanged(() => occur_amt);
            }
        }

        private double _occur_end_amt;
        /// <summary>
        /// �䶯����
        /// </summary>
        public double occur_end_amt
        {
            get { return _occur_end_amt; }

            set
            {
                _occur_end_amt = value;
                RaisePropertyChanged(() => occur_end_amt);
            }
        }

        private String _jour_occur_field;
        /// <summary>
        /// ��ˮ�䶯�ֶ�
        /// </summary>
        public String jour_occur_field
        {
            get { return _jour_occur_field; }

            set
            {
                _jour_occur_field = value;
                RaisePropertyChanged(() => jour_occur_field);
            }
        }

        private String _jour_after_occur_info;
        /// <summary>
        /// ��ˮ����Ϣ
        /// </summary>
        public String jour_after_occur_info
        {
            get { return _jour_after_occur_info; }

            set
            {
                _jour_after_occur_info = value;
                RaisePropertyChanged(() => jour_after_occur_info);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// ������ע
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

}

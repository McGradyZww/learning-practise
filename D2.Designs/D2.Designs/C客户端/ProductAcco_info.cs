using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class prodL_1_1_Info : ObservableObject
    {

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
    }

    public class prodL_1_2_Info : ObservableObject
    {
    }

    public class prodL_1_4_Info : ObservableObject
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

        private String _pd_code;
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code
        {
            get { return _pd_code; }

            set
            {
                _pd_code = value;
                RaisePropertyChanged(() => pd_code);
            }
        }

        private String _pd_name;
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name
        {
            get { return _pd_name; }

            set
            {
                _pd_name = value;
                RaisePropertyChanged(() => pd_name);
            }
        }

        private String _pd_flname;
        /// <summary>
        /// ��Ʒȫ��
        /// </summary>
        public String pd_flname
        {
            get { return _pd_flname; }

            set
            {
                _pd_flname = value;
                RaisePropertyChanged(() => pd_flname);
            }
        }

        private String _fund_reg_code;
        /// <summary>
        /// ���𱸰����
        /// </summary>
        public String fund_reg_code
        {
            get { return _fund_reg_code; }

            set
            {
                _fund_reg_code = value;
                RaisePropertyChanged(() => fund_reg_code);
            }
        }

        private String _pd_manager;
        /// <summary>
        /// ��Ʒ������
        /// </summary>
        public String pd_manager
        {
            get { return _pd_manager; }

            set
            {
                _pd_manager = value;
                RaisePropertyChanged(() => pd_manager);
            }
        }

        private int _found_date;
        /// <summary>
        /// ��������
        /// </summary>
        public int found_date
        {
            get { return _found_date; }

            set
            {
                _found_date = value;
                RaisePropertyChanged(() => found_date);
            }
        }

        private int _pd_type;
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public int pd_type
        {
            get { return _pd_type; }

            set
            {
                _pd_type = value;
                RaisePropertyChanged(() => pd_type);
            }
        }

        private String _apply_currency;
        /// <summary>
        /// ļ������
        /// </summary>
        public String apply_currency
        {
            get { return _apply_currency; }

            set
            {
                _apply_currency = value;
                RaisePropertyChanged(() => apply_currency);
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

        private double _first_asset;
        /// <summary>
        /// ԭʼ�ʲ�
        /// </summary>
        public double first_asset
        {
            get { return _first_asset; }

            set
            {
                _first_asset = value;
                RaisePropertyChanged(() => first_asset);
            }
        }

        private double _first_amt;
        /// <summary>
        /// ԭʼ���
        /// </summary>
        public double first_amt
        {
            get { return _first_amt; }

            set
            {
                _first_amt = value;
                RaisePropertyChanged(() => first_amt);
            }
        }

        private double _pd_all_share;
        /// <summary>
        /// ��Ʒ�ܷݶ�
        /// </summary>
        public double pd_all_share
        {
            get { return _pd_all_share; }

            set
            {
                _pd_all_share = value;
                RaisePropertyChanged(() => pd_all_share);
            }
        }

        private double _curr_share;
        /// <summary>
        /// ��ǰ�ݶ�
        /// </summary>
        public double curr_share
        {
            get { return _curr_share; }

            set
            {
                _curr_share = value;
                RaisePropertyChanged(() => curr_share);
            }
        }

        private double _pre_share;
        /// <summary>
        /// ���շݶ�
        /// </summary>
        public double pre_share
        {
            get { return _pre_share; }

            set
            {
                _pre_share = value;
                RaisePropertyChanged(() => pre_share);
            }
        }

        private double _his_max_per_nav;
        /// <summary>
        /// ��ʷ��ߵ�λ��ֵ
        /// </summary>
        public double his_max_per_nav
        {
            get { return _his_max_per_nav; }

            set
            {
                _his_max_per_nav = value;
                RaisePropertyChanged(() => his_max_per_nav);
            }
        }

        private double _pre_nav;
        /// <summary>
        /// ���վ�ֵ
        /// </summary>
        public double pre_nav
        {
            get { return _pre_nav; }

            set
            {
                _pre_nav = value;
                RaisePropertyChanged(() => pre_nav);
            }
        }

        private String _coust_full_name;
        /// <summary>
        /// �����й���ȫ��
        /// </summary>
        public String coust_full_name
        {
            get { return _coust_full_name; }

            set
            {
                _coust_full_name = value;
                RaisePropertyChanged(() => coust_full_name);
            }
        }

        private String _coust_acco;
        /// <summary>
        /// �����й��˻�
        /// </summary>
        public String coust_acco
        {
            get { return _coust_acco; }

            set
            {
                _coust_acco = value;
                RaisePropertyChanged(() => coust_acco);
            }
        }

        private String _coust_acco_name;
        /// <summary>
        /// �����й��˻���
        /// </summary>
        public String coust_acco_name
        {
            get { return _coust_acco_name; }

            set
            {
                _coust_acco_name = value;
                RaisePropertyChanged(() => coust_acco_name);
            }
        }

        private double _warn_posi_value;
        /// <summary>
        /// Ԥ����
        /// </summary>
        public double warn_posi_value
        {
            get { return _warn_posi_value; }

            set
            {
                _warn_posi_value = value;
                RaisePropertyChanged(() => warn_posi_value);
            }
        }

        private double _close_posi_value;
        /// <summary>
        /// ƽ����
        /// </summary>
        public double close_posi_value
        {
            get { return _close_posi_value; }

            set
            {
                _close_posi_value = value;
                RaisePropertyChanged(() => close_posi_value);
            }
        }

        private double _target_posi_ratio;
        /// <summary>
        /// Ŀ���λ
        /// </summary>
        public double target_posi_ratio
        {
            get { return _target_posi_ratio; }

            set
            {
                _target_posi_ratio = value;
                RaisePropertyChanged(() => target_posi_ratio);
            }
        }

        private double _beta_coeffi;
        /// <summary>
        /// betaϵ��
        /// </summary>
        public double beta_coeffi
        {
            get { return _beta_coeffi; }

            set
            {
                _beta_coeffi = value;
                RaisePropertyChanged(() => beta_coeffi);
            }
        }

        private String _custom_pd_class;
        /// <summary>
        /// �Զ����Ʒ����
        /// </summary>
        public String custom_pd_class
        {
            get { return _custom_pd_class; }

            set
            {
                _custom_pd_class = value;
                RaisePropertyChanged(() => custom_pd_class);
            }
        }

        private String _pd_status;
        /// <summary>
        /// ��Ʒ״̬
        /// </summary>
        public String pd_status
        {
            get { return _pd_status; }

            set
            {
                _pd_status = value;
                RaisePropertyChanged(() => pd_status);
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

        private int _index_value;
        /// <summary>
        /// ����ֵ
        /// </summary>
        public int index_value
        {
            get { return _index_value; }

            set
            {
                _index_value = value;
                RaisePropertyChanged(() => index_value);
            }
        }
    }

    public class prodL_1_5_Info : ObservableObject
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

        private String _pd_code;
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code
        {
            get { return _pd_code; }

            set
            {
                _pd_code = value;
                RaisePropertyChanged(() => pd_code);
            }
        }

        private String _pd_name;
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name
        {
            get { return _pd_name; }

            set
            {
                _pd_name = value;
                RaisePropertyChanged(() => pd_name);
            }
        }

        private String _pd_flname;
        /// <summary>
        /// ��Ʒȫ��
        /// </summary>
        public String pd_flname
        {
            get { return _pd_flname; }

            set
            {
                _pd_flname = value;
                RaisePropertyChanged(() => pd_flname);
            }
        }

        private String _fund_reg_code;
        /// <summary>
        /// ���𱸰����
        /// </summary>
        public String fund_reg_code
        {
            get { return _fund_reg_code; }

            set
            {
                _fund_reg_code = value;
                RaisePropertyChanged(() => fund_reg_code);
            }
        }

        private String _pd_manager;
        /// <summary>
        /// ��Ʒ������
        /// </summary>
        public String pd_manager
        {
            get { return _pd_manager; }

            set
            {
                _pd_manager = value;
                RaisePropertyChanged(() => pd_manager);
            }
        }

        private int _found_date;
        /// <summary>
        /// ��������
        /// </summary>
        public int found_date
        {
            get { return _found_date; }

            set
            {
                _found_date = value;
                RaisePropertyChanged(() => found_date);
            }
        }

        private int _pd_type;
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public int pd_type
        {
            get { return _pd_type; }

            set
            {
                _pd_type = value;
                RaisePropertyChanged(() => pd_type);
            }
        }

        private String _apply_currency;
        /// <summary>
        /// ļ������
        /// </summary>
        public String apply_currency
        {
            get { return _apply_currency; }

            set
            {
                _apply_currency = value;
                RaisePropertyChanged(() => apply_currency);
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

        private double _first_asset;
        /// <summary>
        /// ԭʼ�ʲ�
        /// </summary>
        public double first_asset
        {
            get { return _first_asset; }

            set
            {
                _first_asset = value;
                RaisePropertyChanged(() => first_asset);
            }
        }

        private double _first_amt;
        /// <summary>
        /// ԭʼ���
        /// </summary>
        public double first_amt
        {
            get { return _first_amt; }

            set
            {
                _first_amt = value;
                RaisePropertyChanged(() => first_amt);
            }
        }

        private double _pd_all_share;
        /// <summary>
        /// ��Ʒ�ܷݶ�
        /// </summary>
        public double pd_all_share
        {
            get { return _pd_all_share; }

            set
            {
                _pd_all_share = value;
                RaisePropertyChanged(() => pd_all_share);
            }
        }

        private double _curr_share;
        /// <summary>
        /// ��ǰ�ݶ�
        /// </summary>
        public double curr_share
        {
            get { return _curr_share; }

            set
            {
                _curr_share = value;
                RaisePropertyChanged(() => curr_share);
            }
        }

        private double _pre_share;
        /// <summary>
        /// ���շݶ�
        /// </summary>
        public double pre_share
        {
            get { return _pre_share; }

            set
            {
                _pre_share = value;
                RaisePropertyChanged(() => pre_share);
            }
        }

        private double _his_max_per_nav;
        /// <summary>
        /// ��ʷ��ߵ�λ��ֵ
        /// </summary>
        public double his_max_per_nav
        {
            get { return _his_max_per_nav; }

            set
            {
                _his_max_per_nav = value;
                RaisePropertyChanged(() => his_max_per_nav);
            }
        }

        private double _pre_nav;
        /// <summary>
        /// ���վ�ֵ
        /// </summary>
        public double pre_nav
        {
            get { return _pre_nav; }

            set
            {
                _pre_nav = value;
                RaisePropertyChanged(() => pre_nav);
            }
        }

        private String _coust_full_name;
        /// <summary>
        /// �����й���ȫ��
        /// </summary>
        public String coust_full_name
        {
            get { return _coust_full_name; }

            set
            {
                _coust_full_name = value;
                RaisePropertyChanged(() => coust_full_name);
            }
        }

        private String _coust_acco;
        /// <summary>
        /// �����й��˻�
        /// </summary>
        public String coust_acco
        {
            get { return _coust_acco; }

            set
            {
                _coust_acco = value;
                RaisePropertyChanged(() => coust_acco);
            }
        }

        private String _coust_acco_name;
        /// <summary>
        /// �����й��˻���
        /// </summary>
        public String coust_acco_name
        {
            get { return _coust_acco_name; }

            set
            {
                _coust_acco_name = value;
                RaisePropertyChanged(() => coust_acco_name);
            }
        }

        private double _warn_posi_value;
        /// <summary>
        /// Ԥ����
        /// </summary>
        public double warn_posi_value
        {
            get { return _warn_posi_value; }

            set
            {
                _warn_posi_value = value;
                RaisePropertyChanged(() => warn_posi_value);
            }
        }

        private double _close_posi_value;
        /// <summary>
        /// ƽ����
        /// </summary>
        public double close_posi_value
        {
            get { return _close_posi_value; }

            set
            {
                _close_posi_value = value;
                RaisePropertyChanged(() => close_posi_value);
            }
        }

        private double _target_posi_ratio;
        /// <summary>
        /// Ŀ���λ
        /// </summary>
        public double target_posi_ratio
        {
            get { return _target_posi_ratio; }

            set
            {
                _target_posi_ratio = value;
                RaisePropertyChanged(() => target_posi_ratio);
            }
        }

        private double _beta_coeffi;
        /// <summary>
        /// betaϵ��
        /// </summary>
        public double beta_coeffi
        {
            get { return _beta_coeffi; }

            set
            {
                _beta_coeffi = value;
                RaisePropertyChanged(() => beta_coeffi);
            }
        }

        private String _custom_pd_class;
        /// <summary>
        /// �Զ����Ʒ����
        /// </summary>
        public String custom_pd_class
        {
            get { return _custom_pd_class; }

            set
            {
                _custom_pd_class = value;
                RaisePropertyChanged(() => custom_pd_class);
            }
        }

        private String _pd_status;
        /// <summary>
        /// ��Ʒ״̬
        /// </summary>
        public String pd_status
        {
            get { return _pd_status; }

            set
            {
                _pd_status = value;
                RaisePropertyChanged(() => pd_status);
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

        private int _index_value;
        /// <summary>
        /// ����ֵ
        /// </summary>
        public int index_value
        {
            get { return _index_value; }

            set
            {
                _index_value = value;
                RaisePropertyChanged(() => index_value);
            }
        }
    }

    public class prodL_1_6_Info : ObservableObject
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

    public class prodL_1_7_Info : ObservableObject
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

    public class prodL_1_8_Info : ObservableObject
    {
    }

    public class prodL_1_9_Info : ObservableObject
    {
    }

    public class prodL_1_10_Info : ObservableObject
    {
    }

    public class prodL_1_11_Info : ObservableObject
    {
    }

    public class prodL_1_12_Info : ObservableObject
    {

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

        private String _pd_code;
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code
        {
            get { return _pd_code; }

            set
            {
                _pd_code = value;
                RaisePropertyChanged(() => pd_code);
            }
        }

        private String _pd_name;
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name
        {
            get { return _pd_name; }

            set
            {
                _pd_name = value;
                RaisePropertyChanged(() => pd_name);
            }
        }

        private String _pd_status;
        /// <summary>
        /// ��Ʒ״̬
        /// </summary>
        public String pd_status
        {
            get { return _pd_status; }

            set
            {
                _pd_status = value;
                RaisePropertyChanged(() => pd_status);
            }
        }
    }

    public class prodL_1_13_Info : ObservableObject
    {

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

        private String _pd_code;
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code
        {
            get { return _pd_code; }

            set
            {
                _pd_code = value;
                RaisePropertyChanged(() => pd_code);
            }
        }

        private String _pd_name;
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name
        {
            get { return _pd_name; }

            set
            {
                _pd_name = value;
                RaisePropertyChanged(() => pd_name);
            }
        }

        private String _pd_status;
        /// <summary>
        /// ��Ʒ״̬
        /// </summary>
        public String pd_status
        {
            get { return _pd_status; }

            set
            {
                _pd_status = value;
                RaisePropertyChanged(() => pd_status);
            }
        }

        private String _pd_busi_config_str;
        /// <summary>
        /// ��Ʒҵ��������ô�
        /// </summary>
        public String pd_busi_config_str
        {
            get { return _pd_busi_config_str; }

            set
            {
                _pd_busi_config_str = value;
                RaisePropertyChanged(() => pd_busi_config_str);
            }
        }

        private double _comm_no_limit_price_ratio;
        /// <summary>
        /// ָ��޼۸�������
        /// </summary>
        public double comm_no_limit_price_ratio
        {
            get { return _comm_no_limit_price_ratio; }

            set
            {
                _comm_no_limit_price_ratio = value;
                RaisePropertyChanged(() => comm_no_limit_price_ratio);
            }
        }
    }

    public class prodL_1_17_Info : ObservableObject
    {

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

        private String _pd_code;
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code
        {
            get { return _pd_code; }

            set
            {
                _pd_code = value;
                RaisePropertyChanged(() => pd_code);
            }
        }

        private String _pd_name;
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_name
        {
            get { return _pd_name; }

            set
            {
                _pd_name = value;
                RaisePropertyChanged(() => pd_name);
            }
        }

        private double _his_max_per_nav;
        /// <summary>
        /// ��ʷ��ߵ�λ��ֵ
        /// </summary>
        public double his_max_per_nav
        {
            get { return _his_max_per_nav; }

            set
            {
                _his_max_per_nav = value;
                RaisePropertyChanged(() => his_max_per_nav);
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
    }

    public class prodL_1_22_Info : ObservableObject
    {
    }

    public class prodL_1_24_Info : ObservableObject
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

        private int _cost_calc_type;
        /// <summary>
        /// �ɱ����㷽ʽ
        /// </summary>
        public int cost_calc_type
        {
            get { return _cost_calc_type; }

            set
            {
                _cost_calc_type = value;
                RaisePropertyChanged(() => cost_calc_type);
            }
        }

        private String _allow_exch;
        /// <summary>
        /// ����Ͷ���г�
        /// </summary>
        public String allow_exch
        {
            get { return _allow_exch; }

            set
            {
                _allow_exch = value;
                RaisePropertyChanged(() => allow_exch);
            }
        }

        private String _allow_stock_type;
        /// <summary>
        /// �������֤ȯ����
        /// </summary>
        public String allow_stock_type
        {
            get { return _allow_stock_type; }

            set
            {
                _allow_stock_type = value;
                RaisePropertyChanged(() => allow_stock_type);
            }
        }

        private String _busi_config_str;
        /// <summary>
        /// ҵ��������ô�
        /// </summary>
        public String busi_config_str
        {
            get { return _busi_config_str; }

            set
            {
                _busi_config_str = value;
                RaisePropertyChanged(() => busi_config_str);
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

        private double _market_price_ratio;
        /// <summary>
        /// �м۶��ḡ������
        /// </summary>
        public double market_price_ratio
        {
            get { return _market_price_ratio; }

            set
            {
                _market_price_ratio = value;
                RaisePropertyChanged(() => market_price_ratio);
            }
        }

        private String _forbid_order_dir;
        /// <summary>
        /// ��ֹ��������
        /// </summary>
        public String forbid_order_dir
        {
            get { return _forbid_order_dir; }

            set
            {
                _forbid_order_dir = value;
                RaisePropertyChanged(() => forbid_order_dir);
            }
        }

        private String _pd_status;
        /// <summary>
        /// ��Ʒ״̬
        /// </summary>
        public String pd_status
        {
            get { return _pd_status; }

            set
            {
                _pd_status = value;
                RaisePropertyChanged(() => pd_status);
            }
        }

        private double _comm_no_limit_price_ratio;
        /// <summary>
        /// ָ��޼۸�������
        /// </summary>
        public double comm_no_limit_price_ratio
        {
            get { return _comm_no_limit_price_ratio; }

            set
            {
                _comm_no_limit_price_ratio = value;
                RaisePropertyChanged(() => comm_no_limit_price_ratio);
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

    public class prodL_1_25_Info : ObservableObject
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

    public class prodL_1_26_Info : ObservableObject
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

    public class prodL_1_27_Info : ObservableObject
    {
    }

    public class prodL_1_28_Info : ObservableObject
    {
    }

    public class prodL_1_29_Info : ObservableObject
    {
    }

    public class prodL_1_30_Info : ObservableObject
    {
    }

    public class prodL_1_31_Info : ObservableObject
    {

        private int _bank_acco_no;
        /// <summary>
        /// �����˻����
        /// </summary>
        public int bank_acco_no
        {
            get { return _bank_acco_no; }

            set
            {
                _bank_acco_no = value;
                RaisePropertyChanged(() => bank_acco_no);
            }
        }
    }

    public class prodL_1_32_Info : ObservableObject
    {
    }

    public class prodL_1_33_Info : ObservableObject
    {
    }

    public class prodL_1_34_Info : ObservableObject
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

        private int _bank_acco_no;
        /// <summary>
        /// �����˻����
        /// </summary>
        public int bank_acco_no
        {
            get { return _bank_acco_no; }

            set
            {
                _bank_acco_no = value;
                RaisePropertyChanged(() => bank_acco_no);
            }
        }

        private String _bank_code;
        /// <summary>
        /// ���д���
        /// </summary>
        public String bank_code
        {
            get { return _bank_code; }

            set
            {
                _bank_code = value;
                RaisePropertyChanged(() => bank_code);
            }
        }

        private String _bank_name;
        /// <summary>
        /// ��������
        /// </summary>
        public String bank_name
        {
            get { return _bank_name; }

            set
            {
                _bank_name = value;
                RaisePropertyChanged(() => bank_name);
            }
        }

        private String _bank_acco;
        /// <summary>
        /// �����˻�
        /// </summary>
        public String bank_acco
        {
            get { return _bank_acco; }

            set
            {
                _bank_acco = value;
                RaisePropertyChanged(() => bank_acco);
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

    public class prodL_1_35_Info : ObservableObject
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

        private int _bank_acco_no;
        /// <summary>
        /// �����˻����
        /// </summary>
        public int bank_acco_no
        {
            get { return _bank_acco_no; }

            set
            {
                _bank_acco_no = value;
                RaisePropertyChanged(() => bank_acco_no);
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

    public class prodL_1_36_Info : ObservableObject
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

        private int _bank_acco_no;
        /// <summary>
        /// �����˻����
        /// </summary>
        public int bank_acco_no
        {
            get { return _bank_acco_no; }

            set
            {
                _bank_acco_no = value;
                RaisePropertyChanged(() => bank_acco_no);
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

    public class prodL_1_40_Info : ObservableObject
    {
    }

    public class prodL_1_41_Info : ObservableObject
    {

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
    }

    public class prodL_1_42_Info : ObservableObject
    {
    }

    public class prodL_1_43_Info : ObservableObject
    {
    }

    public class prodL_1_44_Info : ObservableObject
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

        private String _asset_acco;
        /// <summary>
        /// �ʲ��˻�
        /// </summary>
        public String asset_acco
        {
            get { return _asset_acco; }

            set
            {
                _asset_acco = value;
                RaisePropertyChanged(() => asset_acco);
            }
        }

        private String _asset_acco_name;
        /// <summary>
        /// �ʲ��˻�����
        /// </summary>
        public String asset_acco_name
        {
            get { return _asset_acco_name; }

            set
            {
                _asset_acco_name = value;
                RaisePropertyChanged(() => asset_acco_name);
            }
        }

        private int _asset_acco_type;
        /// <summary>
        /// �ʲ��˻�����
        /// </summary>
        public int asset_acco_type
        {
            get { return _asset_acco_type; }

            set
            {
                _asset_acco_type = value;
                RaisePropertyChanged(() => asset_acco_type);
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

        private String _trade_pwd;
        /// <summary>
        /// ��������
        /// </summary>
        public String trade_pwd
        {
            get { return _trade_pwd; }

            set
            {
                _trade_pwd = value;
                RaisePropertyChanged(() => trade_pwd);
            }
        }

        private String _asset_acco_status;
        /// <summary>
        /// �ʲ��˻�״̬
        /// </summary>
        public String asset_acco_status
        {
            get { return _asset_acco_status; }

            set
            {
                _asset_acco_status = value;
                RaisePropertyChanged(() => asset_acco_status);
            }
        }

        private String _busi_config_str;
        /// <summary>
        /// ҵ��������ô�
        /// </summary>
        public String busi_config_str
        {
            get { return _busi_config_str; }

            set
            {
                _busi_config_str = value;
                RaisePropertyChanged(() => busi_config_str);
            }
        }

        private double _market_price_ratio;
        /// <summary>
        /// �м۶��ḡ������
        /// </summary>
        public double market_price_ratio
        {
            get { return _market_price_ratio; }

            set
            {
                _market_price_ratio = value;
                RaisePropertyChanged(() => market_price_ratio);
            }
        }

        private String _allow_exch;
        /// <summary>
        /// ����Ͷ���г�
        /// </summary>
        public String allow_exch
        {
            get { return _allow_exch; }

            set
            {
                _allow_exch = value;
                RaisePropertyChanged(() => allow_exch);
            }
        }

        private String _allow_stock_type;
        /// <summary>
        /// �������֤ȯ����
        /// </summary>
        public String allow_stock_type
        {
            get { return _allow_stock_type; }

            set
            {
                _allow_stock_type = value;
                RaisePropertyChanged(() => allow_stock_type);
            }
        }

        private String _split_fee_typr_str;
        /// <summary>
        /// �ֱʷ������ʹ�
        /// </summary>
        public String split_fee_typr_str
        {
            get { return _split_fee_typr_str; }

            set
            {
                _split_fee_typr_str = value;
                RaisePropertyChanged(() => split_fee_typr_str);
            }
        }

        private String _busi_limit_str;
        /// <summary>
        /// ҵ�����ƴ�
        /// </summary>
        public String busi_limit_str
        {
            get { return _busi_limit_str; }

            set
            {
                _busi_limit_str = value;
                RaisePropertyChanged(() => busi_limit_str);
            }
        }

        private int _exter_comm_flag;
        /// <summary>
        /// ����ָ���־
        /// </summary>
        public int exter_comm_flag
        {
            get { return _exter_comm_flag; }

            set
            {
                _exter_comm_flag = value;
                RaisePropertyChanged(() => exter_comm_flag);
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

        private String _busi_depart;
        /// <summary>
        /// Ӫҵ��
        /// </summary>
        public String busi_depart
        {
            get { return _busi_depart; }

            set
            {
                _busi_depart = value;
                RaisePropertyChanged(() => busi_depart);
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
    }

    public class prodL_1_45_Info : ObservableObject
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

    public class prodL_1_46_Info : ObservableObject
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

    public class prodL_1_47_Info : ObservableObject
    {
    }

    public class prodL_1_48_Info : ObservableObject
    {
    }

    public class prodL_1_49_Info : ObservableObject
    {
    }

    public class prodL_1_50_Info : ObservableObject
    {
    }

    public class prodL_1_51_Info : ObservableObject
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

        private String _asset_acco;
        /// <summary>
        /// �ʲ��˻�
        /// </summary>
        public String asset_acco
        {
            get { return _asset_acco; }

            set
            {
                _asset_acco = value;
                RaisePropertyChanged(() => asset_acco);
            }
        }

        private String _asset_acco_name;
        /// <summary>
        /// �ʲ��˻�����
        /// </summary>
        public String asset_acco_name
        {
            get { return _asset_acco_name; }

            set
            {
                _asset_acco_name = value;
                RaisePropertyChanged(() => asset_acco_name);
            }
        }

        private String _asset_acco_status;
        /// <summary>
        /// �ʲ��˻�״̬
        /// </summary>
        public String asset_acco_status
        {
            get { return _asset_acco_status; }

            set
            {
                _asset_acco_status = value;
                RaisePropertyChanged(() => asset_acco_status);
            }
        }
    }

    public class prodL_1_52_Info : ObservableObject
    {

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

        private int _online_status;
        /// <summary>
        /// ����״̬
        /// </summary>
        public int online_status
        {
            get { return _online_status; }

            set
            {
                _online_status = value;
                RaisePropertyChanged(() => online_status);
            }
        }
    }

    public class prodL_1_74_Info : ObservableObject
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

        private String _pd_code;
        /// <summary>
        /// ��Ʒ����
        /// </summary>
        public String pd_code
        {
            get { return _pd_code; }

            set
            {
                _pd_code = value;
                RaisePropertyChanged(() => pd_code);
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

        private int _pass_type;
        /// <summary>
        /// ͨ������
        /// </summary>
        public int pass_type
        {
            get { return _pass_type; }

            set
            {
                _pass_type = value;
                RaisePropertyChanged(() => pass_type);
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

        private int _online_status;
        /// <summary>
        /// ����״̬
        /// </summary>
        public int online_status
        {
            get { return _online_status; }

            set
            {
                _online_status = value;
                RaisePropertyChanged(() => online_status);
            }
        }

        private String _config_str;
        /// <summary>
        /// �������ô�
        /// </summary>
        public String config_str
        {
            get { return _config_str; }

            set
            {
                _config_str = value;
                RaisePropertyChanged(() => config_str);
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

    public class prodL_1_75_Info : ObservableObject
    {

        private double _pd_part_nav;
        /// <summary>
        /// ��Ʒ��λ��ֵ
        /// </summary>
        public double pd_part_nav
        {
            get { return _pd_part_nav; }

            set
            {
                _pd_part_nav = value;
                RaisePropertyChanged(() => pd_part_nav);
            }
        }
    }

    public class prodL_1_76_Info : ObservableObject
    {

        private double _nav_asset;
        /// <summary>
        /// ���ʲ�
        /// </summary>
        public double nav_asset
        {
            get { return _nav_asset; }

            set
            {
                _nav_asset = value;
                RaisePropertyChanged(() => nav_asset);
            }
        }
    }

    public class prodL_1_77_Info : ObservableObject
    {

        private String _asset_acco;
        /// <summary>
        /// �ʲ��˻�
        /// </summary>
        public String asset_acco
        {
            get { return _asset_acco; }

            set
            {
                _asset_acco = value;
                RaisePropertyChanged(() => asset_acco);
            }
        }
    }

    public class prodL_1_78_Info : ObservableObject
    {

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
    }

    public class prodL_1_79_Info : ObservableObject
    {

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
    }

    public class prodL_1_80_Info : ObservableObject
    {
    }

    public class prodL_1_81_Info : ObservableObject
    {
    }

    public class prodL_1_82_Info : ObservableObject
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

        private int _workflow_type;
        /// <summary>
        /// ������ģʽ
        /// </summary>
        public int workflow_type
        {
            get { return _workflow_type; }

            set
            {
                _workflow_type = value;
                RaisePropertyChanged(() => workflow_type);
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

        private int _workflow_num;
        /// <summary>
        /// ������˳���
        /// </summary>
        public int workflow_num
        {
            get { return _workflow_num; }

            set
            {
                _workflow_num = value;
                RaisePropertyChanged(() => workflow_num);
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
    }

    public class prodL_1_83_Info : ObservableObject
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

        private int _asset_acco_type;
        /// <summary>
        /// �ʲ��˻�����
        /// </summary>
        public int asset_acco_type
        {
            get { return _asset_acco_type; }

            set
            {
                _asset_acco_type = value;
                RaisePropertyChanged(() => asset_acco_type);
            }
        }

        private String _asset_acco_status;
        /// <summary>
        /// �ʲ��˻�״̬
        /// </summary>
        public String asset_acco_status
        {
            get { return _asset_acco_status; }

            set
            {
                _asset_acco_status = value;
                RaisePropertyChanged(() => asset_acco_status);
            }
        }

        private int _pwd_check_status;
        /// <summary>
        /// ������֤״̬
        /// </summary>
        public int pwd_check_status
        {
            get { return _pwd_check_status; }

            set
            {
                _pwd_check_status = value;
                RaisePropertyChanged(() => pwd_check_status);
            }
        }

        private int _online_status;
        /// <summary>
        /// ����״̬
        /// </summary>
        public int online_status
        {
            get { return _online_status; }

            set
            {
                _online_status = value;
                RaisePropertyChanged(() => online_status);
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

        private String _allow_exch;
        /// <summary>
        /// ����Ͷ���г�
        /// </summary>
        public String allow_exch
        {
            get { return _allow_exch; }

            set
            {
                _allow_exch = value;
                RaisePropertyChanged(() => allow_exch);
            }
        }

        private String _allow_stock_type;
        /// <summary>
        /// �������֤ȯ����
        /// </summary>
        public String allow_stock_type
        {
            get { return _allow_stock_type; }

            set
            {
                _allow_stock_type = value;
                RaisePropertyChanged(() => allow_stock_type);
            }
        }
    }

    public class prodL_1_84_Info : ObservableObject
    {
    }

    public class prodL_1_85_Info : ObservableObject
    {

        private int _workflow_type;
        /// <summary>
        /// ������ģʽ
        /// </summary>
        public int workflow_type
        {
            get { return _workflow_type; }

            set
            {
                _workflow_type = value;
                RaisePropertyChanged(() => workflow_type);
            }
        }

        private int _workflow_num;
        /// <summary>
        /// ������˳���
        /// </summary>
        public int workflow_num
        {
            get { return _workflow_num; }

            set
            {
                _workflow_num = value;
                RaisePropertyChanged(() => workflow_num);
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
    }

    public class prodL_1_86_Info : ObservableObject
    {

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
    }

    public class prodL_1_87_Info : ObservableObject
    {
    }

    public class prodL_1_88_Info : ObservableObject
    {
    }

    public class prodL_1_89_Info : ObservableObject
    {

        private int _execute_type;
        /// <summary>
        /// ִ�з�ʽ
        /// </summary>
        public int execute_type
        {
            get { return _execute_type; }

            set
            {
                _execute_type = value;
                RaisePropertyChanged(() => execute_type);
            }
        }

        private int _init_step;
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_step
        {
            get { return _init_step; }

            set
            {
                _init_step = value;
                RaisePropertyChanged(() => init_step);
            }
        }

        private int _begin_time;
        /// <summary>
        /// ��ʼʱ��
        /// </summary>
        public int begin_time
        {
            get { return _begin_time; }

            set
            {
                _begin_time = value;
                RaisePropertyChanged(() => begin_time);
            }
        }

        private int _exec_time;
        /// <summary>
        /// ִ��ʱ��
        /// </summary>
        public int exec_time
        {
            get { return _exec_time; }

            set
            {
                _exec_time = value;
                RaisePropertyChanged(() => exec_time);
            }
        }

        private int _exec_date;
        /// <summary>
        /// ִ������
        /// </summary>
        public int exec_date
        {
            get { return _exec_date; }

            set
            {
                _exec_date = value;
                RaisePropertyChanged(() => exec_date);
            }
        }

        private int _open_execute_type;
        /// <summary>
        /// ���̼��ִ��״̬
        /// </summary>
        public int open_execute_type
        {
            get { return _open_execute_type; }

            set
            {
                _open_execute_type = value;
                RaisePropertyChanged(() => open_execute_type);
            }
        }

        private int _open_execute_result;
        /// <summary>
        /// ���̼��ִ�н��
        /// </summary>
        public int open_execute_result
        {
            get { return _open_execute_result; }

            set
            {
                _open_execute_result = value;
                RaisePropertyChanged(() => open_execute_result);
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

    public class prodL_1_90_Info : ObservableObject
    {

        private int _execute_type;
        /// <summary>
        /// ִ�з�ʽ
        /// </summary>
        public int execute_type
        {
            get { return _execute_type; }

            set
            {
                _execute_type = value;
                RaisePropertyChanged(() => execute_type);
            }
        }

        private int _init_step;
        /// <summary>
        /// ��ʼ������
        /// </summary>
        public int init_step
        {
            get { return _init_step; }

            set
            {
                _init_step = value;
                RaisePropertyChanged(() => init_step);
            }
        }

        private int _begin_time;
        /// <summary>
        /// ��ʼʱ��
        /// </summary>
        public int begin_time
        {
            get { return _begin_time; }

            set
            {
                _begin_time = value;
                RaisePropertyChanged(() => begin_time);
            }
        }

        private int _exec_time;
        /// <summary>
        /// ִ��ʱ��
        /// </summary>
        public int exec_time
        {
            get { return _exec_time; }

            set
            {
                _exec_time = value;
                RaisePropertyChanged(() => exec_time);
            }
        }

        private int _exec_date;
        /// <summary>
        /// ִ������
        /// </summary>
        public int exec_date
        {
            get { return _exec_date; }

            set
            {
                _exec_date = value;
                RaisePropertyChanged(() => exec_date);
            }
        }

        private int _open_execute_type;
        /// <summary>
        /// ���̼��ִ��״̬
        /// </summary>
        public int open_execute_type
        {
            get { return _open_execute_type; }

            set
            {
                _open_execute_type = value;
                RaisePropertyChanged(() => open_execute_type);
            }
        }

        private int _open_execute_result;
        /// <summary>
        /// ���̼��ִ�н��
        /// </summary>
        public int open_execute_result
        {
            get { return _open_execute_result; }

            set
            {
                _open_execute_result = value;
                RaisePropertyChanged(() => open_execute_result);
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

    public class prodL_1_91_Info : ObservableObject
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

        private int _flow_business;
        /// <summary>
        /// ����ҵ��
        /// </summary>
        public int flow_business
        {
            get { return _flow_business; }

            set
            {
                _flow_business = value;
                RaisePropertyChanged(() => flow_business);
            }
        }

        private int _execute_type;
        /// <summary>
        /// ִ�з�ʽ
        /// </summary>
        public int execute_type
        {
            get { return _execute_type; }

            set
            {
                _execute_type = value;
                RaisePropertyChanged(() => execute_type);
            }
        }

        private int _begin_time;
        /// <summary>
        /// ��ʼʱ��
        /// </summary>
        public int begin_time
        {
            get { return _begin_time; }

            set
            {
                _begin_time = value;
                RaisePropertyChanged(() => begin_time);
            }
        }

        private int _exec_date;
        /// <summary>
        /// ִ������
        /// </summary>
        public int exec_date
        {
            get { return _exec_date; }

            set
            {
                _exec_date = value;
                RaisePropertyChanged(() => exec_date);
            }
        }

        private int _exec_time;
        /// <summary>
        /// ִ��ʱ��
        /// </summary>
        public int exec_time
        {
            get { return _exec_time; }

            set
            {
                _exec_time = value;
                RaisePropertyChanged(() => exec_time);
            }
        }

        private int _close_execute_type;
        /// <summary>
        /// ������ҵִ��״̬
        /// </summary>
        public int close_execute_type
        {
            get { return _close_execute_type; }

            set
            {
                _close_execute_type = value;
                RaisePropertyChanged(() => close_execute_type);
            }
        }

        private int _error_deal_type;
        /// <summary>
        /// �쳣����ʽ
        /// </summary>
        public int error_deal_type
        {
            get { return _error_deal_type; }

            set
            {
                _error_deal_type = value;
                RaisePropertyChanged(() => error_deal_type);
            }
        }
    }

    public class prodL_1_92_Info : ObservableObject
    {
    }

    public class prodL_1_101_Info : ObservableObject
    {
    }

    public class prodL_1_102_Info : ObservableObject
    {
    }

    public class prodL_1_103_Info : ObservableObject
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

        private int _mum_pd_no;
        /// <summary>
        /// ĸ��Ʒ���
        /// </summary>
        public int mum_pd_no
        {
            get { return _mum_pd_no; }

            set
            {
                _mum_pd_no = value;
                RaisePropertyChanged(() => mum_pd_no);
            }
        }
    }

    public class prodL_1_104_Info : ObservableObject
    {

        private String _asset_acco_no_str;
        /// <summary>
        /// �ʲ��˻���Ŵ�
        /// </summary>
        public String asset_acco_no_str
        {
            get { return _asset_acco_no_str; }

            set
            {
                _asset_acco_no_str = value;
                RaisePropertyChanged(() => asset_acco_no_str);
            }
        }
    }

    public class prodL_1_105_Info : ObservableObject
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

    public class prodL_1_106_Info : ObservableObject
    {
    }

    public class prodL_1_107_Info : ObservableObject
    {
    }

    public class prodL_1_108_Info : ObservableObject
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

        private int _fina_return_type;
        /// <summary>
        /// ��ȯ���ʽ
        /// </summary>
        public int fina_return_type
        {
            get { return _fina_return_type; }

            set
            {
                _fina_return_type = value;
                RaisePropertyChanged(() => fina_return_type);
            }
        }

        private int _sell_auto_back_debt;
        /// <summary>
        /// �����Զ�����
        /// </summary>
        public int sell_auto_back_debt
        {
            get { return _sell_auto_back_debt; }

            set
            {
                _sell_auto_back_debt = value;
                RaisePropertyChanged(() => sell_auto_back_debt);
            }
        }

        private double _fina_limit_max;
        /// <summary>
        /// ���ʶ������
        /// </summary>
        public double fina_limit_max
        {
            get { return _fina_limit_max; }

            set
            {
                _fina_limit_max = value;
                RaisePropertyChanged(() => fina_limit_max);
            }
        }

        private double _loan_limit_max;
        /// <summary>
        /// ��ȯ�������
        /// </summary>
        public double loan_limit_max
        {
            get { return _loan_limit_max; }

            set
            {
                _loan_limit_max = value;
                RaisePropertyChanged(() => loan_limit_max);
            }
        }

        private double _fina_year_intrst_rate;
        /// <summary>
        /// ����������
        /// </summary>
        public double fina_year_intrst_rate
        {
            get { return _fina_year_intrst_rate; }

            set
            {
                _fina_year_intrst_rate = value;
                RaisePropertyChanged(() => fina_year_intrst_rate);
            }
        }

        private double _secu_loan_year_intrst_rate;
        /// <summary>
        /// ��ȯ������
        /// </summary>
        public double secu_loan_year_intrst_rate
        {
            get { return _secu_loan_year_intrst_rate; }

            set
            {
                _secu_loan_year_intrst_rate = value;
                RaisePropertyChanged(() => secu_loan_year_intrst_rate);
            }
        }

        private double _close_posi_keep_guarantee_ratio;
        /// <summary>
        /// ƽ��ά�ֵ�������
        /// </summary>
        public double close_posi_keep_guarantee_ratio
        {
            get { return _close_posi_keep_guarantee_ratio; }

            set
            {
                _close_posi_keep_guarantee_ratio = value;
                RaisePropertyChanged(() => close_posi_keep_guarantee_ratio);
            }
        }

        private double _fill_posi_keep_guarantee_ratio;
        /// <summary>
        /// ����ά�ֵ�������
        /// </summary>
        public double fill_posi_keep_guarantee_ratio
        {
            get { return _fill_posi_keep_guarantee_ratio; }

            set
            {
                _fill_posi_keep_guarantee_ratio = value;
                RaisePropertyChanged(() => fill_posi_keep_guarantee_ratio);
            }
        }

        private double _extract_guarantee_ratio;
        /// <summary>
        /// ��ȡ��������
        /// </summary>
        public double extract_guarantee_ratio
        {
            get { return _extract_guarantee_ratio; }

            set
            {
                _extract_guarantee_ratio = value;
                RaisePropertyChanged(() => extract_guarantee_ratio);
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

    public class prodL_1_109_Info : ObservableObject
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
    }

    public class prodL_1_110_Info : ObservableObject
    {
    }

    public class prodL_1_111_Info : ObservableObject
    {
    }

    public class prodL_1_112_Info : ObservableObject
    {

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
    }

    public class prodL_1_113_Info : ObservableObject
    {
    }

    public class prodL_1_114_Info : ObservableObject
    {
    }

    public class prodL_1_115_Info : ObservableObject
    {
    }

    public class prodL_1_116_Info : ObservableObject
    {

        private double _margin_ratio;
        /// <summary>
        /// ��֤�����
        /// </summary>
        public double margin_ratio
        {
            get { return _margin_ratio; }

            set
            {
                _margin_ratio = value;
                RaisePropertyChanged(() => margin_ratio);
            }
        }
    }

    public class prodL_1_117_Info : ObservableObject
    {

        private double _trade_commis;
        /// <summary>
        /// ����Ӷ��
        /// </summary>
        public double trade_commis
        {
            get { return _trade_commis; }

            set
            {
                _trade_commis = value;
                RaisePropertyChanged(() => trade_commis);
            }
        }

        private double _all_fee;
        /// <summary>
        /// ȫ������
        /// </summary>
        public double all_fee
        {
            get { return _all_fee; }

            set
            {
                _all_fee = value;
                RaisePropertyChanged(() => all_fee);
            }
        }

        private double _stamp_tax;
        /// <summary>
        /// ӡ��˰
        /// </summary>
        public double stamp_tax
        {
            get { return _stamp_tax; }

            set
            {
                _stamp_tax = value;
                RaisePropertyChanged(() => stamp_tax);
            }
        }

        private double _trans_fee;
        /// <summary>
        /// ������
        /// </summary>
        public double trans_fee
        {
            get { return _trans_fee; }

            set
            {
                _trans_fee = value;
                RaisePropertyChanged(() => trans_fee);
            }
        }

        private double _brkage_fee;
        /// <summary>
        /// ���ַ�
        /// </summary>
        public double brkage_fee
        {
            get { return _brkage_fee; }

            set
            {
                _brkage_fee = value;
                RaisePropertyChanged(() => brkage_fee);
            }
        }

        private double _SEC_charges;
        /// <summary>
        /// ֤�ܷ�
        /// </summary>
        public double SEC_charges
        {
            get { return _SEC_charges; }

            set
            {
                _SEC_charges = value;
                RaisePropertyChanged(() => SEC_charges);
            }
        }

        private double _other_fee;
        /// <summary>
        /// ��������
        /// </summary>
        public double other_fee
        {
            get { return _other_fee; }

            set
            {
                _other_fee = value;
                RaisePropertyChanged(() => other_fee);
            }
        }

        private double _other_commis;
        /// <summary>
        /// ����Ӷ��
        /// </summary>
        public double other_commis
        {
            get { return _other_commis; }

            set
            {
                _other_commis = value;
                RaisePropertyChanged(() => other_commis);
            }
        }

        private double _trade_tax;
        /// <summary>
        /// ��������
        /// </summary>
        public double trade_tax
        {
            get { return _trade_tax; }

            set
            {
                _trade_tax = value;
                RaisePropertyChanged(() => trade_tax);
            }
        }

        private double _trade_cost_fee;
        /// <summary>
        /// ���׷�
        /// </summary>
        public double trade_cost_fee
        {
            get { return _trade_cost_fee; }

            set
            {
                _trade_cost_fee = value;
                RaisePropertyChanged(() => trade_cost_fee);
            }
        }

        private double _trade_system_use_fee;
        /// <summary>
        /// ����ϵͳʹ�÷�
        /// </summary>
        public double trade_system_use_fee
        {
            get { return _trade_system_use_fee; }

            set
            {
                _trade_system_use_fee = value;
                RaisePropertyChanged(() => trade_system_use_fee);
            }
        }

        private double _stock_settle_fee;
        /// <summary>
        /// �ɷݽ��շ�
        /// </summary>
        public double stock_settle_fee
        {
            get { return _stock_settle_fee; }

            set
            {
                _stock_settle_fee = value;
                RaisePropertyChanged(() => stock_settle_fee);
            }
        }

        private double _order_frozen_amt;
        /// <summary>
        /// ����������
        /// </summary>
        public double order_frozen_amt
        {
            get { return _order_frozen_amt; }

            set
            {
                _order_frozen_amt = value;
                RaisePropertyChanged(() => order_frozen_amt);
            }
        }
    }

    public class prodL_1_118_Info : ObservableObject
    {

        private ulong _corrsp_id;
        /// <summary>
        /// ��Ӧ���
        /// </summary>
        public ulong corrsp_id
        {
            get { return _corrsp_id; }

            set
            {
                _corrsp_id = value;
                RaisePropertyChanged(() => corrsp_id);
            }
        }

        private double _trade_commis;
        /// <summary>
        /// ����Ӷ��
        /// </summary>
        public double trade_commis
        {
            get { return _trade_commis; }

            set
            {
                _trade_commis = value;
                RaisePropertyChanged(() => trade_commis);
            }
        }

        private double _all_fee;
        /// <summary>
        /// ȫ������
        /// </summary>
        public double all_fee
        {
            get { return _all_fee; }

            set
            {
                _all_fee = value;
                RaisePropertyChanged(() => all_fee);
            }
        }

        private double _stamp_tax;
        /// <summary>
        /// ӡ��˰
        /// </summary>
        public double stamp_tax
        {
            get { return _stamp_tax; }

            set
            {
                _stamp_tax = value;
                RaisePropertyChanged(() => stamp_tax);
            }
        }

        private double _trans_fee;
        /// <summary>
        /// ������
        /// </summary>
        public double trans_fee
        {
            get { return _trans_fee; }

            set
            {
                _trans_fee = value;
                RaisePropertyChanged(() => trans_fee);
            }
        }

        private double _brkage_fee;
        /// <summary>
        /// ���ַ�
        /// </summary>
        public double brkage_fee
        {
            get { return _brkage_fee; }

            set
            {
                _brkage_fee = value;
                RaisePropertyChanged(() => brkage_fee);
            }
        }

        private double _SEC_charges;
        /// <summary>
        /// ֤�ܷ�
        /// </summary>
        public double SEC_charges
        {
            get { return _SEC_charges; }

            set
            {
                _SEC_charges = value;
                RaisePropertyChanged(() => SEC_charges);
            }
        }

        private double _other_fee;
        /// <summary>
        /// ��������
        /// </summary>
        public double other_fee
        {
            get { return _other_fee; }

            set
            {
                _other_fee = value;
                RaisePropertyChanged(() => other_fee);
            }
        }

        private double _other_commis;
        /// <summary>
        /// ����Ӷ��
        /// </summary>
        public double other_commis
        {
            get { return _other_commis; }

            set
            {
                _other_commis = value;
                RaisePropertyChanged(() => other_commis);
            }
        }

        private double _trade_tax;
        /// <summary>
        /// ��������
        /// </summary>
        public double trade_tax
        {
            get { return _trade_tax; }

            set
            {
                _trade_tax = value;
                RaisePropertyChanged(() => trade_tax);
            }
        }

        private double _trade_cost_fee;
        /// <summary>
        /// ���׷�
        /// </summary>
        public double trade_cost_fee
        {
            get { return _trade_cost_fee; }

            set
            {
                _trade_cost_fee = value;
                RaisePropertyChanged(() => trade_cost_fee);
            }
        }

        private double _trade_system_use_fee;
        /// <summary>
        /// ����ϵͳʹ�÷�
        /// </summary>
        public double trade_system_use_fee
        {
            get { return _trade_system_use_fee; }

            set
            {
                _trade_system_use_fee = value;
                RaisePropertyChanged(() => trade_system_use_fee);
            }
        }

        private double _stock_settle_fee;
        /// <summary>
        /// �ɷݽ��շ�
        /// </summary>
        public double stock_settle_fee
        {
            get { return _stock_settle_fee; }

            set
            {
                _stock_settle_fee = value;
                RaisePropertyChanged(() => stock_settle_fee);
            }
        }

        private double _order_frozen_amt;
        /// <summary>
        /// ����������
        /// </summary>
        public double order_frozen_amt
        {
            get { return _order_frozen_amt; }

            set
            {
                _order_frozen_amt = value;
                RaisePropertyChanged(() => order_frozen_amt);
            }
        }
    }

}

using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class pdfutuL_3_1_Info : ObservableObject
    {
    }

    public class pdfutuL_3_2_Info : ObservableObject
    {
    }

    public class pdfutuL_3_3_Info : ObservableObject
    {
    }

    public class pdfutuL_3_4_Info : ObservableObject
    {
    }

    public class pdfutuL_3_5_Info : ObservableObject
    {
    }

    public class pdfutuL_3_21_Info : ObservableObject
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

        private int _lngsht_type;
        /// <summary>
        /// �������
        /// </summary>
        public int lngsht_type
        {
            get { return _lngsht_type; }

            set
            {
                _lngsht_type = value;
                RaisePropertyChanged(() => lngsht_type);
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

        private int _contrc_unit;
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_unit
        {
            get { return _contrc_unit; }

            set
            {
                _contrc_unit = value;
                RaisePropertyChanged(() => contrc_unit);
            }
        }

        private double _begin_qty;
        /// <summary>
        /// �ڳ�����
        /// </summary>
        public double begin_qty
        {
            get { return _begin_qty; }

            set
            {
                _begin_qty = value;
                RaisePropertyChanged(() => begin_qty);
            }
        }

        private double _curr_qty;
        /// <summary>
        /// ��ǰ����
        /// </summary>
        public double curr_qty
        {
            get { return _curr_qty; }

            set
            {
                _curr_qty = value;
                RaisePropertyChanged(() => curr_qty);
            }
        }

        private double _frozen_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double frozen_qty
        {
            get { return _frozen_qty; }

            set
            {
                _frozen_qty = value;
                RaisePropertyChanged(() => frozen_qty);
            }
        }

        private double _unfroz_qty;
        /// <summary>
        /// �ⶳ����
        /// </summary>
        public double unfroz_qty
        {
            get { return _unfroz_qty; }

            set
            {
                _unfroz_qty = value;
                RaisePropertyChanged(() => unfroz_qty);
            }
        }

        private double _pre_settle_price;
        /// <summary>
        /// ������
        /// </summary>
        public double pre_settle_price
        {
            get { return _pre_settle_price; }

            set
            {
                _pre_settle_price = value;
                RaisePropertyChanged(() => pre_settle_price);
            }
        }

        private double _sett_price;
        /// <summary>
        /// �����
        /// </summary>
        public double sett_price
        {
            get { return _sett_price; }

            set
            {
                _sett_price = value;
                RaisePropertyChanged(() => sett_price);
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
    }

    public class pdfutuL_3_22_Info : ObservableObject
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

        private int _lngsht_type;
        /// <summary>
        /// �������
        /// </summary>
        public int lngsht_type
        {
            get { return _lngsht_type; }

            set
            {
                _lngsht_type = value;
                RaisePropertyChanged(() => lngsht_type);
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

        private int _contrc_unit;
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_unit
        {
            get { return _contrc_unit; }

            set
            {
                _contrc_unit = value;
                RaisePropertyChanged(() => contrc_unit);
            }
        }

        private double _begin_qty;
        /// <summary>
        /// �ڳ�����
        /// </summary>
        public double begin_qty
        {
            get { return _begin_qty; }

            set
            {
                _begin_qty = value;
                RaisePropertyChanged(() => begin_qty);
            }
        }

        private double _curr_qty;
        /// <summary>
        /// ��ǰ����
        /// </summary>
        public double curr_qty
        {
            get { return _curr_qty; }

            set
            {
                _curr_qty = value;
                RaisePropertyChanged(() => curr_qty);
            }
        }

        private double _frozen_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double frozen_qty
        {
            get { return _frozen_qty; }

            set
            {
                _frozen_qty = value;
                RaisePropertyChanged(() => frozen_qty);
            }
        }

        private double _unfroz_qty;
        /// <summary>
        /// �ⶳ����
        /// </summary>
        public double unfroz_qty
        {
            get { return _unfroz_qty; }

            set
            {
                _unfroz_qty = value;
                RaisePropertyChanged(() => unfroz_qty);
            }
        }

        private double _pre_settle_price;
        /// <summary>
        /// ������
        /// </summary>
        public double pre_settle_price
        {
            get { return _pre_settle_price; }

            set
            {
                _pre_settle_price = value;
                RaisePropertyChanged(() => pre_settle_price);
            }
        }

        private double _sett_price;
        /// <summary>
        /// �����
        /// </summary>
        public double sett_price
        {
            get { return _sett_price; }

            set
            {
                _sett_price = value;
                RaisePropertyChanged(() => sett_price);
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
    }

    public class pdfutuL_3_31_Info : ObservableObject
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

        private int _lngsht_type;
        /// <summary>
        /// �������
        /// </summary>
        public int lngsht_type
        {
            get { return _lngsht_type; }

            set
            {
                _lngsht_type = value;
                RaisePropertyChanged(() => lngsht_type);
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

        private double _occur_qty;
        /// <summary>
        /// �䶯����
        /// </summary>
        public double occur_qty
        {
            get { return _occur_qty; }

            set
            {
                _occur_qty = value;
                RaisePropertyChanged(() => occur_qty);
            }
        }

        private double _occur_end_qty;
        /// <summary>
        /// �䶯������
        /// </summary>
        public double occur_end_qty
        {
            get { return _occur_end_qty; }

            set
            {
                _occur_end_qty = value;
                RaisePropertyChanged(() => occur_end_qty);
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

    public class pdfutuL_3_32_Info : ObservableObject
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

        private int _lngsht_type;
        /// <summary>
        /// �������
        /// </summary>
        public int lngsht_type
        {
            get { return _lngsht_type; }

            set
            {
                _lngsht_type = value;
                RaisePropertyChanged(() => lngsht_type);
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

        private double _occur_qty;
        /// <summary>
        /// �䶯����
        /// </summary>
        public double occur_qty
        {
            get { return _occur_qty; }

            set
            {
                _occur_qty = value;
                RaisePropertyChanged(() => occur_qty);
            }
        }

        private double _occur_end_qty;
        /// <summary>
        /// �䶯������
        /// </summary>
        public double occur_end_qty
        {
            get { return _occur_end_qty; }

            set
            {
                _occur_end_qty = value;
                RaisePropertyChanged(() => occur_end_qty);
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

    public class pdfutuL_3_34_Info : ObservableObject
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

        private int _lngsht_type;
        /// <summary>
        /// �������
        /// </summary>
        public int lngsht_type
        {
            get { return _lngsht_type; }

            set
            {
                _lngsht_type = value;
                RaisePropertyChanged(() => lngsht_type);
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

        private int _frozen_type;
        /// <summary>
        /// ����ⶳ����
        /// </summary>
        public int frozen_type
        {
            get { return _frozen_type; }

            set
            {
                _frozen_type = value;
                RaisePropertyChanged(() => frozen_type);
            }
        }

        private double _occur_qty;
        /// <summary>
        /// �䶯����
        /// </summary>
        public double occur_qty
        {
            get { return _occur_qty; }

            set
            {
                _occur_qty = value;
                RaisePropertyChanged(() => occur_qty);
            }
        }

        private int _expire_date;
        /// <summary>
        /// ��������
        /// </summary>
        public int expire_date
        {
            get { return _expire_date; }

            set
            {
                _expire_date = value;
                RaisePropertyChanged(() => expire_date);
            }
        }

        private String _jour_status;
        /// <summary>
        /// ��ˮ״̬
        /// </summary>
        public String jour_status
        {
            get { return _jour_status; }

            set
            {
                _jour_status = value;
                RaisePropertyChanged(() => jour_status);
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

    public class pdfutuL_3_35_Info : ObservableObject
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

        private int _lngsht_type;
        /// <summary>
        /// �������
        /// </summary>
        public int lngsht_type
        {
            get { return _lngsht_type; }

            set
            {
                _lngsht_type = value;
                RaisePropertyChanged(() => lngsht_type);
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

        private int _frozen_type;
        /// <summary>
        /// ����ⶳ����
        /// </summary>
        public int frozen_type
        {
            get { return _frozen_type; }

            set
            {
                _frozen_type = value;
                RaisePropertyChanged(() => frozen_type);
            }
        }

        private double _occur_qty;
        /// <summary>
        /// �䶯����
        /// </summary>
        public double occur_qty
        {
            get { return _occur_qty; }

            set
            {
                _occur_qty = value;
                RaisePropertyChanged(() => occur_qty);
            }
        }

        private int _expire_date;
        /// <summary>
        /// ��������
        /// </summary>
        public int expire_date
        {
            get { return _expire_date; }

            set
            {
                _expire_date = value;
                RaisePropertyChanged(() => expire_date);
            }
        }

        private String _jour_status;
        /// <summary>
        /// ��ˮ״̬
        /// </summary>
        public String jour_status
        {
            get { return _jour_status; }

            set
            {
                _jour_status = value;
                RaisePropertyChanged(() => jour_status);
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

    public class pdfutuL_3_51_Info : ObservableObject
    {
    }

    public class pdfutuL_3_52_Info : ObservableObject
    {
    }

    public class pdfutuL_3_53_Info : ObservableObject
    {
    }

    public class pdfutuL_3_54_Info : ObservableObject
    {
    }

    public class pdfutuL_3_55_Info : ObservableObject
    {
    }

    public class pdfutuL_3_71_Info : ObservableObject
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

        private int _lngsht_type;
        /// <summary>
        /// �������
        /// </summary>
        public int lngsht_type
        {
            get { return _lngsht_type; }

            set
            {
                _lngsht_type = value;
                RaisePropertyChanged(() => lngsht_type);
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

        private int _contrc_unit;
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_unit
        {
            get { return _contrc_unit; }

            set
            {
                _contrc_unit = value;
                RaisePropertyChanged(() => contrc_unit);
            }
        }

        private double _begin_qty;
        /// <summary>
        /// �ڳ�����
        /// </summary>
        public double begin_qty
        {
            get { return _begin_qty; }

            set
            {
                _begin_qty = value;
                RaisePropertyChanged(() => begin_qty);
            }
        }

        private double _curr_qty;
        /// <summary>
        /// ��ǰ����
        /// </summary>
        public double curr_qty
        {
            get { return _curr_qty; }

            set
            {
                _curr_qty = value;
                RaisePropertyChanged(() => curr_qty);
            }
        }

        private double _frozen_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double frozen_qty
        {
            get { return _frozen_qty; }

            set
            {
                _frozen_qty = value;
                RaisePropertyChanged(() => frozen_qty);
            }
        }

        private double _unfroz_qty;
        /// <summary>
        /// �ⶳ����
        /// </summary>
        public double unfroz_qty
        {
            get { return _unfroz_qty; }

            set
            {
                _unfroz_qty = value;
                RaisePropertyChanged(() => unfroz_qty);
            }
        }

        private double _pre_settle_price;
        /// <summary>
        /// ������
        /// </summary>
        public double pre_settle_price
        {
            get { return _pre_settle_price; }

            set
            {
                _pre_settle_price = value;
                RaisePropertyChanged(() => pre_settle_price);
            }
        }

        private double _sett_price;
        /// <summary>
        /// �����
        /// </summary>
        public double sett_price
        {
            get { return _sett_price; }

            set
            {
                _sett_price = value;
                RaisePropertyChanged(() => sett_price);
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
    }

    public class pdfutuL_3_72_Info : ObservableObject
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

        private int _lngsht_type;
        /// <summary>
        /// �������
        /// </summary>
        public int lngsht_type
        {
            get { return _lngsht_type; }

            set
            {
                _lngsht_type = value;
                RaisePropertyChanged(() => lngsht_type);
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

        private int _contrc_unit;
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_unit
        {
            get { return _contrc_unit; }

            set
            {
                _contrc_unit = value;
                RaisePropertyChanged(() => contrc_unit);
            }
        }

        private double _begin_qty;
        /// <summary>
        /// �ڳ�����
        /// </summary>
        public double begin_qty
        {
            get { return _begin_qty; }

            set
            {
                _begin_qty = value;
                RaisePropertyChanged(() => begin_qty);
            }
        }

        private double _curr_qty;
        /// <summary>
        /// ��ǰ����
        /// </summary>
        public double curr_qty
        {
            get { return _curr_qty; }

            set
            {
                _curr_qty = value;
                RaisePropertyChanged(() => curr_qty);
            }
        }

        private double _frozen_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double frozen_qty
        {
            get { return _frozen_qty; }

            set
            {
                _frozen_qty = value;
                RaisePropertyChanged(() => frozen_qty);
            }
        }

        private double _unfroz_qty;
        /// <summary>
        /// �ⶳ����
        /// </summary>
        public double unfroz_qty
        {
            get { return _unfroz_qty; }

            set
            {
                _unfroz_qty = value;
                RaisePropertyChanged(() => unfroz_qty);
            }
        }

        private double _pre_settle_price;
        /// <summary>
        /// ������
        /// </summary>
        public double pre_settle_price
        {
            get { return _pre_settle_price; }

            set
            {
                _pre_settle_price = value;
                RaisePropertyChanged(() => pre_settle_price);
            }
        }

        private double _sett_price;
        /// <summary>
        /// �����
        /// </summary>
        public double sett_price
        {
            get { return _sett_price; }

            set
            {
                _sett_price = value;
                RaisePropertyChanged(() => sett_price);
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
    }

    public class pdfutuL_3_81_Info : ObservableObject
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

        private int _lngsht_type;
        /// <summary>
        /// �������
        /// </summary>
        public int lngsht_type
        {
            get { return _lngsht_type; }

            set
            {
                _lngsht_type = value;
                RaisePropertyChanged(() => lngsht_type);
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

        private double _occur_qty;
        /// <summary>
        /// �䶯����
        /// </summary>
        public double occur_qty
        {
            get { return _occur_qty; }

            set
            {
                _occur_qty = value;
                RaisePropertyChanged(() => occur_qty);
            }
        }

        private double _occur_end_qty;
        /// <summary>
        /// �䶯������
        /// </summary>
        public double occur_end_qty
        {
            get { return _occur_end_qty; }

            set
            {
                _occur_end_qty = value;
                RaisePropertyChanged(() => occur_end_qty);
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

    public class pdfutuL_3_82_Info : ObservableObject
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

        private int _lngsht_type;
        /// <summary>
        /// �������
        /// </summary>
        public int lngsht_type
        {
            get { return _lngsht_type; }

            set
            {
                _lngsht_type = value;
                RaisePropertyChanged(() => lngsht_type);
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

        private double _occur_qty;
        /// <summary>
        /// �䶯����
        /// </summary>
        public double occur_qty
        {
            get { return _occur_qty; }

            set
            {
                _occur_qty = value;
                RaisePropertyChanged(() => occur_qty);
            }
        }

        private double _occur_end_qty;
        /// <summary>
        /// �䶯������
        /// </summary>
        public double occur_end_qty
        {
            get { return _occur_end_qty; }

            set
            {
                _occur_end_qty = value;
                RaisePropertyChanged(() => occur_end_qty);
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

    public class pdfutuL_3_84_Info : ObservableObject
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

        private int _lngsht_type;
        /// <summary>
        /// �������
        /// </summary>
        public int lngsht_type
        {
            get { return _lngsht_type; }

            set
            {
                _lngsht_type = value;
                RaisePropertyChanged(() => lngsht_type);
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

        private int _frozen_type;
        /// <summary>
        /// ����ⶳ����
        /// </summary>
        public int frozen_type
        {
            get { return _frozen_type; }

            set
            {
                _frozen_type = value;
                RaisePropertyChanged(() => frozen_type);
            }
        }

        private double _occur_qty;
        /// <summary>
        /// �䶯����
        /// </summary>
        public double occur_qty
        {
            get { return _occur_qty; }

            set
            {
                _occur_qty = value;
                RaisePropertyChanged(() => occur_qty);
            }
        }

        private int _expire_date;
        /// <summary>
        /// ��������
        /// </summary>
        public int expire_date
        {
            get { return _expire_date; }

            set
            {
                _expire_date = value;
                RaisePropertyChanged(() => expire_date);
            }
        }

        private String _jour_status;
        /// <summary>
        /// ��ˮ״̬
        /// </summary>
        public String jour_status
        {
            get { return _jour_status; }

            set
            {
                _jour_status = value;
                RaisePropertyChanged(() => jour_status);
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

    public class pdfutuL_3_85_Info : ObservableObject
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

        private int _lngsht_type;
        /// <summary>
        /// �������
        /// </summary>
        public int lngsht_type
        {
            get { return _lngsht_type; }

            set
            {
                _lngsht_type = value;
                RaisePropertyChanged(() => lngsht_type);
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

        private int _frozen_type;
        /// <summary>
        /// ����ⶳ����
        /// </summary>
        public int frozen_type
        {
            get { return _frozen_type; }

            set
            {
                _frozen_type = value;
                RaisePropertyChanged(() => frozen_type);
            }
        }

        private double _occur_qty;
        /// <summary>
        /// �䶯����
        /// </summary>
        public double occur_qty
        {
            get { return _occur_qty; }

            set
            {
                _occur_qty = value;
                RaisePropertyChanged(() => occur_qty);
            }
        }

        private int _expire_date;
        /// <summary>
        /// ��������
        /// </summary>
        public int expire_date
        {
            get { return _expire_date; }

            set
            {
                _expire_date = value;
                RaisePropertyChanged(() => expire_date);
            }
        }

        private String _jour_status;
        /// <summary>
        /// ��ˮ״̬
        /// </summary>
        public String jour_status
        {
            get { return _jour_status; }

            set
            {
                _jour_status = value;
                RaisePropertyChanged(() => jour_status);
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

    public class pdfutuL_3_171_Info : ObservableObject
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

    public class pdfutuL_3_172_Info : ObservableObject
    {
    }

    public class pdfutuL_3_173_Info : ObservableObject
    {
    }

}

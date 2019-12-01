using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class tdsecuL_2_1_Info : ObservableObject
    {

        private double _comm_avail_amt;
        /// <summary>
        /// ָ��˿��ý��
        /// </summary>
        public double comm_avail_amt
        {
            get { return _comm_avail_amt; }

            set
            {
                _comm_avail_amt = value;
                RaisePropertyChanged(() => comm_avail_amt);
            }
        }

        private double _trade_avail_amt;
        /// <summary>
        /// ���׶˿��ý��
        /// </summary>
        public double trade_avail_amt
        {
            get { return _trade_avail_amt; }

            set
            {
                _trade_avail_amt = value;
                RaisePropertyChanged(() => trade_avail_amt);
            }
        }

        private double _static_avail_amt;
        /// <summary>
        /// ��̬���ý��
        /// </summary>
        public double static_avail_amt
        {
            get { return _static_avail_amt; }

            set
            {
                _static_avail_amt = value;
                RaisePropertyChanged(() => static_avail_amt);
            }
        }
    }

    public class tdsecuL_2_2_Info : ObservableObject
    {

        private double _comm_avail_amt;
        /// <summary>
        /// ָ��˿��ý��
        /// </summary>
        public double comm_avail_amt
        {
            get { return _comm_avail_amt; }

            set
            {
                _comm_avail_amt = value;
                RaisePropertyChanged(() => comm_avail_amt);
            }
        }

        private double _trade_avail_amt;
        /// <summary>
        /// ���׶˿��ý��
        /// </summary>
        public double trade_avail_amt
        {
            get { return _trade_avail_amt; }

            set
            {
                _trade_avail_amt = value;
                RaisePropertyChanged(() => trade_avail_amt);
            }
        }

        private double _static_avail_amt;
        /// <summary>
        /// ��̬���ý��
        /// </summary>
        public double static_avail_amt
        {
            get { return _static_avail_amt; }

            set
            {
                _static_avail_amt = value;
                RaisePropertyChanged(() => static_avail_amt);
            }
        }
    }

    public class tdsecuL_2_3_Info : ObservableObject
    {

        private double _comm_avail_qty;
        /// <summary>
        /// ָ��˿�������
        /// </summary>
        public double comm_avail_qty
        {
            get { return _comm_avail_qty; }

            set
            {
                _comm_avail_qty = value;
                RaisePropertyChanged(() => comm_avail_qty);
            }
        }

        private double _trade_avail_qty;
        /// <summary>
        /// ���׶˿�������
        /// </summary>
        public double trade_avail_qty
        {
            get { return _trade_avail_qty; }

            set
            {
                _trade_avail_qty = value;
                RaisePropertyChanged(() => trade_avail_qty);
            }
        }

        private double _static_avail_qty;
        /// <summary>
        /// ��̬��������
        /// </summary>
        public double static_avail_qty
        {
            get { return _static_avail_qty; }

            set
            {
                _static_avail_qty = value;
                RaisePropertyChanged(() => static_avail_qty);
            }
        }
    }

    public class tdsecuL_2_4_Info : ObservableObject
    {

        private double _comm_avail_qty;
        /// <summary>
        /// ָ��˿�������
        /// </summary>
        public double comm_avail_qty
        {
            get { return _comm_avail_qty; }

            set
            {
                _comm_avail_qty = value;
                RaisePropertyChanged(() => comm_avail_qty);
            }
        }

        private double _trade_avail_qty;
        /// <summary>
        /// ���׶˿�������
        /// </summary>
        public double trade_avail_qty
        {
            get { return _trade_avail_qty; }

            set
            {
                _trade_avail_qty = value;
                RaisePropertyChanged(() => trade_avail_qty);
            }
        }

        private double _static_avail_qty;
        /// <summary>
        /// ��̬��������
        /// </summary>
        public double static_avail_qty
        {
            get { return _static_avail_qty; }

            set
            {
                _static_avail_qty = value;
                RaisePropertyChanged(() => static_avail_qty);
            }
        }
    }

    public class tdsecuL_2_51_Info : ObservableObject
    {
    }

    public class tdsecuL_2_52_Info : ObservableObject
    {
    }

    public class tdsecuL_2_53_Info : ObservableObject
    {
    }

    public class tdsecuL_2_54_Info : ObservableObject
    {
    }

    public class tdsecuL_2_5_Info : ObservableObject
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

        private double _comm_frozen_amt;
        /// <summary>
        /// ָ�����
        /// </summary>
        public double comm_frozen_amt
        {
            get { return _comm_frozen_amt; }

            set
            {
                _comm_frozen_amt = value;
                RaisePropertyChanged(() => comm_frozen_amt);
            }
        }

        private double _comm_unfroz_amt;
        /// <summary>
        /// ָ��ⶳ���
        /// </summary>
        public double comm_unfroz_amt
        {
            get { return _comm_unfroz_amt; }

            set
            {
                _comm_unfroz_amt = value;
                RaisePropertyChanged(() => comm_unfroz_amt);
            }
        }

        private double _comm_capt_amt;
        /// <summary>
        /// ָ��ռ�ý��
        /// </summary>
        public double comm_capt_amt
        {
            get { return _comm_capt_amt; }

            set
            {
                _comm_capt_amt = value;
                RaisePropertyChanged(() => comm_capt_amt);
            }
        }

        private double _comm_releas_amt;
        /// <summary>
        /// ָ���ͷŽ��
        /// </summary>
        public double comm_releas_amt
        {
            get { return _comm_releas_amt; }

            set
            {
                _comm_releas_amt = value;
                RaisePropertyChanged(() => comm_releas_amt);
            }
        }

        private double _trade_frozen_amt;
        /// <summary>
        /// ���׶�����
        /// </summary>
        public double trade_frozen_amt
        {
            get { return _trade_frozen_amt; }

            set
            {
                _trade_frozen_amt = value;
                RaisePropertyChanged(() => trade_frozen_amt);
            }
        }

        private double _trade_unfroz_amt;
        /// <summary>
        /// ���׽ⶳ���
        /// </summary>
        public double trade_unfroz_amt
        {
            get { return _trade_unfroz_amt; }

            set
            {
                _trade_unfroz_amt = value;
                RaisePropertyChanged(() => trade_unfroz_amt);
            }
        }

        private double _trade_capt_amt;
        /// <summary>
        /// ����ռ�ý��
        /// </summary>
        public double trade_capt_amt
        {
            get { return _trade_capt_amt; }

            set
            {
                _trade_capt_amt = value;
                RaisePropertyChanged(() => trade_capt_amt);
            }
        }

        private double _trade_releas_amt;
        /// <summary>
        /// �����ͷŽ��
        /// </summary>
        public double trade_releas_amt
        {
            get { return _trade_releas_amt; }

            set
            {
                _trade_releas_amt = value;
                RaisePropertyChanged(() => trade_releas_amt);
            }
        }

        private double _strike_capt_amt;
        /// <summary>
        /// �ɽ�ռ�ý��
        /// </summary>
        public double strike_capt_amt
        {
            get { return _strike_capt_amt; }

            set
            {
                _strike_capt_amt = value;
                RaisePropertyChanged(() => strike_capt_amt);
            }
        }

        private double _strike_releas_amt;
        /// <summary>
        /// �ɽ��ͷŽ��
        /// </summary>
        public double strike_releas_amt
        {
            get { return _strike_releas_amt; }

            set
            {
                _strike_releas_amt = value;
                RaisePropertyChanged(() => strike_releas_amt);
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

    public class tdsecuL_2_6_Info : ObservableObject
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

        private double _comm_frozen_amt;
        /// <summary>
        /// ָ�����
        /// </summary>
        public double comm_frozen_amt
        {
            get { return _comm_frozen_amt; }

            set
            {
                _comm_frozen_amt = value;
                RaisePropertyChanged(() => comm_frozen_amt);
            }
        }

        private double _comm_unfroz_amt;
        /// <summary>
        /// ָ��ⶳ���
        /// </summary>
        public double comm_unfroz_amt
        {
            get { return _comm_unfroz_amt; }

            set
            {
                _comm_unfroz_amt = value;
                RaisePropertyChanged(() => comm_unfroz_amt);
            }
        }

        private double _comm_capt_amt;
        /// <summary>
        /// ָ��ռ�ý��
        /// </summary>
        public double comm_capt_amt
        {
            get { return _comm_capt_amt; }

            set
            {
                _comm_capt_amt = value;
                RaisePropertyChanged(() => comm_capt_amt);
            }
        }

        private double _comm_releas_amt;
        /// <summary>
        /// ָ���ͷŽ��
        /// </summary>
        public double comm_releas_amt
        {
            get { return _comm_releas_amt; }

            set
            {
                _comm_releas_amt = value;
                RaisePropertyChanged(() => comm_releas_amt);
            }
        }

        private double _trade_frozen_amt;
        /// <summary>
        /// ���׶�����
        /// </summary>
        public double trade_frozen_amt
        {
            get { return _trade_frozen_amt; }

            set
            {
                _trade_frozen_amt = value;
                RaisePropertyChanged(() => trade_frozen_amt);
            }
        }

        private double _trade_unfroz_amt;
        /// <summary>
        /// ���׽ⶳ���
        /// </summary>
        public double trade_unfroz_amt
        {
            get { return _trade_unfroz_amt; }

            set
            {
                _trade_unfroz_amt = value;
                RaisePropertyChanged(() => trade_unfroz_amt);
            }
        }

        private double _trade_capt_amt;
        /// <summary>
        /// ����ռ�ý��
        /// </summary>
        public double trade_capt_amt
        {
            get { return _trade_capt_amt; }

            set
            {
                _trade_capt_amt = value;
                RaisePropertyChanged(() => trade_capt_amt);
            }
        }

        private double _trade_releas_amt;
        /// <summary>
        /// �����ͷŽ��
        /// </summary>
        public double trade_releas_amt
        {
            get { return _trade_releas_amt; }

            set
            {
                _trade_releas_amt = value;
                RaisePropertyChanged(() => trade_releas_amt);
            }
        }

        private double _strike_capt_amt;
        /// <summary>
        /// �ɽ�ռ�ý��
        /// </summary>
        public double strike_capt_amt
        {
            get { return _strike_capt_amt; }

            set
            {
                _strike_capt_amt = value;
                RaisePropertyChanged(() => strike_capt_amt);
            }
        }

        private double _strike_releas_amt;
        /// <summary>
        /// �ɽ��ͷŽ��
        /// </summary>
        public double strike_releas_amt
        {
            get { return _strike_releas_amt; }

            set
            {
                _strike_releas_amt = value;
                RaisePropertyChanged(() => strike_releas_amt);
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

    public class tdsecuL_2_7_Info : ObservableObject
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

        private double _comm_unfroz_qty;
        /// <summary>
        /// ָ��ⶳ����
        /// </summary>
        public double comm_unfroz_qty
        {
            get { return _comm_unfroz_qty; }

            set
            {
                _comm_unfroz_qty = value;
                RaisePropertyChanged(() => comm_unfroz_qty);
            }
        }

        private double _comm_capt_qty;
        /// <summary>
        /// ָ��ռ������
        /// </summary>
        public double comm_capt_qty
        {
            get { return _comm_capt_qty; }

            set
            {
                _comm_capt_qty = value;
                RaisePropertyChanged(() => comm_capt_qty);
            }
        }

        private double _comm_releas_qty;
        /// <summary>
        /// ָ���ͷ�����
        /// </summary>
        public double comm_releas_qty
        {
            get { return _comm_releas_qty; }

            set
            {
                _comm_releas_qty = value;
                RaisePropertyChanged(() => comm_releas_qty);
            }
        }

        private double _trade_frozen_qty;
        /// <summary>
        /// ���׶�������
        /// </summary>
        public double trade_frozen_qty
        {
            get { return _trade_frozen_qty; }

            set
            {
                _trade_frozen_qty = value;
                RaisePropertyChanged(() => trade_frozen_qty);
            }
        }

        private double _trade_unfroz_qty;
        /// <summary>
        /// ���׽ⶳ����
        /// </summary>
        public double trade_unfroz_qty
        {
            get { return _trade_unfroz_qty; }

            set
            {
                _trade_unfroz_qty = value;
                RaisePropertyChanged(() => trade_unfroz_qty);
            }
        }

        private double _trade_capt_qty;
        /// <summary>
        /// ����ռ������
        /// </summary>
        public double trade_capt_qty
        {
            get { return _trade_capt_qty; }

            set
            {
                _trade_capt_qty = value;
                RaisePropertyChanged(() => trade_capt_qty);
            }
        }

        private double _trade_releas_qty;
        /// <summary>
        /// �����ͷ�����
        /// </summary>
        public double trade_releas_qty
        {
            get { return _trade_releas_qty; }

            set
            {
                _trade_releas_qty = value;
                RaisePropertyChanged(() => trade_releas_qty);
            }
        }

        private double _strike_capt_qty;
        /// <summary>
        /// �ɽ�ռ������
        /// </summary>
        public double strike_capt_qty
        {
            get { return _strike_capt_qty; }

            set
            {
                _strike_capt_qty = value;
                RaisePropertyChanged(() => strike_capt_qty);
            }
        }

        private double _strike_releas_qty;
        /// <summary>
        /// �ɽ��ͷ�����
        /// </summary>
        public double strike_releas_qty
        {
            get { return _strike_releas_qty; }

            set
            {
                _strike_releas_qty = value;
                RaisePropertyChanged(() => strike_releas_qty);
            }
        }

        private double _strike_frozen_qty;
        /// <summary>
        /// �ɽ���������
        /// </summary>
        public double strike_frozen_qty
        {
            get { return _strike_frozen_qty; }

            set
            {
                _strike_frozen_qty = value;
                RaisePropertyChanged(() => strike_frozen_qty);
            }
        }

        private double _strike_unfroz_qty;
        /// <summary>
        /// �ɽ��ⶳ����
        /// </summary>
        public double strike_unfroz_qty
        {
            get { return _strike_unfroz_qty; }

            set
            {
                _strike_unfroz_qty = value;
                RaisePropertyChanged(() => strike_unfroz_qty);
            }
        }

        private double _cost_amt;
        /// <summary>
        /// �ɱ����
        /// </summary>
        public double cost_amt
        {
            get { return _cost_amt; }

            set
            {
                _cost_amt = value;
                RaisePropertyChanged(() => cost_amt);
            }
        }

        private double _intrst_cost_amt;
        /// <summary>
        /// ��Ϣ�ɱ����
        /// </summary>
        public double intrst_cost_amt
        {
            get { return _intrst_cost_amt; }

            set
            {
                _intrst_cost_amt = value;
                RaisePropertyChanged(() => intrst_cost_amt);
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

        private double _realize_pandl;
        /// <summary>
        /// ʵ��ӯ��
        /// </summary>
        public double realize_pandl
        {
            get { return _realize_pandl; }

            set
            {
                _realize_pandl = value;
                RaisePropertyChanged(() => realize_pandl);
            }
        }

        private double _intrst_pandl;
        /// <summary>
        /// ��Ϣ����
        /// </summary>
        public double intrst_pandl
        {
            get { return _intrst_pandl; }

            set
            {
                _intrst_pandl = value;
                RaisePropertyChanged(() => intrst_pandl);
            }
        }
    }

    public class tdsecuL_2_8_Info : ObservableObject
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

        private double _comm_unfroz_qty;
        /// <summary>
        /// ָ��ⶳ����
        /// </summary>
        public double comm_unfroz_qty
        {
            get { return _comm_unfroz_qty; }

            set
            {
                _comm_unfroz_qty = value;
                RaisePropertyChanged(() => comm_unfroz_qty);
            }
        }

        private double _comm_capt_qty;
        /// <summary>
        /// ָ��ռ������
        /// </summary>
        public double comm_capt_qty
        {
            get { return _comm_capt_qty; }

            set
            {
                _comm_capt_qty = value;
                RaisePropertyChanged(() => comm_capt_qty);
            }
        }

        private double _comm_releas_qty;
        /// <summary>
        /// ָ���ͷ�����
        /// </summary>
        public double comm_releas_qty
        {
            get { return _comm_releas_qty; }

            set
            {
                _comm_releas_qty = value;
                RaisePropertyChanged(() => comm_releas_qty);
            }
        }

        private double _trade_frozen_qty;
        /// <summary>
        /// ���׶�������
        /// </summary>
        public double trade_frozen_qty
        {
            get { return _trade_frozen_qty; }

            set
            {
                _trade_frozen_qty = value;
                RaisePropertyChanged(() => trade_frozen_qty);
            }
        }

        private double _trade_unfroz_qty;
        /// <summary>
        /// ���׽ⶳ����
        /// </summary>
        public double trade_unfroz_qty
        {
            get { return _trade_unfroz_qty; }

            set
            {
                _trade_unfroz_qty = value;
                RaisePropertyChanged(() => trade_unfroz_qty);
            }
        }

        private double _trade_capt_qty;
        /// <summary>
        /// ����ռ������
        /// </summary>
        public double trade_capt_qty
        {
            get { return _trade_capt_qty; }

            set
            {
                _trade_capt_qty = value;
                RaisePropertyChanged(() => trade_capt_qty);
            }
        }

        private double _trade_releas_qty;
        /// <summary>
        /// �����ͷ�����
        /// </summary>
        public double trade_releas_qty
        {
            get { return _trade_releas_qty; }

            set
            {
                _trade_releas_qty = value;
                RaisePropertyChanged(() => trade_releas_qty);
            }
        }

        private double _strike_capt_qty;
        /// <summary>
        /// �ɽ�ռ������
        /// </summary>
        public double strike_capt_qty
        {
            get { return _strike_capt_qty; }

            set
            {
                _strike_capt_qty = value;
                RaisePropertyChanged(() => strike_capt_qty);
            }
        }

        private double _strike_releas_qty;
        /// <summary>
        /// �ɽ��ͷ�����
        /// </summary>
        public double strike_releas_qty
        {
            get { return _strike_releas_qty; }

            set
            {
                _strike_releas_qty = value;
                RaisePropertyChanged(() => strike_releas_qty);
            }
        }

        private double _strike_frozen_qty;
        /// <summary>
        /// �ɽ���������
        /// </summary>
        public double strike_frozen_qty
        {
            get { return _strike_frozen_qty; }

            set
            {
                _strike_frozen_qty = value;
                RaisePropertyChanged(() => strike_frozen_qty);
            }
        }

        private double _strike_unfroz_qty;
        /// <summary>
        /// �ɽ��ⶳ����
        /// </summary>
        public double strike_unfroz_qty
        {
            get { return _strike_unfroz_qty; }

            set
            {
                _strike_unfroz_qty = value;
                RaisePropertyChanged(() => strike_unfroz_qty);
            }
        }

        private double _cost_amt;
        /// <summary>
        /// �ɱ����
        /// </summary>
        public double cost_amt
        {
            get { return _cost_amt; }

            set
            {
                _cost_amt = value;
                RaisePropertyChanged(() => cost_amt);
            }
        }

        private double _intrst_cost_amt;
        /// <summary>
        /// ��Ϣ�ɱ����
        /// </summary>
        public double intrst_cost_amt
        {
            get { return _intrst_cost_amt; }

            set
            {
                _intrst_cost_amt = value;
                RaisePropertyChanged(() => intrst_cost_amt);
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

        private double _realize_pandl;
        /// <summary>
        /// ʵ��ӯ��
        /// </summary>
        public double realize_pandl
        {
            get { return _realize_pandl; }

            set
            {
                _realize_pandl = value;
                RaisePropertyChanged(() => realize_pandl);
            }
        }

        private double _intrst_pandl;
        /// <summary>
        /// ��Ϣ����
        /// </summary>
        public double intrst_pandl
        {
            get { return _intrst_pandl; }

            set
            {
                _intrst_pandl = value;
                RaisePropertyChanged(() => intrst_pandl);
            }
        }
    }

    public class tdsecuL_2_33_Info : ObservableObject
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

        private double _put_impawn_qty;
        /// <summary>
        /// �ύ��Ѻ����
        /// </summary>
        public double put_impawn_qty
        {
            get { return _put_impawn_qty; }

            set
            {
                _put_impawn_qty = value;
                RaisePropertyChanged(() => put_impawn_qty);
            }
        }

        private double _get_impawn_qty;
        /// <summary>
        /// ת����Ѻ����
        /// </summary>
        public double get_impawn_qty
        {
            get { return _get_impawn_qty; }

            set
            {
                _get_impawn_qty = value;
                RaisePropertyChanged(() => get_impawn_qty);
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

    public class tdsecuL_2_34_Info : ObservableObject
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

        private double _put_impawn_qty;
        /// <summary>
        /// �ύ��Ѻ����
        /// </summary>
        public double put_impawn_qty
        {
            get { return _put_impawn_qty; }

            set
            {
                _put_impawn_qty = value;
                RaisePropertyChanged(() => put_impawn_qty);
            }
        }

        private double _get_impawn_qty;
        /// <summary>
        /// ת����Ѻ����
        /// </summary>
        public double get_impawn_qty
        {
            get { return _get_impawn_qty; }

            set
            {
                _get_impawn_qty = value;
                RaisePropertyChanged(() => get_impawn_qty);
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

    public class tdsecuL_2_36_Info : ObservableObject
    {
    }

    public class tdsecuL_2_37_Info : ObservableObject
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

        private double _comm_reback_avail_qty;
        /// <summary>
        /// ָ���ת�ؿ�������
        /// </summary>
        public double comm_reback_avail_qty
        {
            get { return _comm_reback_avail_qty; }

            set
            {
                _comm_reback_avail_qty = value;
                RaisePropertyChanged(() => comm_reback_avail_qty);
            }
        }

        private double _trade_reback_avail_qty;
        /// <summary>
        /// ���׶�ת�ؿ�������
        /// </summary>
        public double trade_reback_avail_qty
        {
            get { return _trade_reback_avail_qty; }

            set
            {
                _trade_reback_avail_qty = value;
                RaisePropertyChanged(() => trade_reback_avail_qty);
            }
        }
    }

    public class tdsecuL_2_42_Info : ObservableObject
    {
    }

    public class tdsecuL_2_43_Info : ObservableObject
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

        private double _exch_rate;
        /// <summary>
        /// ����
        /// </summary>
        public double exch_rate
        {
            get { return _exch_rate; }

            set
            {
                _exch_rate = value;
                RaisePropertyChanged(() => exch_rate);
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

        private int _target_code_no;
        /// <summary>
        /// ��Ĵ�����
        /// </summary>
        public int target_code_no
        {
            get { return _target_code_no; }

            set
            {
                _target_code_no = value;
                RaisePropertyChanged(() => target_code_no);
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

        private int _order_dir;
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir
        {
            get { return _order_dir; }

            set
            {
                _order_dir = value;
                RaisePropertyChanged(() => order_dir);
            }
        }

        private double _repo_qty;
        /// <summary>
        /// �ع�����
        /// </summary>
        public double repo_qty
        {
            get { return _repo_qty; }

            set
            {
                _repo_qty = value;
                RaisePropertyChanged(() => repo_qty);
            }
        }

        private double _repo_amt;
        /// <summary>
        /// �ع����
        /// </summary>
        public double repo_amt
        {
            get { return _repo_amt; }

            set
            {
                _repo_amt = value;
                RaisePropertyChanged(() => repo_amt);
            }
        }

        private double _repo_rate;
        /// <summary>
        /// �ع�����
        /// </summary>
        public double repo_rate
        {
            get { return _repo_rate; }

            set
            {
                _repo_rate = value;
                RaisePropertyChanged(() => repo_rate);
            }
        }

        private int _repo_trade_date;
        /// <summary>
        /// �ع���������
        /// </summary>
        public int repo_trade_date
        {
            get { return _repo_trade_date; }

            set
            {
                _repo_trade_date = value;
                RaisePropertyChanged(() => repo_trade_date);
            }
        }

        private ulong _repo_order_id;
        /// <summary>
        /// �ع�ί�����
        /// </summary>
        public ulong repo_order_id
        {
            get { return _repo_order_id; }

            set
            {
                _repo_order_id = value;
                RaisePropertyChanged(() => repo_order_id);
            }
        }

        private ulong _repo_strike_id;
        /// <summary>
        /// �ع��ɽ����
        /// </summary>
        public ulong repo_strike_id
        {
            get { return _repo_strike_id; }

            set
            {
                _repo_strike_id = value;
                RaisePropertyChanged(() => repo_strike_id);
            }
        }

        private int _repo_days;
        /// <summary>
        /// �ع�����
        /// </summary>
        public int repo_days
        {
            get { return _repo_days; }

            set
            {
                _repo_days = value;
                RaisePropertyChanged(() => repo_days);
            }
        }

        private int _repo_cale_days;
        /// <summary>
        /// �ع�ʵ������
        /// </summary>
        public int repo_cale_days
        {
            get { return _repo_cale_days; }

            set
            {
                _repo_cale_days = value;
                RaisePropertyChanged(() => repo_cale_days);
            }
        }

        private int _repo_back_date;
        /// <summary>
        /// �ع���������
        /// </summary>
        public int repo_back_date
        {
            get { return _repo_back_date; }

            set
            {
                _repo_back_date = value;
                RaisePropertyChanged(() => repo_back_date);
            }
        }

        private double _repo_back_amt;
        /// <summary>
        /// �ع����ؽ��
        /// </summary>
        public double repo_back_amt
        {
            get { return _repo_back_amt; }

            set
            {
                _repo_back_amt = value;
                RaisePropertyChanged(() => repo_back_amt);
            }
        }

        private double _repo_back_intrst;
        /// <summary>
        /// �ع�������Ϣ
        /// </summary>
        public double repo_back_intrst
        {
            get { return _repo_back_intrst; }

            set
            {
                _repo_back_intrst = value;
                RaisePropertyChanged(() => repo_back_intrst);
            }
        }

        private int _repo_back_trade_date;
        /// <summary>
        /// ʵ�ʻع���������
        /// </summary>
        public int repo_back_trade_date
        {
            get { return _repo_back_trade_date; }

            set
            {
                _repo_back_trade_date = value;
                RaisePropertyChanged(() => repo_back_trade_date);
            }
        }

        private String _repo_status;
        /// <summary>
        /// �ع�����״̬
        /// </summary>
        public String repo_status
        {
            get { return _repo_status; }

            set
            {
                _repo_status = value;
                RaisePropertyChanged(() => repo_status);
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

    public class tdsecuL_2_44_Info : ObservableObject
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

        private int _open_posi_date;
        /// <summary>
        /// ��������
        /// </summary>
        public int open_posi_date
        {
            get { return _open_posi_date; }

            set
            {
                _open_posi_date = value;
                RaisePropertyChanged(() => open_posi_date);
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

        private double _posi_qty;
        /// <summary>
        /// �ֲ�����
        /// </summary>
        public double posi_qty
        {
            get { return _posi_qty; }

            set
            {
                _posi_qty = value;
                RaisePropertyChanged(() => posi_qty);
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

        private double _pre_settle_qty;
        /// <summary>
        /// ����������
        /// </summary>
        public double pre_settle_qty
        {
            get { return _pre_settle_qty; }

            set
            {
                _pre_settle_qty = value;
                RaisePropertyChanged(() => pre_settle_qty);
            }
        }

        private double _trade_frozen_qty;
        /// <summary>
        /// ���׶�������
        /// </summary>
        public double trade_frozen_qty
        {
            get { return _trade_frozen_qty; }

            set
            {
                _trade_frozen_qty = value;
                RaisePropertyChanged(() => trade_frozen_qty);
            }
        }

        private double _trade_unfroz_qty;
        /// <summary>
        /// ���׽ⶳ����
        /// </summary>
        public double trade_unfroz_qty
        {
            get { return _trade_unfroz_qty; }

            set
            {
                _trade_unfroz_qty = value;
                RaisePropertyChanged(() => trade_unfroz_qty);
            }
        }

        private double _trade_capt_qty;
        /// <summary>
        /// ����ռ������
        /// </summary>
        public double trade_capt_qty
        {
            get { return _trade_capt_qty; }

            set
            {
                _trade_capt_qty = value;
                RaisePropertyChanged(() => trade_capt_qty);
            }
        }

        private double _trade_releas_qty;
        /// <summary>
        /// �����ͷ�����
        /// </summary>
        public double trade_releas_qty
        {
            get { return _trade_releas_qty; }

            set
            {
                _trade_releas_qty = value;
                RaisePropertyChanged(() => trade_releas_qty);
            }
        }

        private double _strike_capt_qty;
        /// <summary>
        /// �ɽ�ռ������
        /// </summary>
        public double strike_capt_qty
        {
            get { return _strike_capt_qty; }

            set
            {
                _strike_capt_qty = value;
                RaisePropertyChanged(() => strike_capt_qty);
            }
        }

        private double _strike_releas_qty;
        /// <summary>
        /// �ɽ��ͷ�����
        /// </summary>
        public double strike_releas_qty
        {
            get { return _strike_releas_qty; }

            set
            {
                _strike_releas_qty = value;
                RaisePropertyChanged(() => strike_releas_qty);
            }
        }

        private double _strike_frozen_qty;
        /// <summary>
        /// �ɽ���������
        /// </summary>
        public double strike_frozen_qty
        {
            get { return _strike_frozen_qty; }

            set
            {
                _strike_frozen_qty = value;
                RaisePropertyChanged(() => strike_frozen_qty);
            }
        }

        private double _strike_unfroz_qty;
        /// <summary>
        /// �ɽ��ⶳ����
        /// </summary>
        public double strike_unfroz_qty
        {
            get { return _strike_unfroz_qty; }

            set
            {
                _strike_unfroz_qty = value;
                RaisePropertyChanged(() => strike_unfroz_qty);
            }
        }

        private double _realize_pandl;
        /// <summary>
        /// ʵ��ӯ��
        /// </summary>
        public double realize_pandl
        {
            get { return _realize_pandl; }

            set
            {
                _realize_pandl = value;
                RaisePropertyChanged(() => realize_pandl);
            }
        }

        private double _cost_amt;
        /// <summary>
        /// �ɱ����
        /// </summary>
        public double cost_amt
        {
            get { return _cost_amt; }

            set
            {
                _cost_amt = value;
                RaisePropertyChanged(() => cost_amt);
            }
        }

        private double _intrst_cost_amt;
        /// <summary>
        /// ��Ϣ�ɱ����
        /// </summary>
        public double intrst_cost_amt
        {
            get { return _intrst_cost_amt; }

            set
            {
                _intrst_cost_amt = value;
                RaisePropertyChanged(() => intrst_cost_amt);
            }
        }

        private double _intrst_pandl;
        /// <summary>
        /// ��Ϣ����
        /// </summary>
        public double intrst_pandl
        {
            get { return _intrst_pandl; }

            set
            {
                _intrst_pandl = value;
                RaisePropertyChanged(() => intrst_pandl);
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

    public class tdsecuL_2_45_Info : ObservableObject
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

        private int _open_posi_date;
        /// <summary>
        /// ��������
        /// </summary>
        public int open_posi_date
        {
            get { return _open_posi_date; }

            set
            {
                _open_posi_date = value;
                RaisePropertyChanged(() => open_posi_date);
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

        private double _posi_qty;
        /// <summary>
        /// �ֲ�����
        /// </summary>
        public double posi_qty
        {
            get { return _posi_qty; }

            set
            {
                _posi_qty = value;
                RaisePropertyChanged(() => posi_qty);
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

        private double _pre_settle_qty;
        /// <summary>
        /// ����������
        /// </summary>
        public double pre_settle_qty
        {
            get { return _pre_settle_qty; }

            set
            {
                _pre_settle_qty = value;
                RaisePropertyChanged(() => pre_settle_qty);
            }
        }

        private double _trade_frozen_qty;
        /// <summary>
        /// ���׶�������
        /// </summary>
        public double trade_frozen_qty
        {
            get { return _trade_frozen_qty; }

            set
            {
                _trade_frozen_qty = value;
                RaisePropertyChanged(() => trade_frozen_qty);
            }
        }

        private double _trade_unfroz_qty;
        /// <summary>
        /// ���׽ⶳ����
        /// </summary>
        public double trade_unfroz_qty
        {
            get { return _trade_unfroz_qty; }

            set
            {
                _trade_unfroz_qty = value;
                RaisePropertyChanged(() => trade_unfroz_qty);
            }
        }

        private double _trade_capt_qty;
        /// <summary>
        /// ����ռ������
        /// </summary>
        public double trade_capt_qty
        {
            get { return _trade_capt_qty; }

            set
            {
                _trade_capt_qty = value;
                RaisePropertyChanged(() => trade_capt_qty);
            }
        }

        private double _trade_releas_qty;
        /// <summary>
        /// �����ͷ�����
        /// </summary>
        public double trade_releas_qty
        {
            get { return _trade_releas_qty; }

            set
            {
                _trade_releas_qty = value;
                RaisePropertyChanged(() => trade_releas_qty);
            }
        }

        private double _strike_capt_qty;
        /// <summary>
        /// �ɽ�ռ������
        /// </summary>
        public double strike_capt_qty
        {
            get { return _strike_capt_qty; }

            set
            {
                _strike_capt_qty = value;
                RaisePropertyChanged(() => strike_capt_qty);
            }
        }

        private double _strike_releas_qty;
        /// <summary>
        /// �ɽ��ͷ�����
        /// </summary>
        public double strike_releas_qty
        {
            get { return _strike_releas_qty; }

            set
            {
                _strike_releas_qty = value;
                RaisePropertyChanged(() => strike_releas_qty);
            }
        }

        private double _strike_frozen_qty;
        /// <summary>
        /// �ɽ���������
        /// </summary>
        public double strike_frozen_qty
        {
            get { return _strike_frozen_qty; }

            set
            {
                _strike_frozen_qty = value;
                RaisePropertyChanged(() => strike_frozen_qty);
            }
        }

        private double _strike_unfroz_qty;
        /// <summary>
        /// �ɽ��ⶳ����
        /// </summary>
        public double strike_unfroz_qty
        {
            get { return _strike_unfroz_qty; }

            set
            {
                _strike_unfroz_qty = value;
                RaisePropertyChanged(() => strike_unfroz_qty);
            }
        }

        private double _realize_pandl;
        /// <summary>
        /// ʵ��ӯ��
        /// </summary>
        public double realize_pandl
        {
            get { return _realize_pandl; }

            set
            {
                _realize_pandl = value;
                RaisePropertyChanged(() => realize_pandl);
            }
        }

        private double _cost_amt;
        /// <summary>
        /// �ɱ����
        /// </summary>
        public double cost_amt
        {
            get { return _cost_amt; }

            set
            {
                _cost_amt = value;
                RaisePropertyChanged(() => cost_amt);
            }
        }

        private double _intrst_cost_amt;
        /// <summary>
        /// ��Ϣ�ɱ����
        /// </summary>
        public double intrst_cost_amt
        {
            get { return _intrst_cost_amt; }

            set
            {
                _intrst_cost_amt = value;
                RaisePropertyChanged(() => intrst_cost_amt);
            }
        }

        private double _intrst_pandl;
        /// <summary>
        /// ��Ϣ����
        /// </summary>
        public double intrst_pandl
        {
            get { return _intrst_pandl; }

            set
            {
                _intrst_pandl = value;
                RaisePropertyChanged(() => intrst_pandl);
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

    public class tdsecuL_2_46_Info : ObservableObject
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

        private int _open_posi_date;
        /// <summary>
        /// ��������
        /// </summary>
        public int open_posi_date
        {
            get { return _open_posi_date; }

            set
            {
                _open_posi_date = value;
                RaisePropertyChanged(() => open_posi_date);
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

        private double _combo_copies;
        /// <summary>
        /// ��Ϸ���
        /// </summary>
        public double combo_copies
        {
            get { return _combo_copies; }

            set
            {
                _combo_copies = value;
                RaisePropertyChanged(() => combo_copies);
            }
        }

        private String _combo_status;
        /// <summary>
        /// ���״̬
        /// </summary>
        public String combo_status
        {
            get { return _combo_status; }

            set
            {
                _combo_status = value;
                RaisePropertyChanged(() => combo_status);
            }
        }

        private double _combo_cost;
        /// <summary>
        /// ��ϳɱ�
        /// </summary>
        public double combo_cost
        {
            get { return _combo_cost; }

            set
            {
                _combo_cost = value;
                RaisePropertyChanged(() => combo_cost);
            }
        }

        private double _combo_market_value;
        /// <summary>
        /// �����ֵ
        /// </summary>
        public double combo_market_value
        {
            get { return _combo_market_value; }

            set
            {
                _combo_market_value = value;
                RaisePropertyChanged(() => combo_market_value);
            }
        }

        private double _realize_pandl;
        /// <summary>
        /// ʵ��ӯ��
        /// </summary>
        public double realize_pandl
        {
            get { return _realize_pandl; }

            set
            {
                _realize_pandl = value;
                RaisePropertyChanged(() => realize_pandl);
            }
        }

        private double _sum_realize_pandl;
        /// <summary>
        /// �ۼ�ʵ��ӯ��
        /// </summary>
        public double sum_realize_pandl
        {
            get { return _sum_realize_pandl; }

            set
            {
                _sum_realize_pandl = value;
                RaisePropertyChanged(() => sum_realize_pandl);
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

    public class tdsecuL_2_47_Info : ObservableObject
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

        private int _open_posi_date;
        /// <summary>
        /// ��������
        /// </summary>
        public int open_posi_date
        {
            get { return _open_posi_date; }

            set
            {
                _open_posi_date = value;
                RaisePropertyChanged(() => open_posi_date);
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

        private double _combo_copies;
        /// <summary>
        /// ��Ϸ���
        /// </summary>
        public double combo_copies
        {
            get { return _combo_copies; }

            set
            {
                _combo_copies = value;
                RaisePropertyChanged(() => combo_copies);
            }
        }

        private String _combo_status;
        /// <summary>
        /// ���״̬
        /// </summary>
        public String combo_status
        {
            get { return _combo_status; }

            set
            {
                _combo_status = value;
                RaisePropertyChanged(() => combo_status);
            }
        }

        private double _combo_cost;
        /// <summary>
        /// ��ϳɱ�
        /// </summary>
        public double combo_cost
        {
            get { return _combo_cost; }

            set
            {
                _combo_cost = value;
                RaisePropertyChanged(() => combo_cost);
            }
        }

        private double _combo_market_value;
        /// <summary>
        /// �����ֵ
        /// </summary>
        public double combo_market_value
        {
            get { return _combo_market_value; }

            set
            {
                _combo_market_value = value;
                RaisePropertyChanged(() => combo_market_value);
            }
        }

        private double _realize_pandl;
        /// <summary>
        /// ʵ��ӯ��
        /// </summary>
        public double realize_pandl
        {
            get { return _realize_pandl; }

            set
            {
                _realize_pandl = value;
                RaisePropertyChanged(() => realize_pandl);
            }
        }

        private double _sum_realize_pandl;
        /// <summary>
        /// �ۼ�ʵ��ӯ��
        /// </summary>
        public double sum_realize_pandl
        {
            get { return _sum_realize_pandl; }

            set
            {
                _sum_realize_pandl = value;
                RaisePropertyChanged(() => sum_realize_pandl);
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

    public class tdsecuL_2_48_Info : ObservableObject
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

        private double _posi_qty;
        /// <summary>
        /// �ֲ�����
        /// </summary>
        public double posi_qty
        {
            get { return _posi_qty; }

            set
            {
                _posi_qty = value;
                RaisePropertyChanged(() => posi_qty);
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

        private double _pre_settle_qty;
        /// <summary>
        /// ����������
        /// </summary>
        public double pre_settle_qty
        {
            get { return _pre_settle_qty; }

            set
            {
                _pre_settle_qty = value;
                RaisePropertyChanged(() => pre_settle_qty);
            }
        }

        private double _trade_frozen_qty;
        /// <summary>
        /// ���׶�������
        /// </summary>
        public double trade_frozen_qty
        {
            get { return _trade_frozen_qty; }

            set
            {
                _trade_frozen_qty = value;
                RaisePropertyChanged(() => trade_frozen_qty);
            }
        }

        private double _trade_unfroz_qty;
        /// <summary>
        /// ���׽ⶳ����
        /// </summary>
        public double trade_unfroz_qty
        {
            get { return _trade_unfroz_qty; }

            set
            {
                _trade_unfroz_qty = value;
                RaisePropertyChanged(() => trade_unfroz_qty);
            }
        }

        private double _trade_capt_qty;
        /// <summary>
        /// ����ռ������
        /// </summary>
        public double trade_capt_qty
        {
            get { return _trade_capt_qty; }

            set
            {
                _trade_capt_qty = value;
                RaisePropertyChanged(() => trade_capt_qty);
            }
        }

        private double _trade_releas_qty;
        /// <summary>
        /// �����ͷ�����
        /// </summary>
        public double trade_releas_qty
        {
            get { return _trade_releas_qty; }

            set
            {
                _trade_releas_qty = value;
                RaisePropertyChanged(() => trade_releas_qty);
            }
        }

        private double _strike_capt_qty;
        /// <summary>
        /// �ɽ�ռ������
        /// </summary>
        public double strike_capt_qty
        {
            get { return _strike_capt_qty; }

            set
            {
                _strike_capt_qty = value;
                RaisePropertyChanged(() => strike_capt_qty);
            }
        }

        private double _strike_releas_qty;
        /// <summary>
        /// �ɽ��ͷ�����
        /// </summary>
        public double strike_releas_qty
        {
            get { return _strike_releas_qty; }

            set
            {
                _strike_releas_qty = value;
                RaisePropertyChanged(() => strike_releas_qty);
            }
        }

        private double _strike_frozen_qty;
        /// <summary>
        /// �ɽ���������
        /// </summary>
        public double strike_frozen_qty
        {
            get { return _strike_frozen_qty; }

            set
            {
                _strike_frozen_qty = value;
                RaisePropertyChanged(() => strike_frozen_qty);
            }
        }

        private double _strike_unfroz_qty;
        /// <summary>
        /// �ɽ��ⶳ����
        /// </summary>
        public double strike_unfroz_qty
        {
            get { return _strike_unfroz_qty; }

            set
            {
                _strike_unfroz_qty = value;
                RaisePropertyChanged(() => strike_unfroz_qty);
            }
        }

        private double _realize_pandl;
        /// <summary>
        /// ʵ��ӯ��
        /// </summary>
        public double realize_pandl
        {
            get { return _realize_pandl; }

            set
            {
                _realize_pandl = value;
                RaisePropertyChanged(() => realize_pandl);
            }
        }

        private double _cost_amt;
        /// <summary>
        /// �ɱ����
        /// </summary>
        public double cost_amt
        {
            get { return _cost_amt; }

            set
            {
                _cost_amt = value;
                RaisePropertyChanged(() => cost_amt);
            }
        }

        private double _intrst_cost_amt;
        /// <summary>
        /// ��Ϣ�ɱ����
        /// </summary>
        public double intrst_cost_amt
        {
            get { return _intrst_cost_amt; }

            set
            {
                _intrst_cost_amt = value;
                RaisePropertyChanged(() => intrst_cost_amt);
            }
        }

        private double _intrst_pandl;
        /// <summary>
        /// ��Ϣ����
        /// </summary>
        public double intrst_pandl
        {
            get { return _intrst_pandl; }

            set
            {
                _intrst_pandl = value;
                RaisePropertyChanged(() => intrst_pandl);
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

    public class tdsecuL_2_49_Info : ObservableObject
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

        private double _posi_qty;
        /// <summary>
        /// �ֲ�����
        /// </summary>
        public double posi_qty
        {
            get { return _posi_qty; }

            set
            {
                _posi_qty = value;
                RaisePropertyChanged(() => posi_qty);
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

        private double _pre_settle_qty;
        /// <summary>
        /// ����������
        /// </summary>
        public double pre_settle_qty
        {
            get { return _pre_settle_qty; }

            set
            {
                _pre_settle_qty = value;
                RaisePropertyChanged(() => pre_settle_qty);
            }
        }

        private double _trade_frozen_qty;
        /// <summary>
        /// ���׶�������
        /// </summary>
        public double trade_frozen_qty
        {
            get { return _trade_frozen_qty; }

            set
            {
                _trade_frozen_qty = value;
                RaisePropertyChanged(() => trade_frozen_qty);
            }
        }

        private double _trade_unfroz_qty;
        /// <summary>
        /// ���׽ⶳ����
        /// </summary>
        public double trade_unfroz_qty
        {
            get { return _trade_unfroz_qty; }

            set
            {
                _trade_unfroz_qty = value;
                RaisePropertyChanged(() => trade_unfroz_qty);
            }
        }

        private double _trade_capt_qty;
        /// <summary>
        /// ����ռ������
        /// </summary>
        public double trade_capt_qty
        {
            get { return _trade_capt_qty; }

            set
            {
                _trade_capt_qty = value;
                RaisePropertyChanged(() => trade_capt_qty);
            }
        }

        private double _trade_releas_qty;
        /// <summary>
        /// �����ͷ�����
        /// </summary>
        public double trade_releas_qty
        {
            get { return _trade_releas_qty; }

            set
            {
                _trade_releas_qty = value;
                RaisePropertyChanged(() => trade_releas_qty);
            }
        }

        private double _strike_capt_qty;
        /// <summary>
        /// �ɽ�ռ������
        /// </summary>
        public double strike_capt_qty
        {
            get { return _strike_capt_qty; }

            set
            {
                _strike_capt_qty = value;
                RaisePropertyChanged(() => strike_capt_qty);
            }
        }

        private double _strike_releas_qty;
        /// <summary>
        /// �ɽ��ͷ�����
        /// </summary>
        public double strike_releas_qty
        {
            get { return _strike_releas_qty; }

            set
            {
                _strike_releas_qty = value;
                RaisePropertyChanged(() => strike_releas_qty);
            }
        }

        private double _strike_frozen_qty;
        /// <summary>
        /// �ɽ���������
        /// </summary>
        public double strike_frozen_qty
        {
            get { return _strike_frozen_qty; }

            set
            {
                _strike_frozen_qty = value;
                RaisePropertyChanged(() => strike_frozen_qty);
            }
        }

        private double _strike_unfroz_qty;
        /// <summary>
        /// �ɽ��ⶳ����
        /// </summary>
        public double strike_unfroz_qty
        {
            get { return _strike_unfroz_qty; }

            set
            {
                _strike_unfroz_qty = value;
                RaisePropertyChanged(() => strike_unfroz_qty);
            }
        }

        private double _realize_pandl;
        /// <summary>
        /// ʵ��ӯ��
        /// </summary>
        public double realize_pandl
        {
            get { return _realize_pandl; }

            set
            {
                _realize_pandl = value;
                RaisePropertyChanged(() => realize_pandl);
            }
        }

        private double _cost_amt;
        /// <summary>
        /// �ɱ����
        /// </summary>
        public double cost_amt
        {
            get { return _cost_amt; }

            set
            {
                _cost_amt = value;
                RaisePropertyChanged(() => cost_amt);
            }
        }

        private double _intrst_cost_amt;
        /// <summary>
        /// ��Ϣ�ɱ����
        /// </summary>
        public double intrst_cost_amt
        {
            get { return _intrst_cost_amt; }

            set
            {
                _intrst_cost_amt = value;
                RaisePropertyChanged(() => intrst_cost_amt);
            }
        }

        private double _intrst_pandl;
        /// <summary>
        /// ��Ϣ����
        /// </summary>
        public double intrst_pandl
        {
            get { return _intrst_pandl; }

            set
            {
                _intrst_pandl = value;
                RaisePropertyChanged(() => intrst_pandl);
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

    public class tdsecuL_2_50_Info : ObservableObject
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

        private double _combo_copies;
        /// <summary>
        /// ��Ϸ���
        /// </summary>
        public double combo_copies
        {
            get { return _combo_copies; }

            set
            {
                _combo_copies = value;
                RaisePropertyChanged(() => combo_copies);
            }
        }

        private String _combo_status;
        /// <summary>
        /// ���״̬
        /// </summary>
        public String combo_status
        {
            get { return _combo_status; }

            set
            {
                _combo_status = value;
                RaisePropertyChanged(() => combo_status);
            }
        }

        private double _combo_cost;
        /// <summary>
        /// ��ϳɱ�
        /// </summary>
        public double combo_cost
        {
            get { return _combo_cost; }

            set
            {
                _combo_cost = value;
                RaisePropertyChanged(() => combo_cost);
            }
        }

        private double _combo_market_value;
        /// <summary>
        /// �����ֵ
        /// </summary>
        public double combo_market_value
        {
            get { return _combo_market_value; }

            set
            {
                _combo_market_value = value;
                RaisePropertyChanged(() => combo_market_value);
            }
        }

        private double _realize_pandl;
        /// <summary>
        /// ʵ��ӯ��
        /// </summary>
        public double realize_pandl
        {
            get { return _realize_pandl; }

            set
            {
                _realize_pandl = value;
                RaisePropertyChanged(() => realize_pandl);
            }
        }

        private double _sum_realize_pandl;
        /// <summary>
        /// �ۼ�ʵ��ӯ��
        /// </summary>
        public double sum_realize_pandl
        {
            get { return _sum_realize_pandl; }

            set
            {
                _sum_realize_pandl = value;
                RaisePropertyChanged(() => sum_realize_pandl);
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

    public class tdsecuL_2_60_Info : ObservableObject
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

        private double _combo_copies;
        /// <summary>
        /// ��Ϸ���
        /// </summary>
        public double combo_copies
        {
            get { return _combo_copies; }

            set
            {
                _combo_copies = value;
                RaisePropertyChanged(() => combo_copies);
            }
        }

        private String _combo_status;
        /// <summary>
        /// ���״̬
        /// </summary>
        public String combo_status
        {
            get { return _combo_status; }

            set
            {
                _combo_status = value;
                RaisePropertyChanged(() => combo_status);
            }
        }

        private double _combo_cost;
        /// <summary>
        /// ��ϳɱ�
        /// </summary>
        public double combo_cost
        {
            get { return _combo_cost; }

            set
            {
                _combo_cost = value;
                RaisePropertyChanged(() => combo_cost);
            }
        }

        private double _combo_market_value;
        /// <summary>
        /// �����ֵ
        /// </summary>
        public double combo_market_value
        {
            get { return _combo_market_value; }

            set
            {
                _combo_market_value = value;
                RaisePropertyChanged(() => combo_market_value);
            }
        }

        private double _realize_pandl;
        /// <summary>
        /// ʵ��ӯ��
        /// </summary>
        public double realize_pandl
        {
            get { return _realize_pandl; }

            set
            {
                _realize_pandl = value;
                RaisePropertyChanged(() => realize_pandl);
            }
        }

        private double _sum_realize_pandl;
        /// <summary>
        /// �ۼ�ʵ��ӯ��
        /// </summary>
        public double sum_realize_pandl
        {
            get { return _sum_realize_pandl; }

            set
            {
                _sum_realize_pandl = value;
                RaisePropertyChanged(() => sum_realize_pandl);
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

    public class tdsecuL_2_61_Info : ObservableObject
    {

        private double _stat_qty;
        /// <summary>
        /// ͳ������
        /// </summary>
        public double stat_qty
        {
            get { return _stat_qty; }

            set
            {
                _stat_qty = value;
                RaisePropertyChanged(() => stat_qty);
            }
        }
    }

    public class tdsecuL_2_62_Info : ObservableObject
    {
    }

    public class tdsecuL_2_63_Info : ObservableObject
    {
    }

    public class tdsecuL_2_64_Info : ObservableObject
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

        private double _converted_margin;
        /// <summary>
        /// ������㱣֤��
        /// </summary>
        public double converted_margin
        {
            get { return _converted_margin; }

            set
            {
                _converted_margin = value;
                RaisePropertyChanged(() => converted_margin);
            }
        }

        private double _fina_converted_pandl;
        /// <summary>
        /// ��������ӯ��
        /// </summary>
        public double fina_converted_pandl
        {
            get { return _fina_converted_pandl; }

            set
            {
                _fina_converted_pandl = value;
                RaisePropertyChanged(() => fina_converted_pandl);
            }
        }

        private double _loan_converted_pandl;
        /// <summary>
        /// ��ȯ����ӯ��
        /// </summary>
        public double loan_converted_pandl
        {
            get { return _loan_converted_pandl; }

            set
            {
                _loan_converted_pandl = value;
                RaisePropertyChanged(() => loan_converted_pandl);
            }
        }

        private double _fina_capt_margin;
        /// <summary>
        /// ����ռ�ñ�֤��
        /// </summary>
        public double fina_capt_margin
        {
            get { return _fina_capt_margin; }

            set
            {
                _fina_capt_margin = value;
                RaisePropertyChanged(() => fina_capt_margin);
            }
        }

        private double _loan_capt_margin;
        /// <summary>
        /// ��ȯռ�ñ�֤��
        /// </summary>
        public double loan_capt_margin
        {
            get { return _loan_capt_margin; }

            set
            {
                _loan_capt_margin = value;
                RaisePropertyChanged(() => loan_capt_margin);
            }
        }

        private double _keep_guarantee_ratio;
        /// <summary>
        /// ά�ֵ�������
        /// </summary>
        public double keep_guarantee_ratio
        {
            get { return _keep_guarantee_ratio; }

            set
            {
                _keep_guarantee_ratio = value;
                RaisePropertyChanged(() => keep_guarantee_ratio);
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

    public class tdsecuL_2_65_Info : ObservableObject
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

        private double _converted_margin;
        /// <summary>
        /// ������㱣֤��
        /// </summary>
        public double converted_margin
        {
            get { return _converted_margin; }

            set
            {
                _converted_margin = value;
                RaisePropertyChanged(() => converted_margin);
            }
        }

        private double _fina_converted_pandl;
        /// <summary>
        /// ��������ӯ��
        /// </summary>
        public double fina_converted_pandl
        {
            get { return _fina_converted_pandl; }

            set
            {
                _fina_converted_pandl = value;
                RaisePropertyChanged(() => fina_converted_pandl);
            }
        }

        private double _loan_converted_pandl;
        /// <summary>
        /// ��ȯ����ӯ��
        /// </summary>
        public double loan_converted_pandl
        {
            get { return _loan_converted_pandl; }

            set
            {
                _loan_converted_pandl = value;
                RaisePropertyChanged(() => loan_converted_pandl);
            }
        }

        private double _fina_capt_margin;
        /// <summary>
        /// ����ռ�ñ�֤��
        /// </summary>
        public double fina_capt_margin
        {
            get { return _fina_capt_margin; }

            set
            {
                _fina_capt_margin = value;
                RaisePropertyChanged(() => fina_capt_margin);
            }
        }

        private double _loan_capt_margin;
        /// <summary>
        /// ��ȯռ�ñ�֤��
        /// </summary>
        public double loan_capt_margin
        {
            get { return _loan_capt_margin; }

            set
            {
                _loan_capt_margin = value;
                RaisePropertyChanged(() => loan_capt_margin);
            }
        }

        private double _keep_guarantee_ratio;
        /// <summary>
        /// ά�ֵ�������
        /// </summary>
        public double keep_guarantee_ratio
        {
            get { return _keep_guarantee_ratio; }

            set
            {
                _keep_guarantee_ratio = value;
                RaisePropertyChanged(() => keep_guarantee_ratio);
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

    public class tdsecuL_2_66_Info : ObservableObject
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

        private double _debt_loan_sell_strike_amt;
        /// <summary>
        /// ��ծ��ȯ�����ɽ����
        /// </summary>
        public double debt_loan_sell_strike_amt
        {
            get { return _debt_loan_sell_strike_amt; }

            set
            {
                _debt_loan_sell_strike_amt = value;
                RaisePropertyChanged(() => debt_loan_sell_strike_amt);
            }
        }

        private double _debt_strike_fee;
        /// <summary>
        /// ��ծ�ɽ�����
        /// </summary>
        public double debt_strike_fee
        {
            get { return _debt_strike_fee; }

            set
            {
                _debt_strike_fee = value;
                RaisePropertyChanged(() => debt_strike_fee);
            }
        }

        private double _loan_return_strike_amt;
        /// <summary>
        /// ��ȯ�黹�ɽ����
        /// </summary>
        public double loan_return_strike_amt
        {
            get { return _loan_return_strike_amt; }

            set
            {
                _loan_return_strike_amt = value;
                RaisePropertyChanged(() => loan_return_strike_amt);
            }
        }

        private double _loan_return_order_amt;
        /// <summary>
        /// ��ȯ�黹�������
        /// </summary>
        public double loan_return_order_amt
        {
            get { return _loan_return_order_amt; }

            set
            {
                _loan_return_order_amt = value;
                RaisePropertyChanged(() => loan_return_order_amt);
            }
        }

        private double _loan_return_comm_amt;
        /// <summary>
        /// ��ȯ�黹ָ����
        /// </summary>
        public double loan_return_comm_amt
        {
            get { return _loan_return_comm_amt; }

            set
            {
                _loan_return_comm_amt = value;
                RaisePropertyChanged(() => loan_return_comm_amt);
            }
        }

        private double _return_strike_fee;
        /// <summary>
        /// �黹�ɽ�����
        /// </summary>
        public double return_strike_fee
        {
            get { return _return_strike_fee; }

            set
            {
                _return_strike_fee = value;
                RaisePropertyChanged(() => return_strike_fee);
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

    public class tdsecuL_2_67_Info : ObservableObject
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

        private double _debt_loan_sell_strike_amt;
        /// <summary>
        /// ��ծ��ȯ�����ɽ����
        /// </summary>
        public double debt_loan_sell_strike_amt
        {
            get { return _debt_loan_sell_strike_amt; }

            set
            {
                _debt_loan_sell_strike_amt = value;
                RaisePropertyChanged(() => debt_loan_sell_strike_amt);
            }
        }

        private double _debt_strike_fee;
        /// <summary>
        /// ��ծ�ɽ�����
        /// </summary>
        public double debt_strike_fee
        {
            get { return _debt_strike_fee; }

            set
            {
                _debt_strike_fee = value;
                RaisePropertyChanged(() => debt_strike_fee);
            }
        }

        private double _loan_return_strike_amt;
        /// <summary>
        /// ��ȯ�黹�ɽ����
        /// </summary>
        public double loan_return_strike_amt
        {
            get { return _loan_return_strike_amt; }

            set
            {
                _loan_return_strike_amt = value;
                RaisePropertyChanged(() => loan_return_strike_amt);
            }
        }

        private double _loan_return_order_amt;
        /// <summary>
        /// ��ȯ�黹�������
        /// </summary>
        public double loan_return_order_amt
        {
            get { return _loan_return_order_amt; }

            set
            {
                _loan_return_order_amt = value;
                RaisePropertyChanged(() => loan_return_order_amt);
            }
        }

        private double _loan_return_comm_amt;
        /// <summary>
        /// ��ȯ�黹ָ����
        /// </summary>
        public double loan_return_comm_amt
        {
            get { return _loan_return_comm_amt; }

            set
            {
                _loan_return_comm_amt = value;
                RaisePropertyChanged(() => loan_return_comm_amt);
            }
        }

        private double _return_strike_fee;
        /// <summary>
        /// �黹�ɽ�����
        /// </summary>
        public double return_strike_fee
        {
            get { return _return_strike_fee; }

            set
            {
                _return_strike_fee = value;
                RaisePropertyChanged(() => return_strike_fee);
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

    public class tdsecuL_2_68_Info : ObservableObject
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

        private int _invest_type;
        /// <summary>
        /// Ͷ������
        /// </summary>
        public int invest_type
        {
            get { return _invest_type; }

            set
            {
                _invest_type = value;
                RaisePropertyChanged(() => invest_type);
            }
        }

        private int _debt_type;
        /// <summary>
        /// ��ծ����
        /// </summary>
        public int debt_type
        {
            get { return _debt_type; }

            set
            {
                _debt_type = value;
                RaisePropertyChanged(() => debt_type);
            }
        }

        private double _debt_fina_buy_strike_qty;
        /// <summary>
        /// ��ծ��������ɽ�����
        /// </summary>
        public double debt_fina_buy_strike_qty
        {
            get { return _debt_fina_buy_strike_qty; }

            set
            {
                _debt_fina_buy_strike_qty = value;
                RaisePropertyChanged(() => debt_fina_buy_strike_qty);
            }
        }

        private double _fina_return_strike_qty;
        /// <summary>
        /// ���ʹ黹�ɽ�����
        /// </summary>
        public double fina_return_strike_qty
        {
            get { return _fina_return_strike_qty; }

            set
            {
                _fina_return_strike_qty = value;
                RaisePropertyChanged(() => fina_return_strike_qty);
            }
        }

        private double _debt_loan_sell_strike_qty;
        /// <summary>
        /// ��ծ��ȯ�����ɽ�����
        /// </summary>
        public double debt_loan_sell_strike_qty
        {
            get { return _debt_loan_sell_strike_qty; }

            set
            {
                _debt_loan_sell_strike_qty = value;
                RaisePropertyChanged(() => debt_loan_sell_strike_qty);
            }
        }

        private double _loan_return_strike_qty;
        /// <summary>
        /// ��ȯ�黹�ɽ�����
        /// </summary>
        public double loan_return_strike_qty
        {
            get { return _loan_return_strike_qty; }

            set
            {
                _loan_return_strike_qty = value;
                RaisePropertyChanged(() => loan_return_strike_qty);
            }
        }

        private double _debt_fina_buy_order_qty;
        /// <summary>
        /// ��ծ�������붩������
        /// </summary>
        public double debt_fina_buy_order_qty
        {
            get { return _debt_fina_buy_order_qty; }

            set
            {
                _debt_fina_buy_order_qty = value;
                RaisePropertyChanged(() => debt_fina_buy_order_qty);
            }
        }

        private double _fina_return_order_qty;
        /// <summary>
        /// ���ʹ黹��������
        /// </summary>
        public double fina_return_order_qty
        {
            get { return _fina_return_order_qty; }

            set
            {
                _fina_return_order_qty = value;
                RaisePropertyChanged(() => fina_return_order_qty);
            }
        }

        private double _debt_loan_sell_order_qty;
        /// <summary>
        /// ��ծ��ȯ������������
        /// </summary>
        public double debt_loan_sell_order_qty
        {
            get { return _debt_loan_sell_order_qty; }

            set
            {
                _debt_loan_sell_order_qty = value;
                RaisePropertyChanged(() => debt_loan_sell_order_qty);
            }
        }

        private double _loan_return_order_qty;
        /// <summary>
        /// ��ȯ�黹��������
        /// </summary>
        public double loan_return_order_qty
        {
            get { return _loan_return_order_qty; }

            set
            {
                _loan_return_order_qty = value;
                RaisePropertyChanged(() => loan_return_order_qty);
            }
        }

        private double _debt_fina_buy_comm_qty;
        /// <summary>
        /// ��ծ��������ָ������
        /// </summary>
        public double debt_fina_buy_comm_qty
        {
            get { return _debt_fina_buy_comm_qty; }

            set
            {
                _debt_fina_buy_comm_qty = value;
                RaisePropertyChanged(() => debt_fina_buy_comm_qty);
            }
        }

        private double _fina_return_comm_qty;
        /// <summary>
        /// ���ʹ黹ָ������
        /// </summary>
        public double fina_return_comm_qty
        {
            get { return _fina_return_comm_qty; }

            set
            {
                _fina_return_comm_qty = value;
                RaisePropertyChanged(() => fina_return_comm_qty);
            }
        }

        private double _debt_loan_sell_comm_qty;
        /// <summary>
        /// ��ծ��ȯ����ָ������
        /// </summary>
        public double debt_loan_sell_comm_qty
        {
            get { return _debt_loan_sell_comm_qty; }

            set
            {
                _debt_loan_sell_comm_qty = value;
                RaisePropertyChanged(() => debt_loan_sell_comm_qty);
            }
        }

        private double _loan_return_comm_qty;
        /// <summary>
        /// ��ȯ�黹ָ������
        /// </summary>
        public double loan_return_comm_qty
        {
            get { return _loan_return_comm_qty; }

            set
            {
                _loan_return_comm_qty = value;
                RaisePropertyChanged(() => loan_return_comm_qty);
            }
        }

        private double _debt_fina_buy_strike_amt;
        /// <summary>
        /// ��ծ��������ɽ����
        /// </summary>
        public double debt_fina_buy_strike_amt
        {
            get { return _debt_fina_buy_strike_amt; }

            set
            {
                _debt_fina_buy_strike_amt = value;
                RaisePropertyChanged(() => debt_fina_buy_strike_amt);
            }
        }

        private double _fina_return_strike_amt;
        /// <summary>
        /// ���ʹ黹�ɽ����
        /// </summary>
        public double fina_return_strike_amt
        {
            get { return _fina_return_strike_amt; }

            set
            {
                _fina_return_strike_amt = value;
                RaisePropertyChanged(() => fina_return_strike_amt);
            }
        }

        private double _debt_loan_sell_strike_amt;
        /// <summary>
        /// ��ծ��ȯ�����ɽ����
        /// </summary>
        public double debt_loan_sell_strike_amt
        {
            get { return _debt_loan_sell_strike_amt; }

            set
            {
                _debt_loan_sell_strike_amt = value;
                RaisePropertyChanged(() => debt_loan_sell_strike_amt);
            }
        }

        private double _loan_return_strike_amt;
        /// <summary>
        /// ��ȯ�黹�ɽ����
        /// </summary>
        public double loan_return_strike_amt
        {
            get { return _loan_return_strike_amt; }

            set
            {
                _loan_return_strike_amt = value;
                RaisePropertyChanged(() => loan_return_strike_amt);
            }
        }

        private double _debt_fina_buy_order_amt;
        /// <summary>
        /// ��ծ�������붩�����
        /// </summary>
        public double debt_fina_buy_order_amt
        {
            get { return _debt_fina_buy_order_amt; }

            set
            {
                _debt_fina_buy_order_amt = value;
                RaisePropertyChanged(() => debt_fina_buy_order_amt);
            }
        }

        private double _fina_return_order_amt;
        /// <summary>
        /// ���ʹ黹�������
        /// </summary>
        public double fina_return_order_amt
        {
            get { return _fina_return_order_amt; }

            set
            {
                _fina_return_order_amt = value;
                RaisePropertyChanged(() => fina_return_order_amt);
            }
        }

        private double _debt_loan_sell_order_amt;
        /// <summary>
        /// ��ծ��ȯ�����������
        /// </summary>
        public double debt_loan_sell_order_amt
        {
            get { return _debt_loan_sell_order_amt; }

            set
            {
                _debt_loan_sell_order_amt = value;
                RaisePropertyChanged(() => debt_loan_sell_order_amt);
            }
        }

        private double _loan_return_order_amt;
        /// <summary>
        /// ��ȯ�黹�������
        /// </summary>
        public double loan_return_order_amt
        {
            get { return _loan_return_order_amt; }

            set
            {
                _loan_return_order_amt = value;
                RaisePropertyChanged(() => loan_return_order_amt);
            }
        }

        private double _debt_fina_buy_comm_amt;
        /// <summary>
        /// ��ծ��������ָ����
        /// </summary>
        public double debt_fina_buy_comm_amt
        {
            get { return _debt_fina_buy_comm_amt; }

            set
            {
                _debt_fina_buy_comm_amt = value;
                RaisePropertyChanged(() => debt_fina_buy_comm_amt);
            }
        }

        private double _fina_return_comm_amt;
        /// <summary>
        /// ���ʹ黹ָ����
        /// </summary>
        public double fina_return_comm_amt
        {
            get { return _fina_return_comm_amt; }

            set
            {
                _fina_return_comm_amt = value;
                RaisePropertyChanged(() => fina_return_comm_amt);
            }
        }

        private double _debt_loan_sell_comm_amt;
        /// <summary>
        /// ��ծ��ȯ����ָ����
        /// </summary>
        public double debt_loan_sell_comm_amt
        {
            get { return _debt_loan_sell_comm_amt; }

            set
            {
                _debt_loan_sell_comm_amt = value;
                RaisePropertyChanged(() => debt_loan_sell_comm_amt);
            }
        }

        private double _loan_return_comm_amt;
        /// <summary>
        /// ��ȯ�黹ָ����
        /// </summary>
        public double loan_return_comm_amt
        {
            get { return _loan_return_comm_amt; }

            set
            {
                _loan_return_comm_amt = value;
                RaisePropertyChanged(() => loan_return_comm_amt);
            }
        }

        private double _debt_strike_fee;
        /// <summary>
        /// ��ծ�ɽ�����
        /// </summary>
        public double debt_strike_fee
        {
            get { return _debt_strike_fee; }

            set
            {
                _debt_strike_fee = value;
                RaisePropertyChanged(() => debt_strike_fee);
            }
        }

        private double _return_strike_fee;
        /// <summary>
        /// �黹�ɽ�����
        /// </summary>
        public double return_strike_fee
        {
            get { return _return_strike_fee; }

            set
            {
                _return_strike_fee = value;
                RaisePropertyChanged(() => return_strike_fee);
            }
        }

        private double _debt_interest;
        /// <summary>
        /// ��ծ��Ϣ
        /// </summary>
        public double debt_interest
        {
            get { return _debt_interest; }

            set
            {
                _debt_interest = value;
                RaisePropertyChanged(() => debt_interest);
            }
        }

        private double _return_interest_amt;
        /// <summary>
        /// �黹��Ϣ���
        /// </summary>
        public double return_interest_amt
        {
            get { return _return_interest_amt; }

            set
            {
                _return_interest_amt = value;
                RaisePropertyChanged(() => return_interest_amt);
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

    public class tdsecuL_2_69_Info : ObservableObject
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

        private int _invest_type;
        /// <summary>
        /// Ͷ������
        /// </summary>
        public int invest_type
        {
            get { return _invest_type; }

            set
            {
                _invest_type = value;
                RaisePropertyChanged(() => invest_type);
            }
        }

        private int _debt_type;
        /// <summary>
        /// ��ծ����
        /// </summary>
        public int debt_type
        {
            get { return _debt_type; }

            set
            {
                _debt_type = value;
                RaisePropertyChanged(() => debt_type);
            }
        }

        private double _debt_fina_buy_strike_qty;
        /// <summary>
        /// ��ծ��������ɽ�����
        /// </summary>
        public double debt_fina_buy_strike_qty
        {
            get { return _debt_fina_buy_strike_qty; }

            set
            {
                _debt_fina_buy_strike_qty = value;
                RaisePropertyChanged(() => debt_fina_buy_strike_qty);
            }
        }

        private double _fina_return_strike_qty;
        /// <summary>
        /// ���ʹ黹�ɽ�����
        /// </summary>
        public double fina_return_strike_qty
        {
            get { return _fina_return_strike_qty; }

            set
            {
                _fina_return_strike_qty = value;
                RaisePropertyChanged(() => fina_return_strike_qty);
            }
        }

        private double _debt_loan_sell_strike_qty;
        /// <summary>
        /// ��ծ��ȯ�����ɽ�����
        /// </summary>
        public double debt_loan_sell_strike_qty
        {
            get { return _debt_loan_sell_strike_qty; }

            set
            {
                _debt_loan_sell_strike_qty = value;
                RaisePropertyChanged(() => debt_loan_sell_strike_qty);
            }
        }

        private double _loan_return_strike_qty;
        /// <summary>
        /// ��ȯ�黹�ɽ�����
        /// </summary>
        public double loan_return_strike_qty
        {
            get { return _loan_return_strike_qty; }

            set
            {
                _loan_return_strike_qty = value;
                RaisePropertyChanged(() => loan_return_strike_qty);
            }
        }

        private double _debt_fina_buy_order_qty;
        /// <summary>
        /// ��ծ�������붩������
        /// </summary>
        public double debt_fina_buy_order_qty
        {
            get { return _debt_fina_buy_order_qty; }

            set
            {
                _debt_fina_buy_order_qty = value;
                RaisePropertyChanged(() => debt_fina_buy_order_qty);
            }
        }

        private double _fina_return_order_qty;
        /// <summary>
        /// ���ʹ黹��������
        /// </summary>
        public double fina_return_order_qty
        {
            get { return _fina_return_order_qty; }

            set
            {
                _fina_return_order_qty = value;
                RaisePropertyChanged(() => fina_return_order_qty);
            }
        }

        private double _debt_loan_sell_order_qty;
        /// <summary>
        /// ��ծ��ȯ������������
        /// </summary>
        public double debt_loan_sell_order_qty
        {
            get { return _debt_loan_sell_order_qty; }

            set
            {
                _debt_loan_sell_order_qty = value;
                RaisePropertyChanged(() => debt_loan_sell_order_qty);
            }
        }

        private double _loan_return_order_qty;
        /// <summary>
        /// ��ȯ�黹��������
        /// </summary>
        public double loan_return_order_qty
        {
            get { return _loan_return_order_qty; }

            set
            {
                _loan_return_order_qty = value;
                RaisePropertyChanged(() => loan_return_order_qty);
            }
        }

        private double _debt_fina_buy_comm_qty;
        /// <summary>
        /// ��ծ��������ָ������
        /// </summary>
        public double debt_fina_buy_comm_qty
        {
            get { return _debt_fina_buy_comm_qty; }

            set
            {
                _debt_fina_buy_comm_qty = value;
                RaisePropertyChanged(() => debt_fina_buy_comm_qty);
            }
        }

        private double _fina_return_comm_qty;
        /// <summary>
        /// ���ʹ黹ָ������
        /// </summary>
        public double fina_return_comm_qty
        {
            get { return _fina_return_comm_qty; }

            set
            {
                _fina_return_comm_qty = value;
                RaisePropertyChanged(() => fina_return_comm_qty);
            }
        }

        private double _debt_loan_sell_comm_qty;
        /// <summary>
        /// ��ծ��ȯ����ָ������
        /// </summary>
        public double debt_loan_sell_comm_qty
        {
            get { return _debt_loan_sell_comm_qty; }

            set
            {
                _debt_loan_sell_comm_qty = value;
                RaisePropertyChanged(() => debt_loan_sell_comm_qty);
            }
        }

        private double _loan_return_comm_qty;
        /// <summary>
        /// ��ȯ�黹ָ������
        /// </summary>
        public double loan_return_comm_qty
        {
            get { return _loan_return_comm_qty; }

            set
            {
                _loan_return_comm_qty = value;
                RaisePropertyChanged(() => loan_return_comm_qty);
            }
        }

        private double _debt_fina_buy_strike_amt;
        /// <summary>
        /// ��ծ��������ɽ����
        /// </summary>
        public double debt_fina_buy_strike_amt
        {
            get { return _debt_fina_buy_strike_amt; }

            set
            {
                _debt_fina_buy_strike_amt = value;
                RaisePropertyChanged(() => debt_fina_buy_strike_amt);
            }
        }

        private double _fina_return_strike_amt;
        /// <summary>
        /// ���ʹ黹�ɽ����
        /// </summary>
        public double fina_return_strike_amt
        {
            get { return _fina_return_strike_amt; }

            set
            {
                _fina_return_strike_amt = value;
                RaisePropertyChanged(() => fina_return_strike_amt);
            }
        }

        private double _debt_loan_sell_strike_amt;
        /// <summary>
        /// ��ծ��ȯ�����ɽ����
        /// </summary>
        public double debt_loan_sell_strike_amt
        {
            get { return _debt_loan_sell_strike_amt; }

            set
            {
                _debt_loan_sell_strike_amt = value;
                RaisePropertyChanged(() => debt_loan_sell_strike_amt);
            }
        }

        private double _loan_return_strike_amt;
        /// <summary>
        /// ��ȯ�黹�ɽ����
        /// </summary>
        public double loan_return_strike_amt
        {
            get { return _loan_return_strike_amt; }

            set
            {
                _loan_return_strike_amt = value;
                RaisePropertyChanged(() => loan_return_strike_amt);
            }
        }

        private double _debt_fina_buy_order_amt;
        /// <summary>
        /// ��ծ�������붩�����
        /// </summary>
        public double debt_fina_buy_order_amt
        {
            get { return _debt_fina_buy_order_amt; }

            set
            {
                _debt_fina_buy_order_amt = value;
                RaisePropertyChanged(() => debt_fina_buy_order_amt);
            }
        }

        private double _fina_return_order_amt;
        /// <summary>
        /// ���ʹ黹�������
        /// </summary>
        public double fina_return_order_amt
        {
            get { return _fina_return_order_amt; }

            set
            {
                _fina_return_order_amt = value;
                RaisePropertyChanged(() => fina_return_order_amt);
            }
        }

        private double _debt_loan_sell_order_amt;
        /// <summary>
        /// ��ծ��ȯ�����������
        /// </summary>
        public double debt_loan_sell_order_amt
        {
            get { return _debt_loan_sell_order_amt; }

            set
            {
                _debt_loan_sell_order_amt = value;
                RaisePropertyChanged(() => debt_loan_sell_order_amt);
            }
        }

        private double _loan_return_order_amt;
        /// <summary>
        /// ��ȯ�黹�������
        /// </summary>
        public double loan_return_order_amt
        {
            get { return _loan_return_order_amt; }

            set
            {
                _loan_return_order_amt = value;
                RaisePropertyChanged(() => loan_return_order_amt);
            }
        }

        private double _debt_fina_buy_comm_amt;
        /// <summary>
        /// ��ծ��������ָ����
        /// </summary>
        public double debt_fina_buy_comm_amt
        {
            get { return _debt_fina_buy_comm_amt; }

            set
            {
                _debt_fina_buy_comm_amt = value;
                RaisePropertyChanged(() => debt_fina_buy_comm_amt);
            }
        }

        private double _fina_return_comm_amt;
        /// <summary>
        /// ���ʹ黹ָ����
        /// </summary>
        public double fina_return_comm_amt
        {
            get { return _fina_return_comm_amt; }

            set
            {
                _fina_return_comm_amt = value;
                RaisePropertyChanged(() => fina_return_comm_amt);
            }
        }

        private double _debt_loan_sell_comm_amt;
        /// <summary>
        /// ��ծ��ȯ����ָ����
        /// </summary>
        public double debt_loan_sell_comm_amt
        {
            get { return _debt_loan_sell_comm_amt; }

            set
            {
                _debt_loan_sell_comm_amt = value;
                RaisePropertyChanged(() => debt_loan_sell_comm_amt);
            }
        }

        private double _loan_return_comm_amt;
        /// <summary>
        /// ��ȯ�黹ָ����
        /// </summary>
        public double loan_return_comm_amt
        {
            get { return _loan_return_comm_amt; }

            set
            {
                _loan_return_comm_amt = value;
                RaisePropertyChanged(() => loan_return_comm_amt);
            }
        }

        private double _debt_strike_fee;
        /// <summary>
        /// ��ծ�ɽ�����
        /// </summary>
        public double debt_strike_fee
        {
            get { return _debt_strike_fee; }

            set
            {
                _debt_strike_fee = value;
                RaisePropertyChanged(() => debt_strike_fee);
            }
        }

        private double _return_strike_fee;
        /// <summary>
        /// �黹�ɽ�����
        /// </summary>
        public double return_strike_fee
        {
            get { return _return_strike_fee; }

            set
            {
                _return_strike_fee = value;
                RaisePropertyChanged(() => return_strike_fee);
            }
        }

        private double _debt_interest;
        /// <summary>
        /// ��ծ��Ϣ
        /// </summary>
        public double debt_interest
        {
            get { return _debt_interest; }

            set
            {
                _debt_interest = value;
                RaisePropertyChanged(() => debt_interest);
            }
        }

        private double _return_interest_amt;
        /// <summary>
        /// �黹��Ϣ���
        /// </summary>
        public double return_interest_amt
        {
            get { return _return_interest_amt; }

            set
            {
                _return_interest_amt = value;
                RaisePropertyChanged(() => return_interest_amt);
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

    public class tdsecuL_2_70_Info : ObservableObject
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

        private int _debt_type;
        /// <summary>
        /// ��ծ����
        /// </summary>
        public int debt_type
        {
            get { return _debt_type; }

            set
            {
                _debt_type = value;
                RaisePropertyChanged(() => debt_type);
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

        private double _strike_fee;
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_fee
        {
            get { return _strike_fee; }

            set
            {
                _strike_fee = value;
                RaisePropertyChanged(() => strike_fee);
            }
        }

        private int _debt_order_no;
        /// <summary>
        /// ��ծ�������
        /// </summary>
        public int debt_order_no
        {
            get { return _debt_order_no; }

            set
            {
                _debt_order_no = value;
                RaisePropertyChanged(() => debt_order_no);
            }
        }

        private String _report_no;
        /// <summary>
        /// �걨���
        /// </summary>
        public String report_no
        {
            get { return _report_no; }

            set
            {
                _report_no = value;
                RaisePropertyChanged(() => report_no);
            }
        }

        private int _order_date;
        /// <summary>
        /// ��������
        /// </summary>
        public int order_date
        {
            get { return _order_date; }

            set
            {
                _order_date = value;
                RaisePropertyChanged(() => order_date);
            }
        }

        private int _order_time;
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int order_time
        {
            get { return _order_time; }

            set
            {
                _order_time = value;
                RaisePropertyChanged(() => order_time);
            }
        }

        private int _order_dir;
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir
        {
            get { return _order_dir; }

            set
            {
                _order_dir = value;
                RaisePropertyChanged(() => order_dir);
            }
        }

        private double _order_price;
        /// <summary>
        /// �����۸�
        /// </summary>
        public double order_price
        {
            get { return _order_price; }

            set
            {
                _order_price = value;
                RaisePropertyChanged(() => order_price);
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

        private double _debt_amt;
        /// <summary>
        /// ��ծ���
        /// </summary>
        public double debt_amt
        {
            get { return _debt_amt; }

            set
            {
                _debt_amt = value;
                RaisePropertyChanged(() => debt_amt);
            }
        }

        private double _debt_qty;
        /// <summary>
        /// ��ծ����
        /// </summary>
        public double debt_qty
        {
            get { return _debt_qty; }

            set
            {
                _debt_qty = value;
                RaisePropertyChanged(() => debt_qty);
            }
        }

        private double _debt_fee;
        /// <summary>
        /// ��ծ����
        /// </summary>
        public double debt_fee
        {
            get { return _debt_fee; }

            set
            {
                _debt_fee = value;
                RaisePropertyChanged(() => debt_fee);
            }
        }

        private double _debt_interest;
        /// <summary>
        /// ��ծ��Ϣ
        /// </summary>
        public double debt_interest
        {
            get { return _debt_interest; }

            set
            {
                _debt_interest = value;
                RaisePropertyChanged(() => debt_interest);
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

        private double _debt_return_amt;
        /// <summary>
        /// �ѹ黹���
        /// </summary>
        public double debt_return_amt
        {
            get { return _debt_return_amt; }

            set
            {
                _debt_return_amt = value;
                RaisePropertyChanged(() => debt_return_amt);
            }
        }

        private double _debt_return_qty;
        /// <summary>
        /// �ѹ黹����
        /// </summary>
        public double debt_return_qty
        {
            get { return _debt_return_qty; }

            set
            {
                _debt_return_qty = value;
                RaisePropertyChanged(() => debt_return_qty);
            }
        }

        private double _return_interest_amt;
        /// <summary>
        /// �黹��Ϣ���
        /// </summary>
        public double return_interest_amt
        {
            get { return _return_interest_amt; }

            set
            {
                _return_interest_amt = value;
                RaisePropertyChanged(() => return_interest_amt);
            }
        }

        private int _debt_status;
        /// <summary>
        /// ��ծ״̬
        /// </summary>
        public int debt_status
        {
            get { return _debt_status; }

            set
            {
                _debt_status = value;
                RaisePropertyChanged(() => debt_status);
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

    public class tdsecuL_2_90_Info : ObservableObject
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

        private double _comm_frozen_amt;
        /// <summary>
        /// ָ�����
        /// </summary>
        public double comm_frozen_amt
        {
            get { return _comm_frozen_amt; }

            set
            {
                _comm_frozen_amt = value;
                RaisePropertyChanged(() => comm_frozen_amt);
            }
        }

        private double _comm_unfroz_amt;
        /// <summary>
        /// ָ��ⶳ���
        /// </summary>
        public double comm_unfroz_amt
        {
            get { return _comm_unfroz_amt; }

            set
            {
                _comm_unfroz_amt = value;
                RaisePropertyChanged(() => comm_unfroz_amt);
            }
        }

        private double _comm_capt_amt;
        /// <summary>
        /// ָ��ռ�ý��
        /// </summary>
        public double comm_capt_amt
        {
            get { return _comm_capt_amt; }

            set
            {
                _comm_capt_amt = value;
                RaisePropertyChanged(() => comm_capt_amt);
            }
        }

        private double _comm_releas_amt;
        /// <summary>
        /// ָ���ͷŽ��
        /// </summary>
        public double comm_releas_amt
        {
            get { return _comm_releas_amt; }

            set
            {
                _comm_releas_amt = value;
                RaisePropertyChanged(() => comm_releas_amt);
            }
        }

        private double _trade_frozen_amt;
        /// <summary>
        /// ���׶�����
        /// </summary>
        public double trade_frozen_amt
        {
            get { return _trade_frozen_amt; }

            set
            {
                _trade_frozen_amt = value;
                RaisePropertyChanged(() => trade_frozen_amt);
            }
        }

        private double _trade_unfroz_amt;
        /// <summary>
        /// ���׽ⶳ���
        /// </summary>
        public double trade_unfroz_amt
        {
            get { return _trade_unfroz_amt; }

            set
            {
                _trade_unfroz_amt = value;
                RaisePropertyChanged(() => trade_unfroz_amt);
            }
        }

        private double _trade_capt_amt;
        /// <summary>
        /// ����ռ�ý��
        /// </summary>
        public double trade_capt_amt
        {
            get { return _trade_capt_amt; }

            set
            {
                _trade_capt_amt = value;
                RaisePropertyChanged(() => trade_capt_amt);
            }
        }

        private double _trade_releas_amt;
        /// <summary>
        /// �����ͷŽ��
        /// </summary>
        public double trade_releas_amt
        {
            get { return _trade_releas_amt; }

            set
            {
                _trade_releas_amt = value;
                RaisePropertyChanged(() => trade_releas_amt);
            }
        }

        private double _strike_capt_amt;
        /// <summary>
        /// �ɽ�ռ�ý��
        /// </summary>
        public double strike_capt_amt
        {
            get { return _strike_capt_amt; }

            set
            {
                _strike_capt_amt = value;
                RaisePropertyChanged(() => strike_capt_amt);
            }
        }

        private double _strike_releas_amt;
        /// <summary>
        /// �ɽ��ͷŽ��
        /// </summary>
        public double strike_releas_amt
        {
            get { return _strike_releas_amt; }

            set
            {
                _strike_releas_amt = value;
                RaisePropertyChanged(() => strike_releas_amt);
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

    public class tdsecuL_2_91_Info : ObservableObject
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

        private double _comm_unfroz_qty;
        /// <summary>
        /// ָ��ⶳ����
        /// </summary>
        public double comm_unfroz_qty
        {
            get { return _comm_unfroz_qty; }

            set
            {
                _comm_unfroz_qty = value;
                RaisePropertyChanged(() => comm_unfroz_qty);
            }
        }

        private double _comm_capt_qty;
        /// <summary>
        /// ָ��ռ������
        /// </summary>
        public double comm_capt_qty
        {
            get { return _comm_capt_qty; }

            set
            {
                _comm_capt_qty = value;
                RaisePropertyChanged(() => comm_capt_qty);
            }
        }

        private double _comm_releas_qty;
        /// <summary>
        /// ָ���ͷ�����
        /// </summary>
        public double comm_releas_qty
        {
            get { return _comm_releas_qty; }

            set
            {
                _comm_releas_qty = value;
                RaisePropertyChanged(() => comm_releas_qty);
            }
        }

        private double _trade_frozen_qty;
        /// <summary>
        /// ���׶�������
        /// </summary>
        public double trade_frozen_qty
        {
            get { return _trade_frozen_qty; }

            set
            {
                _trade_frozen_qty = value;
                RaisePropertyChanged(() => trade_frozen_qty);
            }
        }

        private double _trade_unfroz_qty;
        /// <summary>
        /// ���׽ⶳ����
        /// </summary>
        public double trade_unfroz_qty
        {
            get { return _trade_unfroz_qty; }

            set
            {
                _trade_unfroz_qty = value;
                RaisePropertyChanged(() => trade_unfroz_qty);
            }
        }

        private double _trade_capt_qty;
        /// <summary>
        /// ����ռ������
        /// </summary>
        public double trade_capt_qty
        {
            get { return _trade_capt_qty; }

            set
            {
                _trade_capt_qty = value;
                RaisePropertyChanged(() => trade_capt_qty);
            }
        }

        private double _trade_releas_qty;
        /// <summary>
        /// �����ͷ�����
        /// </summary>
        public double trade_releas_qty
        {
            get { return _trade_releas_qty; }

            set
            {
                _trade_releas_qty = value;
                RaisePropertyChanged(() => trade_releas_qty);
            }
        }

        private double _strike_capt_qty;
        /// <summary>
        /// �ɽ�ռ������
        /// </summary>
        public double strike_capt_qty
        {
            get { return _strike_capt_qty; }

            set
            {
                _strike_capt_qty = value;
                RaisePropertyChanged(() => strike_capt_qty);
            }
        }

        private double _strike_releas_qty;
        /// <summary>
        /// �ɽ��ͷ�����
        /// </summary>
        public double strike_releas_qty
        {
            get { return _strike_releas_qty; }

            set
            {
                _strike_releas_qty = value;
                RaisePropertyChanged(() => strike_releas_qty);
            }
        }

        private double _strike_frozen_qty;
        /// <summary>
        /// �ɽ���������
        /// </summary>
        public double strike_frozen_qty
        {
            get { return _strike_frozen_qty; }

            set
            {
                _strike_frozen_qty = value;
                RaisePropertyChanged(() => strike_frozen_qty);
            }
        }

        private double _strike_unfroz_qty;
        /// <summary>
        /// �ɽ��ⶳ����
        /// </summary>
        public double strike_unfroz_qty
        {
            get { return _strike_unfroz_qty; }

            set
            {
                _strike_unfroz_qty = value;
                RaisePropertyChanged(() => strike_unfroz_qty);
            }
        }

        private double _cost_amt;
        /// <summary>
        /// �ɱ����
        /// </summary>
        public double cost_amt
        {
            get { return _cost_amt; }

            set
            {
                _cost_amt = value;
                RaisePropertyChanged(() => cost_amt);
            }
        }

        private double _intrst_cost_amt;
        /// <summary>
        /// ��Ϣ�ɱ����
        /// </summary>
        public double intrst_cost_amt
        {
            get { return _intrst_cost_amt; }

            set
            {
                _intrst_cost_amt = value;
                RaisePropertyChanged(() => intrst_cost_amt);
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

        private double _realize_pandl;
        /// <summary>
        /// ʵ��ӯ��
        /// </summary>
        public double realize_pandl
        {
            get { return _realize_pandl; }

            set
            {
                _realize_pandl = value;
                RaisePropertyChanged(() => realize_pandl);
            }
        }

        private double _intrst_pandl;
        /// <summary>
        /// ��Ϣ����
        /// </summary>
        public double intrst_pandl
        {
            get { return _intrst_pandl; }

            set
            {
                _intrst_pandl = value;
                RaisePropertyChanged(() => intrst_pandl);
            }
        }
    }

    public class tdsecuL_2_92_Info : ObservableObject
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

        private int _debt_type;
        /// <summary>
        /// ��ծ����
        /// </summary>
        public int debt_type
        {
            get { return _debt_type; }

            set
            {
                _debt_type = value;
                RaisePropertyChanged(() => debt_type);
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

        private double _strike_fee;
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_fee
        {
            get { return _strike_fee; }

            set
            {
                _strike_fee = value;
                RaisePropertyChanged(() => strike_fee);
            }
        }

        private int _debt_order_no;
        /// <summary>
        /// ��ծ�������
        /// </summary>
        public int debt_order_no
        {
            get { return _debt_order_no; }

            set
            {
                _debt_order_no = value;
                RaisePropertyChanged(() => debt_order_no);
            }
        }

        private String _report_no;
        /// <summary>
        /// �걨���
        /// </summary>
        public String report_no
        {
            get { return _report_no; }

            set
            {
                _report_no = value;
                RaisePropertyChanged(() => report_no);
            }
        }

        private int _order_date;
        /// <summary>
        /// ��������
        /// </summary>
        public int order_date
        {
            get { return _order_date; }

            set
            {
                _order_date = value;
                RaisePropertyChanged(() => order_date);
            }
        }

        private int _order_time;
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int order_time
        {
            get { return _order_time; }

            set
            {
                _order_time = value;
                RaisePropertyChanged(() => order_time);
            }
        }

        private int _order_dir;
        /// <summary>
        /// ��������
        /// </summary>
        public int order_dir
        {
            get { return _order_dir; }

            set
            {
                _order_dir = value;
                RaisePropertyChanged(() => order_dir);
            }
        }

        private double _order_price;
        /// <summary>
        /// �����۸�
        /// </summary>
        public double order_price
        {
            get { return _order_price; }

            set
            {
                _order_price = value;
                RaisePropertyChanged(() => order_price);
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

        private double _debt_amt;
        /// <summary>
        /// ��ծ���
        /// </summary>
        public double debt_amt
        {
            get { return _debt_amt; }

            set
            {
                _debt_amt = value;
                RaisePropertyChanged(() => debt_amt);
            }
        }

        private double _debt_qty;
        /// <summary>
        /// ��ծ����
        /// </summary>
        public double debt_qty
        {
            get { return _debt_qty; }

            set
            {
                _debt_qty = value;
                RaisePropertyChanged(() => debt_qty);
            }
        }

        private double _debt_fee;
        /// <summary>
        /// ��ծ����
        /// </summary>
        public double debt_fee
        {
            get { return _debt_fee; }

            set
            {
                _debt_fee = value;
                RaisePropertyChanged(() => debt_fee);
            }
        }

        private double _debt_interest;
        /// <summary>
        /// ��ծ��Ϣ
        /// </summary>
        public double debt_interest
        {
            get { return _debt_interest; }

            set
            {
                _debt_interest = value;
                RaisePropertyChanged(() => debt_interest);
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

        private double _debt_return_amt;
        /// <summary>
        /// �ѹ黹���
        /// </summary>
        public double debt_return_amt
        {
            get { return _debt_return_amt; }

            set
            {
                _debt_return_amt = value;
                RaisePropertyChanged(() => debt_return_amt);
            }
        }

        private double _debt_return_qty;
        /// <summary>
        /// �ѹ黹����
        /// </summary>
        public double debt_return_qty
        {
            get { return _debt_return_qty; }

            set
            {
                _debt_return_qty = value;
                RaisePropertyChanged(() => debt_return_qty);
            }
        }

        private double _return_interest_amt;
        /// <summary>
        /// �黹��Ϣ���
        /// </summary>
        public double return_interest_amt
        {
            get { return _return_interest_amt; }

            set
            {
                _return_interest_amt = value;
                RaisePropertyChanged(() => return_interest_amt);
            }
        }

        private int _debt_status;
        /// <summary>
        /// ��ծ״̬
        /// </summary>
        public int debt_status
        {
            get { return _debt_status; }

            set
            {
                _debt_status = value;
                RaisePropertyChanged(() => debt_status);
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

}

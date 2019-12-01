using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class tdfutuL_2_1_Info : ObservableObject
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

    public class tdfutuL_2_2_Info : ObservableObject
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

    public class tdfutuL_2_3_Info : ObservableObject
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

    public class tdfutuL_2_4_Info : ObservableObject
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

    public class tdfutuL_2_5_Info : ObservableObject
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

        private double _trade_fee;
        /// <summary>
        /// ���׷���
        /// </summary>
        public double trade_fee
        {
            get { return _trade_fee; }

            set
            {
                _trade_fee = value;
                RaisePropertyChanged(() => trade_fee);
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

        private double _close_pandl;
        /// <summary>
        /// ƽ��ӯ��
        /// </summary>
        public double close_pandl
        {
            get { return _close_pandl; }

            set
            {
                _close_pandl = value;
                RaisePropertyChanged(() => close_pandl);
            }
        }

        private double _marked_pandl;
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double marked_pandl
        {
            get { return _marked_pandl; }

            set
            {
                _marked_pandl = value;
                RaisePropertyChanged(() => marked_pandl);
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

    public class tdfutuL_2_6_Info : ObservableObject
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

        private double _trade_fee;
        /// <summary>
        /// ���׷���
        /// </summary>
        public double trade_fee
        {
            get { return _trade_fee; }

            set
            {
                _trade_fee = value;
                RaisePropertyChanged(() => trade_fee);
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

        private double _close_pandl;
        /// <summary>
        /// ƽ��ӯ��
        /// </summary>
        public double close_pandl
        {
            get { return _close_pandl; }

            set
            {
                _close_pandl = value;
                RaisePropertyChanged(() => close_pandl);
            }
        }

        private double _marked_pandl;
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double marked_pandl
        {
            get { return _marked_pandl; }

            set
            {
                _marked_pandl = value;
                RaisePropertyChanged(() => marked_pandl);
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

    public class tdfutuL_2_7_Info : ObservableObject
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

        private double _pre_comm_capt_qty;
        /// <summary>
        /// �ϲ�ָ��ռ������
        /// </summary>
        public double pre_comm_capt_qty
        {
            get { return _pre_comm_capt_qty; }

            set
            {
                _pre_comm_capt_qty = value;
                RaisePropertyChanged(() => pre_comm_capt_qty);
            }
        }

        private double _today_comm_capt_qty;
        /// <summary>
        /// ���ָ��ռ������
        /// </summary>
        public double today_comm_capt_qty
        {
            get { return _today_comm_capt_qty; }

            set
            {
                _today_comm_capt_qty = value;
                RaisePropertyChanged(() => today_comm_capt_qty);
            }
        }

        private double _old_trade_capt_qty;
        /// <summary>
        /// �ϲֽ���ռ������
        /// </summary>
        public double old_trade_capt_qty
        {
            get { return _old_trade_capt_qty; }

            set
            {
                _old_trade_capt_qty = value;
                RaisePropertyChanged(() => old_trade_capt_qty);
            }
        }

        private double _today_trade_capt_qty;
        /// <summary>
        /// ��ֽ���ռ������
        /// </summary>
        public double today_trade_capt_qty
        {
            get { return _today_trade_capt_qty; }

            set
            {
                _today_trade_capt_qty = value;
                RaisePropertyChanged(() => today_trade_capt_qty);
            }
        }

        private double _pre_strike_capt_qty;
        /// <summary>
        /// �ϲֳɽ�ռ������
        /// </summary>
        public double pre_strike_capt_qty
        {
            get { return _pre_strike_capt_qty; }

            set
            {
                _pre_strike_capt_qty = value;
                RaisePropertyChanged(() => pre_strike_capt_qty);
            }
        }

        private double _today_strike_capt_qty;
        /// <summary>
        /// ��ֳɽ�ռ������
        /// </summary>
        public double today_strike_capt_qty
        {
            get { return _today_strike_capt_qty; }

            set
            {
                _today_strike_capt_qty = value;
                RaisePropertyChanged(() => today_strike_capt_qty);
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

        private double _open_amount;
        /// <summary>
        /// ���ֽ��
        /// </summary>
        public double open_amount
        {
            get { return _open_amount; }

            set
            {
                _open_amount = value;
                RaisePropertyChanged(() => open_amount);
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

    public class tdfutuL_2_8_Info : ObservableObject
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

        private double _old_trade_capt_qty;
        /// <summary>
        /// �ϲֽ���ռ������
        /// </summary>
        public double old_trade_capt_qty
        {
            get { return _old_trade_capt_qty; }

            set
            {
                _old_trade_capt_qty = value;
                RaisePropertyChanged(() => old_trade_capt_qty);
            }
        }

        private double _today_trade_capt_qty;
        /// <summary>
        /// ��ֽ���ռ������
        /// </summary>
        public double today_trade_capt_qty
        {
            get { return _today_trade_capt_qty; }

            set
            {
                _today_trade_capt_qty = value;
                RaisePropertyChanged(() => today_trade_capt_qty);
            }
        }

        private double _pre_strike_capt_qty;
        /// <summary>
        /// �ϲֳɽ�ռ������
        /// </summary>
        public double pre_strike_capt_qty
        {
            get { return _pre_strike_capt_qty; }

            set
            {
                _pre_strike_capt_qty = value;
                RaisePropertyChanged(() => pre_strike_capt_qty);
            }
        }

        private double _today_strike_capt_qty;
        /// <summary>
        /// ��ֳɽ�ռ������
        /// </summary>
        public double today_strike_capt_qty
        {
            get { return _today_strike_capt_qty; }

            set
            {
                _today_strike_capt_qty = value;
                RaisePropertyChanged(() => today_strike_capt_qty);
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

        private double _open_amount;
        /// <summary>
        /// ���ֽ��
        /// </summary>
        public double open_amount
        {
            get { return _open_amount; }

            set
            {
                _open_amount = value;
                RaisePropertyChanged(() => open_amount);
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

    public class tdfutuL_2_9_Info : ObservableObject
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

        private ulong _detail_posi_id;
        /// <summary>
        /// ��ϸ�ֲ����
        /// </summary>
        public ulong detail_posi_id
        {
            get { return _detail_posi_id; }

            set
            {
                _detail_posi_id = value;
                RaisePropertyChanged(() => detail_posi_id);
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

        private int _open_posi_time;
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int open_posi_time
        {
            get { return _open_posi_time; }

            set
            {
                _open_posi_time = value;
                RaisePropertyChanged(() => open_posi_time);
            }
        }

        private String _strike_no;
        /// <summary>
        /// �ɽ����
        /// </summary>
        public String strike_no
        {
            get { return _strike_no; }

            set
            {
                _strike_no = value;
                RaisePropertyChanged(() => strike_no);
            }
        }

        private double _open_posi_price;
        /// <summary>
        /// ���ּ۸�
        /// </summary>
        public double open_posi_price
        {
            get { return _open_posi_price; }

            set
            {
                _open_posi_price = value;
                RaisePropertyChanged(() => open_posi_price);
            }
        }

        private double _open_posi_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double open_posi_qty
        {
            get { return _open_posi_qty; }

            set
            {
                _open_posi_qty = value;
                RaisePropertyChanged(() => open_posi_qty);
            }
        }

        private double _open_amount;
        /// <summary>
        /// ���ֽ��
        /// </summary>
        public double open_amount
        {
            get { return _open_amount; }

            set
            {
                _open_amount = value;
                RaisePropertyChanged(() => open_amount);
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

        private double _open_posi_fee;
        /// <summary>
        /// ���ַ���
        /// </summary>
        public double open_posi_fee
        {
            get { return _open_posi_fee; }

            set
            {
                _open_posi_fee = value;
                RaisePropertyChanged(() => open_posi_fee);
            }
        }

        private double _close_posi_fee;
        /// <summary>
        /// ƽ�ַ���
        /// </summary>
        public double close_posi_fee
        {
            get { return _close_posi_fee; }

            set
            {
                _close_posi_fee = value;
                RaisePropertyChanged(() => close_posi_fee);
            }
        }

        private double _marked_sett_price;
        /// <summary>
        /// ���н���۸�
        /// </summary>
        public double marked_sett_price
        {
            get { return _marked_sett_price; }

            set
            {
                _marked_sett_price = value;
                RaisePropertyChanged(() => marked_sett_price);
            }
        }

        private double _marked_pandl;
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double marked_pandl
        {
            get { return _marked_pandl; }

            set
            {
                _marked_pandl = value;
                RaisePropertyChanged(() => marked_pandl);
            }
        }

        private double _close_pandl;
        /// <summary>
        /// ƽ��ӯ��
        /// </summary>
        public double close_pandl
        {
            get { return _close_pandl; }

            set
            {
                _close_pandl = value;
                RaisePropertyChanged(() => close_pandl);
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

    public class tdfutuL_2_10_Info : ObservableObject
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

        private double _trade_fee;
        /// <summary>
        /// ���׷���
        /// </summary>
        public double trade_fee
        {
            get { return _trade_fee; }

            set
            {
                _trade_fee = value;
                RaisePropertyChanged(() => trade_fee);
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

        private double _close_pandl;
        /// <summary>
        /// ƽ��ӯ��
        /// </summary>
        public double close_pandl
        {
            get { return _close_pandl; }

            set
            {
                _close_pandl = value;
                RaisePropertyChanged(() => close_pandl);
            }
        }

        private double _marked_pandl;
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double marked_pandl
        {
            get { return _marked_pandl; }

            set
            {
                _marked_pandl = value;
                RaisePropertyChanged(() => marked_pandl);
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

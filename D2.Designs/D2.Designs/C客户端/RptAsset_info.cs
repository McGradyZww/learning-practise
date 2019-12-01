using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class rptL_4_1_Info : ObservableObject
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

        private double _trade_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double trade_qty
        {
            get { return _trade_qty; }

            set
            {
                _trade_qty = value;
                RaisePropertyChanged(() => trade_qty);
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

        private double _yield_rate;
        /// <summary>
        /// ������
        /// </summary>
        public double yield_rate
        {
            get { return _yield_rate; }

            set
            {
                _yield_rate = value;
                RaisePropertyChanged(() => yield_rate);
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
    }

    public class rptL_4_2_Info : ObservableObject
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

        private double _source_stock_qty;
        /// <summary>
        /// ȯԴ����
        /// </summary>
        public double source_stock_qty
        {
            get { return _source_stock_qty; }

            set
            {
                _source_stock_qty = value;
                RaisePropertyChanged(() => source_stock_qty);
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

        private double _yield_rate;
        /// <summary>
        /// ������
        /// </summary>
        public double yield_rate
        {
            get { return _yield_rate; }

            set
            {
                _yield_rate = value;
                RaisePropertyChanged(() => yield_rate);
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

        private double _total_long_curr_qty;
        /// <summary>
        /// �ܶ�ͷ��ǰ����
        /// </summary>
        public double total_long_curr_qty
        {
            get { return _total_long_curr_qty; }

            set
            {
                _total_long_curr_qty = value;
                RaisePropertyChanged(() => total_long_curr_qty);
            }
        }

        private double _total_short_curr_qty;
        /// <summary>
        /// �ܿ�ͷ��ǰ����
        /// </summary>
        public double total_short_curr_qty
        {
            get { return _total_short_curr_qty; }

            set
            {
                _total_short_curr_qty = value;
                RaisePropertyChanged(() => total_short_curr_qty);
            }
        }

        private double _total_long_open_posi_value;
        /// <summary>
        /// �ܶ�ͷ������ֵ
        /// </summary>
        public double total_long_open_posi_value
        {
            get { return _total_long_open_posi_value; }

            set
            {
                _total_long_open_posi_value = value;
                RaisePropertyChanged(() => total_long_open_posi_value);
            }
        }

        private double _total_short_open_posi_value;
        /// <summary>
        /// �ܿ�ͷ������ֵ
        /// </summary>
        public double total_short_open_posi_value
        {
            get { return _total_short_open_posi_value; }

            set
            {
                _total_short_open_posi_value = value;
                RaisePropertyChanged(() => total_short_open_posi_value);
            }
        }

        private double _total_long_open_posi_fee;
        /// <summary>
        /// �ܶ�ͷ���ַ���
        /// </summary>
        public double total_long_open_posi_fee
        {
            get { return _total_long_open_posi_fee; }

            set
            {
                _total_long_open_posi_fee = value;
                RaisePropertyChanged(() => total_long_open_posi_fee);
            }
        }

        private double _total_short_open_posi_fee;
        /// <summary>
        /// �ܿ�ͷ���ַ���
        /// </summary>
        public double total_short_open_posi_fee
        {
            get { return _total_short_open_posi_fee; }

            set
            {
                _total_short_open_posi_fee = value;
                RaisePropertyChanged(() => total_short_open_posi_fee);
            }
        }

        private double _total_long_close_posi_value;
        /// <summary>
        /// �ܶ�ͷƽ����ֵ
        /// </summary>
        public double total_long_close_posi_value
        {
            get { return _total_long_close_posi_value; }

            set
            {
                _total_long_close_posi_value = value;
                RaisePropertyChanged(() => total_long_close_posi_value);
            }
        }

        private double _total_short_close_posi_value;
        /// <summary>
        /// �ܿ�ͷƽ����ֵ
        /// </summary>
        public double total_short_close_posi_value
        {
            get { return _total_short_close_posi_value; }

            set
            {
                _total_short_close_posi_value = value;
                RaisePropertyChanged(() => total_short_close_posi_value);
            }
        }

        private double _total_long_close_posi_qty;
        /// <summary>
        /// �ܶ�ͷƽ������
        /// </summary>
        public double total_long_close_posi_qty
        {
            get { return _total_long_close_posi_qty; }

            set
            {
                _total_long_close_posi_qty = value;
                RaisePropertyChanged(() => total_long_close_posi_qty);
            }
        }

        private double _total_short_close_posi_qty;
        /// <summary>
        /// �ܿ�ͷƽ������
        /// </summary>
        public double total_short_close_posi_qty
        {
            get { return _total_short_close_posi_qty; }

            set
            {
                _total_short_close_posi_qty = value;
                RaisePropertyChanged(() => total_short_close_posi_qty);
            }
        }

        private double _total_long_close_posi_fee;
        /// <summary>
        /// �ܶ�ͷƽ�ַ���
        /// </summary>
        public double total_long_close_posi_fee
        {
            get { return _total_long_close_posi_fee; }

            set
            {
                _total_long_close_posi_fee = value;
                RaisePropertyChanged(() => total_long_close_posi_fee);
            }
        }

        private double _total_short_close_posi_fee;
        /// <summary>
        /// �ܿ�ͷƽ�ַ���
        /// </summary>
        public double total_short_close_posi_fee
        {
            get { return _total_short_close_posi_fee; }

            set
            {
                _total_short_close_posi_fee = value;
                RaisePropertyChanged(() => total_short_close_posi_fee);
            }
        }

        private double _total_realize_pandl;
        /// <summary>
        /// ��ʵ��ӯ��
        /// </summary>
        public double total_realize_pandl
        {
            get { return _total_realize_pandl; }

            set
            {
                _total_realize_pandl = value;
                RaisePropertyChanged(() => total_realize_pandl);
            }
        }

        private double _long_curr_qty;
        /// <summary>
        /// ��ͷ��ǰ����
        /// </summary>
        public double long_curr_qty
        {
            get { return _long_curr_qty; }

            set
            {
                _long_curr_qty = value;
                RaisePropertyChanged(() => long_curr_qty);
            }
        }

        private double _short_curr_qty;
        /// <summary>
        /// ��ͷ��ǰ����
        /// </summary>
        public double short_curr_qty
        {
            get { return _short_curr_qty; }

            set
            {
                _short_curr_qty = value;
                RaisePropertyChanged(() => short_curr_qty);
            }
        }

        private double _long_open_posi_value;
        /// <summary>
        /// ��ͷ������ֵ
        /// </summary>
        public double long_open_posi_value
        {
            get { return _long_open_posi_value; }

            set
            {
                _long_open_posi_value = value;
                RaisePropertyChanged(() => long_open_posi_value);
            }
        }

        private double _short_open_posi_value;
        /// <summary>
        /// ��ͷ������ֵ
        /// </summary>
        public double short_open_posi_value
        {
            get { return _short_open_posi_value; }

            set
            {
                _short_open_posi_value = value;
                RaisePropertyChanged(() => short_open_posi_value);
            }
        }

        private double _long_open_posi_fee;
        /// <summary>
        /// ��ͷ���ַ���
        /// </summary>
        public double long_open_posi_fee
        {
            get { return _long_open_posi_fee; }

            set
            {
                _long_open_posi_fee = value;
                RaisePropertyChanged(() => long_open_posi_fee);
            }
        }

        private double _short_open_posi_fee;
        /// <summary>
        /// ��ͷ���ַ���
        /// </summary>
        public double short_open_posi_fee
        {
            get { return _short_open_posi_fee; }

            set
            {
                _short_open_posi_fee = value;
                RaisePropertyChanged(() => short_open_posi_fee);
            }
        }

        private double _long_close_posi_qty;
        /// <summary>
        /// ��ͷƽ������
        /// </summary>
        public double long_close_posi_qty
        {
            get { return _long_close_posi_qty; }

            set
            {
                _long_close_posi_qty = value;
                RaisePropertyChanged(() => long_close_posi_qty);
            }
        }

        private double _short_close_posi_qty;
        /// <summary>
        /// ��ͷƽ������
        /// </summary>
        public double short_close_posi_qty
        {
            get { return _short_close_posi_qty; }

            set
            {
                _short_close_posi_qty = value;
                RaisePropertyChanged(() => short_close_posi_qty);
            }
        }

        private double _long_close_posi_value;
        /// <summary>
        /// ��ͷƽ����ֵ
        /// </summary>
        public double long_close_posi_value
        {
            get { return _long_close_posi_value; }

            set
            {
                _long_close_posi_value = value;
                RaisePropertyChanged(() => long_close_posi_value);
            }
        }

        private double _short_close_posi_value;
        /// <summary>
        /// ��ͷƽ����ֵ
        /// </summary>
        public double short_close_posi_value
        {
            get { return _short_close_posi_value; }

            set
            {
                _short_close_posi_value = value;
                RaisePropertyChanged(() => short_close_posi_value);
            }
        }

        private double _long_close_posi_fee;
        /// <summary>
        /// ��ͷƽ�ַ���
        /// </summary>
        public double long_close_posi_fee
        {
            get { return _long_close_posi_fee; }

            set
            {
                _long_close_posi_fee = value;
                RaisePropertyChanged(() => long_close_posi_fee);
            }
        }

        private double _short_close_posi_fee;
        /// <summary>
        /// ��ͷƽ�ַ���
        /// </summary>
        public double short_close_posi_fee
        {
            get { return _short_close_posi_fee; }

            set
            {
                _short_close_posi_fee = value;
                RaisePropertyChanged(() => short_close_posi_fee);
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

        private double _over_night_pandl;
        /// <summary>
        /// ��ҹӯ��
        /// </summary>
        public double over_night_pandl
        {
            get { return _over_night_pandl; }

            set
            {
                _over_night_pandl = value;
                RaisePropertyChanged(() => over_night_pandl);
            }
        }
    }

    public class rptL_4_3_Info : ObservableObject
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

        private double _posi_market_value;
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value
        {
            get { return _posi_market_value; }

            set
            {
                _posi_market_value = value;
                RaisePropertyChanged(() => posi_market_value);
            }
        }

        private double _trade_amt;
        /// <summary>
        /// ���׽��
        /// </summary>
        public double trade_amt
        {
            get { return _trade_amt; }

            set
            {
                _trade_amt = value;
                RaisePropertyChanged(() => trade_amt);
            }
        }

        private double _today_pandl;
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double today_pandl
        {
            get { return _today_pandl; }

            set
            {
                _today_pandl = value;
                RaisePropertyChanged(() => today_pandl);
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

        private double _yield_rate;
        /// <summary>
        /// ������
        /// </summary>
        public double yield_rate
        {
            get { return _yield_rate; }

            set
            {
                _yield_rate = value;
                RaisePropertyChanged(() => yield_rate);
            }
        }
    }

    public class rptL_4_4_Info : ObservableObject
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

        private double _trade_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double trade_qty
        {
            get { return _trade_qty; }

            set
            {
                _trade_qty = value;
                RaisePropertyChanged(() => trade_qty);
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

        private double _yield_rate;
        /// <summary>
        /// ������
        /// </summary>
        public double yield_rate
        {
            get { return _yield_rate; }

            set
            {
                _yield_rate = value;
                RaisePropertyChanged(() => yield_rate);
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

        private double _open_posi_value;
        /// <summary>
        /// ������ֵ
        /// </summary>
        public double open_posi_value
        {
            get { return _open_posi_value; }

            set
            {
                _open_posi_value = value;
                RaisePropertyChanged(() => open_posi_value);
            }
        }

        private double _close_posi_qty;
        /// <summary>
        /// ƽ������
        /// </summary>
        public double close_posi_qty
        {
            get { return _close_posi_qty; }

            set
            {
                _close_posi_qty = value;
                RaisePropertyChanged(() => close_posi_qty);
            }
        }

        private double _close_posi_market_value;
        /// <summary>
        /// ƽ����ֵ
        /// </summary>
        public double close_posi_market_value
        {
            get { return _close_posi_market_value; }

            set
            {
                _close_posi_market_value = value;
                RaisePropertyChanged(() => close_posi_market_value);
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

        private double _over_night_pandl;
        /// <summary>
        /// ��ҹӯ��
        /// </summary>
        public double over_night_pandl
        {
            get { return _over_night_pandl; }

            set
            {
                _over_night_pandl = value;
                RaisePropertyChanged(() => over_night_pandl);
            }
        }

        private double _trade_amt;
        /// <summary>
        /// ���׽��
        /// </summary>
        public double trade_amt
        {
            get { return _trade_amt; }

            set
            {
                _trade_amt = value;
                RaisePropertyChanged(() => trade_amt);
            }
        }
    }

    public class rptL_4_5_Info : ObservableObject
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

        private double _source_stock_qty;
        /// <summary>
        /// ȯԴ����
        /// </summary>
        public double source_stock_qty
        {
            get { return _source_stock_qty; }

            set
            {
                _source_stock_qty = value;
                RaisePropertyChanged(() => source_stock_qty);
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

        private double _yield_rate;
        /// <summary>
        /// ������
        /// </summary>
        public double yield_rate
        {
            get { return _yield_rate; }

            set
            {
                _yield_rate = value;
                RaisePropertyChanged(() => yield_rate);
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

        private double _total_long_curr_qty;
        /// <summary>
        /// �ܶ�ͷ��ǰ����
        /// </summary>
        public double total_long_curr_qty
        {
            get { return _total_long_curr_qty; }

            set
            {
                _total_long_curr_qty = value;
                RaisePropertyChanged(() => total_long_curr_qty);
            }
        }

        private double _total_short_curr_qty;
        /// <summary>
        /// �ܿ�ͷ��ǰ����
        /// </summary>
        public double total_short_curr_qty
        {
            get { return _total_short_curr_qty; }

            set
            {
                _total_short_curr_qty = value;
                RaisePropertyChanged(() => total_short_curr_qty);
            }
        }

        private double _total_long_open_posi_value;
        /// <summary>
        /// �ܶ�ͷ������ֵ
        /// </summary>
        public double total_long_open_posi_value
        {
            get { return _total_long_open_posi_value; }

            set
            {
                _total_long_open_posi_value = value;
                RaisePropertyChanged(() => total_long_open_posi_value);
            }
        }

        private double _total_short_open_posi_value;
        /// <summary>
        /// �ܿ�ͷ������ֵ
        /// </summary>
        public double total_short_open_posi_value
        {
            get { return _total_short_open_posi_value; }

            set
            {
                _total_short_open_posi_value = value;
                RaisePropertyChanged(() => total_short_open_posi_value);
            }
        }

        private double _total_long_open_posi_fee;
        /// <summary>
        /// �ܶ�ͷ���ַ���
        /// </summary>
        public double total_long_open_posi_fee
        {
            get { return _total_long_open_posi_fee; }

            set
            {
                _total_long_open_posi_fee = value;
                RaisePropertyChanged(() => total_long_open_posi_fee);
            }
        }

        private double _total_short_open_posi_fee;
        /// <summary>
        /// �ܿ�ͷ���ַ���
        /// </summary>
        public double total_short_open_posi_fee
        {
            get { return _total_short_open_posi_fee; }

            set
            {
                _total_short_open_posi_fee = value;
                RaisePropertyChanged(() => total_short_open_posi_fee);
            }
        }

        private double _total_long_close_posi_value;
        /// <summary>
        /// �ܶ�ͷƽ����ֵ
        /// </summary>
        public double total_long_close_posi_value
        {
            get { return _total_long_close_posi_value; }

            set
            {
                _total_long_close_posi_value = value;
                RaisePropertyChanged(() => total_long_close_posi_value);
            }
        }

        private double _total_short_close_posi_value;
        /// <summary>
        /// �ܿ�ͷƽ����ֵ
        /// </summary>
        public double total_short_close_posi_value
        {
            get { return _total_short_close_posi_value; }

            set
            {
                _total_short_close_posi_value = value;
                RaisePropertyChanged(() => total_short_close_posi_value);
            }
        }

        private double _total_long_close_posi_qty;
        /// <summary>
        /// �ܶ�ͷƽ������
        /// </summary>
        public double total_long_close_posi_qty
        {
            get { return _total_long_close_posi_qty; }

            set
            {
                _total_long_close_posi_qty = value;
                RaisePropertyChanged(() => total_long_close_posi_qty);
            }
        }

        private double _total_short_close_posi_qty;
        /// <summary>
        /// �ܿ�ͷƽ������
        /// </summary>
        public double total_short_close_posi_qty
        {
            get { return _total_short_close_posi_qty; }

            set
            {
                _total_short_close_posi_qty = value;
                RaisePropertyChanged(() => total_short_close_posi_qty);
            }
        }

        private double _total_long_close_posi_fee;
        /// <summary>
        /// �ܶ�ͷƽ�ַ���
        /// </summary>
        public double total_long_close_posi_fee
        {
            get { return _total_long_close_posi_fee; }

            set
            {
                _total_long_close_posi_fee = value;
                RaisePropertyChanged(() => total_long_close_posi_fee);
            }
        }

        private double _total_short_close_posi_fee;
        /// <summary>
        /// �ܿ�ͷƽ�ַ���
        /// </summary>
        public double total_short_close_posi_fee
        {
            get { return _total_short_close_posi_fee; }

            set
            {
                _total_short_close_posi_fee = value;
                RaisePropertyChanged(() => total_short_close_posi_fee);
            }
        }

        private double _total_realize_pandl;
        /// <summary>
        /// ��ʵ��ӯ��
        /// </summary>
        public double total_realize_pandl
        {
            get { return _total_realize_pandl; }

            set
            {
                _total_realize_pandl = value;
                RaisePropertyChanged(() => total_realize_pandl);
            }
        }

        private double _long_curr_qty;
        /// <summary>
        /// ��ͷ��ǰ����
        /// </summary>
        public double long_curr_qty
        {
            get { return _long_curr_qty; }

            set
            {
                _long_curr_qty = value;
                RaisePropertyChanged(() => long_curr_qty);
            }
        }

        private double _short_curr_qty;
        /// <summary>
        /// ��ͷ��ǰ����
        /// </summary>
        public double short_curr_qty
        {
            get { return _short_curr_qty; }

            set
            {
                _short_curr_qty = value;
                RaisePropertyChanged(() => short_curr_qty);
            }
        }

        private double _long_open_posi_value;
        /// <summary>
        /// ��ͷ������ֵ
        /// </summary>
        public double long_open_posi_value
        {
            get { return _long_open_posi_value; }

            set
            {
                _long_open_posi_value = value;
                RaisePropertyChanged(() => long_open_posi_value);
            }
        }

        private double _short_open_posi_value;
        /// <summary>
        /// ��ͷ������ֵ
        /// </summary>
        public double short_open_posi_value
        {
            get { return _short_open_posi_value; }

            set
            {
                _short_open_posi_value = value;
                RaisePropertyChanged(() => short_open_posi_value);
            }
        }

        private double _long_open_posi_fee;
        /// <summary>
        /// ��ͷ���ַ���
        /// </summary>
        public double long_open_posi_fee
        {
            get { return _long_open_posi_fee; }

            set
            {
                _long_open_posi_fee = value;
                RaisePropertyChanged(() => long_open_posi_fee);
            }
        }

        private double _short_open_posi_fee;
        /// <summary>
        /// ��ͷ���ַ���
        /// </summary>
        public double short_open_posi_fee
        {
            get { return _short_open_posi_fee; }

            set
            {
                _short_open_posi_fee = value;
                RaisePropertyChanged(() => short_open_posi_fee);
            }
        }

        private double _long_close_posi_qty;
        /// <summary>
        /// ��ͷƽ������
        /// </summary>
        public double long_close_posi_qty
        {
            get { return _long_close_posi_qty; }

            set
            {
                _long_close_posi_qty = value;
                RaisePropertyChanged(() => long_close_posi_qty);
            }
        }

        private double _short_close_posi_qty;
        /// <summary>
        /// ��ͷƽ������
        /// </summary>
        public double short_close_posi_qty
        {
            get { return _short_close_posi_qty; }

            set
            {
                _short_close_posi_qty = value;
                RaisePropertyChanged(() => short_close_posi_qty);
            }
        }

        private double _long_close_posi_value;
        /// <summary>
        /// ��ͷƽ����ֵ
        /// </summary>
        public double long_close_posi_value
        {
            get { return _long_close_posi_value; }

            set
            {
                _long_close_posi_value = value;
                RaisePropertyChanged(() => long_close_posi_value);
            }
        }

        private double _short_close_posi_value;
        /// <summary>
        /// ��ͷƽ����ֵ
        /// </summary>
        public double short_close_posi_value
        {
            get { return _short_close_posi_value; }

            set
            {
                _short_close_posi_value = value;
                RaisePropertyChanged(() => short_close_posi_value);
            }
        }

        private double _long_close_posi_fee;
        /// <summary>
        /// ��ͷƽ�ַ���
        /// </summary>
        public double long_close_posi_fee
        {
            get { return _long_close_posi_fee; }

            set
            {
                _long_close_posi_fee = value;
                RaisePropertyChanged(() => long_close_posi_fee);
            }
        }

        private double _short_close_posi_fee;
        /// <summary>
        /// ��ͷƽ�ַ���
        /// </summary>
        public double short_close_posi_fee
        {
            get { return _short_close_posi_fee; }

            set
            {
                _short_close_posi_fee = value;
                RaisePropertyChanged(() => short_close_posi_fee);
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

        private double _over_night_pandl;
        /// <summary>
        /// ��ҹӯ��
        /// </summary>
        public double over_night_pandl
        {
            get { return _over_night_pandl; }

            set
            {
                _over_night_pandl = value;
                RaisePropertyChanged(() => over_night_pandl);
            }
        }
    }

    public class rptL_4_6_Info : ObservableObject
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

        private double _posi_market_value;
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value
        {
            get { return _posi_market_value; }

            set
            {
                _posi_market_value = value;
                RaisePropertyChanged(() => posi_market_value);
            }
        }

        private double _trade_amt;
        /// <summary>
        /// ���׽��
        /// </summary>
        public double trade_amt
        {
            get { return _trade_amt; }

            set
            {
                _trade_amt = value;
                RaisePropertyChanged(() => trade_amt);
            }
        }

        private double _today_pandl;
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double today_pandl
        {
            get { return _today_pandl; }

            set
            {
                _today_pandl = value;
                RaisePropertyChanged(() => today_pandl);
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

        private double _yield_rate;
        /// <summary>
        /// ������
        /// </summary>
        public double yield_rate
        {
            get { return _yield_rate; }

            set
            {
                _yield_rate = value;
                RaisePropertyChanged(() => yield_rate);
            }
        }
    }

    public class rptL_4_7_Info : ObservableObject
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

        private double _today_buy_qty;
        /// <summary>
        /// ������������
        /// </summary>
        public double today_buy_qty
        {
            get { return _today_buy_qty; }

            set
            {
                _today_buy_qty = value;
                RaisePropertyChanged(() => today_buy_qty);
            }
        }

        private double _today_sell_qty;
        /// <summary>
        /// ������������
        /// </summary>
        public double today_sell_qty
        {
            get { return _today_sell_qty; }

            set
            {
                _today_sell_qty = value;
                RaisePropertyChanged(() => today_sell_qty);
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

        private double _cost_price;
        /// <summary>
        /// �ɱ���
        /// </summary>
        public double cost_price
        {
            get { return _cost_price; }

            set
            {
                _cost_price = value;
                RaisePropertyChanged(() => cost_price);
            }
        }

        private double _today_close_price;
        /// <summary>
        /// �����̼�
        /// </summary>
        public double today_close_price
        {
            get { return _today_close_price; }

            set
            {
                _today_close_price = value;
                RaisePropertyChanged(() => today_close_price);
            }
        }

        private double _posi_market_value;
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value
        {
            get { return _posi_market_value; }

            set
            {
                _posi_market_value = value;
                RaisePropertyChanged(() => posi_market_value);
            }
        }
    }

    public class rptL_4_8_Info : ObservableObject
    {

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

        private double _today_buy_qty;
        /// <summary>
        /// ������������
        /// </summary>
        public double today_buy_qty
        {
            get { return _today_buy_qty; }

            set
            {
                _today_buy_qty = value;
                RaisePropertyChanged(() => today_buy_qty);
            }
        }

        private double _today_sell_qty;
        /// <summary>
        /// ������������
        /// </summary>
        public double today_sell_qty
        {
            get { return _today_sell_qty; }

            set
            {
                _today_sell_qty = value;
                RaisePropertyChanged(() => today_sell_qty);
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

        private double _today_close_price;
        /// <summary>
        /// �����̼�
        /// </summary>
        public double today_close_price
        {
            get { return _today_close_price; }

            set
            {
                _today_close_price = value;
                RaisePropertyChanged(() => today_close_price);
            }
        }

        private double _posi_market_value;
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value
        {
            get { return _posi_market_value; }

            set
            {
                _posi_market_value = value;
                RaisePropertyChanged(() => posi_market_value);
            }
        }

        private double _posi_nav_ratio;
        /// <summary>
        /// �ֲ־�ֵռ��
        /// </summary>
        public double posi_nav_ratio
        {
            get { return _posi_nav_ratio; }

            set
            {
                _posi_nav_ratio = value;
                RaisePropertyChanged(() => posi_nav_ratio);
            }
        }
    }

    public class rptL_4_9_Info : ObservableObject
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

        private double _pre_holding_qty;
        /// <summary>
        /// ���ճֲ�����
        /// </summary>
        public double pre_holding_qty
        {
            get { return _pre_holding_qty; }

            set
            {
                _pre_holding_qty = value;
                RaisePropertyChanged(() => pre_holding_qty);
            }
        }

        private double _today_buy_qty;
        /// <summary>
        /// ������������
        /// </summary>
        public double today_buy_qty
        {
            get { return _today_buy_qty; }

            set
            {
                _today_buy_qty = value;
                RaisePropertyChanged(() => today_buy_qty);
            }
        }

        private double _today_buy_amt;
        /// <summary>
        /// ����������
        /// </summary>
        public double today_buy_amt
        {
            get { return _today_buy_amt; }

            set
            {
                _today_buy_amt = value;
                RaisePropertyChanged(() => today_buy_amt);
            }
        }

        private double _today_buy_price;
        /// <summary>
        /// ��������۸�
        /// </summary>
        public double today_buy_price
        {
            get { return _today_buy_price; }

            set
            {
                _today_buy_price = value;
                RaisePropertyChanged(() => today_buy_price);
            }
        }

        private int _buy_begin_time;
        /// <summary>
        /// ���뿪ʼʱ��
        /// </summary>
        public int buy_begin_time
        {
            get { return _buy_begin_time; }

            set
            {
                _buy_begin_time = value;
                RaisePropertyChanged(() => buy_begin_time);
            }
        }

        private int _buy_end_time;
        /// <summary>
        /// �������ʱ��
        /// </summary>
        public int buy_end_time
        {
            get { return _buy_end_time; }

            set
            {
                _buy_end_time = value;
                RaisePropertyChanged(() => buy_end_time);
            }
        }

        private double _today_sell_qty;
        /// <summary>
        /// ������������
        /// </summary>
        public double today_sell_qty
        {
            get { return _today_sell_qty; }

            set
            {
                _today_sell_qty = value;
                RaisePropertyChanged(() => today_sell_qty);
            }
        }

        private double _today_sell_amt;
        /// <summary>
        /// �����������
        /// </summary>
        public double today_sell_amt
        {
            get { return _today_sell_amt; }

            set
            {
                _today_sell_amt = value;
                RaisePropertyChanged(() => today_sell_amt);
            }
        }

        private double _today_sell_price;
        /// <summary>
        /// ���������۸�
        /// </summary>
        public double today_sell_price
        {
            get { return _today_sell_price; }

            set
            {
                _today_sell_price = value;
                RaisePropertyChanged(() => today_sell_price);
            }
        }

        private int _sell_begin_time;
        /// <summary>
        /// ������ʼʱ��
        /// </summary>
        public int sell_begin_time
        {
            get { return _sell_begin_time; }

            set
            {
                _sell_begin_time = value;
                RaisePropertyChanged(() => sell_begin_time);
            }
        }

        private int _sell_end_time;
        /// <summary>
        /// ��������ʱ��
        /// </summary>
        public int sell_end_time
        {
            get { return _sell_end_time; }

            set
            {
                _sell_end_time = value;
                RaisePropertyChanged(() => sell_end_time);
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

        private double _today_close_price;
        /// <summary>
        /// �����̼�
        /// </summary>
        public double today_close_price
        {
            get { return _today_close_price; }

            set
            {
                _today_close_price = value;
                RaisePropertyChanged(() => today_close_price);
            }
        }

        private double _posi_market_value;
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value
        {
            get { return _posi_market_value; }

            set
            {
                _posi_market_value = value;
                RaisePropertyChanged(() => posi_market_value);
            }
        }
    }

    public class rptL_4_10_Info : ObservableObject
    {

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

        private double _last_price;
        /// <summary>
        /// ���¼�
        /// </summary>
        public double last_price
        {
            get { return _last_price; }

            set
            {
                _last_price = value;
                RaisePropertyChanged(() => last_price);
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

        private double _posi_market_value;
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value
        {
            get { return _posi_market_value; }

            set
            {
                _posi_market_value = value;
                RaisePropertyChanged(() => posi_market_value);
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

        private double _cost_price;
        /// <summary>
        /// �ɱ���
        /// </summary>
        public double cost_price
        {
            get { return _cost_price; }

            set
            {
                _cost_price = value;
                RaisePropertyChanged(() => cost_price);
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

        private double _float_pandl;
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double float_pandl
        {
            get { return _float_pandl; }

            set
            {
                _float_pandl = value;
                RaisePropertyChanged(() => float_pandl);
            }
        }

        private double _float_pandl_ratio;
        /// <summary>
        /// ����ӯ������
        /// </summary>
        public double float_pandl_ratio
        {
            get { return _float_pandl_ratio; }

            set
            {
                _float_pandl_ratio = value;
                RaisePropertyChanged(() => float_pandl_ratio);
            }
        }

        private double _market_value_ratio;
        /// <summary>
        /// ��ֵռ��
        /// </summary>
        public double market_value_ratio
        {
            get { return _market_value_ratio; }

            set
            {
                _market_value_ratio = value;
                RaisePropertyChanged(() => market_value_ratio);
            }
        }

        private double _nav_ratio;
        /// <summary>
        /// ��ֵռ��
        /// </summary>
        public double nav_ratio
        {
            get { return _nav_ratio; }

            set
            {
                _nav_ratio = value;
                RaisePropertyChanged(() => nav_ratio);
            }
        }
    }

    public class rptL_4_11_Info : ObservableObject
    {

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

        private double _posi_market_value;
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value
        {
            get { return _posi_market_value; }

            set
            {
                _posi_market_value = value;
                RaisePropertyChanged(() => posi_market_value);
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

        private double _cost_price;
        /// <summary>
        /// �ɱ���
        /// </summary>
        public double cost_price
        {
            get { return _cost_price; }

            set
            {
                _cost_price = value;
                RaisePropertyChanged(() => cost_price);
            }
        }

        private double _last_price;
        /// <summary>
        /// ���¼�
        /// </summary>
        public double last_price
        {
            get { return _last_price; }

            set
            {
                _last_price = value;
                RaisePropertyChanged(() => last_price);
            }
        }

        private double _float_pandl;
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double float_pandl
        {
            get { return _float_pandl; }

            set
            {
                _float_pandl = value;
                RaisePropertyChanged(() => float_pandl);
            }
        }

        private double _float_pandl_ratio;
        /// <summary>
        /// ����ӯ������
        /// </summary>
        public double float_pandl_ratio
        {
            get { return _float_pandl_ratio; }

            set
            {
                _float_pandl_ratio = value;
                RaisePropertyChanged(() => float_pandl_ratio);
            }
        }

        private double _market_value_ratio;
        /// <summary>
        /// ��ֵռ��
        /// </summary>
        public double market_value_ratio
        {
            get { return _market_value_ratio; }

            set
            {
                _market_value_ratio = value;
                RaisePropertyChanged(() => market_value_ratio);
            }
        }

        private double _nav_ratio;
        /// <summary>
        /// ��ֵռ��
        /// </summary>
        public double nav_ratio
        {
            get { return _nav_ratio; }

            set
            {
                _nav_ratio = value;
                RaisePropertyChanged(() => nav_ratio);
            }
        }
    }

    public class rptL_4_12_Info : ObservableObject
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

        private double _posi_market_value;
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value
        {
            get { return _posi_market_value; }

            set
            {
                _posi_market_value = value;
                RaisePropertyChanged(() => posi_market_value);
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

        private double _cost_price;
        /// <summary>
        /// �ɱ���
        /// </summary>
        public double cost_price
        {
            get { return _cost_price; }

            set
            {
                _cost_price = value;
                RaisePropertyChanged(() => cost_price);
            }
        }

        private double _last_price;
        /// <summary>
        /// ���¼�
        /// </summary>
        public double last_price
        {
            get { return _last_price; }

            set
            {
                _last_price = value;
                RaisePropertyChanged(() => last_price);
            }
        }

        private double _float_pandl;
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double float_pandl
        {
            get { return _float_pandl; }

            set
            {
                _float_pandl = value;
                RaisePropertyChanged(() => float_pandl);
            }
        }

        private double _pandl_ratio;
        /// <summary>
        /// ӯ������
        /// </summary>
        public double pandl_ratio
        {
            get { return _pandl_ratio; }

            set
            {
                _pandl_ratio = value;
                RaisePropertyChanged(() => pandl_ratio);
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

        private double _posi_nav_ratio;
        /// <summary>
        /// �ֲ־�ֵռ��
        /// </summary>
        public double posi_nav_ratio
        {
            get { return _posi_nav_ratio; }

            set
            {
                _posi_nav_ratio = value;
                RaisePropertyChanged(() => posi_nav_ratio);
            }
        }

        private double _bond_receivable_amt;
        /// <summary>
        /// ծȯӦ����Ϣ
        /// </summary>
        public double bond_receivable_amt
        {
            get { return _bond_receivable_amt; }

            set
            {
                _bond_receivable_amt = value;
                RaisePropertyChanged(() => bond_receivable_amt);
            }
        }

        private double _full_holding_amt;
        /// <summary>
        /// ȫ�۳ֲ���ֵ
        /// </summary>
        public double full_holding_amt
        {
            get { return _full_holding_amt; }

            set
            {
                _full_holding_amt = value;
                RaisePropertyChanged(() => full_holding_amt);
            }
        }

        private double _impawn_qty;
        /// <summary>
        /// ��Ѻ����
        /// </summary>
        public double impawn_qty
        {
            get { return _impawn_qty; }

            set
            {
                _impawn_qty = value;
                RaisePropertyChanged(() => impawn_qty);
            }
        }
    }

    public class rptL_4_13_Info : ObservableObject
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

        private double _posi_market_value;
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value
        {
            get { return _posi_market_value; }

            set
            {
                _posi_market_value = value;
                RaisePropertyChanged(() => posi_market_value);
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

        private double _cost_price;
        /// <summary>
        /// �ɱ���
        /// </summary>
        public double cost_price
        {
            get { return _cost_price; }

            set
            {
                _cost_price = value;
                RaisePropertyChanged(() => cost_price);
            }
        }

        private double _last_price;
        /// <summary>
        /// ���¼�
        /// </summary>
        public double last_price
        {
            get { return _last_price; }

            set
            {
                _last_price = value;
                RaisePropertyChanged(() => last_price);
            }
        }

        private double _float_pandl;
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double float_pandl
        {
            get { return _float_pandl; }

            set
            {
                _float_pandl = value;
                RaisePropertyChanged(() => float_pandl);
            }
        }

        private double _pandl_ratio;
        /// <summary>
        /// ӯ������
        /// </summary>
        public double pandl_ratio
        {
            get { return _pandl_ratio; }

            set
            {
                _pandl_ratio = value;
                RaisePropertyChanged(() => pandl_ratio);
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

        private double _posi_nav_ratio;
        /// <summary>
        /// �ֲ־�ֵռ��
        /// </summary>
        public double posi_nav_ratio
        {
            get { return _posi_nav_ratio; }

            set
            {
                _posi_nav_ratio = value;
                RaisePropertyChanged(() => posi_nav_ratio);
            }
        }

        private double _bond_receivable_amt;
        /// <summary>
        /// ծȯӦ����Ϣ
        /// </summary>
        public double bond_receivable_amt
        {
            get { return _bond_receivable_amt; }

            set
            {
                _bond_receivable_amt = value;
                RaisePropertyChanged(() => bond_receivable_amt);
            }
        }

        private double _full_holding_amt;
        /// <summary>
        /// ȫ�۳ֲ���ֵ
        /// </summary>
        public double full_holding_amt
        {
            get { return _full_holding_amt; }

            set
            {
                _full_holding_amt = value;
                RaisePropertyChanged(() => full_holding_amt);
            }
        }

        private double _impawn_qty;
        /// <summary>
        /// ��Ѻ����
        /// </summary>
        public double impawn_qty
        {
            get { return _impawn_qty; }

            set
            {
                _impawn_qty = value;
                RaisePropertyChanged(() => impawn_qty);
            }
        }
    }

    public class rptL_4_14_Info : ObservableObject
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

        private double _over_night_pandl;
        /// <summary>
        /// ��ҹӯ��
        /// </summary>
        public double over_night_pandl
        {
            get { return _over_night_pandl; }

            set
            {
                _over_night_pandl = value;
                RaisePropertyChanged(() => over_night_pandl);
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

        private double _trade_amt;
        /// <summary>
        /// ���׽��
        /// </summary>
        public double trade_amt
        {
            get { return _trade_amt; }

            set
            {
                _trade_amt = value;
                RaisePropertyChanged(() => trade_amt);
            }
        }

        private double _close_posi_market_value;
        /// <summary>
        /// ƽ����ֵ
        /// </summary>
        public double close_posi_market_value
        {
            get { return _close_posi_market_value; }

            set
            {
                _close_posi_market_value = value;
                RaisePropertyChanged(() => close_posi_market_value);
            }
        }

        private double _buy_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double buy_qty
        {
            get { return _buy_qty; }

            set
            {
                _buy_qty = value;
                RaisePropertyChanged(() => buy_qty);
            }
        }

        private double _buy_amt;
        /// <summary>
        /// ������
        /// </summary>
        public double buy_amt
        {
            get { return _buy_amt; }

            set
            {
                _buy_amt = value;
                RaisePropertyChanged(() => buy_amt);
            }
        }

        private double _sell_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double sell_qty
        {
            get { return _sell_qty; }

            set
            {
                _sell_qty = value;
                RaisePropertyChanged(() => sell_qty);
            }
        }

        private double _sellout_amt;
        /// <summary>
        /// �������
        /// </summary>
        public double sellout_amt
        {
            get { return _sellout_amt; }

            set
            {
                _sellout_amt = value;
                RaisePropertyChanged(() => sellout_amt);
            }
        }

        private double _close_posi_qty;
        /// <summary>
        /// ƽ������
        /// </summary>
        public double close_posi_qty
        {
            get { return _close_posi_qty; }

            set
            {
                _close_posi_qty = value;
                RaisePropertyChanged(() => close_posi_qty);
            }
        }

        private double _yield_rate;
        /// <summary>
        /// ������
        /// </summary>
        public double yield_rate
        {
            get { return _yield_rate; }

            set
            {
                _yield_rate = value;
                RaisePropertyChanged(() => yield_rate);
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

        private double _trade_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double trade_qty
        {
            get { return _trade_qty; }

            set
            {
                _trade_qty = value;
                RaisePropertyChanged(() => trade_qty);
            }
        }

        private double _open_posi_value;
        /// <summary>
        /// ������ֵ
        /// </summary>
        public double open_posi_value
        {
            get { return _open_posi_value; }

            set
            {
                _open_posi_value = value;
                RaisePropertyChanged(() => open_posi_value);
            }
        }
    }

    public class rptL_4_15_Info : ObservableObject
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

        private double _today_pandl;
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double today_pandl
        {
            get { return _today_pandl; }

            set
            {
                _today_pandl = value;
                RaisePropertyChanged(() => today_pandl);
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

        private double _over_night_pandl;
        /// <summary>
        /// ��ҹӯ��
        /// </summary>
        public double over_night_pandl
        {
            get { return _over_night_pandl; }

            set
            {
                _over_night_pandl = value;
                RaisePropertyChanged(() => over_night_pandl);
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

        private double _trade_amt;
        /// <summary>
        /// ���׽��
        /// </summary>
        public double trade_amt
        {
            get { return _trade_amt; }

            set
            {
                _trade_amt = value;
                RaisePropertyChanged(() => trade_amt);
            }
        }

        private double _close_posi_market_value;
        /// <summary>
        /// ƽ����ֵ
        /// </summary>
        public double close_posi_market_value
        {
            get { return _close_posi_market_value; }

            set
            {
                _close_posi_market_value = value;
                RaisePropertyChanged(() => close_posi_market_value);
            }
        }

        private double _buy_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double buy_qty
        {
            get { return _buy_qty; }

            set
            {
                _buy_qty = value;
                RaisePropertyChanged(() => buy_qty);
            }
        }

        private double _buy_amt;
        /// <summary>
        /// ������
        /// </summary>
        public double buy_amt
        {
            get { return _buy_amt; }

            set
            {
                _buy_amt = value;
                RaisePropertyChanged(() => buy_amt);
            }
        }

        private double _sell_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double sell_qty
        {
            get { return _sell_qty; }

            set
            {
                _sell_qty = value;
                RaisePropertyChanged(() => sell_qty);
            }
        }

        private double _sellout_amt;
        /// <summary>
        /// �������
        /// </summary>
        public double sellout_amt
        {
            get { return _sellout_amt; }

            set
            {
                _sellout_amt = value;
                RaisePropertyChanged(() => sellout_amt);
            }
        }
    }

    public class rptL_4_16_Info : ObservableObject
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

        private double _open_posi_value;
        /// <summary>
        /// ������ֵ
        /// </summary>
        public double open_posi_value
        {
            get { return _open_posi_value; }

            set
            {
                _open_posi_value = value;
                RaisePropertyChanged(() => open_posi_value);
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

        private double _close_posi_qty;
        /// <summary>
        /// ƽ������
        /// </summary>
        public double close_posi_qty
        {
            get { return _close_posi_qty; }

            set
            {
                _close_posi_qty = value;
                RaisePropertyChanged(() => close_posi_qty);
            }
        }

        private double _close_posi_market_value;
        /// <summary>
        /// ƽ����ֵ
        /// </summary>
        public double close_posi_market_value
        {
            get { return _close_posi_market_value; }

            set
            {
                _close_posi_market_value = value;
                RaisePropertyChanged(() => close_posi_market_value);
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

        private double _un_close_posi_qty;
        /// <summary>
        /// δƽ������
        /// </summary>
        public double un_close_posi_qty
        {
            get { return _un_close_posi_qty; }

            set
            {
                _un_close_posi_qty = value;
                RaisePropertyChanged(() => un_close_posi_qty);
            }
        }

        private double _un_close_marke_value;
        /// <summary>
        /// δƽ����ֵ
        /// </summary>
        public double un_close_marke_value
        {
            get { return _un_close_marke_value; }

            set
            {
                _un_close_marke_value = value;
                RaisePropertyChanged(() => un_close_marke_value);
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

        private double _over_night_pandl;
        /// <summary>
        /// ��ҹӯ��
        /// </summary>
        public double over_night_pandl
        {
            get { return _over_night_pandl; }

            set
            {
                _over_night_pandl = value;
                RaisePropertyChanged(() => over_night_pandl);
            }
        }
    }

    public class rptL_4_17_Info : ObservableObject
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

        private double _trade_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double trade_qty
        {
            get { return _trade_qty; }

            set
            {
                _trade_qty = value;
                RaisePropertyChanged(() => trade_qty);
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

        private double _yield_rate;
        /// <summary>
        /// ������
        /// </summary>
        public double yield_rate
        {
            get { return _yield_rate; }

            set
            {
                _yield_rate = value;
                RaisePropertyChanged(() => yield_rate);
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

        private double _open_posi_value;
        /// <summary>
        /// ������ֵ
        /// </summary>
        public double open_posi_value
        {
            get { return _open_posi_value; }

            set
            {
                _open_posi_value = value;
                RaisePropertyChanged(() => open_posi_value);
            }
        }

        private double _close_posi_qty;
        /// <summary>
        /// ƽ������
        /// </summary>
        public double close_posi_qty
        {
            get { return _close_posi_qty; }

            set
            {
                _close_posi_qty = value;
                RaisePropertyChanged(() => close_posi_qty);
            }
        }

        private double _close_posi_market_value;
        /// <summary>
        /// ƽ����ֵ
        /// </summary>
        public double close_posi_market_value
        {
            get { return _close_posi_market_value; }

            set
            {
                _close_posi_market_value = value;
                RaisePropertyChanged(() => close_posi_market_value);
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

        private double _over_night_pandl;
        /// <summary>
        /// ��ҹӯ��
        /// </summary>
        public double over_night_pandl
        {
            get { return _over_night_pandl; }

            set
            {
                _over_night_pandl = value;
                RaisePropertyChanged(() => over_night_pandl);
            }
        }

        private double _trade_amt;
        /// <summary>
        /// ���׽��
        /// </summary>
        public double trade_amt
        {
            get { return _trade_amt; }

            set
            {
                _trade_amt = value;
                RaisePropertyChanged(() => trade_amt);
            }
        }

        private double _un_close_posi_qty;
        /// <summary>
        /// δƽ������
        /// </summary>
        public double un_close_posi_qty
        {
            get { return _un_close_posi_qty; }

            set
            {
                _un_close_posi_qty = value;
                RaisePropertyChanged(() => un_close_posi_qty);
            }
        }

        private double _un_close_marke_value;
        /// <summary>
        /// δƽ����ֵ
        /// </summary>
        public double un_close_marke_value
        {
            get { return _un_close_marke_value; }

            set
            {
                _un_close_marke_value = value;
                RaisePropertyChanged(() => un_close_marke_value);
            }
        }
    }

    public class rptL_4_18_Info : ObservableObject
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

        private int _report_date;
        /// <summary>
        /// �걨����
        /// </summary>
        public int report_date
        {
            get { return _report_date; }

            set
            {
                _report_date = value;
                RaisePropertyChanged(() => report_date);
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

        private int _order_no;
        /// <summary>
        /// �������
        /// </summary>
        public int order_no
        {
            get { return _order_no; }

            set
            {
                _order_no = value;
                RaisePropertyChanged(() => order_no);
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

        private double _strike_price;
        /// <summary>
        /// �ɽ��۸�
        /// </summary>
        public double strike_price
        {
            get { return _strike_price; }

            set
            {
                _strike_price = value;
                RaisePropertyChanged(() => strike_price);
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

        private int _strike_date;
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public int strike_date
        {
            get { return _strike_date; }

            set
            {
                _strike_date = value;
                RaisePropertyChanged(() => strike_date);
            }
        }

        private int _strike_time;
        /// <summary>
        /// �ɽ�ʱ��
        /// </summary>
        public int strike_time
        {
            get { return _strike_time; }

            set
            {
                _strike_time = value;
                RaisePropertyChanged(() => strike_time);
            }
        }

        private ulong _strike_id;
        /// <summary>
        /// �ɽ����
        /// </summary>
        public ulong strike_id
        {
            get { return _strike_id; }

            set
            {
                _strike_id = value;
                RaisePropertyChanged(() => strike_id);
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

        private int _busi_opor_no;
        /// <summary>
        /// ҵ�����Ա���
        /// </summary>
        public int busi_opor_no
        {
            get { return _busi_opor_no; }

            set
            {
                _busi_opor_no = value;
                RaisePropertyChanged(() => busi_opor_no);
            }
        }

        private String _busi_opor_name;
        /// <summary>
        /// ҵ�����Ա����
        /// </summary>
        public String busi_opor_name
        {
            get { return _busi_opor_name; }

            set
            {
                _busi_opor_name = value;
                RaisePropertyChanged(() => busi_opor_name);
            }
        }

        private double _bond_accr_intrst;
        /// <summary>
        /// ծȯ������Ϣ
        /// </summary>
        public double bond_accr_intrst
        {
            get { return _bond_accr_intrst; }

            set
            {
                _bond_accr_intrst = value;
                RaisePropertyChanged(() => bond_accr_intrst);
            }
        }

        private int _net_price_flag;
        /// <summary>
        /// ���۱�־
        /// </summary>
        public int net_price_flag
        {
            get { return _net_price_flag; }

            set
            {
                _net_price_flag = value;
                RaisePropertyChanged(() => net_price_flag);
            }
        }

        private double _full_execution_amt;
        /// <summary>
        /// ȫ�۳ɽ����
        /// </summary>
        public double full_execution_amt
        {
            get { return _full_execution_amt; }

            set
            {
                _full_execution_amt = value;
                RaisePropertyChanged(() => full_execution_amt);
            }
        }

        private double _strike_aver_price;
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_aver_price
        {
            get { return _strike_aver_price; }

            set
            {
                _strike_aver_price = value;
                RaisePropertyChanged(() => strike_aver_price);
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

        private int _record_valid_flag;
        /// <summary>
        /// ��¼��Ч��־
        /// </summary>
        public int record_valid_flag
        {
            get { return _record_valid_flag; }

            set
            {
                _record_valid_flag = value;
                RaisePropertyChanged(() => record_valid_flag);
            }
        }
    }

    public class rptL_4_19_Info : ObservableObject
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

        private int _report_date;
        /// <summary>
        /// �걨����
        /// </summary>
        public int report_date
        {
            get { return _report_date; }

            set
            {
                _report_date = value;
                RaisePropertyChanged(() => report_date);
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

        private int _order_no;
        /// <summary>
        /// �������
        /// </summary>
        public int order_no
        {
            get { return _order_no; }

            set
            {
                _order_no = value;
                RaisePropertyChanged(() => order_no);
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

        private double _strike_price;
        /// <summary>
        /// �ɽ��۸�
        /// </summary>
        public double strike_price
        {
            get { return _strike_price; }

            set
            {
                _strike_price = value;
                RaisePropertyChanged(() => strike_price);
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

        private int _strike_date;
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public int strike_date
        {
            get { return _strike_date; }

            set
            {
                _strike_date = value;
                RaisePropertyChanged(() => strike_date);
            }
        }

        private int _strike_time;
        /// <summary>
        /// �ɽ�ʱ��
        /// </summary>
        public int strike_time
        {
            get { return _strike_time; }

            set
            {
                _strike_time = value;
                RaisePropertyChanged(() => strike_time);
            }
        }

        private ulong _strike_id;
        /// <summary>
        /// �ɽ����
        /// </summary>
        public ulong strike_id
        {
            get { return _strike_id; }

            set
            {
                _strike_id = value;
                RaisePropertyChanged(() => strike_id);
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

        private int _busi_opor_no;
        /// <summary>
        /// ҵ�����Ա���
        /// </summary>
        public int busi_opor_no
        {
            get { return _busi_opor_no; }

            set
            {
                _busi_opor_no = value;
                RaisePropertyChanged(() => busi_opor_no);
            }
        }

        private String _busi_opor_name;
        /// <summary>
        /// ҵ�����Ա����
        /// </summary>
        public String busi_opor_name
        {
            get { return _busi_opor_name; }

            set
            {
                _busi_opor_name = value;
                RaisePropertyChanged(() => busi_opor_name);
            }
        }

        private double _bond_accr_intrst;
        /// <summary>
        /// ծȯ������Ϣ
        /// </summary>
        public double bond_accr_intrst
        {
            get { return _bond_accr_intrst; }

            set
            {
                _bond_accr_intrst = value;
                RaisePropertyChanged(() => bond_accr_intrst);
            }
        }

        private int _net_price_flag;
        /// <summary>
        /// ���۱�־
        /// </summary>
        public int net_price_flag
        {
            get { return _net_price_flag; }

            set
            {
                _net_price_flag = value;
                RaisePropertyChanged(() => net_price_flag);
            }
        }

        private double _full_execution_amt;
        /// <summary>
        /// ȫ�۳ɽ����
        /// </summary>
        public double full_execution_amt
        {
            get { return _full_execution_amt; }

            set
            {
                _full_execution_amt = value;
                RaisePropertyChanged(() => full_execution_amt);
            }
        }

        private double _strike_aver_price;
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public double strike_aver_price
        {
            get { return _strike_aver_price; }

            set
            {
                _strike_aver_price = value;
                RaisePropertyChanged(() => strike_aver_price);
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

        private int _record_valid_flag;
        /// <summary>
        /// ��¼��Ч��־
        /// </summary>
        public int record_valid_flag
        {
            get { return _record_valid_flag; }

            set
            {
                _record_valid_flag = value;
                RaisePropertyChanged(() => record_valid_flag);
            }
        }
    }

    public class rptL_4_20_Info : ObservableObject
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

        private String _opor_name;
        /// <summary>
        /// ����Ա����
        /// </summary>
        public String opor_name
        {
            get { return _opor_name; }

            set
            {
                _opor_name = value;
                RaisePropertyChanged(() => opor_name);
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

        private double _month_pandl;
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double month_pandl
        {
            get { return _month_pandl; }

            set
            {
                _month_pandl = value;
                RaisePropertyChanged(() => month_pandl);
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

        private double _trade_amt;
        /// <summary>
        /// ���׽��
        /// </summary>
        public double trade_amt
        {
            get { return _trade_amt; }

            set
            {
                _trade_amt = value;
                RaisePropertyChanged(() => trade_amt);
            }
        }

        private double _close_posi_market_value;
        /// <summary>
        /// ƽ����ֵ
        /// </summary>
        public double close_posi_market_value
        {
            get { return _close_posi_market_value; }

            set
            {
                _close_posi_market_value = value;
                RaisePropertyChanged(() => close_posi_market_value);
            }
        }

        private double _buy_amt;
        /// <summary>
        /// ������
        /// </summary>
        public double buy_amt
        {
            get { return _buy_amt; }

            set
            {
                _buy_amt = value;
                RaisePropertyChanged(() => buy_amt);
            }
        }

        private double _sell_amt;
        /// <summary>
        /// ���۽��
        /// </summary>
        public double sell_amt
        {
            get { return _sell_amt; }

            set
            {
                _sell_amt = value;
                RaisePropertyChanged(() => sell_amt);
            }
        }
    }

    public class rptL_4_21_Info : ObservableObject
    {

        private int _curr_month;
        /// <summary>
        /// ��ǰ�·�
        /// </summary>
        public int curr_month
        {
            get { return _curr_month; }

            set
            {
                _curr_month = value;
                RaisePropertyChanged(() => curr_month);
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

        private String _opor_name;
        /// <summary>
        /// ����Ա����
        /// </summary>
        public String opor_name
        {
            get { return _opor_name; }

            set
            {
                _opor_name = value;
                RaisePropertyChanged(() => opor_name);
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

        private double _month_pandl;
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double month_pandl
        {
            get { return _month_pandl; }

            set
            {
                _month_pandl = value;
                RaisePropertyChanged(() => month_pandl);
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

        private double _trade_amt;
        /// <summary>
        /// ���׽��
        /// </summary>
        public double trade_amt
        {
            get { return _trade_amt; }

            set
            {
                _trade_amt = value;
                RaisePropertyChanged(() => trade_amt);
            }
        }

        private double _close_posi_market_value;
        /// <summary>
        /// ƽ����ֵ
        /// </summary>
        public double close_posi_market_value
        {
            get { return _close_posi_market_value; }

            set
            {
                _close_posi_market_value = value;
                RaisePropertyChanged(() => close_posi_market_value);
            }
        }

        private double _buy_amt;
        /// <summary>
        /// ������
        /// </summary>
        public double buy_amt
        {
            get { return _buy_amt; }

            set
            {
                _buy_amt = value;
                RaisePropertyChanged(() => buy_amt);
            }
        }

        private double _sell_amt;
        /// <summary>
        /// ���۽��
        /// </summary>
        public double sell_amt
        {
            get { return _sell_amt; }

            set
            {
                _sell_amt = value;
                RaisePropertyChanged(() => sell_amt);
            }
        }

        private double _yield_rate;
        /// <summary>
        /// ������
        /// </summary>
        public double yield_rate
        {
            get { return _yield_rate; }

            set
            {
                _yield_rate = value;
                RaisePropertyChanged(() => yield_rate);
            }
        }
    }

    public class rptL_4_27_Info : ObservableObject
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

        private double _trade_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double trade_qty
        {
            get { return _trade_qty; }

            set
            {
                _trade_qty = value;
                RaisePropertyChanged(() => trade_qty);
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

        private double _yield_rate;
        /// <summary>
        /// ������
        /// </summary>
        public double yield_rate
        {
            get { return _yield_rate; }

            set
            {
                _yield_rate = value;
                RaisePropertyChanged(() => yield_rate);
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

        private double _open_posi_value;
        /// <summary>
        /// ������ֵ
        /// </summary>
        public double open_posi_value
        {
            get { return _open_posi_value; }

            set
            {
                _open_posi_value = value;
                RaisePropertyChanged(() => open_posi_value);
            }
        }

        private double _close_posi_qty;
        /// <summary>
        /// ƽ������
        /// </summary>
        public double close_posi_qty
        {
            get { return _close_posi_qty; }

            set
            {
                _close_posi_qty = value;
                RaisePropertyChanged(() => close_posi_qty);
            }
        }

        private double _close_posi_market_value;
        /// <summary>
        /// ƽ����ֵ
        /// </summary>
        public double close_posi_market_value
        {
            get { return _close_posi_market_value; }

            set
            {
                _close_posi_market_value = value;
                RaisePropertyChanged(() => close_posi_market_value);
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

        private double _over_night_pandl;
        /// <summary>
        /// ��ҹӯ��
        /// </summary>
        public double over_night_pandl
        {
            get { return _over_night_pandl; }

            set
            {
                _over_night_pandl = value;
                RaisePropertyChanged(() => over_night_pandl);
            }
        }

        private double _trade_amt;
        /// <summary>
        /// ���׽��
        /// </summary>
        public double trade_amt
        {
            get { return _trade_amt; }

            set
            {
                _trade_amt = value;
                RaisePropertyChanged(() => trade_amt);
            }
        }
    }

    public class rptL_4_28_Info : ObservableObject
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

        private double _trade_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double trade_qty
        {
            get { return _trade_qty; }

            set
            {
                _trade_qty = value;
                RaisePropertyChanged(() => trade_qty);
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

        private double _yield_rate;
        /// <summary>
        /// ������
        /// </summary>
        public double yield_rate
        {
            get { return _yield_rate; }

            set
            {
                _yield_rate = value;
                RaisePropertyChanged(() => yield_rate);
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

        private double _open_posi_value;
        /// <summary>
        /// ������ֵ
        /// </summary>
        public double open_posi_value
        {
            get { return _open_posi_value; }

            set
            {
                _open_posi_value = value;
                RaisePropertyChanged(() => open_posi_value);
            }
        }

        private double _close_posi_qty;
        /// <summary>
        /// ƽ������
        /// </summary>
        public double close_posi_qty
        {
            get { return _close_posi_qty; }

            set
            {
                _close_posi_qty = value;
                RaisePropertyChanged(() => close_posi_qty);
            }
        }

        private double _close_posi_market_value;
        /// <summary>
        /// ƽ����ֵ
        /// </summary>
        public double close_posi_market_value
        {
            get { return _close_posi_market_value; }

            set
            {
                _close_posi_market_value = value;
                RaisePropertyChanged(() => close_posi_market_value);
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

        private double _over_night_pandl;
        /// <summary>
        /// ��ҹӯ��
        /// </summary>
        public double over_night_pandl
        {
            get { return _over_night_pandl; }

            set
            {
                _over_night_pandl = value;
                RaisePropertyChanged(() => over_night_pandl);
            }
        }

        private double _trade_amt;
        /// <summary>
        /// ���׽��
        /// </summary>
        public double trade_amt
        {
            get { return _trade_amt; }

            set
            {
                _trade_amt = value;
                RaisePropertyChanged(() => trade_amt);
            }
        }
    }

    public class rptL_4_31_Info : ObservableObject
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

        private double _unit_nav;
        /// <summary>
        /// ��λ��ֵ
        /// </summary>
        public double unit_nav
        {
            get { return _unit_nav; }

            set
            {
                _unit_nav = value;
                RaisePropertyChanged(() => unit_nav);
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

        private double _nav_fluct;
        /// <summary>
        /// ��ֵ����
        /// </summary>
        public double nav_fluct
        {
            get { return _nav_fluct; }

            set
            {
                _nav_fluct = value;
                RaisePropertyChanged(() => nav_fluct);
            }
        }

        private double _cash_asset;
        /// <summary>
        /// �ֽ��ʲ�
        /// </summary>
        public double cash_asset
        {
            get { return _cash_asset; }

            set
            {
                _cash_asset = value;
                RaisePropertyChanged(() => cash_asset);
            }
        }

        private double _stock_asset;
        /// <summary>
        /// ��Ʊ�ʲ�
        /// </summary>
        public double stock_asset
        {
            get { return _stock_asset; }

            set
            {
                _stock_asset = value;
                RaisePropertyChanged(() => stock_asset);
            }
        }

        private double _bond_asset;
        /// <summary>
        /// ծȯ�ʲ�
        /// </summary>
        public double bond_asset
        {
            get { return _bond_asset; }

            set
            {
                _bond_asset = value;
                RaisePropertyChanged(() => bond_asset);
            }
        }

        private double _fund_asset;
        /// <summary>
        /// �����ʲ�
        /// </summary>
        public double fund_asset
        {
            get { return _fund_asset; }

            set
            {
                _fund_asset = value;
                RaisePropertyChanged(() => fund_asset);
            }
        }

        private double _money_fund_asset;
        /// <summary>
        /// ���һ����ʲ�
        /// </summary>
        public double money_fund_asset
        {
            get { return _money_fund_asset; }

            set
            {
                _money_fund_asset = value;
                RaisePropertyChanged(() => money_fund_asset);
            }
        }

        private double _not_money_fund_asset;
        /// <summary>
        /// �ǻ��һ����ʲ�
        /// </summary>
        public double not_money_fund_asset
        {
            get { return _not_money_fund_asset; }

            set
            {
                _not_money_fund_asset = value;
                RaisePropertyChanged(() => not_money_fund_asset);
            }
        }

        private double _repo_asset;
        /// <summary>
        /// �ع��ʲ�
        /// </summary>
        public double repo_asset
        {
            get { return _repo_asset; }

            set
            {
                _repo_asset = value;
                RaisePropertyChanged(() => repo_asset);
            }
        }

        private double _other_asset;
        /// <summary>
        /// �����ʲ�
        /// </summary>
        public double other_asset
        {
            get { return _other_asset; }

            set
            {
                _other_asset = value;
                RaisePropertyChanged(() => other_asset);
            }
        }

        private double _hk_thrgh_stock_asset;
        /// <summary>
        /// �۹�ͨ�ʲ�
        /// </summary>
        public double hk_thrgh_stock_asset
        {
            get { return _hk_thrgh_stock_asset; }

            set
            {
                _hk_thrgh_stock_asset = value;
                RaisePropertyChanged(() => hk_thrgh_stock_asset);
            }
        }

        private double _futu_asset;
        /// <summary>
        /// �ڻ��ʲ�
        /// </summary>
        public double futu_asset
        {
            get { return _futu_asset; }

            set
            {
                _futu_asset = value;
                RaisePropertyChanged(() => futu_asset);
            }
        }

        private double _assign_avail_amt;
        /// <summary>
        /// �ɷ�����
        /// </summary>
        public double assign_avail_amt
        {
            get { return _assign_avail_amt; }

            set
            {
                _assign_avail_amt = value;
                RaisePropertyChanged(() => assign_avail_amt);
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

        private double _today_pandl;
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double today_pandl
        {
            get { return _today_pandl; }

            set
            {
                _today_pandl = value;
                RaisePropertyChanged(() => today_pandl);
            }
        }

        private double _daily_pandl_ratio;
        /// <summary>
        /// ����������
        /// </summary>
        public double daily_pandl_ratio
        {
            get { return _daily_pandl_ratio; }

            set
            {
                _daily_pandl_ratio = value;
                RaisePropertyChanged(() => daily_pandl_ratio);
            }
        }

        private double _cash_out_amt;
        /// <summary>
        /// �����ֽ��
        /// </summary>
        public double cash_out_amt
        {
            get { return _cash_out_amt; }

            set
            {
                _cash_out_amt = value;
                RaisePropertyChanged(() => cash_out_amt);
            }
        }

        private double _stock_asset_ratio;
        /// <summary>
        /// ��Ʊ�ʲ�ռ��
        /// </summary>
        public double stock_asset_ratio
        {
            get { return _stock_asset_ratio; }

            set
            {
                _stock_asset_ratio = value;
                RaisePropertyChanged(() => stock_asset_ratio);
            }
        }

        private double _securities_ratio;
        /// <summary>
        /// ֤ȯռ��
        /// </summary>
        public double securities_ratio
        {
            get { return _securities_ratio; }

            set
            {
                _securities_ratio = value;
                RaisePropertyChanged(() => securities_ratio);
            }
        }

        private double _fund_asset_ratio;
        /// <summary>
        /// �����ʲ�ռ��
        /// </summary>
        public double fund_asset_ratio
        {
            get { return _fund_asset_ratio; }

            set
            {
                _fund_asset_ratio = value;
                RaisePropertyChanged(() => fund_asset_ratio);
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

        private double _avail_cash;
        /// <summary>
        /// �����ʽ�
        /// </summary>
        public double avail_cash
        {
            get { return _avail_cash; }

            set
            {
                _avail_cash = value;
                RaisePropertyChanged(() => avail_cash);
            }
        }

        private double _capit_bala;
        /// <summary>
        /// �ʽ����
        /// </summary>
        public double capit_bala
        {
            get { return _capit_bala; }

            set
            {
                _capit_bala = value;
                RaisePropertyChanged(() => capit_bala);
            }
        }

        private double _avail_amt;
        /// <summary>
        /// ���ý��
        /// </summary>
        public double avail_amt
        {
            get { return _avail_amt; }

            set
            {
                _avail_amt = value;
                RaisePropertyChanged(() => avail_amt);
            }
        }

        private double _total_change_amt;
        /// <summary>
        /// ����������
        /// </summary>
        public double total_change_amt
        {
            get { return _total_change_amt; }

            set
            {
                _total_change_amt = value;
                RaisePropertyChanged(() => total_change_amt);
            }
        }

        private double _futu_cash_asset;
        /// <summary>
        /// �ڻ��ֽ��ʲ�
        /// </summary>
        public double futu_cash_asset
        {
            get { return _futu_cash_asset; }

            set
            {
                _futu_cash_asset = value;
                RaisePropertyChanged(() => futu_cash_asset);
            }
        }

        private double _total_cash_asset;
        /// <summary>
        /// ���ֽ��ʲ�
        /// </summary>
        public double total_cash_asset
        {
            get { return _total_cash_asset; }

            set
            {
                _total_cash_asset = value;
                RaisePropertyChanged(() => total_cash_asset);
            }
        }

        private double _stock_cash_asset;
        /// <summary>
        /// ֤ȯ�ֽ��ʲ�
        /// </summary>
        public double stock_cash_asset
        {
            get { return _stock_cash_asset; }

            set
            {
                _stock_cash_asset = value;
                RaisePropertyChanged(() => stock_cash_asset);
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

        private double _total_fina_debt;
        /// <summary>
        /// �����ʸ�ծ
        /// </summary>
        public double total_fina_debt
        {
            get { return _total_fina_debt; }

            set
            {
                _total_fina_debt = value;
                RaisePropertyChanged(() => total_fina_debt);
            }
        }

        private double _total_loan_debt;
        /// <summary>
        /// ����ȯ��ծ
        /// </summary>
        public double total_loan_debt
        {
            get { return _total_loan_debt; }

            set
            {
                _total_loan_debt = value;
                RaisePropertyChanged(() => total_loan_debt);
            }
        }
    }

    public class rptL_4_32_Info : ObservableObject
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

        private double _exch_group_pd_share;
        /// <summary>
        /// �������Ʒ�ݶ�
        /// </summary>
        public double exch_group_pd_share
        {
            get { return _exch_group_pd_share; }

            set
            {
                _exch_group_pd_share = value;
                RaisePropertyChanged(() => exch_group_pd_share);
            }
        }

        private double _unit_nav;
        /// <summary>
        /// ��λ��ֵ
        /// </summary>
        public double unit_nav
        {
            get { return _unit_nav; }

            set
            {
                _unit_nav = value;
                RaisePropertyChanged(() => unit_nav);
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

        private double _nav_fluct;
        /// <summary>
        /// ��ֵ����
        /// </summary>
        public double nav_fluct
        {
            get { return _nav_fluct; }

            set
            {
                _nav_fluct = value;
                RaisePropertyChanged(() => nav_fluct);
            }
        }

        private double _cash_asset;
        /// <summary>
        /// �ֽ��ʲ�
        /// </summary>
        public double cash_asset
        {
            get { return _cash_asset; }

            set
            {
                _cash_asset = value;
                RaisePropertyChanged(() => cash_asset);
            }
        }

        private double _stock_asset;
        /// <summary>
        /// ��Ʊ�ʲ�
        /// </summary>
        public double stock_asset
        {
            get { return _stock_asset; }

            set
            {
                _stock_asset = value;
                RaisePropertyChanged(() => stock_asset);
            }
        }

        private double _bond_asset;
        /// <summary>
        /// ծȯ�ʲ�
        /// </summary>
        public double bond_asset
        {
            get { return _bond_asset; }

            set
            {
                _bond_asset = value;
                RaisePropertyChanged(() => bond_asset);
            }
        }

        private double _fund_asset;
        /// <summary>
        /// �����ʲ�
        /// </summary>
        public double fund_asset
        {
            get { return _fund_asset; }

            set
            {
                _fund_asset = value;
                RaisePropertyChanged(() => fund_asset);
            }
        }

        private double _money_fund_asset;
        /// <summary>
        /// ���һ����ʲ�
        /// </summary>
        public double money_fund_asset
        {
            get { return _money_fund_asset; }

            set
            {
                _money_fund_asset = value;
                RaisePropertyChanged(() => money_fund_asset);
            }
        }

        private double _not_money_fund_asset;
        /// <summary>
        /// �ǻ��һ����ʲ�
        /// </summary>
        public double not_money_fund_asset
        {
            get { return _not_money_fund_asset; }

            set
            {
                _not_money_fund_asset = value;
                RaisePropertyChanged(() => not_money_fund_asset);
            }
        }

        private double _repo_asset;
        /// <summary>
        /// �ع��ʲ�
        /// </summary>
        public double repo_asset
        {
            get { return _repo_asset; }

            set
            {
                _repo_asset = value;
                RaisePropertyChanged(() => repo_asset);
            }
        }

        private double _other_asset;
        /// <summary>
        /// �����ʲ�
        /// </summary>
        public double other_asset
        {
            get { return _other_asset; }

            set
            {
                _other_asset = value;
                RaisePropertyChanged(() => other_asset);
            }
        }

        private double _futu_asset;
        /// <summary>
        /// �ڻ��ʲ�
        /// </summary>
        public double futu_asset
        {
            get { return _futu_asset; }

            set
            {
                _futu_asset = value;
                RaisePropertyChanged(() => futu_asset);
            }
        }

        private double _hk_thrgh_stock_asset;
        /// <summary>
        /// �۹�ͨ�ʲ�
        /// </summary>
        public double hk_thrgh_stock_asset
        {
            get { return _hk_thrgh_stock_asset; }

            set
            {
                _hk_thrgh_stock_asset = value;
                RaisePropertyChanged(() => hk_thrgh_stock_asset);
            }
        }

        private double _assign_avail_amt;
        /// <summary>
        /// �ɷ�����
        /// </summary>
        public double assign_avail_amt
        {
            get { return _assign_avail_amt; }

            set
            {
                _assign_avail_amt = value;
                RaisePropertyChanged(() => assign_avail_amt);
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

        private double _today_pandl;
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double today_pandl
        {
            get { return _today_pandl; }

            set
            {
                _today_pandl = value;
                RaisePropertyChanged(() => today_pandl);
            }
        }

        private double _daily_pandl_ratio;
        /// <summary>
        /// ����������
        /// </summary>
        public double daily_pandl_ratio
        {
            get { return _daily_pandl_ratio; }

            set
            {
                _daily_pandl_ratio = value;
                RaisePropertyChanged(() => daily_pandl_ratio);
            }
        }

        private double _total_realiz_pandl;
        /// <summary>
        /// �ۼ�ʵ������
        /// </summary>
        public double total_realiz_pandl
        {
            get { return _total_realiz_pandl; }

            set
            {
                _total_realiz_pandl = value;
                RaisePropertyChanged(() => total_realiz_pandl);
            }
        }

        private double _total_realiz_pandl_ratio;
        /// <summary>
        /// �ۼ�������
        /// </summary>
        public double total_realiz_pandl_ratio
        {
            get { return _total_realiz_pandl_ratio; }

            set
            {
                _total_realiz_pandl_ratio = value;
                RaisePropertyChanged(() => total_realiz_pandl_ratio);
            }
        }

        private double _posi_ratio;
        /// <summary>
        /// �ֹɱ���
        /// </summary>
        public double posi_ratio
        {
            get { return _posi_ratio; }

            set
            {
                _posi_ratio = value;
                RaisePropertyChanged(() => posi_ratio);
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

        private double _avail_cash;
        /// <summary>
        /// �����ʽ�
        /// </summary>
        public double avail_cash
        {
            get { return _avail_cash; }

            set
            {
                _avail_cash = value;
                RaisePropertyChanged(() => avail_cash);
            }
        }

        private double _capit_bala;
        /// <summary>
        /// �ʽ����
        /// </summary>
        public double capit_bala
        {
            get { return _capit_bala; }

            set
            {
                _capit_bala = value;
                RaisePropertyChanged(() => capit_bala);
            }
        }

        private double _avail_amt;
        /// <summary>
        /// ���ý��
        /// </summary>
        public double avail_amt
        {
            get { return _avail_amt; }

            set
            {
                _avail_amt = value;
                RaisePropertyChanged(() => avail_amt);
            }
        }

        private double _total_change_amt;
        /// <summary>
        /// ����������
        /// </summary>
        public double total_change_amt
        {
            get { return _total_change_amt; }

            set
            {
                _total_change_amt = value;
                RaisePropertyChanged(() => total_change_amt);
            }
        }

        private double _futu_cash_asset;
        /// <summary>
        /// �ڻ��ֽ��ʲ�
        /// </summary>
        public double futu_cash_asset
        {
            get { return _futu_cash_asset; }

            set
            {
                _futu_cash_asset = value;
                RaisePropertyChanged(() => futu_cash_asset);
            }
        }

        private double _total_cash_asset;
        /// <summary>
        /// ���ֽ��ʲ�
        /// </summary>
        public double total_cash_asset
        {
            get { return _total_cash_asset; }

            set
            {
                _total_cash_asset = value;
                RaisePropertyChanged(() => total_cash_asset);
            }
        }

        private double _stock_cash_asset;
        /// <summary>
        /// ֤ȯ�ֽ��ʲ�
        /// </summary>
        public double stock_cash_asset
        {
            get { return _stock_cash_asset; }

            set
            {
                _stock_cash_asset = value;
                RaisePropertyChanged(() => stock_cash_asset);
            }
        }

        private double _hk_avail_amt;
        /// <summary>
        /// �۹ɿ��ý��
        /// </summary>
        public double hk_avail_amt
        {
            get { return _hk_avail_amt; }

            set
            {
                _hk_avail_amt = value;
                RaisePropertyChanged(() => hk_avail_amt);
            }
        }

        private double _total_fina_debt;
        /// <summary>
        /// �����ʸ�ծ
        /// </summary>
        public double total_fina_debt
        {
            get { return _total_fina_debt; }

            set
            {
                _total_fina_debt = value;
                RaisePropertyChanged(() => total_fina_debt);
            }
        }

        private double _total_loan_debt;
        /// <summary>
        /// ����ȯ��ծ
        /// </summary>
        public double total_loan_debt
        {
            get { return _total_loan_debt; }

            set
            {
                _total_loan_debt = value;
                RaisePropertyChanged(() => total_loan_debt);
            }
        }
    }

    public class rptL_4_33_Info : ObservableObject
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

        private double _unit_nav;
        /// <summary>
        /// ��λ��ֵ
        /// </summary>
        public double unit_nav
        {
            get { return _unit_nav; }

            set
            {
                _unit_nav = value;
                RaisePropertyChanged(() => unit_nav);
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

        private double _nav_fluct;
        /// <summary>
        /// ��ֵ����
        /// </summary>
        public double nav_fluct
        {
            get { return _nav_fluct; }

            set
            {
                _nav_fluct = value;
                RaisePropertyChanged(() => nav_fluct);
            }
        }

        private double _cash_asset;
        /// <summary>
        /// �ֽ��ʲ�
        /// </summary>
        public double cash_asset
        {
            get { return _cash_asset; }

            set
            {
                _cash_asset = value;
                RaisePropertyChanged(() => cash_asset);
            }
        }

        private double _stock_asset;
        /// <summary>
        /// ��Ʊ�ʲ�
        /// </summary>
        public double stock_asset
        {
            get { return _stock_asset; }

            set
            {
                _stock_asset = value;
                RaisePropertyChanged(() => stock_asset);
            }
        }

        private double _bond_asset;
        /// <summary>
        /// ծȯ�ʲ�
        /// </summary>
        public double bond_asset
        {
            get { return _bond_asset; }

            set
            {
                _bond_asset = value;
                RaisePropertyChanged(() => bond_asset);
            }
        }

        private double _fund_asset;
        /// <summary>
        /// �����ʲ�
        /// </summary>
        public double fund_asset
        {
            get { return _fund_asset; }

            set
            {
                _fund_asset = value;
                RaisePropertyChanged(() => fund_asset);
            }
        }

        private double _money_fund_asset;
        /// <summary>
        /// ���һ����ʲ�
        /// </summary>
        public double money_fund_asset
        {
            get { return _money_fund_asset; }

            set
            {
                _money_fund_asset = value;
                RaisePropertyChanged(() => money_fund_asset);
            }
        }

        private double _not_money_fund_asset;
        /// <summary>
        /// �ǻ��һ����ʲ�
        /// </summary>
        public double not_money_fund_asset
        {
            get { return _not_money_fund_asset; }

            set
            {
                _not_money_fund_asset = value;
                RaisePropertyChanged(() => not_money_fund_asset);
            }
        }

        private double _repo_asset;
        /// <summary>
        /// �ع��ʲ�
        /// </summary>
        public double repo_asset
        {
            get { return _repo_asset; }

            set
            {
                _repo_asset = value;
                RaisePropertyChanged(() => repo_asset);
            }
        }

        private double _other_asset;
        /// <summary>
        /// �����ʲ�
        /// </summary>
        public double other_asset
        {
            get { return _other_asset; }

            set
            {
                _other_asset = value;
                RaisePropertyChanged(() => other_asset);
            }
        }

        private double _hk_thrgh_stock_asset;
        /// <summary>
        /// �۹�ͨ�ʲ�
        /// </summary>
        public double hk_thrgh_stock_asset
        {
            get { return _hk_thrgh_stock_asset; }

            set
            {
                _hk_thrgh_stock_asset = value;
                RaisePropertyChanged(() => hk_thrgh_stock_asset);
            }
        }

        private double _futu_asset;
        /// <summary>
        /// �ڻ��ʲ�
        /// </summary>
        public double futu_asset
        {
            get { return _futu_asset; }

            set
            {
                _futu_asset = value;
                RaisePropertyChanged(() => futu_asset);
            }
        }

        private double _assign_avail_amt;
        /// <summary>
        /// �ɷ�����
        /// </summary>
        public double assign_avail_amt
        {
            get { return _assign_avail_amt; }

            set
            {
                _assign_avail_amt = value;
                RaisePropertyChanged(() => assign_avail_amt);
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

        private double _today_pandl;
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double today_pandl
        {
            get { return _today_pandl; }

            set
            {
                _today_pandl = value;
                RaisePropertyChanged(() => today_pandl);
            }
        }

        private double _daily_pandl_ratio;
        /// <summary>
        /// ����������
        /// </summary>
        public double daily_pandl_ratio
        {
            get { return _daily_pandl_ratio; }

            set
            {
                _daily_pandl_ratio = value;
                RaisePropertyChanged(() => daily_pandl_ratio);
            }
        }

        private double _cash_out_amt;
        /// <summary>
        /// �����ֽ��
        /// </summary>
        public double cash_out_amt
        {
            get { return _cash_out_amt; }

            set
            {
                _cash_out_amt = value;
                RaisePropertyChanged(() => cash_out_amt);
            }
        }

        private double _stock_asset_ratio;
        /// <summary>
        /// ��Ʊ�ʲ�ռ��
        /// </summary>
        public double stock_asset_ratio
        {
            get { return _stock_asset_ratio; }

            set
            {
                _stock_asset_ratio = value;
                RaisePropertyChanged(() => stock_asset_ratio);
            }
        }

        private double _securities_ratio;
        /// <summary>
        /// ֤ȯռ��
        /// </summary>
        public double securities_ratio
        {
            get { return _securities_ratio; }

            set
            {
                _securities_ratio = value;
                RaisePropertyChanged(() => securities_ratio);
            }
        }

        private double _fund_asset_ratio;
        /// <summary>
        /// �����ʲ�ռ��
        /// </summary>
        public double fund_asset_ratio
        {
            get { return _fund_asset_ratio; }

            set
            {
                _fund_asset_ratio = value;
                RaisePropertyChanged(() => fund_asset_ratio);
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

        private double _avail_cash;
        /// <summary>
        /// �����ʽ�
        /// </summary>
        public double avail_cash
        {
            get { return _avail_cash; }

            set
            {
                _avail_cash = value;
                RaisePropertyChanged(() => avail_cash);
            }
        }

        private double _capit_bala;
        /// <summary>
        /// �ʽ����
        /// </summary>
        public double capit_bala
        {
            get { return _capit_bala; }

            set
            {
                _capit_bala = value;
                RaisePropertyChanged(() => capit_bala);
            }
        }

        private double _avail_amt;
        /// <summary>
        /// ���ý��
        /// </summary>
        public double avail_amt
        {
            get { return _avail_amt; }

            set
            {
                _avail_amt = value;
                RaisePropertyChanged(() => avail_amt);
            }
        }

        private double _total_change_amt;
        /// <summary>
        /// ����������
        /// </summary>
        public double total_change_amt
        {
            get { return _total_change_amt; }

            set
            {
                _total_change_amt = value;
                RaisePropertyChanged(() => total_change_amt);
            }
        }

        private double _futu_cash_asset;
        /// <summary>
        /// �ڻ��ֽ��ʲ�
        /// </summary>
        public double futu_cash_asset
        {
            get { return _futu_cash_asset; }

            set
            {
                _futu_cash_asset = value;
                RaisePropertyChanged(() => futu_cash_asset);
            }
        }

        private double _total_cash_asset;
        /// <summary>
        /// ���ֽ��ʲ�
        /// </summary>
        public double total_cash_asset
        {
            get { return _total_cash_asset; }

            set
            {
                _total_cash_asset = value;
                RaisePropertyChanged(() => total_cash_asset);
            }
        }

        private double _stock_cash_asset;
        /// <summary>
        /// ֤ȯ�ֽ��ʲ�
        /// </summary>
        public double stock_cash_asset
        {
            get { return _stock_cash_asset; }

            set
            {
                _stock_cash_asset = value;
                RaisePropertyChanged(() => stock_cash_asset);
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

        private double _total_fina_debt;
        /// <summary>
        /// �����ʸ�ծ
        /// </summary>
        public double total_fina_debt
        {
            get { return _total_fina_debt; }

            set
            {
                _total_fina_debt = value;
                RaisePropertyChanged(() => total_fina_debt);
            }
        }

        private double _total_loan_debt;
        /// <summary>
        /// ����ȯ��ծ
        /// </summary>
        public double total_loan_debt
        {
            get { return _total_loan_debt; }

            set
            {
                _total_loan_debt = value;
                RaisePropertyChanged(() => total_loan_debt);
            }
        }
    }

    public class rptL_4_34_Info : ObservableObject
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

        private double _exch_group_pd_share;
        /// <summary>
        /// �������Ʒ�ݶ�
        /// </summary>
        public double exch_group_pd_share
        {
            get { return _exch_group_pd_share; }

            set
            {
                _exch_group_pd_share = value;
                RaisePropertyChanged(() => exch_group_pd_share);
            }
        }

        private double _unit_nav;
        /// <summary>
        /// ��λ��ֵ
        /// </summary>
        public double unit_nav
        {
            get { return _unit_nav; }

            set
            {
                _unit_nav = value;
                RaisePropertyChanged(() => unit_nav);
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

        private double _nav_fluct;
        /// <summary>
        /// ��ֵ����
        /// </summary>
        public double nav_fluct
        {
            get { return _nav_fluct; }

            set
            {
                _nav_fluct = value;
                RaisePropertyChanged(() => nav_fluct);
            }
        }

        private double _cash_asset;
        /// <summary>
        /// �ֽ��ʲ�
        /// </summary>
        public double cash_asset
        {
            get { return _cash_asset; }

            set
            {
                _cash_asset = value;
                RaisePropertyChanged(() => cash_asset);
            }
        }

        private double _stock_asset;
        /// <summary>
        /// ��Ʊ�ʲ�
        /// </summary>
        public double stock_asset
        {
            get { return _stock_asset; }

            set
            {
                _stock_asset = value;
                RaisePropertyChanged(() => stock_asset);
            }
        }

        private double _bond_asset;
        /// <summary>
        /// ծȯ�ʲ�
        /// </summary>
        public double bond_asset
        {
            get { return _bond_asset; }

            set
            {
                _bond_asset = value;
                RaisePropertyChanged(() => bond_asset);
            }
        }

        private double _fund_asset;
        /// <summary>
        /// �����ʲ�
        /// </summary>
        public double fund_asset
        {
            get { return _fund_asset; }

            set
            {
                _fund_asset = value;
                RaisePropertyChanged(() => fund_asset);
            }
        }

        private double _money_fund_asset;
        /// <summary>
        /// ���һ����ʲ�
        /// </summary>
        public double money_fund_asset
        {
            get { return _money_fund_asset; }

            set
            {
                _money_fund_asset = value;
                RaisePropertyChanged(() => money_fund_asset);
            }
        }

        private double _not_money_fund_asset;
        /// <summary>
        /// �ǻ��һ����ʲ�
        /// </summary>
        public double not_money_fund_asset
        {
            get { return _not_money_fund_asset; }

            set
            {
                _not_money_fund_asset = value;
                RaisePropertyChanged(() => not_money_fund_asset);
            }
        }

        private double _repo_asset;
        /// <summary>
        /// �ع��ʲ�
        /// </summary>
        public double repo_asset
        {
            get { return _repo_asset; }

            set
            {
                _repo_asset = value;
                RaisePropertyChanged(() => repo_asset);
            }
        }

        private double _other_asset;
        /// <summary>
        /// �����ʲ�
        /// </summary>
        public double other_asset
        {
            get { return _other_asset; }

            set
            {
                _other_asset = value;
                RaisePropertyChanged(() => other_asset);
            }
        }

        private double _futu_asset;
        /// <summary>
        /// �ڻ��ʲ�
        /// </summary>
        public double futu_asset
        {
            get { return _futu_asset; }

            set
            {
                _futu_asset = value;
                RaisePropertyChanged(() => futu_asset);
            }
        }

        private double _hk_thrgh_stock_asset;
        /// <summary>
        /// �۹�ͨ�ʲ�
        /// </summary>
        public double hk_thrgh_stock_asset
        {
            get { return _hk_thrgh_stock_asset; }

            set
            {
                _hk_thrgh_stock_asset = value;
                RaisePropertyChanged(() => hk_thrgh_stock_asset);
            }
        }

        private double _assign_avail_amt;
        /// <summary>
        /// �ɷ�����
        /// </summary>
        public double assign_avail_amt
        {
            get { return _assign_avail_amt; }

            set
            {
                _assign_avail_amt = value;
                RaisePropertyChanged(() => assign_avail_amt);
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

        private double _today_pandl;
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double today_pandl
        {
            get { return _today_pandl; }

            set
            {
                _today_pandl = value;
                RaisePropertyChanged(() => today_pandl);
            }
        }

        private double _daily_pandl_ratio;
        /// <summary>
        /// ����������
        /// </summary>
        public double daily_pandl_ratio
        {
            get { return _daily_pandl_ratio; }

            set
            {
                _daily_pandl_ratio = value;
                RaisePropertyChanged(() => daily_pandl_ratio);
            }
        }

        private double _total_realiz_pandl;
        /// <summary>
        /// �ۼ�ʵ������
        /// </summary>
        public double total_realiz_pandl
        {
            get { return _total_realiz_pandl; }

            set
            {
                _total_realiz_pandl = value;
                RaisePropertyChanged(() => total_realiz_pandl);
            }
        }

        private double _total_realiz_pandl_ratio;
        /// <summary>
        /// �ۼ�������
        /// </summary>
        public double total_realiz_pandl_ratio
        {
            get { return _total_realiz_pandl_ratio; }

            set
            {
                _total_realiz_pandl_ratio = value;
                RaisePropertyChanged(() => total_realiz_pandl_ratio);
            }
        }

        private double _posi_ratio;
        /// <summary>
        /// �ֹɱ���
        /// </summary>
        public double posi_ratio
        {
            get { return _posi_ratio; }

            set
            {
                _posi_ratio = value;
                RaisePropertyChanged(() => posi_ratio);
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

        private double _avail_cash;
        /// <summary>
        /// �����ʽ�
        /// </summary>
        public double avail_cash
        {
            get { return _avail_cash; }

            set
            {
                _avail_cash = value;
                RaisePropertyChanged(() => avail_cash);
            }
        }

        private double _capit_bala;
        /// <summary>
        /// �ʽ����
        /// </summary>
        public double capit_bala
        {
            get { return _capit_bala; }

            set
            {
                _capit_bala = value;
                RaisePropertyChanged(() => capit_bala);
            }
        }

        private double _avail_amt;
        /// <summary>
        /// ���ý��
        /// </summary>
        public double avail_amt
        {
            get { return _avail_amt; }

            set
            {
                _avail_amt = value;
                RaisePropertyChanged(() => avail_amt);
            }
        }

        private double _total_change_amt;
        /// <summary>
        /// ����������
        /// </summary>
        public double total_change_amt
        {
            get { return _total_change_amt; }

            set
            {
                _total_change_amt = value;
                RaisePropertyChanged(() => total_change_amt);
            }
        }

        private double _futu_cash_asset;
        /// <summary>
        /// �ڻ��ֽ��ʲ�
        /// </summary>
        public double futu_cash_asset
        {
            get { return _futu_cash_asset; }

            set
            {
                _futu_cash_asset = value;
                RaisePropertyChanged(() => futu_cash_asset);
            }
        }

        private double _total_cash_asset;
        /// <summary>
        /// ���ֽ��ʲ�
        /// </summary>
        public double total_cash_asset
        {
            get { return _total_cash_asset; }

            set
            {
                _total_cash_asset = value;
                RaisePropertyChanged(() => total_cash_asset);
            }
        }

        private double _stock_cash_asset;
        /// <summary>
        /// ֤ȯ�ֽ��ʲ�
        /// </summary>
        public double stock_cash_asset
        {
            get { return _stock_cash_asset; }

            set
            {
                _stock_cash_asset = value;
                RaisePropertyChanged(() => stock_cash_asset);
            }
        }

        private double _hk_avail_amt;
        /// <summary>
        /// �۹ɿ��ý��
        /// </summary>
        public double hk_avail_amt
        {
            get { return _hk_avail_amt; }

            set
            {
                _hk_avail_amt = value;
                RaisePropertyChanged(() => hk_avail_amt);
            }
        }

        private double _total_fina_debt;
        /// <summary>
        /// �����ʸ�ծ
        /// </summary>
        public double total_fina_debt
        {
            get { return _total_fina_debt; }

            set
            {
                _total_fina_debt = value;
                RaisePropertyChanged(() => total_fina_debt);
            }
        }

        private double _total_loan_debt;
        /// <summary>
        /// ����ȯ��ծ
        /// </summary>
        public double total_loan_debt
        {
            get { return _total_loan_debt; }

            set
            {
                _total_loan_debt = value;
                RaisePropertyChanged(() => total_loan_debt);
            }
        }
    }

    public class rptL_4_35_Info : ObservableObject
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

        private double _buy_pre_sett_qty;
        /// <summary>
        /// �������������
        /// </summary>
        public double buy_pre_sett_qty
        {
            get { return _buy_pre_sett_qty; }

            set
            {
                _buy_pre_sett_qty = value;
                RaisePropertyChanged(() => buy_pre_sett_qty);
            }
        }

        private double _sell_pre_sett_qty;
        /// <summary>
        /// ��������������
        /// </summary>
        public double sell_pre_sett_qty
        {
            get { return _sell_pre_sett_qty; }

            set
            {
                _sell_pre_sett_qty = value;
                RaisePropertyChanged(() => sell_pre_sett_qty);
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

        private double _avail_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double avail_qty
        {
            get { return _avail_qty; }

            set
            {
                _avail_qty = value;
                RaisePropertyChanged(() => avail_qty);
            }
        }

        private double _impawn_qty;
        /// <summary>
        /// ��Ѻ����
        /// </summary>
        public double impawn_qty
        {
            get { return _impawn_qty; }

            set
            {
                _impawn_qty = value;
                RaisePropertyChanged(() => impawn_qty);
            }
        }

        private double _bond_receivable_amt;
        /// <summary>
        /// ծȯӦ����Ϣ
        /// </summary>
        public double bond_receivable_amt
        {
            get { return _bond_receivable_amt; }

            set
            {
                _bond_receivable_amt = value;
                RaisePropertyChanged(() => bond_receivable_amt);
            }
        }

        private double _net_price;
        /// <summary>
        /// ����
        /// </summary>
        public double net_price
        {
            get { return _net_price; }

            set
            {
                _net_price = value;
                RaisePropertyChanged(() => net_price);
            }
        }

        private double _full_price;
        /// <summary>
        /// ȫ��
        /// </summary>
        public double full_price
        {
            get { return _full_price; }

            set
            {
                _full_price = value;
                RaisePropertyChanged(() => full_price);
            }
        }

        private double _last_price;
        /// <summary>
        /// ���¼�
        /// </summary>
        public double last_price
        {
            get { return _last_price; }

            set
            {
                _last_price = value;
                RaisePropertyChanged(() => last_price);
            }
        }

        private double _pre_close_price;
        /// <summary>
        /// �����̼�
        /// </summary>
        public double pre_close_price
        {
            get { return _pre_close_price; }

            set
            {
                _pre_close_price = value;
                RaisePropertyChanged(() => pre_close_price);
            }
        }

        private double _posi_market_value;
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value
        {
            get { return _posi_market_value; }

            set
            {
                _posi_market_value = value;
                RaisePropertyChanged(() => posi_market_value);
            }
        }

        private double _full_holding_amt;
        /// <summary>
        /// ȫ�۳ֲ���ֵ
        /// </summary>
        public double full_holding_amt
        {
            get { return _full_holding_amt; }

            set
            {
                _full_holding_amt = value;
                RaisePropertyChanged(() => full_holding_amt);
            }
        }

        private double _block_trade_posi_market_value;
        /// <summary>
        /// ���ڽ��׳ֲ���ֵ
        /// </summary>
        public double block_trade_posi_market_value
        {
            get { return _block_trade_posi_market_value; }

            set
            {
                _block_trade_posi_market_value = value;
                RaisePropertyChanged(() => block_trade_posi_market_value);
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

        private double _fair_price;
        /// <summary>
        /// ���ʼ۸�
        /// </summary>
        public double fair_price
        {
            get { return _fair_price; }

            set
            {
                _fair_price = value;
                RaisePropertyChanged(() => fair_price);
            }
        }

        private double _bond_accr_intrst;
        /// <summary>
        /// ծȯ������Ϣ
        /// </summary>
        public double bond_accr_intrst
        {
            get { return _bond_accr_intrst; }

            set
            {
                _bond_accr_intrst = value;
                RaisePropertyChanged(() => bond_accr_intrst);
            }
        }

        private int _bond_rate_type;
        /// <summary>
        /// ծȯ��������
        /// </summary>
        public int bond_rate_type
        {
            get { return _bond_rate_type; }

            set
            {
                _bond_rate_type = value;
                RaisePropertyChanged(() => bond_rate_type);
            }
        }

        private int _net_price_flag;
        /// <summary>
        /// ���۱�־
        /// </summary>
        public int net_price_flag
        {
            get { return _net_price_flag; }

            set
            {
                _net_price_flag = value;
                RaisePropertyChanged(() => net_price_flag);
            }
        }

        private double _impawn_ratio;
        /// <summary>
        /// ��Ѻ����
        /// </summary>
        public double impawn_ratio
        {
            get { return _impawn_ratio; }

            set
            {
                _impawn_ratio = value;
                RaisePropertyChanged(() => impawn_ratio);
            }
        }

        private double _total_stock_issue;
        /// <summary>
        /// �ܹɱ�
        /// </summary>
        public double total_stock_issue
        {
            get { return _total_stock_issue; }

            set
            {
                _total_stock_issue = value;
                RaisePropertyChanged(() => total_stock_issue);
            }
        }

        private double _circl_stock_capit;
        /// <summary>
        /// ��ͨ�ɱ�
        /// </summary>
        public double circl_stock_capit
        {
            get { return _circl_stock_capit; }

            set
            {
                _circl_stock_capit = value;
                RaisePropertyChanged(() => circl_stock_capit);
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

    public class rptL_4_36_Info : ObservableObject
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

        private double _posi_market_value;
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value
        {
            get { return _posi_market_value; }

            set
            {
                _posi_market_value = value;
                RaisePropertyChanged(() => posi_market_value);
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

        private double _buy_pre_sett_qty;
        /// <summary>
        /// �������������
        /// </summary>
        public double buy_pre_sett_qty
        {
            get { return _buy_pre_sett_qty; }

            set
            {
                _buy_pre_sett_qty = value;
                RaisePropertyChanged(() => buy_pre_sett_qty);
            }
        }

        private double _sell_pre_sett_qty;
        /// <summary>
        /// ��������������
        /// </summary>
        public double sell_pre_sett_qty
        {
            get { return _sell_pre_sett_qty; }

            set
            {
                _sell_pre_sett_qty = value;
                RaisePropertyChanged(() => sell_pre_sett_qty);
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

        private double _full_holding_amt;
        /// <summary>
        /// ȫ�۳ֲ���ֵ
        /// </summary>
        public double full_holding_amt
        {
            get { return _full_holding_amt; }

            set
            {
                _full_holding_amt = value;
                RaisePropertyChanged(() => full_holding_amt);
            }
        }

        private double _impawn_qty;
        /// <summary>
        /// ��Ѻ����
        /// </summary>
        public double impawn_qty
        {
            get { return _impawn_qty; }

            set
            {
                _impawn_qty = value;
                RaisePropertyChanged(() => impawn_qty);
            }
        }

        private double _bond_receivable_amt;
        /// <summary>
        /// ծȯӦ����Ϣ
        /// </summary>
        public double bond_receivable_amt
        {
            get { return _bond_receivable_amt; }

            set
            {
                _bond_receivable_amt = value;
                RaisePropertyChanged(() => bond_receivable_amt);
            }
        }

        private double _net_price;
        /// <summary>
        /// ����
        /// </summary>
        public double net_price
        {
            get { return _net_price; }

            set
            {
                _net_price = value;
                RaisePropertyChanged(() => net_price);
            }
        }

        private double _full_price;
        /// <summary>
        /// ȫ��
        /// </summary>
        public double full_price
        {
            get { return _full_price; }

            set
            {
                _full_price = value;
                RaisePropertyChanged(() => full_price);
            }
        }

        private double _last_price;
        /// <summary>
        /// ���¼�
        /// </summary>
        public double last_price
        {
            get { return _last_price; }

            set
            {
                _last_price = value;
                RaisePropertyChanged(() => last_price);
            }
        }

        private double _pre_close_price;
        /// <summary>
        /// �����̼�
        /// </summary>
        public double pre_close_price
        {
            get { return _pre_close_price; }

            set
            {
                _pre_close_price = value;
                RaisePropertyChanged(() => pre_close_price);
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

        private double _block_trade_posi_market_value;
        /// <summary>
        /// ���ڽ��׳ֲ���ֵ
        /// </summary>
        public double block_trade_posi_market_value
        {
            get { return _block_trade_posi_market_value; }

            set
            {
                _block_trade_posi_market_value = value;
                RaisePropertyChanged(() => block_trade_posi_market_value);
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

        private double _fair_price;
        /// <summary>
        /// ���ʼ۸�
        /// </summary>
        public double fair_price
        {
            get { return _fair_price; }

            set
            {
                _fair_price = value;
                RaisePropertyChanged(() => fair_price);
            }
        }

        private double _bond_accr_intrst;
        /// <summary>
        /// ծȯ������Ϣ
        /// </summary>
        public double bond_accr_intrst
        {
            get { return _bond_accr_intrst; }

            set
            {
                _bond_accr_intrst = value;
                RaisePropertyChanged(() => bond_accr_intrst);
            }
        }

        private int _bond_rate_type;
        /// <summary>
        /// ծȯ��������
        /// </summary>
        public int bond_rate_type
        {
            get { return _bond_rate_type; }

            set
            {
                _bond_rate_type = value;
                RaisePropertyChanged(() => bond_rate_type);
            }
        }

        private int _net_price_flag;
        /// <summary>
        /// ���۱�־
        /// </summary>
        public int net_price_flag
        {
            get { return _net_price_flag; }

            set
            {
                _net_price_flag = value;
                RaisePropertyChanged(() => net_price_flag);
            }
        }

        private double _impawn_ratio;
        /// <summary>
        /// ��Ѻ����
        /// </summary>
        public double impawn_ratio
        {
            get { return _impawn_ratio; }

            set
            {
                _impawn_ratio = value;
                RaisePropertyChanged(() => impawn_ratio);
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

    public class rptL_4_37_Info : ObservableObject
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

        private double _posi_market_value;
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value
        {
            get { return _posi_market_value; }

            set
            {
                _posi_market_value = value;
                RaisePropertyChanged(() => posi_market_value);
            }
        }

        private double _posi_nav_ratio;
        /// <summary>
        /// �ֲ־�ֵռ��
        /// </summary>
        public double posi_nav_ratio
        {
            get { return _posi_nav_ratio; }

            set
            {
                _posi_nav_ratio = value;
                RaisePropertyChanged(() => posi_nav_ratio);
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

        private double _buy_pre_sett_qty;
        /// <summary>
        /// �������������
        /// </summary>
        public double buy_pre_sett_qty
        {
            get { return _buy_pre_sett_qty; }

            set
            {
                _buy_pre_sett_qty = value;
                RaisePropertyChanged(() => buy_pre_sett_qty);
            }
        }

        private double _sell_pre_sett_qty;
        /// <summary>
        /// ��������������
        /// </summary>
        public double sell_pre_sett_qty
        {
            get { return _sell_pre_sett_qty; }

            set
            {
                _sell_pre_sett_qty = value;
                RaisePropertyChanged(() => sell_pre_sett_qty);
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

        private double _avail_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double avail_qty
        {
            get { return _avail_qty; }

            set
            {
                _avail_qty = value;
                RaisePropertyChanged(() => avail_qty);
            }
        }

        private double _full_holding_amt;
        /// <summary>
        /// ȫ�۳ֲ���ֵ
        /// </summary>
        public double full_holding_amt
        {
            get { return _full_holding_amt; }

            set
            {
                _full_holding_amt = value;
                RaisePropertyChanged(() => full_holding_amt);
            }
        }

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

        private double _impawn_qty;
        /// <summary>
        /// ��Ѻ����
        /// </summary>
        public double impawn_qty
        {
            get { return _impawn_qty; }

            set
            {
                _impawn_qty = value;
                RaisePropertyChanged(() => impawn_qty);
            }
        }

        private double _bond_receivable_amt;
        /// <summary>
        /// ծȯӦ����Ϣ
        /// </summary>
        public double bond_receivable_amt
        {
            get { return _bond_receivable_amt; }

            set
            {
                _bond_receivable_amt = value;
                RaisePropertyChanged(() => bond_receivable_amt);
            }
        }

        private double _net_price;
        /// <summary>
        /// ����
        /// </summary>
        public double net_price
        {
            get { return _net_price; }

            set
            {
                _net_price = value;
                RaisePropertyChanged(() => net_price);
            }
        }

        private double _full_price;
        /// <summary>
        /// ȫ��
        /// </summary>
        public double full_price
        {
            get { return _full_price; }

            set
            {
                _full_price = value;
                RaisePropertyChanged(() => full_price);
            }
        }

        private double _last_price;
        /// <summary>
        /// ���¼�
        /// </summary>
        public double last_price
        {
            get { return _last_price; }

            set
            {
                _last_price = value;
                RaisePropertyChanged(() => last_price);
            }
        }

        private double _pre_close_price;
        /// <summary>
        /// �����̼�
        /// </summary>
        public double pre_close_price
        {
            get { return _pre_close_price; }

            set
            {
                _pre_close_price = value;
                RaisePropertyChanged(() => pre_close_price);
            }
        }

        private double _cost_price;
        /// <summary>
        /// �ɱ���
        /// </summary>
        public double cost_price
        {
            get { return _cost_price; }

            set
            {
                _cost_price = value;
                RaisePropertyChanged(() => cost_price);
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

    public class rptL_4_38_Info : ObservableObject
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

        private double _cost_price;
        /// <summary>
        /// �ɱ���
        /// </summary>
        public double cost_price
        {
            get { return _cost_price; }

            set
            {
                _cost_price = value;
                RaisePropertyChanged(() => cost_price);
            }
        }

        private double _last_price;
        /// <summary>
        /// ���¼�
        /// </summary>
        public double last_price
        {
            get { return _last_price; }

            set
            {
                _last_price = value;
                RaisePropertyChanged(() => last_price);
            }
        }

        private double _pre_close_price;
        /// <summary>
        /// �����̼�
        /// </summary>
        public double pre_close_price
        {
            get { return _pre_close_price; }

            set
            {
                _pre_close_price = value;
                RaisePropertyChanged(() => pre_close_price);
            }
        }

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

        private double _posi_market_value;
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value
        {
            get { return _posi_market_value; }

            set
            {
                _posi_market_value = value;
                RaisePropertyChanged(() => posi_market_value);
            }
        }

        private double _posi_nav_ratio;
        /// <summary>
        /// �ֲ־�ֵռ��
        /// </summary>
        public double posi_nav_ratio
        {
            get { return _posi_nav_ratio; }

            set
            {
                _posi_nav_ratio = value;
                RaisePropertyChanged(() => posi_nav_ratio);
            }
        }

        private double _full_holding_amt;
        /// <summary>
        /// ȫ�۳ֲ���ֵ
        /// </summary>
        public double full_holding_amt
        {
            get { return _full_holding_amt; }

            set
            {
                _full_holding_amt = value;
                RaisePropertyChanged(() => full_holding_amt);
            }
        }

        private double _float_pandl;
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double float_pandl
        {
            get { return _float_pandl; }

            set
            {
                _float_pandl = value;
                RaisePropertyChanged(() => float_pandl);
            }
        }

        private double _pandl_ratio;
        /// <summary>
        /// ӯ������
        /// </summary>
        public double pandl_ratio
        {
            get { return _pandl_ratio; }

            set
            {
                _pandl_ratio = value;
                RaisePropertyChanged(() => pandl_ratio);
            }
        }

        private double _bond_receivable_amt;
        /// <summary>
        /// ծȯӦ����Ϣ
        /// </summary>
        public double bond_receivable_amt
        {
            get { return _bond_receivable_amt; }

            set
            {
                _bond_receivable_amt = value;
                RaisePropertyChanged(() => bond_receivable_amt);
            }
        }

        private double _impawn_qty;
        /// <summary>
        /// ��Ѻ����
        /// </summary>
        public double impawn_qty
        {
            get { return _impawn_qty; }

            set
            {
                _impawn_qty = value;
                RaisePropertyChanged(() => impawn_qty);
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

    public class rptL_4_41_Info : ObservableObject
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

        private double _posi_market_value;
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value
        {
            get { return _posi_market_value; }

            set
            {
                _posi_market_value = value;
                RaisePropertyChanged(() => posi_market_value);
            }
        }

        private double _posi_nav_ratio;
        /// <summary>
        /// �ֲ־�ֵռ��
        /// </summary>
        public double posi_nav_ratio
        {
            get { return _posi_nav_ratio; }

            set
            {
                _posi_nav_ratio = value;
                RaisePropertyChanged(() => posi_nav_ratio);
            }
        }

        private double _open_aver_price;
        /// <summary>
        /// ���־���
        /// </summary>
        public double open_aver_price
        {
            get { return _open_aver_price; }

            set
            {
                _open_aver_price = value;
                RaisePropertyChanged(() => open_aver_price);
            }
        }
    }

    public class rptL_4_42_Info : ObservableObject
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

        private double _posi_market_value;
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value
        {
            get { return _posi_market_value; }

            set
            {
                _posi_market_value = value;
                RaisePropertyChanged(() => posi_market_value);
            }
        }

        private double _posi_nav_ratio;
        /// <summary>
        /// �ֲ־�ֵռ��
        /// </summary>
        public double posi_nav_ratio
        {
            get { return _posi_nav_ratio; }

            set
            {
                _posi_nav_ratio = value;
                RaisePropertyChanged(() => posi_nav_ratio);
            }
        }

        private double _open_aver_price;
        /// <summary>
        /// ���־���
        /// </summary>
        public double open_aver_price
        {
            get { return _open_aver_price; }

            set
            {
                _open_aver_price = value;
                RaisePropertyChanged(() => open_aver_price);
            }
        }
    }

    public class rptL_4_43_Info : ObservableObject
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

        private double _posi_market_value;
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value
        {
            get { return _posi_market_value; }

            set
            {
                _posi_market_value = value;
                RaisePropertyChanged(() => posi_market_value);
            }
        }

        private double _posi_nav_ratio;
        /// <summary>
        /// �ֲ־�ֵռ��
        /// </summary>
        public double posi_nav_ratio
        {
            get { return _posi_nav_ratio; }

            set
            {
                _posi_nav_ratio = value;
                RaisePropertyChanged(() => posi_nav_ratio);
            }
        }

        private double _open_aver_price;
        /// <summary>
        /// ���־���
        /// </summary>
        public double open_aver_price
        {
            get { return _open_aver_price; }

            set
            {
                _open_aver_price = value;
                RaisePropertyChanged(() => open_aver_price);
            }
        }
    }

    public class rptL_4_44_Info : ObservableObject
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

        private double _posi_market_value;
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value
        {
            get { return _posi_market_value; }

            set
            {
                _posi_market_value = value;
                RaisePropertyChanged(() => posi_market_value);
            }
        }

        private double _posi_nav_ratio;
        /// <summary>
        /// �ֲ־�ֵռ��
        /// </summary>
        public double posi_nav_ratio
        {
            get { return _posi_nav_ratio; }

            set
            {
                _posi_nav_ratio = value;
                RaisePropertyChanged(() => posi_nav_ratio);
            }
        }

        private double _open_aver_price;
        /// <summary>
        /// ���־���
        /// </summary>
        public double open_aver_price
        {
            get { return _open_aver_price; }

            set
            {
                _open_aver_price = value;
                RaisePropertyChanged(() => open_aver_price);
            }
        }
    }

    public class rptL_4_45_Info : ObservableObject
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

    public class rptL_4_46_Info : ObservableObject
    {

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

        private double _open_posi_value;
        /// <summary>
        /// ������ֵ
        /// </summary>
        public double open_posi_value
        {
            get { return _open_posi_value; }

            set
            {
                _open_posi_value = value;
                RaisePropertyChanged(() => open_posi_value);
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

        private int _close_posi_date;
        /// <summary>
        /// ƽ������
        /// </summary>
        public int close_posi_date
        {
            get { return _close_posi_date; }

            set
            {
                _close_posi_date = value;
                RaisePropertyChanged(() => close_posi_date);
            }
        }

        private int _close_posi_time;
        /// <summary>
        /// ƽ��ʱ��
        /// </summary>
        public int close_posi_time
        {
            get { return _close_posi_time; }

            set
            {
                _close_posi_time = value;
                RaisePropertyChanged(() => close_posi_time);
            }
        }

        private double _close_posi_price;
        /// <summary>
        /// ƽ�ּ۸�
        /// </summary>
        public double close_posi_price
        {
            get { return _close_posi_price; }

            set
            {
                _close_posi_price = value;
                RaisePropertyChanged(() => close_posi_price);
            }
        }

        private double _close_posi_market_value;
        /// <summary>
        /// ƽ����ֵ
        /// </summary>
        public double close_posi_market_value
        {
            get { return _close_posi_market_value; }

            set
            {
                _close_posi_market_value = value;
                RaisePropertyChanged(() => close_posi_market_value);
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

        private double _close_posi_qty;
        /// <summary>
        /// ƽ������
        /// </summary>
        public double close_posi_qty
        {
            get { return _close_posi_qty; }

            set
            {
                _close_posi_qty = value;
                RaisePropertyChanged(() => close_posi_qty);
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

        private double _over_night_pandl;
        /// <summary>
        /// ��ҹӯ��
        /// </summary>
        public double over_night_pandl
        {
            get { return _over_night_pandl; }

            set
            {
                _over_night_pandl = value;
                RaisePropertyChanged(() => over_night_pandl);
            }
        }
    }

    public class rptL_4_47_Info : ObservableObject
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

        private int _strike_date;
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public int strike_date
        {
            get { return _strike_date; }

            set
            {
                _strike_date = value;
                RaisePropertyChanged(() => strike_date);
            }
        }

        private int _strike_time;
        /// <summary>
        /// �ɽ�ʱ��
        /// </summary>
        public int strike_time
        {
            get { return _strike_time; }

            set
            {
                _strike_time = value;
                RaisePropertyChanged(() => strike_time);
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

        private int _report_date;
        /// <summary>
        /// �걨����
        /// </summary>
        public int report_date
        {
            get { return _report_date; }

            set
            {
                _report_date = value;
                RaisePropertyChanged(() => report_date);
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

        private double _strike_price;
        /// <summary>
        /// �ɽ��۸�
        /// </summary>
        public double strike_price
        {
            get { return _strike_price; }

            set
            {
                _strike_price = value;
                RaisePropertyChanged(() => strike_price);
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

        private double _bond_accr_intrst;
        /// <summary>
        /// ծȯ������Ϣ
        /// </summary>
        public double bond_accr_intrst
        {
            get { return _bond_accr_intrst; }

            set
            {
                _bond_accr_intrst = value;
                RaisePropertyChanged(() => bond_accr_intrst);
            }
        }

        private double _strike_bond_accr_intrst;
        /// <summary>
        /// �ɽ�ծȯ������Ϣ
        /// </summary>
        public double strike_bond_accr_intrst
        {
            get { return _strike_bond_accr_intrst; }

            set
            {
                _strike_bond_accr_intrst = value;
                RaisePropertyChanged(() => strike_bond_accr_intrst);
            }
        }

        private int _net_price_flag;
        /// <summary>
        /// ���۱�־
        /// </summary>
        public int net_price_flag
        {
            get { return _net_price_flag; }

            set
            {
                _net_price_flag = value;
                RaisePropertyChanged(() => net_price_flag);
            }
        }

        private String _order_oper_way;
        /// <summary>
        /// ����������ʽ
        /// </summary>
        public String order_oper_way
        {
            get { return _order_oper_way; }

            set
            {
                _order_oper_way = value;
                RaisePropertyChanged(() => order_oper_way);
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

        private int _record_valid_flag;
        /// <summary>
        /// ��¼��Ч��־
        /// </summary>
        public int record_valid_flag
        {
            get { return _record_valid_flag; }

            set
            {
                _record_valid_flag = value;
                RaisePropertyChanged(() => record_valid_flag);
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

        private double _quot_strike_qty;
        /// <summary>
        /// ����ɽ�����
        /// </summary>
        public double quot_strike_qty
        {
            get { return _quot_strike_qty; }

            set
            {
                _quot_strike_qty = value;
                RaisePropertyChanged(() => quot_strike_qty);
            }
        }

        private double _quot_strike_amt;
        /// <summary>
        /// ����ɽ����
        /// </summary>
        public double quot_strike_amt
        {
            get { return _quot_strike_amt; }

            set
            {
                _quot_strike_amt = value;
                RaisePropertyChanged(() => quot_strike_amt);
            }
        }
    }

    public class rptL_4_101_Info : ObservableObject
    {

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

        private String _exch_group_code;
        /// <summary>
        /// ���������
        /// </summary>
        public String exch_group_code
        {
            get { return _exch_group_code; }

            set
            {
                _exch_group_code = value;
                RaisePropertyChanged(() => exch_group_code);
            }
        }

        private String _exch_group_name;
        /// <summary>
        /// ����������
        /// </summary>
        public String exch_group_name
        {
            get { return _exch_group_name; }

            set
            {
                _exch_group_name = value;
                RaisePropertyChanged(() => exch_group_name);
            }
        }

        private String _exch_group_status;
        /// <summary>
        /// ������״̬
        /// </summary>
        public String exch_group_status
        {
            get { return _exch_group_status; }

            set
            {
                _exch_group_status = value;
                RaisePropertyChanged(() => exch_group_status);
            }
        }

        private int _default_group_flag;
        /// <summary>
        /// Ĭ�����־
        /// </summary>
        public int default_group_flag
        {
            get { return _default_group_flag; }

            set
            {
                _default_group_flag = value;
                RaisePropertyChanged(() => default_group_flag);
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
    }

    public class rptL_4_102_Info : ObservableObject
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

        private String _opor_name;
        /// <summary>
        /// ����Ա����
        /// </summary>
        public String opor_name
        {
            get { return _opor_name; }

            set
            {
                _opor_name = value;
                RaisePropertyChanged(() => opor_name);
            }
        }

        private int _opor_type;
        /// <summary>
        /// ����Ա����
        /// </summary>
        public int opor_type
        {
            get { return _opor_type; }

            set
            {
                _opor_type = value;
                RaisePropertyChanged(() => opor_type);
            }
        }

        private String _opor_status;
        /// <summary>
        /// ����Ա״̬
        /// </summary>
        public String opor_status
        {
            get { return _opor_status; }

            set
            {
                _opor_status = value;
                RaisePropertyChanged(() => opor_status);
            }
        }
    }

    public class rptL_4_103_Info : ObservableObject
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

        private double _begin_NAV;
        /// <summary>
        /// �ڳ����ʲ�
        /// </summary>
        public double begin_NAV
        {
            get { return _begin_NAV; }

            set
            {
                _begin_NAV = value;
                RaisePropertyChanged(() => begin_NAV);
            }
        }

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

        private double _unit_nav;
        /// <summary>
        /// ��λ��ֵ
        /// </summary>
        public double unit_nav
        {
            get { return _unit_nav; }

            set
            {
                _unit_nav = value;
                RaisePropertyChanged(() => unit_nav);
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

        private double _nav_fluct;
        /// <summary>
        /// ��ֵ����
        /// </summary>
        public double nav_fluct
        {
            get { return _nav_fluct; }

            set
            {
                _nav_fluct = value;
                RaisePropertyChanged(() => nav_fluct);
            }
        }

        private double _cash_asset;
        /// <summary>
        /// �ֽ��ʲ�
        /// </summary>
        public double cash_asset
        {
            get { return _cash_asset; }

            set
            {
                _cash_asset = value;
                RaisePropertyChanged(() => cash_asset);
            }
        }

        private double _stock_asset;
        /// <summary>
        /// ��Ʊ�ʲ�
        /// </summary>
        public double stock_asset
        {
            get { return _stock_asset; }

            set
            {
                _stock_asset = value;
                RaisePropertyChanged(() => stock_asset);
            }
        }

        private double _bond_asset;
        /// <summary>
        /// ծȯ�ʲ�
        /// </summary>
        public double bond_asset
        {
            get { return _bond_asset; }

            set
            {
                _bond_asset = value;
                RaisePropertyChanged(() => bond_asset);
            }
        }

        private double _fund_asset;
        /// <summary>
        /// �����ʲ�
        /// </summary>
        public double fund_asset
        {
            get { return _fund_asset; }

            set
            {
                _fund_asset = value;
                RaisePropertyChanged(() => fund_asset);
            }
        }

        private double _repo_asset;
        /// <summary>
        /// �ع��ʲ�
        /// </summary>
        public double repo_asset
        {
            get { return _repo_asset; }

            set
            {
                _repo_asset = value;
                RaisePropertyChanged(() => repo_asset);
            }
        }

        private double _other_asset;
        /// <summary>
        /// �����ʲ�
        /// </summary>
        public double other_asset
        {
            get { return _other_asset; }

            set
            {
                _other_asset = value;
                RaisePropertyChanged(() => other_asset);
            }
        }

        private double _futu_asset;
        /// <summary>
        /// �ڻ��ʲ�
        /// </summary>
        public double futu_asset
        {
            get { return _futu_asset; }

            set
            {
                _futu_asset = value;
                RaisePropertyChanged(() => futu_asset);
            }
        }

        private double _hk_thrgh_stock_asset;
        /// <summary>
        /// �۹�ͨ�ʲ�
        /// </summary>
        public double hk_thrgh_stock_asset
        {
            get { return _hk_thrgh_stock_asset; }

            set
            {
                _hk_thrgh_stock_asset = value;
                RaisePropertyChanged(() => hk_thrgh_stock_asset);
            }
        }

        private double _assign_avail_amt;
        /// <summary>
        /// �ɷ�����
        /// </summary>
        public double assign_avail_amt
        {
            get { return _assign_avail_amt; }

            set
            {
                _assign_avail_amt = value;
                RaisePropertyChanged(() => assign_avail_amt);
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

        private double _today_pandl;
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double today_pandl
        {
            get { return _today_pandl; }

            set
            {
                _today_pandl = value;
                RaisePropertyChanged(() => today_pandl);
            }
        }

        private double _daily_pandl_ratio;
        /// <summary>
        /// ����������
        /// </summary>
        public double daily_pandl_ratio
        {
            get { return _daily_pandl_ratio; }

            set
            {
                _daily_pandl_ratio = value;
                RaisePropertyChanged(() => daily_pandl_ratio);
            }
        }

        private double _cash_out_amt;
        /// <summary>
        /// �����ֽ��
        /// </summary>
        public double cash_out_amt
        {
            get { return _cash_out_amt; }

            set
            {
                _cash_out_amt = value;
                RaisePropertyChanged(() => cash_out_amt);
            }
        }

        private double _stock_asset_ratio;
        /// <summary>
        /// ��Ʊ�ʲ�ռ��
        /// </summary>
        public double stock_asset_ratio
        {
            get { return _stock_asset_ratio; }

            set
            {
                _stock_asset_ratio = value;
                RaisePropertyChanged(() => stock_asset_ratio);
            }
        }

        private double _fund_asset_ratio;
        /// <summary>
        /// �����ʲ�ռ��
        /// </summary>
        public double fund_asset_ratio
        {
            get { return _fund_asset_ratio; }

            set
            {
                _fund_asset_ratio = value;
                RaisePropertyChanged(() => fund_asset_ratio);
            }
        }

        private double _securities_ratio;
        /// <summary>
        /// ֤ȯռ��
        /// </summary>
        public double securities_ratio
        {
            get { return _securities_ratio; }

            set
            {
                _securities_ratio = value;
                RaisePropertyChanged(() => securities_ratio);
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

        private double _money_fund_asset;
        /// <summary>
        /// ���һ����ʲ�
        /// </summary>
        public double money_fund_asset
        {
            get { return _money_fund_asset; }

            set
            {
                _money_fund_asset = value;
                RaisePropertyChanged(() => money_fund_asset);
            }
        }

        private double _stock_cost;
        /// <summary>
        /// ��Ʊ�ɱ�
        /// </summary>
        public double stock_cost
        {
            get { return _stock_cost; }

            set
            {
                _stock_cost = value;
                RaisePropertyChanged(() => stock_cost);
            }
        }

        private double _bond_cost;
        /// <summary>
        /// ծȯ�ɱ�
        /// </summary>
        public double bond_cost
        {
            get { return _bond_cost; }

            set
            {
                _bond_cost = value;
                RaisePropertyChanged(() => bond_cost);
            }
        }

        private double _fund_cost;
        /// <summary>
        /// ����ɱ�
        /// </summary>
        public double fund_cost
        {
            get { return _fund_cost; }

            set
            {
                _fund_cost = value;
                RaisePropertyChanged(() => fund_cost);
            }
        }

        private double _repo_cost;
        /// <summary>
        /// �ع��ɱ�
        /// </summary>
        public double repo_cost
        {
            get { return _repo_cost; }

            set
            {
                _repo_cost = value;
                RaisePropertyChanged(() => repo_cost);
            }
        }

        private double _other_cost;
        /// <summary>
        /// �����ɱ�
        /// </summary>
        public double other_cost
        {
            get { return _other_cost; }

            set
            {
                _other_cost = value;
                RaisePropertyChanged(() => other_cost);
            }
        }

        private double _futu_cost;
        /// <summary>
        /// �ڻ��ɱ�
        /// </summary>
        public double futu_cost
        {
            get { return _futu_cost; }

            set
            {
                _futu_cost = value;
                RaisePropertyChanged(() => futu_cost);
            }
        }

        private double _hk_thrgh_stock_cost;
        /// <summary>
        /// �۹�ͨ�ɱ�
        /// </summary>
        public double hk_thrgh_stock_cost
        {
            get { return _hk_thrgh_stock_cost; }

            set
            {
                _hk_thrgh_stock_cost = value;
                RaisePropertyChanged(() => hk_thrgh_stock_cost);
            }
        }

        private double _money_fund_cost;
        /// <summary>
        /// ���һ���ɱ�
        /// </summary>
        public double money_fund_cost
        {
            get { return _money_fund_cost; }

            set
            {
                _money_fund_cost = value;
                RaisePropertyChanged(() => money_fund_cost);
            }
        }

        private double _unit_nav_total;
        /// <summary>
        /// ��λ�ۼƾ�ֵ
        /// </summary>
        public double unit_nav_total
        {
            get { return _unit_nav_total; }

            set
            {
                _unit_nav_total = value;
                RaisePropertyChanged(() => unit_nav_total);
            }
        }

        private double _unit_divi_amt;
        /// <summary>
        /// ��λ�ֺ�
        /// </summary>
        public double unit_divi_amt
        {
            get { return _unit_divi_amt; }

            set
            {
                _unit_divi_amt = value;
                RaisePropertyChanged(() => unit_divi_amt);
            }
        }

        private double _avail_cash;
        /// <summary>
        /// �����ʽ�
        /// </summary>
        public double avail_cash
        {
            get { return _avail_cash; }

            set
            {
                _avail_cash = value;
                RaisePropertyChanged(() => avail_cash);
            }
        }

        private ulong _grp_row;
        /// <summary>
        /// �������
        /// </summary>
        public ulong grp_row
        {
            get { return _grp_row; }

            set
            {
                _grp_row = value;
                RaisePropertyChanged(() => grp_row);
            }
        }

        private double _last_month_pd_nav;
        /// <summary>
        /// ���¾�ֵ
        /// </summary>
        public double last_month_pd_nav
        {
            get { return _last_month_pd_nav; }

            set
            {
                _last_month_pd_nav = value;
                RaisePropertyChanged(() => last_month_pd_nav);
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

        private double _capit_bala;
        /// <summary>
        /// �ʽ����
        /// </summary>
        public double capit_bala
        {
            get { return _capit_bala; }

            set
            {
                _capit_bala = value;
                RaisePropertyChanged(() => capit_bala);
            }
        }

        private double _avail_amt;
        /// <summary>
        /// ���ý��
        /// </summary>
        public double avail_amt
        {
            get { return _avail_amt; }

            set
            {
                _avail_amt = value;
                RaisePropertyChanged(() => avail_amt);
            }
        }

        private double _pre_cash_asset;
        /// <summary>
        /// �����ֽ��ʲ�
        /// </summary>
        public double pre_cash_asset
        {
            get { return _pre_cash_asset; }

            set
            {
                _pre_cash_asset = value;
                RaisePropertyChanged(() => pre_cash_asset);
            }
        }

        private double _pre_stock_asset;
        /// <summary>
        /// ���չ�Ʊ�ʲ�
        /// </summary>
        public double pre_stock_asset
        {
            get { return _pre_stock_asset; }

            set
            {
                _pre_stock_asset = value;
                RaisePropertyChanged(() => pre_stock_asset);
            }
        }

        private double _pre_bond_asset;
        /// <summary>
        /// ����ծȯ�ʲ�
        /// </summary>
        public double pre_bond_asset
        {
            get { return _pre_bond_asset; }

            set
            {
                _pre_bond_asset = value;
                RaisePropertyChanged(() => pre_bond_asset);
            }
        }

        private double _pre_fund_asset;
        /// <summary>
        /// ���ջ����ʲ�
        /// </summary>
        public double pre_fund_asset
        {
            get { return _pre_fund_asset; }

            set
            {
                _pre_fund_asset = value;
                RaisePropertyChanged(() => pre_fund_asset);
            }
        }

        private double _pre_repo_asset;
        /// <summary>
        /// ���ջع��ʲ�
        /// </summary>
        public double pre_repo_asset
        {
            get { return _pre_repo_asset; }

            set
            {
                _pre_repo_asset = value;
                RaisePropertyChanged(() => pre_repo_asset);
            }
        }

        private double _pre_other_asset;
        /// <summary>
        /// ���������ʲ�
        /// </summary>
        public double pre_other_asset
        {
            get { return _pre_other_asset; }

            set
            {
                _pre_other_asset = value;
                RaisePropertyChanged(() => pre_other_asset);
            }
        }

        private double _pre_futu_asset;
        /// <summary>
        /// �����ڻ��ʲ�
        /// </summary>
        public double pre_futu_asset
        {
            get { return _pre_futu_asset; }

            set
            {
                _pre_futu_asset = value;
                RaisePropertyChanged(() => pre_futu_asset);
            }
        }

        private double _pre_hk_thrgh_stock_asset;
        /// <summary>
        /// ���ո۹�ͨ�ʲ�
        /// </summary>
        public double pre_hk_thrgh_stock_asset
        {
            get { return _pre_hk_thrgh_stock_asset; }

            set
            {
                _pre_hk_thrgh_stock_asset = value;
                RaisePropertyChanged(() => pre_hk_thrgh_stock_asset);
            }
        }

        private double _pre_money_fund_asset;
        /// <summary>
        /// ���ջ��һ����ʲ�
        /// </summary>
        public double pre_money_fund_asset
        {
            get { return _pre_money_fund_asset; }

            set
            {
                _pre_money_fund_asset = value;
                RaisePropertyChanged(() => pre_money_fund_asset);
            }
        }

        private double _pre_stock_cost;
        /// <summary>
        /// ���չ�Ʊ�ɱ�
        /// </summary>
        public double pre_stock_cost
        {
            get { return _pre_stock_cost; }

            set
            {
                _pre_stock_cost = value;
                RaisePropertyChanged(() => pre_stock_cost);
            }
        }

        private double _pre_bond_cost;
        /// <summary>
        /// ����ծȯ�ɱ�
        /// </summary>
        public double pre_bond_cost
        {
            get { return _pre_bond_cost; }

            set
            {
                _pre_bond_cost = value;
                RaisePropertyChanged(() => pre_bond_cost);
            }
        }

        private double _pre_fund_cost;
        /// <summary>
        /// ���ջ���ɱ�
        /// </summary>
        public double pre_fund_cost
        {
            get { return _pre_fund_cost; }

            set
            {
                _pre_fund_cost = value;
                RaisePropertyChanged(() => pre_fund_cost);
            }
        }

        private double _pre_repo_cost;
        /// <summary>
        /// ���ջع��ɱ�
        /// </summary>
        public double pre_repo_cost
        {
            get { return _pre_repo_cost; }

            set
            {
                _pre_repo_cost = value;
                RaisePropertyChanged(() => pre_repo_cost);
            }
        }

        private double _pre_other_cost;
        /// <summary>
        /// ���������ɱ�
        /// </summary>
        public double pre_other_cost
        {
            get { return _pre_other_cost; }

            set
            {
                _pre_other_cost = value;
                RaisePropertyChanged(() => pre_other_cost);
            }
        }

        private double _pre_futu_cost;
        /// <summary>
        /// �����ڻ��ɱ�
        /// </summary>
        public double pre_futu_cost
        {
            get { return _pre_futu_cost; }

            set
            {
                _pre_futu_cost = value;
                RaisePropertyChanged(() => pre_futu_cost);
            }
        }

        private double _pre_hk_thrgh_stock_cost;
        /// <summary>
        /// ���ո۹�ͨ�ɱ�
        /// </summary>
        public double pre_hk_thrgh_stock_cost
        {
            get { return _pre_hk_thrgh_stock_cost; }

            set
            {
                _pre_hk_thrgh_stock_cost = value;
                RaisePropertyChanged(() => pre_hk_thrgh_stock_cost);
            }
        }

        private double _pre_money_fund_cost;
        /// <summary>
        /// ���ջ��һ���ɱ�
        /// </summary>
        public double pre_money_fund_cost
        {
            get { return _pre_money_fund_cost; }

            set
            {
                _pre_money_fund_cost = value;
                RaisePropertyChanged(() => pre_money_fund_cost);
            }
        }
    }

    public class rptL_4_104_Info : ObservableObject
    {

        private int _begin_date;
        /// <summary>
        /// ��ʼ����
        /// </summary>
        public int begin_date
        {
            get { return _begin_date; }

            set
            {
                _begin_date = value;
                RaisePropertyChanged(() => begin_date);
            }
        }

        private int _end_date;
        /// <summary>
        /// ��������
        /// </summary>
        public int end_date
        {
            get { return _end_date; }

            set
            {
                _end_date = value;
                RaisePropertyChanged(() => end_date);
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

        private double _total_trade_amt;
        /// <summary>
        /// �ۼƽ��׽��
        /// </summary>
        public double total_trade_amt
        {
            get { return _total_trade_amt; }

            set
            {
                _total_trade_amt = value;
                RaisePropertyChanged(() => total_trade_amt);
            }
        }

        private double _total_strike_commis;
        /// <summary>
        /// �ۼƳɽ�Ӷ��
        /// </summary>
        public double total_strike_commis
        {
            get { return _total_strike_commis; }

            set
            {
                _total_strike_commis = value;
                RaisePropertyChanged(() => total_strike_commis);
            }
        }

        private double _stock_trade_amt;
        /// <summary>
        /// A�ɽ��׽��
        /// </summary>
        public double stock_trade_amt
        {
            get { return _stock_trade_amt; }

            set
            {
                _stock_trade_amt = value;
                RaisePropertyChanged(() => stock_trade_amt);
            }
        }

        private double _stock_strike_commis;
        /// <summary>
        /// A�ɳɽ�Ӷ��
        /// </summary>
        public double stock_strike_commis
        {
            get { return _stock_strike_commis; }

            set
            {
                _stock_strike_commis = value;
                RaisePropertyChanged(() => stock_strike_commis);
            }
        }

        private double _bond_trade_amt;
        /// <summary>
        /// ծȯ���׽��
        /// </summary>
        public double bond_trade_amt
        {
            get { return _bond_trade_amt; }

            set
            {
                _bond_trade_amt = value;
                RaisePropertyChanged(() => bond_trade_amt);
            }
        }

        private double _bond_strike_commis;
        /// <summary>
        /// ծȯ�ɽ�Ӷ��
        /// </summary>
        public double bond_strike_commis
        {
            get { return _bond_strike_commis; }

            set
            {
                _bond_strike_commis = value;
                RaisePropertyChanged(() => bond_strike_commis);
            }
        }

        private double _fund_trade_amt;
        /// <summary>
        /// �����׽��
        /// </summary>
        public double fund_trade_amt
        {
            get { return _fund_trade_amt; }

            set
            {
                _fund_trade_amt = value;
                RaisePropertyChanged(() => fund_trade_amt);
            }
        }

        private double _fund_strike_commis;
        /// <summary>
        /// ����ɽ�Ӷ��
        /// </summary>
        public double fund_strike_commis
        {
            get { return _fund_strike_commis; }

            set
            {
                _fund_strike_commis = value;
                RaisePropertyChanged(() => fund_strike_commis);
            }
        }

        private double _money_fund_trade_amt;
        /// <summary>
        /// ���һ����׽��
        /// </summary>
        public double money_fund_trade_amt
        {
            get { return _money_fund_trade_amt; }

            set
            {
                _money_fund_trade_amt = value;
                RaisePropertyChanged(() => money_fund_trade_amt);
            }
        }

        private double _money_fund_strike_commis;
        /// <summary>
        /// ���һ���ɽ�Ӷ��
        /// </summary>
        public double money_fund_strike_commis
        {
            get { return _money_fund_strike_commis; }

            set
            {
                _money_fund_strike_commis = value;
                RaisePropertyChanged(() => money_fund_strike_commis);
            }
        }

        private double _hk_thrgh_trade_amt;
        /// <summary>
        /// �۹�ͨ���׽��
        /// </summary>
        public double hk_thrgh_trade_amt
        {
            get { return _hk_thrgh_trade_amt; }

            set
            {
                _hk_thrgh_trade_amt = value;
                RaisePropertyChanged(() => hk_thrgh_trade_amt);
            }
        }

        private double _hk_thrgh_strike_commis;
        /// <summary>
        /// �۹�ͨ�ɽ�Ӷ��
        /// </summary>
        public double hk_thrgh_strike_commis
        {
            get { return _hk_thrgh_strike_commis; }

            set
            {
                _hk_thrgh_strike_commis = value;
                RaisePropertyChanged(() => hk_thrgh_strike_commis);
            }
        }

        private double _repo_trade_amt;
        /// <summary>
        /// �ع����׽��
        /// </summary>
        public double repo_trade_amt
        {
            get { return _repo_trade_amt; }

            set
            {
                _repo_trade_amt = value;
                RaisePropertyChanged(() => repo_trade_amt);
            }
        }

        private double _repo_strike_commis;
        /// <summary>
        /// �ع��ɽ�Ӷ��
        /// </summary>
        public double repo_strike_commis
        {
            get { return _repo_strike_commis; }

            set
            {
                _repo_strike_commis = value;
                RaisePropertyChanged(() => repo_strike_commis);
            }
        }

        private double _option_trade_amt;
        /// <summary>
        /// ��Ȩ���׽��
        /// </summary>
        public double option_trade_amt
        {
            get { return _option_trade_amt; }

            set
            {
                _option_trade_amt = value;
                RaisePropertyChanged(() => option_trade_amt);
            }
        }

        private double _option_strike_commis;
        /// <summary>
        /// ��Ȩ�ɽ�Ӷ��
        /// </summary>
        public double option_strike_commis
        {
            get { return _option_strike_commis; }

            set
            {
                _option_strike_commis = value;
                RaisePropertyChanged(() => option_strike_commis);
            }
        }

        private double _futu_trade_amt;
        /// <summary>
        /// �ڻ����׽��
        /// </summary>
        public double futu_trade_amt
        {
            get { return _futu_trade_amt; }

            set
            {
                _futu_trade_amt = value;
                RaisePropertyChanged(() => futu_trade_amt);
            }
        }

        private double _futu_strike_commis;
        /// <summary>
        /// �ڻ��ɽ�Ӷ��
        /// </summary>
        public double futu_strike_commis
        {
            get { return _futu_strike_commis; }

            set
            {
                _futu_strike_commis = value;
                RaisePropertyChanged(() => futu_strike_commis);
            }
        }

        private int _total_trade_cnt;
        /// <summary>
        /// �ۼƽ��ױ���
        /// </summary>
        public int total_trade_cnt
        {
            get { return _total_trade_cnt; }

            set
            {
                _total_trade_cnt = value;
                RaisePropertyChanged(() => total_trade_cnt);
            }
        }

        private int _stock_trade_cnt;
        /// <summary>
        /// A�ɽ��ױ���
        /// </summary>
        public int stock_trade_cnt
        {
            get { return _stock_trade_cnt; }

            set
            {
                _stock_trade_cnt = value;
                RaisePropertyChanged(() => stock_trade_cnt);
            }
        }

        private int _bond_trade_cnt;
        /// <summary>
        /// ծȯ���ױ���
        /// </summary>
        public int bond_trade_cnt
        {
            get { return _bond_trade_cnt; }

            set
            {
                _bond_trade_cnt = value;
                RaisePropertyChanged(() => bond_trade_cnt);
            }
        }

        private int _fund_trade_cnt;
        /// <summary>
        /// �����ױ���
        /// </summary>
        public int fund_trade_cnt
        {
            get { return _fund_trade_cnt; }

            set
            {
                _fund_trade_cnt = value;
                RaisePropertyChanged(() => fund_trade_cnt);
            }
        }

        private int _money_fund_trade_cnt;
        /// <summary>
        /// ���һ����ױ���
        /// </summary>
        public int money_fund_trade_cnt
        {
            get { return _money_fund_trade_cnt; }

            set
            {
                _money_fund_trade_cnt = value;
                RaisePropertyChanged(() => money_fund_trade_cnt);
            }
        }

        private int _hk_thrgh_trade_cnt;
        /// <summary>
        /// �۹�ͨ���ױ���
        /// </summary>
        public int hk_thrgh_trade_cnt
        {
            get { return _hk_thrgh_trade_cnt; }

            set
            {
                _hk_thrgh_trade_cnt = value;
                RaisePropertyChanged(() => hk_thrgh_trade_cnt);
            }
        }

        private int _repo_trade_cnt;
        /// <summary>
        /// �ع����ױ���
        /// </summary>
        public int repo_trade_cnt
        {
            get { return _repo_trade_cnt; }

            set
            {
                _repo_trade_cnt = value;
                RaisePropertyChanged(() => repo_trade_cnt);
            }
        }

        private int _option_trade_cnt;
        /// <summary>
        /// ��Ȩ���ױ���
        /// </summary>
        public int option_trade_cnt
        {
            get { return _option_trade_cnt; }

            set
            {
                _option_trade_cnt = value;
                RaisePropertyChanged(() => option_trade_cnt);
            }
        }

        private int _futu_trade_cnt;
        /// <summary>
        /// �ڻ����ױ���
        /// </summary>
        public int futu_trade_cnt
        {
            get { return _futu_trade_cnt; }

            set
            {
                _futu_trade_cnt = value;
                RaisePropertyChanged(() => futu_trade_cnt);
            }
        }
    }

    public class rptL_4_106_Info : ObservableObject
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

        private String _stock_name;
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
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

        private double _up_limit_price;
        /// <summary>
        /// ��ͣ��
        /// </summary>
        public double up_limit_price
        {
            get { return _up_limit_price; }

            set
            {
                _up_limit_price = value;
                RaisePropertyChanged(() => up_limit_price);
            }
        }

        private double _down_limit_price;
        /// <summary>
        /// ��ͣ��
        /// </summary>
        public double down_limit_price
        {
            get { return _down_limit_price; }

            set
            {
                _down_limit_price = value;
                RaisePropertyChanged(() => down_limit_price);
            }
        }

        private double _last_price;
        /// <summary>
        /// ���¼�
        /// </summary>
        public double last_price
        {
            get { return _last_price; }

            set
            {
                _last_price = value;
                RaisePropertyChanged(() => last_price);
            }
        }

        private double _pre_close_price;
        /// <summary>
        /// �����̼�
        /// </summary>
        public double pre_close_price
        {
            get { return _pre_close_price; }

            set
            {
                _pre_close_price = value;
                RaisePropertyChanged(() => pre_close_price);
            }
        }

        private double _today_open_price;
        /// <summary>
        /// ���̼�
        /// </summary>
        public double today_open_price
        {
            get { return _today_open_price; }

            set
            {
                _today_open_price = value;
                RaisePropertyChanged(() => today_open_price);
            }
        }

        private double _today_close_price;
        /// <summary>
        /// �����̼�
        /// </summary>
        public double today_close_price
        {
            get { return _today_close_price; }

            set
            {
                _today_close_price = value;
                RaisePropertyChanged(() => today_close_price);
            }
        }

        private double _today_max_price;
        /// <summary>
        /// ����߼�
        /// </summary>
        public double today_max_price
        {
            get { return _today_max_price; }

            set
            {
                _today_max_price = value;
                RaisePropertyChanged(() => today_max_price);
            }
        }

        private double _today_min_price;
        /// <summary>
        /// ����ͼ�
        /// </summary>
        public double today_min_price
        {
            get { return _today_min_price; }

            set
            {
                _today_min_price = value;
                RaisePropertyChanged(() => today_min_price);
            }
        }

        private double _buy_price_1;
        /// <summary>
        /// ��һ��
        /// </summary>
        public double buy_price_1
        {
            get { return _buy_price_1; }

            set
            {
                _buy_price_1 = value;
                RaisePropertyChanged(() => buy_price_1);
            }
        }

        private double _buy_qty_1;
        /// <summary>
        /// ��һ��
        /// </summary>
        public double buy_qty_1
        {
            get { return _buy_qty_1; }

            set
            {
                _buy_qty_1 = value;
                RaisePropertyChanged(() => buy_qty_1);
            }
        }

        private double _buy_price_2;
        /// <summary>
        /// �����
        /// </summary>
        public double buy_price_2
        {
            get { return _buy_price_2; }

            set
            {
                _buy_price_2 = value;
                RaisePropertyChanged(() => buy_price_2);
            }
        }

        private double _buy_qty_2;
        /// <summary>
        /// �����
        /// </summary>
        public double buy_qty_2
        {
            get { return _buy_qty_2; }

            set
            {
                _buy_qty_2 = value;
                RaisePropertyChanged(() => buy_qty_2);
            }
        }

        private double _buy_price_3;
        /// <summary>
        /// ������
        /// </summary>
        public double buy_price_3
        {
            get { return _buy_price_3; }

            set
            {
                _buy_price_3 = value;
                RaisePropertyChanged(() => buy_price_3);
            }
        }

        private double _buy_qty_3;
        /// <summary>
        /// ������
        /// </summary>
        public double buy_qty_3
        {
            get { return _buy_qty_3; }

            set
            {
                _buy_qty_3 = value;
                RaisePropertyChanged(() => buy_qty_3);
            }
        }

        private double _buy_price_4;
        /// <summary>
        /// ���ļ�
        /// </summary>
        public double buy_price_4
        {
            get { return _buy_price_4; }

            set
            {
                _buy_price_4 = value;
                RaisePropertyChanged(() => buy_price_4);
            }
        }

        private double _buy_qty_4;
        /// <summary>
        /// ������
        /// </summary>
        public double buy_qty_4
        {
            get { return _buy_qty_4; }

            set
            {
                _buy_qty_4 = value;
                RaisePropertyChanged(() => buy_qty_4);
            }
        }

        private double _buy_price_5;
        /// <summary>
        /// �����
        /// </summary>
        public double buy_price_5
        {
            get { return _buy_price_5; }

            set
            {
                _buy_price_5 = value;
                RaisePropertyChanged(() => buy_price_5);
            }
        }

        private double _buy_qty_5;
        /// <summary>
        /// ������
        /// </summary>
        public double buy_qty_5
        {
            get { return _buy_qty_5; }

            set
            {
                _buy_qty_5 = value;
                RaisePropertyChanged(() => buy_qty_5);
            }
        }

        private double _sell_price_1;
        /// <summary>
        /// ��һ��
        /// </summary>
        public double sell_price_1
        {
            get { return _sell_price_1; }

            set
            {
                _sell_price_1 = value;
                RaisePropertyChanged(() => sell_price_1);
            }
        }

        private double _sell_qty_1;
        /// <summary>
        /// ��һ��
        /// </summary>
        public double sell_qty_1
        {
            get { return _sell_qty_1; }

            set
            {
                _sell_qty_1 = value;
                RaisePropertyChanged(() => sell_qty_1);
            }
        }

        private double _sell_price_2;
        /// <summary>
        /// ������
        /// </summary>
        public double sell_price_2
        {
            get { return _sell_price_2; }

            set
            {
                _sell_price_2 = value;
                RaisePropertyChanged(() => sell_price_2);
            }
        }

        private double _sell_qty_2;
        /// <summary>
        /// ������
        /// </summary>
        public double sell_qty_2
        {
            get { return _sell_qty_2; }

            set
            {
                _sell_qty_2 = value;
                RaisePropertyChanged(() => sell_qty_2);
            }
        }

        private double _sell_price_3;
        /// <summary>
        /// ������
        /// </summary>
        public double sell_price_3
        {
            get { return _sell_price_3; }

            set
            {
                _sell_price_3 = value;
                RaisePropertyChanged(() => sell_price_3);
            }
        }

        private double _sell_qty_3;
        /// <summary>
        /// ������
        /// </summary>
        public double sell_qty_3
        {
            get { return _sell_qty_3; }

            set
            {
                _sell_qty_3 = value;
                RaisePropertyChanged(() => sell_qty_3);
            }
        }

        private double _sell_price_4;
        /// <summary>
        /// ���ļ�
        /// </summary>
        public double sell_price_4
        {
            get { return _sell_price_4; }

            set
            {
                _sell_price_4 = value;
                RaisePropertyChanged(() => sell_price_4);
            }
        }

        private double _sell_qty_4;
        /// <summary>
        /// ������
        /// </summary>
        public double sell_qty_4
        {
            get { return _sell_qty_4; }

            set
            {
                _sell_qty_4 = value;
                RaisePropertyChanged(() => sell_qty_4);
            }
        }

        private double _sell_price_5;
        /// <summary>
        /// �����
        /// </summary>
        public double sell_price_5
        {
            get { return _sell_price_5; }

            set
            {
                _sell_price_5 = value;
                RaisePropertyChanged(() => sell_price_5);
            }
        }

        private double _sell_qty_5;
        /// <summary>
        /// ������
        /// </summary>
        public double sell_qty_5
        {
            get { return _sell_qty_5; }

            set
            {
                _sell_qty_5 = value;
                RaisePropertyChanged(() => sell_qty_5);
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

        private double _pe_ratio;
        /// <summary>
        /// ��ӯ��
        /// </summary>
        public double pe_ratio
        {
            get { return _pe_ratio; }

            set
            {
                _pe_ratio = value;
                RaisePropertyChanged(() => pe_ratio);
            }
        }

        private int _time_stamp;
        /// <summary>
        /// ʱ���
        /// </summary>
        public int time_stamp
        {
            get { return _time_stamp; }

            set
            {
                _time_stamp = value;
                RaisePropertyChanged(() => time_stamp);
            }
        }
    }

    public class rptL_4_107_Info : ObservableObject
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

        private double _commd_cnt;
        /// <summary>
        /// ָ�����
        /// </summary>
        public double commd_cnt
        {
            get { return _commd_cnt; }

            set
            {
                _commd_cnt = value;
                RaisePropertyChanged(() => commd_cnt);
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

        private int _order_num;
        /// <summary>
        /// ��������
        /// </summary>
        public int order_num
        {
            get { return _order_num; }

            set
            {
                _order_num = value;
                RaisePropertyChanged(() => order_num);
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

        private double _undeal_amt;
        /// <summary>
        /// δ�ɽ����
        /// </summary>
        public double undeal_amt
        {
            get { return _undeal_amt; }

            set
            {
                _undeal_amt = value;
                RaisePropertyChanged(() => undeal_amt);
            }
        }

        private int _strike_num;
        /// <summary>
        /// �ɽ�����
        /// </summary>
        public int strike_num
        {
            get { return _strike_num; }

            set
            {
                _strike_num = value;
                RaisePropertyChanged(() => strike_num);
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

        private double _quot_strike_qty;
        /// <summary>
        /// ����ɽ�����
        /// </summary>
        public double quot_strike_qty
        {
            get { return _quot_strike_qty; }

            set
            {
                _quot_strike_qty = value;
                RaisePropertyChanged(() => quot_strike_qty);
            }
        }

        private double _quot_strike_amt;
        /// <summary>
        /// ����ɽ����
        /// </summary>
        public double quot_strike_amt
        {
            get { return _quot_strike_amt; }

            set
            {
                _quot_strike_amt = value;
                RaisePropertyChanged(() => quot_strike_amt);
            }
        }

        private double _last_price;
        /// <summary>
        /// ���¼�
        /// </summary>
        public double last_price
        {
            get { return _last_price; }

            set
            {
                _last_price = value;
                RaisePropertyChanged(() => last_price);
            }
        }
    }

    public class rptL_4_108_Info : ObservableObject
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

        private int _begin_date;
        /// <summary>
        /// ��ʼ����
        /// </summary>
        public int begin_date
        {
            get { return _begin_date; }

            set
            {
                _begin_date = value;
                RaisePropertyChanged(() => begin_date);
            }
        }

        private int _end_date;
        /// <summary>
        /// ��������
        /// </summary>
        public int end_date
        {
            get { return _end_date; }

            set
            {
                _end_date = value;
                RaisePropertyChanged(() => end_date);
            }
        }

        private double _posi_yield_rate;
        /// <summary>
        /// �ֲֲ���������
        /// </summary>
        public double posi_yield_rate
        {
            get { return _posi_yield_rate; }

            set
            {
                _posi_yield_rate = value;
                RaisePropertyChanged(() => posi_yield_rate);
            }
        }

        private double _real_trade_oper_rate;
        /// <summary>
        /// ���Բ���Ч��
        /// </summary>
        public double real_trade_oper_rate
        {
            get { return _real_trade_oper_rate; }

            set
            {
                _real_trade_oper_rate = value;
                RaisePropertyChanged(() => real_trade_oper_rate);
            }
        }

        private double _avg_nav_asset;
        /// <summary>
        /// �վ����ʲ�
        /// </summary>
        public double avg_nav_asset
        {
            get { return _avg_nav_asset; }

            set
            {
                _avg_nav_asset = value;
                RaisePropertyChanged(() => avg_nav_asset);
            }
        }

        private double _buy_amt;
        /// <summary>
        /// ������
        /// </summary>
        public double buy_amt
        {
            get { return _buy_amt; }

            set
            {
                _buy_amt = value;
                RaisePropertyChanged(() => buy_amt);
            }
        }

        private double _sellout_amt;
        /// <summary>
        /// �������
        /// </summary>
        public double sellout_amt
        {
            get { return _sellout_amt; }

            set
            {
                _sellout_amt = value;
                RaisePropertyChanged(() => sellout_amt);
            }
        }

        private double _begin_NAV;
        /// <summary>
        /// �ڳ����ʲ�
        /// </summary>
        public double begin_NAV
        {
            get { return _begin_NAV; }

            set
            {
                _begin_NAV = value;
                RaisePropertyChanged(() => begin_NAV);
            }
        }

        private double _begin_share_net_total;
        /// <summary>
        /// �ڳ��ݶ��ۼƾ�ֵ
        /// </summary>
        public double begin_share_net_total
        {
            get { return _begin_share_net_total; }

            set
            {
                _begin_share_net_total = value;
                RaisePropertyChanged(() => begin_share_net_total);
            }
        }

        private double _pd_begin_unit_nav;
        /// <summary>
        /// �ڳ���λ��ֵ
        /// </summary>
        public double pd_begin_unit_nav
        {
            get { return _pd_begin_unit_nav; }

            set
            {
                _pd_begin_unit_nav = value;
                RaisePropertyChanged(() => pd_begin_unit_nav);
            }
        }

        private double _begin_net_all;
        /// <summary>
        /// �ڳ��ݶ��ܶ�
        /// </summary>
        public double begin_net_all
        {
            get { return _begin_net_all; }

            set
            {
                _begin_net_all = value;
                RaisePropertyChanged(() => begin_net_all);
            }
        }

        private double _end_nav_asset;
        /// <summary>
        /// ��ĩ���ʲ�
        /// </summary>
        public double end_nav_asset
        {
            get { return _end_nav_asset; }

            set
            {
                _end_nav_asset = value;
                RaisePropertyChanged(() => end_nav_asset);
            }
        }

        private double _end_share_net_total;
        /// <summary>
        /// ��ĩ�ݶ��ۼƾ�ֵ
        /// </summary>
        public double end_share_net_total
        {
            get { return _end_share_net_total; }

            set
            {
                _end_share_net_total = value;
                RaisePropertyChanged(() => end_share_net_total);
            }
        }

        private double _end_net_all;
        /// <summary>
        /// ��ĩ�ݶ��ܶ�
        /// </summary>
        public double end_net_all
        {
            get { return _end_net_all; }

            set
            {
                _end_net_all = value;
                RaisePropertyChanged(() => end_net_all);
            }
        }

        private double _end_unit_nav;
        /// <summary>
        /// ��ĩ��λ��ֵ
        /// </summary>
        public double end_unit_nav
        {
            get { return _end_unit_nav; }

            set
            {
                _end_unit_nav = value;
                RaisePropertyChanged(() => end_unit_nav);
            }
        }
    }

    public class rptL_4_111_Info : ObservableObject
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

        private double _posi_market_value;
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value
        {
            get { return _posi_market_value; }

            set
            {
                _posi_market_value = value;
                RaisePropertyChanged(() => posi_market_value);
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

        private double _buy_pre_sett_qty;
        /// <summary>
        /// �������������
        /// </summary>
        public double buy_pre_sett_qty
        {
            get { return _buy_pre_sett_qty; }

            set
            {
                _buy_pre_sett_qty = value;
                RaisePropertyChanged(() => buy_pre_sett_qty);
            }
        }

        private double _sell_pre_sett_qty;
        /// <summary>
        /// ��������������
        /// </summary>
        public double sell_pre_sett_qty
        {
            get { return _sell_pre_sett_qty; }

            set
            {
                _sell_pre_sett_qty = value;
                RaisePropertyChanged(() => sell_pre_sett_qty);
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

        private double _avail_qty;
        /// <summary>
        /// ��������
        /// </summary>
        public double avail_qty
        {
            get { return _avail_qty; }

            set
            {
                _avail_qty = value;
                RaisePropertyChanged(() => avail_qty);
            }
        }

        private double _full_holding_amt;
        /// <summary>
        /// ȫ�۳ֲ���ֵ
        /// </summary>
        public double full_holding_amt
        {
            get { return _full_holding_amt; }

            set
            {
                _full_holding_amt = value;
                RaisePropertyChanged(() => full_holding_amt);
            }
        }

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

        private double _impawn_qty;
        /// <summary>
        /// ��Ѻ����
        /// </summary>
        public double impawn_qty
        {
            get { return _impawn_qty; }

            set
            {
                _impawn_qty = value;
                RaisePropertyChanged(() => impawn_qty);
            }
        }

        private double _bond_receivable_amt;
        /// <summary>
        /// ծȯӦ����Ϣ
        /// </summary>
        public double bond_receivable_amt
        {
            get { return _bond_receivable_amt; }

            set
            {
                _bond_receivable_amt = value;
                RaisePropertyChanged(() => bond_receivable_amt);
            }
        }

        private double _net_price;
        /// <summary>
        /// ����
        /// </summary>
        public double net_price
        {
            get { return _net_price; }

            set
            {
                _net_price = value;
                RaisePropertyChanged(() => net_price);
            }
        }

        private double _full_price;
        /// <summary>
        /// ȫ��
        /// </summary>
        public double full_price
        {
            get { return _full_price; }

            set
            {
                _full_price = value;
                RaisePropertyChanged(() => full_price);
            }
        }

        private double _last_price;
        /// <summary>
        /// ���¼�
        /// </summary>
        public double last_price
        {
            get { return _last_price; }

            set
            {
                _last_price = value;
                RaisePropertyChanged(() => last_price);
            }
        }

        private double _pre_close_price;
        /// <summary>
        /// �����̼�
        /// </summary>
        public double pre_close_price
        {
            get { return _pre_close_price; }

            set
            {
                _pre_close_price = value;
                RaisePropertyChanged(() => pre_close_price);
            }
        }

        private double _cost_price;
        /// <summary>
        /// �ɱ���
        /// </summary>
        public double cost_price
        {
            get { return _cost_price; }

            set
            {
                _cost_price = value;
                RaisePropertyChanged(() => cost_price);
            }
        }

        private double _posi_nav_ratio;
        /// <summary>
        /// �ֲ־�ֵռ��
        /// </summary>
        public double posi_nav_ratio
        {
            get { return _posi_nav_ratio; }

            set
            {
                _posi_nav_ratio = value;
                RaisePropertyChanged(() => posi_nav_ratio);
            }
        }
    }

    public class rptL_4_112_Info : ObservableObject
    {

        private int _begin_date;
        /// <summary>
        /// ��ʼ����
        /// </summary>
        public int begin_date
        {
            get { return _begin_date; }

            set
            {
                _begin_date = value;
                RaisePropertyChanged(() => begin_date);
            }
        }

        private int _end_date;
        /// <summary>
        /// ��������
        /// </summary>
        public int end_date
        {
            get { return _end_date; }

            set
            {
                _end_date = value;
                RaisePropertyChanged(() => end_date);
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

        private double _stock_trade_amt;
        /// <summary>
        /// A�ɽ��׽��
        /// </summary>
        public double stock_trade_amt
        {
            get { return _stock_trade_amt; }

            set
            {
                _stock_trade_amt = value;
                RaisePropertyChanged(() => stock_trade_amt);
            }
        }

        private double _stock_strike_commis;
        /// <summary>
        /// A�ɳɽ�Ӷ��
        /// </summary>
        public double stock_strike_commis
        {
            get { return _stock_strike_commis; }

            set
            {
                _stock_strike_commis = value;
                RaisePropertyChanged(() => stock_strike_commis);
            }
        }
    }

    public class rptL_4_113_Info : ObservableObject
    {

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
    }

    public class rptL_4_114_Info : ObservableObject
    {

        private double _posi_market_value;
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value
        {
            get { return _posi_market_value; }

            set
            {
                _posi_market_value = value;
                RaisePropertyChanged(() => posi_market_value);
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

        private double _holder_profit;
        /// <summary>
        /// �ֲ�ӯ��
        /// </summary>
        public double holder_profit
        {
            get { return _holder_profit; }

            set
            {
                _holder_profit = value;
                RaisePropertyChanged(() => holder_profit);
            }
        }
    }

    public class rptL_4_115_Info : ObservableObject
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

        private String _stock_name;
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
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

        private double _posi_market_value;
        /// <summary>
        /// �ֲ���ֵ
        /// </summary>
        public double posi_market_value
        {
            get { return _posi_market_value; }

            set
            {
                _posi_market_value = value;
                RaisePropertyChanged(() => posi_market_value);
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

        private double _buy_pre_sett_qty;
        /// <summary>
        /// �������������
        /// </summary>
        public double buy_pre_sett_qty
        {
            get { return _buy_pre_sett_qty; }

            set
            {
                _buy_pre_sett_qty = value;
                RaisePropertyChanged(() => buy_pre_sett_qty);
            }
        }

        private double _sell_pre_sett_qty;
        /// <summary>
        /// ��������������
        /// </summary>
        public double sell_pre_sett_qty
        {
            get { return _sell_pre_sett_qty; }

            set
            {
                _sell_pre_sett_qty = value;
                RaisePropertyChanged(() => sell_pre_sett_qty);
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

        private double _full_holding_amt;
        /// <summary>
        /// ȫ�۳ֲ���ֵ
        /// </summary>
        public double full_holding_amt
        {
            get { return _full_holding_amt; }

            set
            {
                _full_holding_amt = value;
                RaisePropertyChanged(() => full_holding_amt);
            }
        }

        private double _impawn_qty;
        /// <summary>
        /// ��Ѻ����
        /// </summary>
        public double impawn_qty
        {
            get { return _impawn_qty; }

            set
            {
                _impawn_qty = value;
                RaisePropertyChanged(() => impawn_qty);
            }
        }

        private double _bond_receivable_amt;
        /// <summary>
        /// ծȯӦ����Ϣ
        /// </summary>
        public double bond_receivable_amt
        {
            get { return _bond_receivable_amt; }

            set
            {
                _bond_receivable_amt = value;
                RaisePropertyChanged(() => bond_receivable_amt);
            }
        }

        private double _net_price;
        /// <summary>
        /// ����
        /// </summary>
        public double net_price
        {
            get { return _net_price; }

            set
            {
                _net_price = value;
                RaisePropertyChanged(() => net_price);
            }
        }

        private double _full_price;
        /// <summary>
        /// ȫ��
        /// </summary>
        public double full_price
        {
            get { return _full_price; }

            set
            {
                _full_price = value;
                RaisePropertyChanged(() => full_price);
            }
        }

        private double _last_price;
        /// <summary>
        /// ���¼�
        /// </summary>
        public double last_price
        {
            get { return _last_price; }

            set
            {
                _last_price = value;
                RaisePropertyChanged(() => last_price);
            }
        }

        private double _pre_close_price;
        /// <summary>
        /// �����̼�
        /// </summary>
        public double pre_close_price
        {
            get { return _pre_close_price; }

            set
            {
                _pre_close_price = value;
                RaisePropertyChanged(() => pre_close_price);
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

        private double _block_trade_posi_market_value;
        /// <summary>
        /// ���ڽ��׳ֲ���ֵ
        /// </summary>
        public double block_trade_posi_market_value
        {
            get { return _block_trade_posi_market_value; }

            set
            {
                _block_trade_posi_market_value = value;
                RaisePropertyChanged(() => block_trade_posi_market_value);
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

        private double _fair_price;
        /// <summary>
        /// ���ʼ۸�
        /// </summary>
        public double fair_price
        {
            get { return _fair_price; }

            set
            {
                _fair_price = value;
                RaisePropertyChanged(() => fair_price);
            }
        }

        private double _bond_accr_intrst;
        /// <summary>
        /// ծȯ������Ϣ
        /// </summary>
        public double bond_accr_intrst
        {
            get { return _bond_accr_intrst; }

            set
            {
                _bond_accr_intrst = value;
                RaisePropertyChanged(() => bond_accr_intrst);
            }
        }

        private int _bond_rate_type;
        /// <summary>
        /// ծȯ��������
        /// </summary>
        public int bond_rate_type
        {
            get { return _bond_rate_type; }

            set
            {
                _bond_rate_type = value;
                RaisePropertyChanged(() => bond_rate_type);
            }
        }

        private int _net_price_flag;
        /// <summary>
        /// ���۱�־
        /// </summary>
        public int net_price_flag
        {
            get { return _net_price_flag; }

            set
            {
                _net_price_flag = value;
                RaisePropertyChanged(() => net_price_flag);
            }
        }

        private double _impawn_ratio;
        /// <summary>
        /// ��Ѻ����
        /// </summary>
        public double impawn_ratio
        {
            get { return _impawn_ratio; }

            set
            {
                _impawn_ratio = value;
                RaisePropertyChanged(() => impawn_ratio);
            }
        }
    }

    public class rptL_4_116_Info : ObservableObject
    {

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
    }

}

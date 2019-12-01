using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class evaL_2_1_Info : ObservableObject
    {
    }

    public class evaL_2_11_Info : ObservableObject
    {
    }

    public class evaL_2_12_Info : ObservableObject
    {
    }

    public class evaL_2_13_Info : ObservableObject
    {
    }

    public class evaL_2_14_Info : ObservableObject
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

        private double _curr_cost_amt;
        /// <summary>
        /// ��ǰ�ɱ����
        /// </summary>
        public double curr_cost_amt
        {
            get { return _curr_cost_amt; }

            set
            {
                _curr_cost_amt = value;
                RaisePropertyChanged(() => curr_cost_amt);
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

        private int _evalu_data_source;
        /// <summary>
        /// ��ֵ������Դ
        /// </summary>
        public int evalu_data_source
        {
            get { return _evalu_data_source; }

            set
            {
                _evalu_data_source = value;
                RaisePropertyChanged(() => evalu_data_source);
            }
        }
    }

    public class evaL_2_15_Info : ObservableObject
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

        private double _curr_cost_amt;
        /// <summary>
        /// ��ǰ�ɱ����
        /// </summary>
        public double curr_cost_amt
        {
            get { return _curr_cost_amt; }

            set
            {
                _curr_cost_amt = value;
                RaisePropertyChanged(() => curr_cost_amt);
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
    }

    public class evaL_2_16_Info : ObservableObject
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

        private int _today_posi_flag;
        /// <summary>
        /// ��ֱ�־
        /// </summary>
        public int today_posi_flag
        {
            get { return _today_posi_flag; }

            set
            {
                _today_posi_flag = value;
                RaisePropertyChanged(() => today_posi_flag);
            }
        }

        private int _evalu_data_source;
        /// <summary>
        /// ��ֵ������Դ
        /// </summary>
        public int evalu_data_source
        {
            get { return _evalu_data_source; }

            set
            {
                _evalu_data_source = value;
                RaisePropertyChanged(() => evalu_data_source);
            }
        }
    }

    public class evaL_2_21_Info : ObservableObject
    {
    }

    public class evaL_2_22_Info : ObservableObject
    {
    }

    public class evaL_2_23_Info : ObservableObject
    {
    }

    public class evaL_2_24_Info : ObservableObject
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

        private int _pd_acco_type;
        /// <summary>
        /// ��Ʒ�˻�����
        /// </summary>
        public int pd_acco_type
        {
            get { return _pd_acco_type; }

            set
            {
                _pd_acco_type = value;
                RaisePropertyChanged(() => pd_acco_type);
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

        private double _intrst_cacl_amt;
        /// <summary>
        /// Ԥ����Ϣ
        /// </summary>
        public double intrst_cacl_amt
        {
            get { return _intrst_cacl_amt; }

            set
            {
                _intrst_cacl_amt = value;
                RaisePropertyChanged(() => intrst_cacl_amt);
            }
        }

        private int _evalu_data_source;
        /// <summary>
        /// ��ֵ������Դ
        /// </summary>
        public int evalu_data_source
        {
            get { return _evalu_data_source; }

            set
            {
                _evalu_data_source = value;
                RaisePropertyChanged(() => evalu_data_source);
            }
        }
    }

    public class evaL_2_25_Info : ObservableObject
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

        private int _pd_acco_type;
        /// <summary>
        /// ��Ʒ�˻�����
        /// </summary>
        public int pd_acco_type
        {
            get { return _pd_acco_type; }

            set
            {
                _pd_acco_type = value;
                RaisePropertyChanged(() => pd_acco_type);
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

        private double _intrst_cacl_amt;
        /// <summary>
        /// Ԥ����Ϣ
        /// </summary>
        public double intrst_cacl_amt
        {
            get { return _intrst_cacl_amt; }

            set
            {
                _intrst_cacl_amt = value;
                RaisePropertyChanged(() => intrst_cacl_amt);
            }
        }
    }

    public class evaL_2_31_Info : ObservableObject
    {
    }

    public class evaL_2_41_Info : ObservableObject
    {
    }

    public class evaL_2_42_Info : ObservableObject
    {
    }

    public class evaL_2_43_Info : ObservableObject
    {
    }

    public class evaL_2_44_Info : ObservableObject
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

        private int _occur_dir;
        /// <summary>
        /// �䶯����
        /// </summary>
        public int occur_dir
        {
            get { return _occur_dir; }

            set
            {
                _occur_dir = value;
                RaisePropertyChanged(() => occur_dir);
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

    public class evaL_2_51_Info : ObservableObject
    {
    }

    public class evaL_2_52_Info : ObservableObject
    {
    }

    public class evaL_2_53_Info : ObservableObject
    {
    }

    public class evaL_2_54_Info : ObservableObject
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

}

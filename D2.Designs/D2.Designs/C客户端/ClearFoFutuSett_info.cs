using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class clfofuL_3_1_Info : ObservableObject
    {
    }

    public class clfofuL_3_2_Info : ObservableObject
    {
    }

    public class clfofuL_3_3_Info : ObservableObject
    {
    }

    public class clfofuL_3_4_Info : ObservableObject
    {

        private int _exch_no;
        /// <summary>
        /// 市场编号
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
        /// 合约代码编号
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

        private double _deli_price;
        /// <summary>
        /// 交割价
        /// </summary>
        public double deli_price
        {
            get { return _deli_price; }

            set
            {
                _deli_price = value;
                RaisePropertyChanged(() => deli_price);
            }
        }
    }

    public class clfofuL_3_9_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// 记录序号
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
        /// 初始化日期
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
        /// 机构编号
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
        /// 产品编号
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
        /// 交易组编号
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
        /// 资产账户编号
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
        /// 通道编号
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
        /// 外部账号
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

        private int _invest_type;
        /// <summary>
        /// 投资类型
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

        private String _crncy_type;
        /// <summary>
        /// 本币币种
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

        private int _exch_no;
        /// <summary>
        /// 市场编号
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
        /// 交易编码编号
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

        private String _comb_code;
        /// <summary>
        /// 组合编码
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

        private int _comb_type;
        /// <summary>
        /// 组合类型
        /// </summary>
        public int comb_type
        {
            get { return _comb_type; }

            set
            {
                _comb_type = value;
                RaisePropertyChanged(() => comb_type);
            }
        }

        private String _comb_name;
        /// <summary>
        /// 组合名称
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

        private double _long_hold_margin;
        /// <summary>
        /// 多头持仓保证金
        /// </summary>
        public double long_hold_margin
        {
            get { return _long_hold_margin; }

            set
            {
                _long_hold_margin = value;
                RaisePropertyChanged(() => long_hold_margin);
            }
        }

        private double _short_hold_margin;
        /// <summary>
        /// 空头持仓保证金
        /// </summary>
        public double short_hold_margin
        {
            get { return _short_hold_margin; }

            set
            {
                _short_hold_margin = value;
                RaisePropertyChanged(() => short_hold_margin);
            }
        }

        private double _sett_capt_margin;
        /// <summary>
        /// 清算占用保证金
        /// </summary>
        public double sett_capt_margin
        {
            get { return _sett_capt_margin; }

            set
            {
                _sett_capt_margin = value;
                RaisePropertyChanged(() => sett_capt_margin);
            }
        }

        private int _deal_flag;
        /// <summary>
        /// 处理标志
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
    }

    public class clfofuL_3_31_Info : ObservableObject
    {
    }

    public class clfofuL_3_35_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// 记录序号
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
        /// 初始化日期
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
        /// 机构编号
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
        /// 产品编号
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
        /// 交易组编号
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
        /// 资产账户编号
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
        /// 通道编号
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
        /// 外部账号
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

        private int _invest_type;
        /// <summary>
        /// 投资类型
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

        private String _crncy_type;
        /// <summary>
        /// 本币币种
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

        private int _exch_no;
        /// <summary>
        /// 市场编号
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
        /// 交易编码编号
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
        /// 合约代码编号
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
        /// 合约类型
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
        /// 合约乘数
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

        private int _strike_date;
        /// <summary>
        /// 成交日期
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
        /// 成交时间
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
        /// 成交编号
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
        /// 申报日期
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

        private int _report_time;
        /// <summary>
        /// 申报时间
        /// </summary>
        public int report_time
        {
            get { return _report_time; }

            set
            {
                _report_time = value;
                RaisePropertyChanged(() => report_time);
            }
        }

        private String _report_no;
        /// <summary>
        /// 申报编号
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
        /// 订单日期
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
        /// 订单时间
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

        private int _order_no;
        /// <summary>
        /// 订单编号
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

        private int _order_dir;
        /// <summary>
        /// 订单方向
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
        /// 订单价格
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
        /// 订单数量
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

        private double _pre_settle_price;
        /// <summary>
        /// 昨结算价
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
        /// 结算价
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

        private double _strike_price;
        /// <summary>
        /// 成交价格
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

        private double _strike_qty;
        /// <summary>
        /// 成交数量
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
        /// 成交金额
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

        private int _strike_num;
        /// <summary>
        /// 成交笔数
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

        private double _pre_entry_qty;
        /// <summary>
        /// 待入账数量
        /// </summary>
        public double pre_entry_qty
        {
            get { return _pre_entry_qty; }

            set
            {
                _pre_entry_qty = value;
                RaisePropertyChanged(() => pre_entry_qty);
            }
        }

        private double _pre_entry_amt;
        /// <summary>
        /// 待入账金额
        /// </summary>
        public double pre_entry_amt
        {
            get { return _pre_entry_amt; }

            set
            {
                _pre_entry_amt = value;
                RaisePropertyChanged(() => pre_entry_amt);
            }
        }

        private double _rece_margin;
        /// <summary>
        /// 应收保证金
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

        private String _comb_code;
        /// <summary>
        /// 组合编码
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

        private int _comb_type;
        /// <summary>
        /// 组合类型
        /// </summary>
        public int comb_type
        {
            get { return _comb_type; }

            set
            {
                _comb_type = value;
                RaisePropertyChanged(() => comb_type);
            }
        }

        private String _comb_name;
        /// <summary>
        /// 组合名称
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

        private double _long_hold_margin;
        /// <summary>
        /// 多头持仓保证金
        /// </summary>
        public double long_hold_margin
        {
            get { return _long_hold_margin; }

            set
            {
                _long_hold_margin = value;
                RaisePropertyChanged(() => long_hold_margin);
            }
        }

        private double _short_hold_margin;
        /// <summary>
        /// 空头持仓保证金
        /// </summary>
        public double short_hold_margin
        {
            get { return _short_hold_margin; }

            set
            {
                _short_hold_margin = value;
                RaisePropertyChanged(() => short_hold_margin);
            }
        }

        private double _sett_capt_margin;
        /// <summary>
        /// 清算占用保证金
        /// </summary>
        public double sett_capt_margin
        {
            get { return _sett_capt_margin; }

            set
            {
                _sett_capt_margin = value;
                RaisePropertyChanged(() => sett_capt_margin);
            }
        }

        private double _sett_close_pandl;
        /// <summary>
        /// 清算平仓盈亏
        /// </summary>
        public double sett_close_pandl
        {
            get { return _sett_close_pandl; }

            set
            {
                _sett_close_pandl = value;
                RaisePropertyChanged(() => sett_close_pandl);
            }
        }

        private double _sett_marked_pandl;
        /// <summary>
        /// 清算盯市盈亏
        /// </summary>
        public double sett_marked_pandl
        {
            get { return _sett_marked_pandl; }

            set
            {
                _sett_marked_pandl = value;
                RaisePropertyChanged(() => sett_marked_pandl);
            }
        }

        private double _all_fee;
        /// <summary>
        /// 全部费用
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

        private double _report_fee;
        /// <summary>
        /// 申报费用
        /// </summary>
        public double report_fee
        {
            get { return _report_fee; }

            set
            {
                _report_fee = value;
                RaisePropertyChanged(() => report_fee);
            }
        }

        private double _wtdraw_fee;
        /// <summary>
        /// 撤单费用
        /// </summary>
        public double wtdraw_fee
        {
            get { return _wtdraw_fee; }

            set
            {
                _wtdraw_fee = value;
                RaisePropertyChanged(() => wtdraw_fee);
            }
        }

        private double _deli_fee;
        /// <summary>
        /// 交割费用
        /// </summary>
        public double deli_fee
        {
            get { return _deli_fee; }

            set
            {
                _deli_fee = value;
                RaisePropertyChanged(() => deli_fee);
            }
        }

        private double _other_fee;
        /// <summary>
        /// 其他费用
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
        /// 交易佣金
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
        /// 其他佣金
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

        private double _out_all_fee;
        /// <summary>
        /// 外部全部费用
        /// </summary>
        public double out_all_fee
        {
            get { return _out_all_fee; }

            set
            {
                _out_all_fee = value;
                RaisePropertyChanged(() => out_all_fee);
            }
        }

        private double _out_report_fee;
        /// <summary>
        /// 外部申报费用
        /// </summary>
        public double out_report_fee
        {
            get { return _out_report_fee; }

            set
            {
                _out_report_fee = value;
                RaisePropertyChanged(() => out_report_fee);
            }
        }

        private double _out_cancel_fee;
        /// <summary>
        /// 外部撤单费用
        /// </summary>
        public double out_cancel_fee
        {
            get { return _out_cancel_fee; }

            set
            {
                _out_cancel_fee = value;
                RaisePropertyChanged(() => out_cancel_fee);
            }
        }

        private double _out_deli_fee;
        /// <summary>
        /// 外部交割费用
        /// </summary>
        public double out_deli_fee
        {
            get { return _out_deli_fee; }

            set
            {
                _out_deli_fee = value;
                RaisePropertyChanged(() => out_deli_fee);
            }
        }

        private double _out_other_fee;
        /// <summary>
        /// 外部其他费用
        /// </summary>
        public double out_other_fee
        {
            get { return _out_other_fee; }

            set
            {
                _out_other_fee = value;
                RaisePropertyChanged(() => out_other_fee);
            }
        }

        private double _out_brkage_commis;
        /// <summary>
        /// 外部交易佣金
        /// </summary>
        public double out_brkage_commis
        {
            get { return _out_brkage_commis; }

            set
            {
                _out_brkage_commis = value;
                RaisePropertyChanged(() => out_brkage_commis);
            }
        }

        private double _out_other_commis;
        /// <summary>
        /// 外部其他佣金
        /// </summary>
        public double out_other_commis
        {
            get { return _out_other_commis; }

            set
            {
                _out_other_commis = value;
                RaisePropertyChanged(() => out_other_commis);
            }
        }

        private int _busi_flag;
        /// <summary>
        /// 业务标志
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

        private String _entry_status;
        /// <summary>
        /// 入账状态
        /// </summary>
        public String entry_status
        {
            get { return _entry_status; }

            set
            {
                _entry_status = value;
                RaisePropertyChanged(() => entry_status);
            }
        }

        private String _undo_status;
        /// <summary>
        /// 回滚状态
        /// </summary>
        public String undo_status
        {
            get { return _undo_status; }

            set
            {
                _undo_status = value;
                RaisePropertyChanged(() => undo_status);
            }
        }

        private ulong _entry_money_jour_no;
        /// <summary>
        /// 入账资金流水号
        /// </summary>
        public ulong entry_money_jour_no
        {
            get { return _entry_money_jour_no; }

            set
            {
                _entry_money_jour_no = value;
                RaisePropertyChanged(() => entry_money_jour_no);
            }
        }

        private ulong _entry_posi_jour_no;
        /// <summary>
        /// 入账持仓流水号
        /// </summary>
        public ulong entry_posi_jour_no
        {
            get { return _entry_posi_jour_no; }

            set
            {
                _entry_posi_jour_no = value;
                RaisePropertyChanged(() => entry_posi_jour_no);
            }
        }

        private ulong _deli_jour_no;
        /// <summary>
        /// 对账流水号
        /// </summary>
        public ulong deli_jour_no
        {
            get { return _deli_jour_no; }

            set
            {
                _deli_jour_no = value;
                RaisePropertyChanged(() => deli_jour_no);
            }
        }
    }

    public class clfofuL_3_51_Info : ObservableObject
    {
    }

    public class clfofuL_3_52_Info : ObservableObject
    {
    }

    public class clfofuL_3_71_Info : ObservableObject
    {
    }

    public class clfofuL_3_102_Info : ObservableObject
    {

        private String _task_strike_status;
        /// <summary>
        /// 任务执行状态
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

    public class clfofuL_3_104_Info : ObservableObject
    {

        private String _task_strike_status;
        /// <summary>
        /// 任务执行状态
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

    public class clfofuL_3_106_Info : ObservableObject
    {

        private String _task_strike_status;
        /// <summary>
        /// 任务执行状态
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

}

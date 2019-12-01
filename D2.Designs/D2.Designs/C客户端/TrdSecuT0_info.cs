using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class tdsecuL_6_1_Info : ObservableObject
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

        private int _opor_no;
        /// <summary>
        /// 操作员编号
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

        private int _stock_acco_no;
        /// <summary>
        /// 股东代码编号
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
        /// 证券代码编号
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
        /// 证券代码
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

        private double _source_stock_qty;
        /// <summary>
        /// 券源数量
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

        private double _single_limit_qty;
        /// <summary>
        /// 单笔限额数量
        /// </summary>
        public double single_limit_qty
        {
            get { return _single_limit_qty; }

            set
            {
                _single_limit_qty = value;
                RaisePropertyChanged(() => single_limit_qty);
            }
        }

        private double _assigned_qty;
        /// <summary>
        /// 已分配数量
        /// </summary>
        public double assigned_qty
        {
            get { return _assigned_qty; }

            set
            {
                _assigned_qty = value;
                RaisePropertyChanged(() => assigned_qty);
            }
        }

        private double _trade_releas_qty;
        /// <summary>
        /// 交易释放数量
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

        private double _trade_capt_qty;
        /// <summary>
        /// 交易占用数量
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

        private double _strike_releas_qty;
        /// <summary>
        /// 成交释放数量
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

        private double _strike_capt_qty;
        /// <summary>
        /// 成交占用数量
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

        private double _over_night_pandl;
        /// <summary>
        /// 隔夜盈亏
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

        private double _sum_realize_pandl;
        /// <summary>
        /// 累计实现盈亏
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

        private double _total_open_posi_fee;
        /// <summary>
        /// 总开仓费用
        /// </summary>
        public double total_open_posi_fee
        {
            get { return _total_open_posi_fee; }

            set
            {
                _total_open_posi_fee = value;
                RaisePropertyChanged(() => total_open_posi_fee);
            }
        }

        private double _total_close_posi_fee;
        /// <summary>
        /// 总平仓费用
        /// </summary>
        public double total_close_posi_fee
        {
            get { return _total_close_posi_fee; }

            set
            {
                _total_close_posi_fee = value;
                RaisePropertyChanged(() => total_close_posi_fee);
            }
        }

        private double _out_order_releas_qty;
        /// <summary>
        /// 外部交易释放数量
        /// </summary>
        public double out_order_releas_qty
        {
            get { return _out_order_releas_qty; }

            set
            {
                _out_order_releas_qty = value;
                RaisePropertyChanged(() => out_order_releas_qty);
            }
        }

        private double _out_order_capt_qty;
        /// <summary>
        /// 外部交易占用数量
        /// </summary>
        public double out_order_capt_qty
        {
            get { return _out_order_capt_qty; }

            set
            {
                _out_order_capt_qty = value;
                RaisePropertyChanged(() => out_order_capt_qty);
            }
        }

        private double _out_strike_releas_qty;
        /// <summary>
        /// 外部成交释放数量
        /// </summary>
        public double out_strike_releas_qty
        {
            get { return _out_strike_releas_qty; }

            set
            {
                _out_strike_releas_qty = value;
                RaisePropertyChanged(() => out_strike_releas_qty);
            }
        }

        private double _out_strike_capt_qty;
        /// <summary>
        /// 外部成交占用数量
        /// </summary>
        public double out_strike_capt_qty
        {
            get { return _out_strike_capt_qty; }

            set
            {
                _out_strike_capt_qty = value;
                RaisePropertyChanged(() => out_strike_capt_qty);
            }
        }

        private String _remark_info;
        /// <summary>
        /// 备注信息
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

        private double _buy_avail_qty;
        /// <summary>
        /// 买入可用数量
        /// </summary>
        public double buy_avail_qty
        {
            get { return _buy_avail_qty; }

            set
            {
                _buy_avail_qty = value;
                RaisePropertyChanged(() => buy_avail_qty);
            }
        }

        private double _sell_avail_qty;
        /// <summary>
        /// 卖出可用数量
        /// </summary>
        public double sell_avail_qty
        {
            get { return _sell_avail_qty; }

            set
            {
                _sell_avail_qty = value;
                RaisePropertyChanged(() => sell_avail_qty);
            }
        }

        private double _posi_qty;
        /// <summary>
        /// 持仓数量
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

        private double _today_trade_fee;
        /// <summary>
        /// 当日交易费
        /// </summary>
        public double today_trade_fee
        {
            get { return _today_trade_fee; }

            set
            {
                _today_trade_fee = value;
                RaisePropertyChanged(() => today_trade_fee);
            }
        }

        private double _today_pandl;
        /// <summary>
        /// 当日盈亏
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

        private double _diff_qty;
        /// <summary>
        /// 数量差额
        /// </summary>
        public double diff_qty
        {
            get { return _diff_qty; }

            set
            {
                _diff_qty = value;
                RaisePropertyChanged(() => diff_qty);
            }
        }

        private double _over_night_trade_buy_qty;
        /// <summary>
        /// 隔夜仓强平交易买入数量
        /// </summary>
        public double over_night_trade_buy_qty
        {
            get { return _over_night_trade_buy_qty; }

            set
            {
                _over_night_trade_buy_qty = value;
                RaisePropertyChanged(() => over_night_trade_buy_qty);
            }
        }

        private double _over_night_trade_sell_qty;
        /// <summary>
        /// 隔夜仓强平交易卖出数量
        /// </summary>
        public double over_night_trade_sell_qty
        {
            get { return _over_night_trade_sell_qty; }

            set
            {
                _over_night_trade_sell_qty = value;
                RaisePropertyChanged(() => over_night_trade_sell_qty);
            }
        }

        private double _over_night_strike_sell_qty;
        /// <summary>
        /// 隔夜仓强平成交卖出数量
        /// </summary>
        public double over_night_strike_sell_qty
        {
            get { return _over_night_strike_sell_qty; }

            set
            {
                _over_night_strike_sell_qty = value;
                RaisePropertyChanged(() => over_night_strike_sell_qty);
            }
        }

        private double _over_night_sumtrd_sell_qty;
        /// <summary>
        /// 隔夜仓强平总交易卖出数量
        /// </summary>
        public double over_night_sumtrd_sell_qty
        {
            get { return _over_night_sumtrd_sell_qty; }

            set
            {
                _over_night_sumtrd_sell_qty = value;
                RaisePropertyChanged(() => over_night_sumtrd_sell_qty);
            }
        }

        private double _over_night_sumstk_sell_qty;
        /// <summary>
        /// 隔夜仓强平总成交卖出数量
        /// </summary>
        public double over_night_sumstk_sell_qty
        {
            get { return _over_night_sumstk_sell_qty; }

            set
            {
                _over_night_sumstk_sell_qty = value;
                RaisePropertyChanged(() => over_night_sumstk_sell_qty);
            }
        }

        private int _t0_buy_type;
        /// <summary>
        /// T0买入方式
        /// </summary>
        public int t0_buy_type
        {
            get { return _t0_buy_type; }

            set
            {
                _t0_buy_type = value;
                RaisePropertyChanged(() => t0_buy_type);
            }
        }

        private int _update_times;
        /// <summary>
        /// 更新次数
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

    public class tdsecuL_6_111_Info : ObservableObject
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

        private int _opor_no;
        /// <summary>
        /// 操作员编号
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

        private int _stock_acco_no;
        /// <summary>
        /// 股东代码编号
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
        /// 证券代码编号
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
        /// 证券代码
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

        private double _source_stock_qty;
        /// <summary>
        /// 券源数量
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

        private double _single_limit_qty;
        /// <summary>
        /// 单笔限额数量
        /// </summary>
        public double single_limit_qty
        {
            get { return _single_limit_qty; }

            set
            {
                _single_limit_qty = value;
                RaisePropertyChanged(() => single_limit_qty);
            }
        }

        private double _assigned_qty;
        /// <summary>
        /// 已分配数量
        /// </summary>
        public double assigned_qty
        {
            get { return _assigned_qty; }

            set
            {
                _assigned_qty = value;
                RaisePropertyChanged(() => assigned_qty);
            }
        }

        private double _trade_releas_qty;
        /// <summary>
        /// 交易释放数量
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

        private double _trade_capt_qty;
        /// <summary>
        /// 交易占用数量
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

        private double _strike_releas_qty;
        /// <summary>
        /// 成交释放数量
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

        private double _strike_capt_qty;
        /// <summary>
        /// 成交占用数量
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

        private double _over_night_pandl;
        /// <summary>
        /// 隔夜盈亏
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

        private double _sum_realize_pandl;
        /// <summary>
        /// 累计实现盈亏
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

        private double _total_open_posi_fee;
        /// <summary>
        /// 总开仓费用
        /// </summary>
        public double total_open_posi_fee
        {
            get { return _total_open_posi_fee; }

            set
            {
                _total_open_posi_fee = value;
                RaisePropertyChanged(() => total_open_posi_fee);
            }
        }

        private double _total_close_posi_fee;
        /// <summary>
        /// 总平仓费用
        /// </summary>
        public double total_close_posi_fee
        {
            get { return _total_close_posi_fee; }

            set
            {
                _total_close_posi_fee = value;
                RaisePropertyChanged(() => total_close_posi_fee);
            }
        }

        private double _out_order_releas_qty;
        /// <summary>
        /// 外部交易释放数量
        /// </summary>
        public double out_order_releas_qty
        {
            get { return _out_order_releas_qty; }

            set
            {
                _out_order_releas_qty = value;
                RaisePropertyChanged(() => out_order_releas_qty);
            }
        }

        private double _out_order_capt_qty;
        /// <summary>
        /// 外部交易占用数量
        /// </summary>
        public double out_order_capt_qty
        {
            get { return _out_order_capt_qty; }

            set
            {
                _out_order_capt_qty = value;
                RaisePropertyChanged(() => out_order_capt_qty);
            }
        }

        private double _out_strike_releas_qty;
        /// <summary>
        /// 外部成交释放数量
        /// </summary>
        public double out_strike_releas_qty
        {
            get { return _out_strike_releas_qty; }

            set
            {
                _out_strike_releas_qty = value;
                RaisePropertyChanged(() => out_strike_releas_qty);
            }
        }

        private double _out_strike_capt_qty;
        /// <summary>
        /// 外部成交占用数量
        /// </summary>
        public double out_strike_capt_qty
        {
            get { return _out_strike_capt_qty; }

            set
            {
                _out_strike_capt_qty = value;
                RaisePropertyChanged(() => out_strike_capt_qty);
            }
        }

        private String _remark_info;
        /// <summary>
        /// 备注信息
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

        private double _buy_avail_qty;
        /// <summary>
        /// 买入可用数量
        /// </summary>
        public double buy_avail_qty
        {
            get { return _buy_avail_qty; }

            set
            {
                _buy_avail_qty = value;
                RaisePropertyChanged(() => buy_avail_qty);
            }
        }

        private double _sell_avail_qty;
        /// <summary>
        /// 卖出可用数量
        /// </summary>
        public double sell_avail_qty
        {
            get { return _sell_avail_qty; }

            set
            {
                _sell_avail_qty = value;
                RaisePropertyChanged(() => sell_avail_qty);
            }
        }

        private double _posi_qty;
        /// <summary>
        /// 持仓数量
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

        private double _today_trade_fee;
        /// <summary>
        /// 当日交易费
        /// </summary>
        public double today_trade_fee
        {
            get { return _today_trade_fee; }

            set
            {
                _today_trade_fee = value;
                RaisePropertyChanged(() => today_trade_fee);
            }
        }

        private double _today_pandl;
        /// <summary>
        /// 当日盈亏
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

        private double _diff_qty;
        /// <summary>
        /// 数量差额
        /// </summary>
        public double diff_qty
        {
            get { return _diff_qty; }

            set
            {
                _diff_qty = value;
                RaisePropertyChanged(() => diff_qty);
            }
        }

        private int _t0_buy_type;
        /// <summary>
        /// T0买入方式
        /// </summary>
        public int t0_buy_type
        {
            get { return _t0_buy_type; }

            set
            {
                _t0_buy_type = value;
                RaisePropertyChanged(() => t0_buy_type);
            }
        }

        private int _update_times;
        /// <summary>
        /// 更新次数
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

    public class tdsecuL_6_2_Info : ObservableObject
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

        private int _opor_no;
        /// <summary>
        /// 操作员编号
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

        private String _stock_code;
        /// <summary>
        /// 证券代码
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

        private int _stock_acco_no;
        /// <summary>
        /// 股东代码编号
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
        /// 证券代码编号
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

        private int _lngsht_type;
        /// <summary>
        /// 多空类型
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
        /// 当前数量
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
        /// 开仓日期
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
        /// 开仓时间
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
        /// 开仓价格
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
        /// 开仓市值
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
        /// 开仓费用
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
        /// 平仓数量
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

        private int _close_posi_date;
        /// <summary>
        /// 平仓日期
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
        /// 平仓时间
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

        private double _close_posi_market_value;
        /// <summary>
        /// 平仓市值
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
        /// 平仓费用
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

        private double _realize_pandl;
        /// <summary>
        /// 实现盈亏
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
        /// 隔夜盈亏
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

        private String _posi_status;
        /// <summary>
        /// 持仓状态
        /// </summary>
        public String posi_status
        {
            get { return _posi_status; }

            set
            {
                _posi_status = value;
                RaisePropertyChanged(() => posi_status);
            }
        }

        private String _remark_info;
        /// <summary>
        /// 备注信息
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
        /// 更新次数
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

    public class tdsecuL_6_201_Info : ObservableObject
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

        private int _opor_no;
        /// <summary>
        /// 操作员编号
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

        private String _stock_code;
        /// <summary>
        /// 证券代码
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

        private int _stock_acco_no;
        /// <summary>
        /// 股东代码编号
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
        /// 证券代码编号
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

        private int _lngsht_type;
        /// <summary>
        /// 多空类型
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
        /// 当前数量
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
        /// 开仓日期
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
        /// 开仓时间
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
        /// 开仓价格
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
        /// 开仓市值
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
        /// 开仓费用
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
        /// 平仓数量
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

        private int _close_posi_date;
        /// <summary>
        /// 平仓日期
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
        /// 平仓时间
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

        private double _close_posi_market_value;
        /// <summary>
        /// 平仓市值
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
        /// 平仓费用
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

        private double _realize_pandl;
        /// <summary>
        /// 实现盈亏
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
        /// 隔夜盈亏
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

        private String _posi_status;
        /// <summary>
        /// 持仓状态
        /// </summary>
        public String posi_status
        {
            get { return _posi_status; }

            set
            {
                _posi_status = value;
                RaisePropertyChanged(() => posi_status);
            }
        }

        private String _remark_info;
        /// <summary>
        /// 备注信息
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
        /// 更新次数
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

    public class tdsecuL_6_3_Info : ObservableObject
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

        private int _stock_code_no;
        /// <summary>
        /// 证券代码编号
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

        private double _posi_qty;
        /// <summary>
        /// 持仓数量
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

        private double _curr_qty;
        /// <summary>
        /// 当前数量
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
        /// 开仓市值
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
        /// 开仓费用
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

        private int _open_posi_date;
        /// <summary>
        /// 开仓日期
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
        /// 开仓时间
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

        private double _cost_price;
        /// <summary>
        /// 成本价
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
    }

    public class tdsecuL_6_4_Info : ObservableObject
    {

        private double _trade_amt;
        /// <summary>
        /// 交易金额
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

        private double _trade_qty;
        /// <summary>
        /// 交易数量
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

        private double _realize_pandl;
        /// <summary>
        /// 实现盈亏
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

        private double _yield_rate;
        /// <summary>
        /// 收益率
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

        private double _avail_amt;
        /// <summary>
        /// 可用金额
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

        private double _over_night_pandl;
        /// <summary>
        /// 隔夜盈亏
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

        private double _sum_realize_pandl;
        /// <summary>
        /// 累计实现盈亏
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
        /// 更新次数
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

    public class tdsecuL_6_5_Info : ObservableObject
    {

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

        private int _stock_code_no;
        /// <summary>
        /// 证券代码编号
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
        /// 持仓数量
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
        /// 交易数量
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

        private double _realize_pandl;
        /// <summary>
        /// 实现盈亏
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
        /// 操作员编号
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
        /// 收益率
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

        private double _over_night_pandl;
        /// <summary>
        /// 隔夜盈亏
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

    public class tdsecuL_6_6_Info : ObservableObject
    {

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

        private int _stock_code_no;
        /// <summary>
        /// 证券代码编号
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
        /// 持仓数量
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
        /// 交易数量
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

        private double _realize_pandl;
        /// <summary>
        /// 实现盈亏
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
        /// 操作员编号
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
        /// 收益率
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

        private double _over_night_pandl;
        /// <summary>
        /// 隔夜盈亏
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

    public class tdsecuL_6_9_Info : ObservableObject
    {

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

        private int _opor_no;
        /// <summary>
        /// 操作员编号
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
        /// 期初金额
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
        /// 当前金额
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
        /// 冻结金额
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

        private double _opor_warn_tshold;
        /// <summary>
        /// 操作员预警阈值
        /// </summary>
        public double opor_warn_tshold
        {
            get { return _opor_warn_tshold; }

            set
            {
                _opor_warn_tshold = value;
                RaisePropertyChanged(() => opor_warn_tshold);
            }
        }

        private double _opor_stop_tshold;
        /// <summary>
        /// 操作员止损阈值
        /// </summary>
        public double opor_stop_tshold
        {
            get { return _opor_stop_tshold; }

            set
            {
                _opor_stop_tshold = value;
                RaisePropertyChanged(() => opor_stop_tshold);
            }
        }

        private int _order_limit_time;
        /// <summary>
        /// 下单限制时间
        /// </summary>
        public int order_limit_time
        {
            get { return _order_limit_time; }

            set
            {
                _order_limit_time = value;
                RaisePropertyChanged(() => order_limit_time);
            }
        }

        private double _per_secu_posi_ratio;
        /// <summary>
        /// 单券持仓比例
        /// </summary>
        public double per_secu_posi_ratio
        {
            get { return _per_secu_posi_ratio; }

            set
            {
                _per_secu_posi_ratio = value;
                RaisePropertyChanged(() => per_secu_posi_ratio);
            }
        }

        private int _posi_limit_time;
        /// <summary>
        /// 持仓时限
        /// </summary>
        public int posi_limit_time
        {
            get { return _posi_limit_time; }

            set
            {
                _posi_limit_time = value;
                RaisePropertyChanged(() => posi_limit_time);
            }
        }

        private double _order_ctrl_qty;
        /// <summary>
        /// 单笔数量控制
        /// </summary>
        public double order_ctrl_qty
        {
            get { return _order_ctrl_qty; }

            set
            {
                _order_ctrl_qty = value;
                RaisePropertyChanged(() => order_ctrl_qty);
            }
        }

        private double _order_ctrl_amt;
        /// <summary>
        /// 单笔金额控制
        /// </summary>
        public double order_ctrl_amt
        {
            get { return _order_ctrl_amt; }

            set
            {
                _order_ctrl_amt = value;
                RaisePropertyChanged(() => order_ctrl_amt);
            }
        }

        private double _stock_warn_ratio;
        /// <summary>
        /// 单券预警比例
        /// </summary>
        public double stock_warn_ratio
        {
            get { return _stock_warn_ratio; }

            set
            {
                _stock_warn_ratio = value;
                RaisePropertyChanged(() => stock_warn_ratio);
            }
        }

        private double _stock_stop_ratio;
        /// <summary>
        /// 单券止损比例
        /// </summary>
        public double stock_stop_ratio
        {
            get { return _stock_stop_ratio; }

            set
            {
                _stock_stop_ratio = value;
                RaisePropertyChanged(() => stock_stop_ratio);
            }
        }

        private double _stock_warn_amt;
        /// <summary>
        /// 单券预警金额
        /// </summary>
        public double stock_warn_amt
        {
            get { return _stock_warn_amt; }

            set
            {
                _stock_warn_amt = value;
                RaisePropertyChanged(() => stock_warn_amt);
            }
        }

        private double _stock_stop_amt;
        /// <summary>
        /// 单券止损金额
        /// </summary>
        public double stock_stop_amt
        {
            get { return _stock_stop_amt; }

            set
            {
                _stock_stop_amt = value;
                RaisePropertyChanged(() => stock_stop_amt);
            }
        }

        private int _trig_oper_type;
        /// <summary>
        /// 触警操作方式
        /// </summary>
        public int trig_oper_type
        {
            get { return _trig_oper_type; }

            set
            {
                _trig_oper_type = value;
                RaisePropertyChanged(() => trig_oper_type);
            }
        }

        private int _open_close_permission;
        /// <summary>
        /// 开平仓权限
        /// </summary>
        public int open_close_permission
        {
            get { return _open_close_permission; }

            set
            {
                _open_close_permission = value;
                RaisePropertyChanged(() => open_close_permission);
            }
        }

        private int _risk_oper;
        /// <summary>
        /// 风控监控员
        /// </summary>
        public int risk_oper
        {
            get { return _risk_oper; }

            set
            {
                _risk_oper = value;
                RaisePropertyChanged(() => risk_oper);
            }
        }

        private int _fee_calc_type;
        /// <summary>
        /// 费用计算方式
        /// </summary>
        public int fee_calc_type
        {
            get { return _fee_calc_type; }

            set
            {
                _fee_calc_type = value;
                RaisePropertyChanged(() => fee_calc_type);
            }
        }

        private int _permit_margin_trade;
        /// <summary>
        /// 允许信用交易
        /// </summary>
        public int permit_margin_trade
        {
            get { return _permit_margin_trade; }

            set
            {
                _permit_margin_trade = value;
                RaisePropertyChanged(() => permit_margin_trade);
            }
        }

        private double _buy_fee_ratio;
        /// <summary>
        /// 买费率
        /// </summary>
        public double buy_fee_ratio
        {
            get { return _buy_fee_ratio; }

            set
            {
                _buy_fee_ratio = value;
                RaisePropertyChanged(() => buy_fee_ratio);
            }
        }

        private double _sell_fee_ratio;
        /// <summary>
        /// 卖费率
        /// </summary>
        public double sell_fee_ratio
        {
            get { return _sell_fee_ratio; }

            set
            {
                _sell_fee_ratio = value;
                RaisePropertyChanged(() => sell_fee_ratio);
            }
        }

        private double _buy_min_fee;
        /// <summary>
        /// 买最低费用
        /// </summary>
        public double buy_min_fee
        {
            get { return _buy_min_fee; }

            set
            {
                _buy_min_fee = value;
                RaisePropertyChanged(() => buy_min_fee);
            }
        }

        private double _sell_min_fee;
        /// <summary>
        /// 卖最低费用
        /// </summary>
        public double sell_min_fee
        {
            get { return _sell_min_fee; }

            set
            {
                _sell_min_fee = value;
                RaisePropertyChanged(() => sell_min_fee);
            }
        }

        private double _trade_capt_amt;
        /// <summary>
        /// 交易占用金额
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
        /// 交易释放金额
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
        /// 成交占用金额
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
        /// 成交释放金额
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

        private double _sum_realize_pandl;
        /// <summary>
        /// 累计实现盈亏
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

        private double _amt_diff;
        /// <summary>
        /// 金额差额
        /// </summary>
        public double amt_diff
        {
            get { return _amt_diff; }

            set
            {
                _amt_diff = value;
                RaisePropertyChanged(() => amt_diff);
            }
        }

        private String _remark_info;
        /// <summary>
        /// 备注信息
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
        /// 更新次数
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

        private double _avail_amt;
        /// <summary>
        /// 可用金额
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
    }

    public class tdsecuL_6_10_Info : ObservableObject
    {
    }

    public class tdsecuL_6_101_Info : ObservableObject
    {
    }

    public class tdsecuL_6_11_Info : ObservableObject
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

        private int _lngsht_type;
        /// <summary>
        /// 多空类型
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

        private int _stock_code_no;
        /// <summary>
        /// 证券代码编号
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

        private double _open_posi_price;
        /// <summary>
        /// 开仓价格
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

        private double _curr_qty;
        /// <summary>
        /// 当前数量
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
        /// 开仓市值
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
        /// 开仓费用
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
        /// 平仓数量
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
        /// 平仓市值
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
        /// 平仓费用
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

        private double _realize_pandl;
        /// <summary>
        /// 实现盈亏
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

        private int _open_posi_time;
        /// <summary>
        /// 开仓时间
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

        private int _open_posi_date;
        /// <summary>
        /// 开仓日期
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

        private int _close_posi_time;
        /// <summary>
        /// 平仓时间
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

        private int _close_posi_date;
        /// <summary>
        /// 平仓日期
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

        private int _opor_no;
        /// <summary>
        /// 操作员编号
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
    }

    public class tdsecuL_6_12_Info : ObservableObject
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

    public class tdsecuL_6_13_Info : ObservableObject
    {

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

        private int _lngsht_type;
        /// <summary>
        /// 多空类型
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

        private int _stock_code_no;
        /// <summary>
        /// 证券代码编号
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

        private double _open_posi_price;
        /// <summary>
        /// 开仓价格
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

        private double _curr_qty;
        /// <summary>
        /// 当前数量
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
        /// 开仓市值
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
        /// 开仓费用
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
        /// 平仓数量
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
        /// 平仓市值
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
        /// 平仓费用
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

        private double _realize_pandl;
        /// <summary>
        /// 实现盈亏
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

        private int _open_posi_time;
        /// <summary>
        /// 开仓时间
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

        private int _open_posi_date;
        /// <summary>
        /// 开仓日期
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

        private int _close_posi_time;
        /// <summary>
        /// 平仓时间
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

        private int _close_posi_date;
        /// <summary>
        /// 平仓日期
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

        private int _opor_no;
        /// <summary>
        /// 操作员编号
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
    }

    public class tdsecuL_6_14_Info : ObservableObject
    {
    }

    public class tdsecuL_6_15_Info : ObservableObject
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

        private int _opor_no;
        /// <summary>
        /// 操作员编号
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

        private int _stock_acco_no;
        /// <summary>
        /// 股东代码编号
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
        /// 证券代码编号
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

        private double _begin_qty;
        /// <summary>
        /// 期初数量
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

        private double _source_stock_qty;
        /// <summary>
        /// 券源数量
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

        private double _single_limit_qty;
        /// <summary>
        /// 单笔限额数量
        /// </summary>
        public double single_limit_qty
        {
            get { return _single_limit_qty; }

            set
            {
                _single_limit_qty = value;
                RaisePropertyChanged(() => single_limit_qty);
            }
        }

        private double _assigned_qty;
        /// <summary>
        /// 已分配数量
        /// </summary>
        public double assigned_qty
        {
            get { return _assigned_qty; }

            set
            {
                _assigned_qty = value;
                RaisePropertyChanged(() => assigned_qty);
            }
        }

        private double _trade_releas_qty;
        /// <summary>
        /// 交易释放数量
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

        private double _trade_capt_qty;
        /// <summary>
        /// 交易占用数量
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

        private double _strike_releas_qty;
        /// <summary>
        /// 成交释放数量
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

        private double _strike_capt_qty;
        /// <summary>
        /// 成交占用数量
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

        private double _total_realize_pandl;
        /// <summary>
        /// 总实现盈亏
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

        private double _over_night_pandl;
        /// <summary>
        /// 隔夜盈亏
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

        private double _sum_realize_pandl;
        /// <summary>
        /// 累计实现盈亏
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

        private double _total_open_posi_fee;
        /// <summary>
        /// 总开仓费用
        /// </summary>
        public double total_open_posi_fee
        {
            get { return _total_open_posi_fee; }

            set
            {
                _total_open_posi_fee = value;
                RaisePropertyChanged(() => total_open_posi_fee);
            }
        }

        private double _total_close_posi_fee;
        /// <summary>
        /// 总平仓费用
        /// </summary>
        public double total_close_posi_fee
        {
            get { return _total_close_posi_fee; }

            set
            {
                _total_close_posi_fee = value;
                RaisePropertyChanged(() => total_close_posi_fee);
            }
        }

        private double _out_order_releas_qty;
        /// <summary>
        /// 外部交易释放数量
        /// </summary>
        public double out_order_releas_qty
        {
            get { return _out_order_releas_qty; }

            set
            {
                _out_order_releas_qty = value;
                RaisePropertyChanged(() => out_order_releas_qty);
            }
        }

        private double _out_order_capt_qty;
        /// <summary>
        /// 外部交易占用数量
        /// </summary>
        public double out_order_capt_qty
        {
            get { return _out_order_capt_qty; }

            set
            {
                _out_order_capt_qty = value;
                RaisePropertyChanged(() => out_order_capt_qty);
            }
        }

        private double _out_strike_releas_qty;
        /// <summary>
        /// 外部成交释放数量
        /// </summary>
        public double out_strike_releas_qty
        {
            get { return _out_strike_releas_qty; }

            set
            {
                _out_strike_releas_qty = value;
                RaisePropertyChanged(() => out_strike_releas_qty);
            }
        }

        private double _out_strike_capt_qty;
        /// <summary>
        /// 外部成交占用数量
        /// </summary>
        public double out_strike_capt_qty
        {
            get { return _out_strike_capt_qty; }

            set
            {
                _out_strike_capt_qty = value;
                RaisePropertyChanged(() => out_strike_capt_qty);
            }
        }

        private String _remark_info;
        /// <summary>
        /// 备注信息
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
        /// 更新次数
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

        private double _buy_avail_qty;
        /// <summary>
        /// 买入可用数量
        /// </summary>
        public double buy_avail_qty
        {
            get { return _buy_avail_qty; }

            set
            {
                _buy_avail_qty = value;
                RaisePropertyChanged(() => buy_avail_qty);
            }
        }

        private double _sell_avail_qty;
        /// <summary>
        /// 卖出可用数量
        /// </summary>
        public double sell_avail_qty
        {
            get { return _sell_avail_qty; }

            set
            {
                _sell_avail_qty = value;
                RaisePropertyChanged(() => sell_avail_qty);
            }
        }

        private double _posi_qty;
        /// <summary>
        /// 持仓数量
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

        private double _today_trade_fee;
        /// <summary>
        /// 当日交易费
        /// </summary>
        public double today_trade_fee
        {
            get { return _today_trade_fee; }

            set
            {
                _today_trade_fee = value;
                RaisePropertyChanged(() => today_trade_fee);
            }
        }

        private double _today_pandl;
        /// <summary>
        /// 当日盈亏
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

        private double _diff_qty;
        /// <summary>
        /// 数量差额
        /// </summary>
        public double diff_qty
        {
            get { return _diff_qty; }

            set
            {
                _diff_qty = value;
                RaisePropertyChanged(() => diff_qty);
            }
        }

        private int _t0_buy_type;
        /// <summary>
        /// T0买入方式
        /// </summary>
        public int t0_buy_type
        {
            get { return _t0_buy_type; }

            set
            {
                _t0_buy_type = value;
                RaisePropertyChanged(() => t0_buy_type);
            }
        }
    }

    public class tdsecuL_6_16_Info : ObservableObject
    {
    }

    public class tdsecuL_6_17_Info : ObservableObject
    {
    }

    public class tdsecuL_6_18_Info : ObservableObject
    {
    }

    public class tdsecuL_6_19_Info : ObservableObject
    {
    }

    public class tdsecuL_6_20_Info : ObservableObject
    {

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

        private int _opor_no;
        /// <summary>
        /// 操作员编号
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

        private ulong _config_no;
        /// <summary>
        /// 配置编号
        /// </summary>
        public ulong config_no
        {
            get { return _config_no; }

            set
            {
                _config_no = value;
                RaisePropertyChanged(() => config_no);
            }
        }

        private String _config_value;
        /// <summary>
        /// 配置值
        /// </summary>
        public String config_value
        {
            get { return _config_value; }

            set
            {
                _config_value = value;
                RaisePropertyChanged(() => config_value);
            }
        }

        private String _config_name;
        /// <summary>
        /// 配置名称
        /// </summary>
        public String config_name
        {
            get { return _config_name; }

            set
            {
                _config_name = value;
                RaisePropertyChanged(() => config_name);
            }
        }

        private String _config_memo;
        /// <summary>
        /// 配置说明
        /// </summary>
        public String config_memo
        {
            get { return _config_memo; }

            set
            {
                _config_memo = value;
                RaisePropertyChanged(() => config_memo);
            }
        }
    }

    public class tdsecuL_6_21_Info : ObservableObject
    {
    }

    public class tdsecuL_6_22_Info : ObservableObject
    {
    }

    public class tdsecuL_6_23_Info : ObservableObject
    {
    }

    public class tdsecuL_6_90_Info : ObservableObject
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

    public class tdsecuL_6_92_Info : ObservableObject
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

    public class tdsecuL_6_93_Info : ObservableObject
    {
    }

    public class tdsecuL_6_94_Info : ObservableObject
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

        private int _opor_no;
        /// <summary>
        /// 操作员编号
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

        private int _stock_code_no;
        /// <summary>
        /// 证券代码编号
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
        /// 证券代码
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

        private double _posi_qty;
        /// <summary>
        /// 持仓数量
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
        /// 成本价
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

        private double _curr_qty;
        /// <summary>
        /// 当前数量
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
        /// 开仓市值
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
        /// 开仓费用
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

        private int _open_posi_date;
        /// <summary>
        /// 开仓日期
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
        /// 开仓时间
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

        private int _lngsht_type;
        /// <summary>
        /// 多空类型
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
    }

    public class tdsecuL_6_95_Info : ObservableObject
    {
    }

    public class tdsecuL_6_96_Info : ObservableObject
    {
    }

    public class tdsecuL_6_97_Info : ObservableObject
    {
    }

    public class tdsecuL_6_98_Info : ObservableObject
    {
    }

    public class tdsecuL_6_99_Info : ObservableObject
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

        private int _create_date;
        /// <summary>
        /// 创建日期
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
        /// 创建时间
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
        /// 更新日期
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
        /// 更新时间
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

        private int _opor_no;
        /// <summary>
        /// 操作员编号
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
        /// 操作MAC
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
        /// 操作IP
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
        /// 操作信息
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
        /// 操作方式
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
        /// 操作菜单
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
        /// 操作功能
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

        private int _busi_opor_no;
        /// <summary>
        /// 业务操作员编号
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

        private int _stock_acco_no;
        /// <summary>
        /// 股东代码编号
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
        /// 证券代码编号
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
        /// 证券代码
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

        private double _source_stock_occur_qty;
        /// <summary>
        /// 券源变动数量
        /// </summary>
        public double source_stock_occur_qty
        {
            get { return _source_stock_occur_qty; }

            set
            {
                _source_stock_occur_qty = value;
                RaisePropertyChanged(() => source_stock_occur_qty);
            }
        }

        private double _source_stock_occur_end_qty;
        /// <summary>
        /// 变动后券源数量
        /// </summary>
        public double source_stock_occur_end_qty
        {
            get { return _source_stock_occur_end_qty; }

            set
            {
                _source_stock_occur_end_qty = value;
                RaisePropertyChanged(() => source_stock_occur_end_qty);
            }
        }

        private double _single_limit_occur_qty;
        /// <summary>
        /// 单笔限额变动数量
        /// </summary>
        public double single_limit_occur_qty
        {
            get { return _single_limit_occur_qty; }

            set
            {
                _single_limit_occur_qty = value;
                RaisePropertyChanged(() => single_limit_occur_qty);
            }
        }

        private double _single_limit_occur_end_qty;
        /// <summary>
        /// 变动后单笔限额数量
        /// </summary>
        public double single_limit_occur_end_qty
        {
            get { return _single_limit_occur_end_qty; }

            set
            {
                _single_limit_occur_end_qty = value;
                RaisePropertyChanged(() => single_limit_occur_end_qty);
            }
        }

        private double _assigned_occur_qty;
        /// <summary>
        /// 已分配变动数量
        /// </summary>
        public double assigned_occur_qty
        {
            get { return _assigned_occur_qty; }

            set
            {
                _assigned_occur_qty = value;
                RaisePropertyChanged(() => assigned_occur_qty);
            }
        }

        private double _assigned_occur_end_qty;
        /// <summary>
        /// 变动后已分配数量
        /// </summary>
        public double assigned_occur_end_qty
        {
            get { return _assigned_occur_end_qty; }

            set
            {
                _assigned_occur_end_qty = value;
                RaisePropertyChanged(() => assigned_occur_end_qty);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
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

    public class tdsecuL_6_102_Info : ObservableObject
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

        private int _create_date;
        /// <summary>
        /// 创建日期
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
        /// 创建时间
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
        /// 更新日期
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
        /// 更新时间
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

        private int _opor_no;
        /// <summary>
        /// 操作员编号
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
        /// 操作MAC
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
        /// 操作IP
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
        /// 操作信息
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
        /// 操作方式
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
        /// 操作菜单
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
        /// 操作功能
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

        private int _busi_opor_no;
        /// <summary>
        /// 业务操作员编号
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

        private int _stock_acco_no;
        /// <summary>
        /// 股东代码编号
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
        /// 证券代码编号
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
        /// 证券代码
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

        private double _source_stock_occur_qty;
        /// <summary>
        /// 券源变动数量
        /// </summary>
        public double source_stock_occur_qty
        {
            get { return _source_stock_occur_qty; }

            set
            {
                _source_stock_occur_qty = value;
                RaisePropertyChanged(() => source_stock_occur_qty);
            }
        }

        private double _source_stock_occur_end_qty;
        /// <summary>
        /// 变动后券源数量
        /// </summary>
        public double source_stock_occur_end_qty
        {
            get { return _source_stock_occur_end_qty; }

            set
            {
                _source_stock_occur_end_qty = value;
                RaisePropertyChanged(() => source_stock_occur_end_qty);
            }
        }

        private double _single_limit_occur_qty;
        /// <summary>
        /// 单笔限额变动数量
        /// </summary>
        public double single_limit_occur_qty
        {
            get { return _single_limit_occur_qty; }

            set
            {
                _single_limit_occur_qty = value;
                RaisePropertyChanged(() => single_limit_occur_qty);
            }
        }

        private double _single_limit_occur_end_qty;
        /// <summary>
        /// 变动后单笔限额数量
        /// </summary>
        public double single_limit_occur_end_qty
        {
            get { return _single_limit_occur_end_qty; }

            set
            {
                _single_limit_occur_end_qty = value;
                RaisePropertyChanged(() => single_limit_occur_end_qty);
            }
        }

        private double _assigned_occur_qty;
        /// <summary>
        /// 已分配变动数量
        /// </summary>
        public double assigned_occur_qty
        {
            get { return _assigned_occur_qty; }

            set
            {
                _assigned_occur_qty = value;
                RaisePropertyChanged(() => assigned_occur_qty);
            }
        }

        private double _assigned_occur_end_qty;
        /// <summary>
        /// 变动后已分配数量
        /// </summary>
        public double assigned_occur_end_qty
        {
            get { return _assigned_occur_end_qty; }

            set
            {
                _assigned_occur_end_qty = value;
                RaisePropertyChanged(() => assigned_occur_end_qty);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
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

    public class tdsecuL_6_30_Info : ObservableObject
    {
    }

    public class tdsecuL_6_31_Info : ObservableObject
    {
    }

    public class tdsecuL_6_32_Info : ObservableObject
    {
    }

    public class tdsecuL_6_33_Info : ObservableObject
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

        private int _opor_no;
        /// <summary>
        /// 操作员编号
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

        private String _exch_crncy_type;
        /// <summary>
        /// 交易币种
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
        /// 期初金额
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
        /// 当前金额
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
        /// 冻结金额
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
        /// 解冻金额
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
        /// 指令冻结金额
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
        /// 指令解冻金额
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
        /// 指令占用金额
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
        /// 指令释放金额
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
        /// 交易冻结金额
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
        /// 交易解冻金额
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
        /// 交易占用金额
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
        /// 交易释放金额
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
        /// 成交占用金额
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
        /// 成交释放金额
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

        private double _avail_amt;
        /// <summary>
        /// 可用金额
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
    }

    public class tdsecuL_6_34_Info : ObservableObject
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

        private int _opor_no;
        /// <summary>
        /// 操作员编号
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

        private int _busi_opor_no;
        /// <summary>
        /// 业务操作员编号
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

        private int _stock_acco_no;
        /// <summary>
        /// 股东代码编号
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

        private String _stock_code;
        /// <summary>
        /// 证券代码
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
        /// 证券代码编号
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

        private int _lngsht_type;
        /// <summary>
        /// 多空类型
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
        /// 当前数量
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
        /// 开仓日期
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
        /// 开仓时间
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
        /// 开仓价格
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
        /// 开仓市值
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
        /// 开仓费用
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

        private double _waste_qty;
        /// <summary>
        /// 废单数量
        /// </summary>
        public double waste_qty
        {
            get { return _waste_qty; }

            set
            {
                _waste_qty = value;
                RaisePropertyChanged(() => waste_qty);
            }
        }

        private int _waste_date;
        /// <summary>
        /// 作废日期
        /// </summary>
        public int waste_date
        {
            get { return _waste_date; }

            set
            {
                _waste_date = value;
                RaisePropertyChanged(() => waste_date);
            }
        }

        private int _waste_time;
        /// <summary>
        /// 作废时间
        /// </summary>
        public int waste_time
        {
            get { return _waste_time; }

            set
            {
                _waste_time = value;
                RaisePropertyChanged(() => waste_time);
            }
        }

        private ulong _detail_posi_id;
        /// <summary>
        /// 明细持仓序号
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
    }

    public class tdsecuL_6_35_Info : ObservableObject
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

        private int _opor_no;
        /// <summary>
        /// 操作员编号
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

        private int _busi_opor_no;
        /// <summary>
        /// 业务操作员编号
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

        private int _stock_acco_no;
        /// <summary>
        /// 股东代码编号
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

        private String _stock_code;
        /// <summary>
        /// 证券代码
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
        /// 证券代码编号
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

        private int _lngsht_type;
        /// <summary>
        /// 多空类型
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
        /// 当前数量
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
        /// 开仓日期
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
        /// 开仓时间
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
        /// 开仓价格
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
        /// 开仓市值
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
        /// 开仓费用
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

        private double _waste_qty;
        /// <summary>
        /// 废单数量
        /// </summary>
        public double waste_qty
        {
            get { return _waste_qty; }

            set
            {
                _waste_qty = value;
                RaisePropertyChanged(() => waste_qty);
            }
        }

        private int _waste_date;
        /// <summary>
        /// 作废日期
        /// </summary>
        public int waste_date
        {
            get { return _waste_date; }

            set
            {
                _waste_date = value;
                RaisePropertyChanged(() => waste_date);
            }
        }

        private int _waste_time;
        /// <summary>
        /// 作废时间
        /// </summary>
        public int waste_time
        {
            get { return _waste_time; }

            set
            {
                _waste_time = value;
                RaisePropertyChanged(() => waste_time);
            }
        }

        private ulong _detail_posi_id;
        /// <summary>
        /// 明细持仓序号
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
    }

    public class tdsecuL_6_36_Info : ObservableObject
    {
    }

    public class tdsecuL_6_37_Info : ObservableObject
    {
    }

    public class tdsecuL_6_38_Info : ObservableObject
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

        private int _opor_no;
        /// <summary>
        /// 操作员编号
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

        private double _max_posi_market_value;
        /// <summary>
        /// 最大持仓市值
        /// </summary>
        public double max_posi_market_value
        {
            get { return _max_posi_market_value; }

            set
            {
                _max_posi_market_value = value;
                RaisePropertyChanged(() => max_posi_market_value);
            }
        }

        private String _remark_info;
        /// <summary>
        /// 备注信息
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
        /// 更新次数
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

    public class tdsecuL_6_110_Info : ObservableObject
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

        private int _opor_no;
        /// <summary>
        /// 操作员编号
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

        private int _stock_acco_no;
        /// <summary>
        /// 股东代码编号
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
        /// 证券代码编号
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
        /// 证券代码
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

        private double _source_stock_qty;
        /// <summary>
        /// 券源数量
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

        private double _single_limit_qty;
        /// <summary>
        /// 单笔限额数量
        /// </summary>
        public double single_limit_qty
        {
            get { return _single_limit_qty; }

            set
            {
                _single_limit_qty = value;
                RaisePropertyChanged(() => single_limit_qty);
            }
        }

        private double _assigned_qty;
        /// <summary>
        /// 已分配数量
        /// </summary>
        public double assigned_qty
        {
            get { return _assigned_qty; }

            set
            {
                _assigned_qty = value;
                RaisePropertyChanged(() => assigned_qty);
            }
        }

        private double _trade_releas_qty;
        /// <summary>
        /// 交易释放数量
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

        private double _trade_capt_qty;
        /// <summary>
        /// 交易占用数量
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

        private double _strike_releas_qty;
        /// <summary>
        /// 成交释放数量
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

        private double _strike_capt_qty;
        /// <summary>
        /// 成交占用数量
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

        private double _over_night_pandl;
        /// <summary>
        /// 隔夜盈亏
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

        private double _sum_realize_pandl;
        /// <summary>
        /// 累计实现盈亏
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

        private double _total_open_posi_fee;
        /// <summary>
        /// 总开仓费用
        /// </summary>
        public double total_open_posi_fee
        {
            get { return _total_open_posi_fee; }

            set
            {
                _total_open_posi_fee = value;
                RaisePropertyChanged(() => total_open_posi_fee);
            }
        }

        private double _total_close_posi_fee;
        /// <summary>
        /// 总平仓费用
        /// </summary>
        public double total_close_posi_fee
        {
            get { return _total_close_posi_fee; }

            set
            {
                _total_close_posi_fee = value;
                RaisePropertyChanged(() => total_close_posi_fee);
            }
        }

        private double _out_order_releas_qty;
        /// <summary>
        /// 外部交易释放数量
        /// </summary>
        public double out_order_releas_qty
        {
            get { return _out_order_releas_qty; }

            set
            {
                _out_order_releas_qty = value;
                RaisePropertyChanged(() => out_order_releas_qty);
            }
        }

        private double _out_order_capt_qty;
        /// <summary>
        /// 外部交易占用数量
        /// </summary>
        public double out_order_capt_qty
        {
            get { return _out_order_capt_qty; }

            set
            {
                _out_order_capt_qty = value;
                RaisePropertyChanged(() => out_order_capt_qty);
            }
        }

        private double _out_strike_releas_qty;
        /// <summary>
        /// 外部成交释放数量
        /// </summary>
        public double out_strike_releas_qty
        {
            get { return _out_strike_releas_qty; }

            set
            {
                _out_strike_releas_qty = value;
                RaisePropertyChanged(() => out_strike_releas_qty);
            }
        }

        private double _out_strike_capt_qty;
        /// <summary>
        /// 外部成交占用数量
        /// </summary>
        public double out_strike_capt_qty
        {
            get { return _out_strike_capt_qty; }

            set
            {
                _out_strike_capt_qty = value;
                RaisePropertyChanged(() => out_strike_capt_qty);
            }
        }

        private String _remark_info;
        /// <summary>
        /// 备注信息
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

        private double _buy_avail_qty;
        /// <summary>
        /// 买入可用数量
        /// </summary>
        public double buy_avail_qty
        {
            get { return _buy_avail_qty; }

            set
            {
                _buy_avail_qty = value;
                RaisePropertyChanged(() => buy_avail_qty);
            }
        }

        private double _sell_avail_qty;
        /// <summary>
        /// 卖出可用数量
        /// </summary>
        public double sell_avail_qty
        {
            get { return _sell_avail_qty; }

            set
            {
                _sell_avail_qty = value;
                RaisePropertyChanged(() => sell_avail_qty);
            }
        }

        private double _posi_qty;
        /// <summary>
        /// 持仓数量
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

        private double _today_trade_fee;
        /// <summary>
        /// 当日交易费
        /// </summary>
        public double today_trade_fee
        {
            get { return _today_trade_fee; }

            set
            {
                _today_trade_fee = value;
                RaisePropertyChanged(() => today_trade_fee);
            }
        }

        private double _today_pandl;
        /// <summary>
        /// 当日盈亏
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

        private double _diff_qty;
        /// <summary>
        /// 数量差额
        /// </summary>
        public double diff_qty
        {
            get { return _diff_qty; }

            set
            {
                _diff_qty = value;
                RaisePropertyChanged(() => diff_qty);
            }
        }

        private double _over_night_trade_buy_qty;
        /// <summary>
        /// 隔夜仓强平交易买入数量
        /// </summary>
        public double over_night_trade_buy_qty
        {
            get { return _over_night_trade_buy_qty; }

            set
            {
                _over_night_trade_buy_qty = value;
                RaisePropertyChanged(() => over_night_trade_buy_qty);
            }
        }

        private double _over_night_trade_sell_qty;
        /// <summary>
        /// 隔夜仓强平交易卖出数量
        /// </summary>
        public double over_night_trade_sell_qty
        {
            get { return _over_night_trade_sell_qty; }

            set
            {
                _over_night_trade_sell_qty = value;
                RaisePropertyChanged(() => over_night_trade_sell_qty);
            }
        }

        private double _over_night_strike_sell_qty;
        /// <summary>
        /// 隔夜仓强平成交卖出数量
        /// </summary>
        public double over_night_strike_sell_qty
        {
            get { return _over_night_strike_sell_qty; }

            set
            {
                _over_night_strike_sell_qty = value;
                RaisePropertyChanged(() => over_night_strike_sell_qty);
            }
        }

        private double _over_night_sumtrd_sell_qty;
        /// <summary>
        /// 隔夜仓强平总交易卖出数量
        /// </summary>
        public double over_night_sumtrd_sell_qty
        {
            get { return _over_night_sumtrd_sell_qty; }

            set
            {
                _over_night_sumtrd_sell_qty = value;
                RaisePropertyChanged(() => over_night_sumtrd_sell_qty);
            }
        }

        private double _over_night_sumstk_sell_qty;
        /// <summary>
        /// 隔夜仓强平总成交卖出数量
        /// </summary>
        public double over_night_sumstk_sell_qty
        {
            get { return _over_night_sumstk_sell_qty; }

            set
            {
                _over_night_sumstk_sell_qty = value;
                RaisePropertyChanged(() => over_night_sumstk_sell_qty);
            }
        }

        private int _update_times;
        /// <summary>
        /// 更新次数
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

    public class tdsecuL_6_113_Info : ObservableObject
    {

        private double _trade_amt;
        /// <summary>
        /// 交易金额
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

        private double _trade_qty;
        /// <summary>
        /// 交易数量
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

        private double _realize_pandl;
        /// <summary>
        /// 实现盈亏
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

        private double _yield_rate;
        /// <summary>
        /// 收益率
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

        private double _avail_amt;
        /// <summary>
        /// 可用金额
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

        private double _over_night_pandl;
        /// <summary>
        /// 隔夜盈亏
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

        private double _sum_realize_pandl;
        /// <summary>
        /// 累计实现盈亏
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
        /// 更新次数
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

    public class tdsecuL_6_112_Info : ObservableObject
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

        private int _opor_no;
        /// <summary>
        /// 操作员编号
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

        private String _exch_crncy_type;
        /// <summary>
        /// 交易币种
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
        /// 期初金额
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
        /// 当前金额
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
        /// 冻结金额
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
        /// 解冻金额
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
        /// 指令冻结金额
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
        /// 指令解冻金额
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
        /// 指令占用金额
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
        /// 指令释放金额
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
        /// 交易冻结金额
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
        /// 交易解冻金额
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
        /// 交易占用金额
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
        /// 交易释放金额
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
        /// 成交占用金额
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
        /// 成交释放金额
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

        private double _avail_amt;
        /// <summary>
        /// 可用金额
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
    }

    public class tdsecuL_6_114_Info : ObservableObject
    {

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

        private int _opor_no;
        /// <summary>
        /// 操作员编号
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
        /// 期初金额
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
        /// 当前金额
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
        /// 冻结金额
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

        private double _opor_warn_tshold;
        /// <summary>
        /// 操作员预警阈值
        /// </summary>
        public double opor_warn_tshold
        {
            get { return _opor_warn_tshold; }

            set
            {
                _opor_warn_tshold = value;
                RaisePropertyChanged(() => opor_warn_tshold);
            }
        }

        private double _opor_stop_tshold;
        /// <summary>
        /// 操作员止损阈值
        /// </summary>
        public double opor_stop_tshold
        {
            get { return _opor_stop_tshold; }

            set
            {
                _opor_stop_tshold = value;
                RaisePropertyChanged(() => opor_stop_tshold);
            }
        }

        private int _order_limit_time;
        /// <summary>
        /// 下单限制时间
        /// </summary>
        public int order_limit_time
        {
            get { return _order_limit_time; }

            set
            {
                _order_limit_time = value;
                RaisePropertyChanged(() => order_limit_time);
            }
        }

        private double _per_secu_posi_ratio;
        /// <summary>
        /// 单券持仓比例
        /// </summary>
        public double per_secu_posi_ratio
        {
            get { return _per_secu_posi_ratio; }

            set
            {
                _per_secu_posi_ratio = value;
                RaisePropertyChanged(() => per_secu_posi_ratio);
            }
        }

        private int _posi_limit_time;
        /// <summary>
        /// 持仓时限
        /// </summary>
        public int posi_limit_time
        {
            get { return _posi_limit_time; }

            set
            {
                _posi_limit_time = value;
                RaisePropertyChanged(() => posi_limit_time);
            }
        }

        private double _order_ctrl_qty;
        /// <summary>
        /// 单笔数量控制
        /// </summary>
        public double order_ctrl_qty
        {
            get { return _order_ctrl_qty; }

            set
            {
                _order_ctrl_qty = value;
                RaisePropertyChanged(() => order_ctrl_qty);
            }
        }

        private double _order_ctrl_amt;
        /// <summary>
        /// 单笔金额控制
        /// </summary>
        public double order_ctrl_amt
        {
            get { return _order_ctrl_amt; }

            set
            {
                _order_ctrl_amt = value;
                RaisePropertyChanged(() => order_ctrl_amt);
            }
        }

        private double _stock_warn_ratio;
        /// <summary>
        /// 单券预警比例
        /// </summary>
        public double stock_warn_ratio
        {
            get { return _stock_warn_ratio; }

            set
            {
                _stock_warn_ratio = value;
                RaisePropertyChanged(() => stock_warn_ratio);
            }
        }

        private double _stock_stop_ratio;
        /// <summary>
        /// 单券止损比例
        /// </summary>
        public double stock_stop_ratio
        {
            get { return _stock_stop_ratio; }

            set
            {
                _stock_stop_ratio = value;
                RaisePropertyChanged(() => stock_stop_ratio);
            }
        }

        private double _stock_warn_amt;
        /// <summary>
        /// 单券预警金额
        /// </summary>
        public double stock_warn_amt
        {
            get { return _stock_warn_amt; }

            set
            {
                _stock_warn_amt = value;
                RaisePropertyChanged(() => stock_warn_amt);
            }
        }

        private double _stock_stop_amt;
        /// <summary>
        /// 单券止损金额
        /// </summary>
        public double stock_stop_amt
        {
            get { return _stock_stop_amt; }

            set
            {
                _stock_stop_amt = value;
                RaisePropertyChanged(() => stock_stop_amt);
            }
        }

        private int _trig_oper_type;
        /// <summary>
        /// 触警操作方式
        /// </summary>
        public int trig_oper_type
        {
            get { return _trig_oper_type; }

            set
            {
                _trig_oper_type = value;
                RaisePropertyChanged(() => trig_oper_type);
            }
        }

        private int _open_close_permission;
        /// <summary>
        /// 开平仓权限
        /// </summary>
        public int open_close_permission
        {
            get { return _open_close_permission; }

            set
            {
                _open_close_permission = value;
                RaisePropertyChanged(() => open_close_permission);
            }
        }

        private int _risk_oper;
        /// <summary>
        /// 风控监控员
        /// </summary>
        public int risk_oper
        {
            get { return _risk_oper; }

            set
            {
                _risk_oper = value;
                RaisePropertyChanged(() => risk_oper);
            }
        }

        private int _fee_calc_type;
        /// <summary>
        /// 费用计算方式
        /// </summary>
        public int fee_calc_type
        {
            get { return _fee_calc_type; }

            set
            {
                _fee_calc_type = value;
                RaisePropertyChanged(() => fee_calc_type);
            }
        }

        private int _permit_margin_trade;
        /// <summary>
        /// 允许信用交易
        /// </summary>
        public int permit_margin_trade
        {
            get { return _permit_margin_trade; }

            set
            {
                _permit_margin_trade = value;
                RaisePropertyChanged(() => permit_margin_trade);
            }
        }

        private double _buy_fee_ratio;
        /// <summary>
        /// 买费率
        /// </summary>
        public double buy_fee_ratio
        {
            get { return _buy_fee_ratio; }

            set
            {
                _buy_fee_ratio = value;
                RaisePropertyChanged(() => buy_fee_ratio);
            }
        }

        private double _sell_fee_ratio;
        /// <summary>
        /// 卖费率
        /// </summary>
        public double sell_fee_ratio
        {
            get { return _sell_fee_ratio; }

            set
            {
                _sell_fee_ratio = value;
                RaisePropertyChanged(() => sell_fee_ratio);
            }
        }

        private double _buy_min_fee;
        /// <summary>
        /// 买最低费用
        /// </summary>
        public double buy_min_fee
        {
            get { return _buy_min_fee; }

            set
            {
                _buy_min_fee = value;
                RaisePropertyChanged(() => buy_min_fee);
            }
        }

        private double _sell_min_fee;
        /// <summary>
        /// 卖最低费用
        /// </summary>
        public double sell_min_fee
        {
            get { return _sell_min_fee; }

            set
            {
                _sell_min_fee = value;
                RaisePropertyChanged(() => sell_min_fee);
            }
        }

        private double _trade_capt_amt;
        /// <summary>
        /// 交易占用金额
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
        /// 交易释放金额
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
        /// 成交占用金额
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
        /// 成交释放金额
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

        private double _sum_realize_pandl;
        /// <summary>
        /// 累计实现盈亏
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

        private double _amt_diff;
        /// <summary>
        /// 金额差额
        /// </summary>
        public double amt_diff
        {
            get { return _amt_diff; }

            set
            {
                _amt_diff = value;
                RaisePropertyChanged(() => amt_diff);
            }
        }

        private String _remark_info;
        /// <summary>
        /// 备注信息
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
        /// 更新次数
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

        private double _avail_amt;
        /// <summary>
        /// 可用金额
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
    }

    public class tdsecuL_6_115_Info : ObservableObject
    {
    }

    public class tdsecuL_6_116_Info : ObservableObject
    {
    }

}

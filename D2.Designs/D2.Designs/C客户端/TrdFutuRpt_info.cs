using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class tdfutuL_5_1_Info : ObservableObject
    {

        private String _order_status;
        /// <summary>
        /// 订单状态
        /// </summary>
        public String order_status
        {
            get { return _order_status; }

            set
            {
                _order_status = value;
                RaisePropertyChanged(() => order_status);
            }
        }

        private int _order_batch_no;
        /// <summary>
        /// 订单批号
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

        private ulong _order_id;
        /// <summary>
        /// 订单序号
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

        private String _rsp_info;
        /// <summary>
        /// 回报信息
        /// </summary>
        public String rsp_info
        {
            get { return _rsp_info; }

            set
            {
                _rsp_info = value;
                RaisePropertyChanged(() => rsp_info);
            }
        }
    }

    public class tdfutuL_5_11_Info : ObservableObject
    {

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

        private ulong _external_no;
        /// <summary>
        /// 外部编号
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

        private ulong _order_id;
        /// <summary>
        /// 订单序号
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

        private String _order_status;
        /// <summary>
        /// 订单状态
        /// </summary>
        public String order_status
        {
            get { return _order_status; }

            set
            {
                _order_status = value;
                RaisePropertyChanged(() => order_status);
            }
        }

        private int _wtdraw_date;
        /// <summary>
        /// 撤单日期
        /// </summary>
        public int wtdraw_date
        {
            get { return _wtdraw_date; }

            set
            {
                _wtdraw_date = value;
                RaisePropertyChanged(() => wtdraw_date);
            }
        }

        private int _wtdraw_time;
        /// <summary>
        /// 撤单时间
        /// </summary>
        public int wtdraw_time
        {
            get { return _wtdraw_time; }

            set
            {
                _wtdraw_time = value;
                RaisePropertyChanged(() => wtdraw_time);
            }
        }

        private double _wtdraw_qty;
        /// <summary>
        /// 撤单数量
        /// </summary>
        public double wtdraw_qty
        {
            get { return _wtdraw_qty; }

            set
            {
                _wtdraw_qty = value;
                RaisePropertyChanged(() => wtdraw_qty);
            }
        }

        private String _wtdraw_status;
        /// <summary>
        /// 撤单状态
        /// </summary>
        public String wtdraw_status
        {
            get { return _wtdraw_status; }

            set
            {
                _wtdraw_status = value;
                RaisePropertyChanged(() => wtdraw_status);
            }
        }
    }

    public class tdfutuL_5_21_Info : ObservableObject
    {

        private ulong _external_no;
        /// <summary>
        /// 外部编号
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

        private int _order_batch_no;
        /// <summary>
        /// 订单批号
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

        private ulong _order_id;
        /// <summary>
        /// 订单序号
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

        private String _order_status;
        /// <summary>
        /// 订单状态
        /// </summary>
        public String order_status
        {
            get { return _order_status; }

            set
            {
                _order_status = value;
                RaisePropertyChanged(() => order_status);
            }
        }

        private int _asset_type;
        /// <summary>
        /// 资产类型
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

        private double _old_trade_capt_qty;
        /// <summary>
        /// 老仓交易占用数量
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
        /// 今仓交易占用数量
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
        /// 老仓成交占用数量
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
        /// 今仓成交占用数量
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

        private double _open_amount;
        /// <summary>
        /// 开仓金额
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

        private double _close_pandl;
        /// <summary>
        /// 平仓盈亏
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

        private double _trade_fee;
        /// <summary>
        /// 交易费用
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
        /// 成交费用
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

        private double _capt_margin;
        /// <summary>
        /// 占用保证金
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
    }

    public class tdfutuL_5_31_Info : ObservableObject
    {

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

        private String _futu_acco;
        /// <summary>
        /// 交易编码
        /// </summary>
        public String futu_acco
        {
            get { return _futu_acco; }

            set
            {
                _futu_acco = value;
                RaisePropertyChanged(() => futu_acco);
            }
        }

        private String _contrc_code;
        /// <summary>
        /// 合约代码
        /// </summary>
        public String contrc_code
        {
            get { return _contrc_code; }

            set
            {
                _contrc_code = value;
                RaisePropertyChanged(() => contrc_code);
            }
        }

        private ulong _external_no;
        /// <summary>
        /// 外部编号
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

        private int _contrc_dir;
        /// <summary>
        /// 开平方向
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

        private int _hedge_type;
        /// <summary>
        /// 套保标志
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

        private ulong _order_id;
        /// <summary>
        /// 订单序号
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

        private String _order_status;
        /// <summary>
        /// 订单状态
        /// </summary>
        public String order_status
        {
            get { return _order_status; }

            set
            {
                _order_status = value;
                RaisePropertyChanged(() => order_status);
            }
        }
    }

    public class tdfutuL_5_101_Info : ObservableObject
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

        private ulong _order_id;
        /// <summary>
        /// 订单序号
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

        private String _rsp_status;
        /// <summary>
        /// 回报状态
        /// </summary>
        public String rsp_status
        {
            get { return _rsp_status; }

            set
            {
                _rsp_status = value;
                RaisePropertyChanged(() => rsp_status);
            }
        }

        private String _rsp_info;
        /// <summary>
        /// 回报信息
        /// </summary>
        public String rsp_info
        {
            get { return _rsp_info; }

            set
            {
                _rsp_info = value;
                RaisePropertyChanged(() => rsp_info);
            }
        }

        private String _deal_status;
        /// <summary>
        /// 处理状态
        /// </summary>
        public String deal_status
        {
            get { return _deal_status; }

            set
            {
                _deal_status = value;
                RaisePropertyChanged(() => deal_status);
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

    public class tdfutuL_5_121_Info : ObservableObject
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

        private int _strike_deal_type;
        /// <summary>
        /// 成交处理方式
        /// </summary>
        public int strike_deal_type
        {
            get { return _strike_deal_type; }

            set
            {
                _strike_deal_type = value;
                RaisePropertyChanged(() => strike_deal_type);
            }
        }

        private String _rsp_info;
        /// <summary>
        /// 回报信息
        /// </summary>
        public String rsp_info
        {
            get { return _rsp_info; }

            set
            {
                _rsp_info = value;
                RaisePropertyChanged(() => rsp_info);
            }
        }

        private String _deal_status;
        /// <summary>
        /// 处理状态
        /// </summary>
        public String deal_status
        {
            get { return _deal_status; }

            set
            {
                _deal_status = value;
                RaisePropertyChanged(() => deal_status);
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

    public class tdfutuL_5_122_Info : ObservableObject
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

        private int _query_opor_no;
        /// <summary>
        /// 查询操作员编号
        /// </summary>
        public int query_opor_no
        {
            get { return _query_opor_no; }

            set
            {
                _query_opor_no = value;
                RaisePropertyChanged(() => query_opor_no);
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

        private String _contrc_code;
        /// <summary>
        /// 合约代码
        /// </summary>
        public String contrc_code
        {
            get { return _contrc_code; }

            set
            {
                _contrc_code = value;
                RaisePropertyChanged(() => contrc_code);
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

        private int _contrc_dir;
        /// <summary>
        /// 开平方向
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

        private int _hedge_type;
        /// <summary>
        /// 套保标志
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

        private ulong _order_id;
        /// <summary>
        /// 订单序号
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

        private double _strike_fee;
        /// <summary>
        /// 成交费用
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
        /// 平仓盈亏
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

        private double _strike_margin;
        /// <summary>
        /// 成交保证金
        /// </summary>
        public double strike_margin
        {
            get { return _strike_margin; }

            set
            {
                _strike_margin = value;
                RaisePropertyChanged(() => strike_margin);
            }
        }

        private String _order_oper_way;
        /// <summary>
        /// 订单操作方式
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

        private ulong _comm_id;
        /// <summary>
        /// 指令序号
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
    }

    public class tdfutuL_5_123_Info : ObservableObject
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

        private String _contrc_code;
        /// <summary>
        /// 合约代码
        /// </summary>
        public String contrc_code
        {
            get { return _contrc_code; }

            set
            {
                _contrc_code = value;
                RaisePropertyChanged(() => contrc_code);
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

        private int _contrc_dir;
        /// <summary>
        /// 开平方向
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

        private int _hedge_type;
        /// <summary>
        /// 套保标志
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

        private ulong _order_id;
        /// <summary>
        /// 订单序号
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

        private double _strike_fee;
        /// <summary>
        /// 成交费用
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
        /// 平仓盈亏
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

        private double _strike_margin;
        /// <summary>
        /// 成交保证金
        /// </summary>
        public double strike_margin
        {
            get { return _strike_margin; }

            set
            {
                _strike_margin = value;
                RaisePropertyChanged(() => strike_margin);
            }
        }

        private String _order_oper_way;
        /// <summary>
        /// 订单操作方式
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

}

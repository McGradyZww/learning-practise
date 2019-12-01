using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class clsecuL_21_1_Info : ObservableObject
    {

        private int _record_count;
        /// <summary>
        /// 记录个数
        /// </summary>
        public int record_count
        {
            get { return _record_count; }

            set
            {
                _record_count = value;
                RaisePropertyChanged(() => record_count);
            }
        }

        private String _deal_info;
        /// <summary>
        /// 处理信息
        /// </summary>
        public String deal_info
        {
            get { return _deal_info; }

            set
            {
                _deal_info = value;
                RaisePropertyChanged(() => deal_info);
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
    }

    public class clsecuL_21_3_Info : ObservableObject
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

        private int _stock_type;
        /// <summary>
        /// 证券类型
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

        private double _stamp_tax;
        /// <summary>
        /// 印花税
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
        /// 过户费
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
        /// 经手费
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
        /// 证管费
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

        private int _net_price_flag;
        /// <summary>
        /// 净价标志
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

        private int _intrst_days;
        /// <summary>
        /// 计息天数
        /// </summary>
        public int intrst_days
        {
            get { return _intrst_days; }

            set
            {
                _intrst_days = value;
                RaisePropertyChanged(() => intrst_days);
            }
        }

        private double _par_value;
        /// <summary>
        /// 票面面值
        /// </summary>
        public double par_value
        {
            get { return _par_value; }

            set
            {
                _par_value = value;
                RaisePropertyChanged(() => par_value);
            }
        }

        private double _bond_accr_intrst;
        /// <summary>
        /// 债券计提利息
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

        private int _clear_entry_type;
        /// <summary>
        /// 清算入账类型
        /// </summary>
        public int clear_entry_type
        {
            get { return _clear_entry_type; }

            set
            {
                _clear_entry_type = value;
                RaisePropertyChanged(() => clear_entry_type);
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

    public class clsecuL_21_4_Info : ObservableObject
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

        private String _stock_acco;
        /// <summary>
        /// 股东代码
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

        private int _sett_flag;
        /// <summary>
        /// 清算结算标志
        /// </summary>
        public int sett_flag
        {
            get { return _sett_flag; }

            set
            {
                _sett_flag = value;
                RaisePropertyChanged(() => sett_flag);
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
    }

    public class clsecuL_21_11_Info : ObservableObject
    {

        private int _record_count;
        /// <summary>
        /// 记录个数
        /// </summary>
        public int record_count
        {
            get { return _record_count; }

            set
            {
                _record_count = value;
                RaisePropertyChanged(() => record_count);
            }
        }

        private String _deal_info;
        /// <summary>
        /// 处理信息
        /// </summary>
        public String deal_info
        {
            get { return _deal_info; }

            set
            {
                _deal_info = value;
                RaisePropertyChanged(() => deal_info);
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
    }

    public class clsecuL_21_13_Info : ObservableObject
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

        private double _strike_aver_price;
        /// <summary>
        /// 成交均价
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

        private double _split_strike_qty;
        /// <summary>
        /// 分笔累计成交数量
        /// </summary>
        public double split_strike_qty
        {
            get { return _split_strike_qty; }

            set
            {
                _split_strike_qty = value;
                RaisePropertyChanged(() => split_strike_qty);
            }
        }

        private double _split_strike_amt;
        /// <summary>
        /// 分笔累计成交金额
        /// </summary>
        public double split_strike_amt
        {
            get { return _split_strike_amt; }

            set
            {
                _split_strike_amt = value;
                RaisePropertyChanged(() => split_strike_amt);
            }
        }

        private double _split_stamp_tax;
        /// <summary>
        /// 分笔累计印花税
        /// </summary>
        public double split_stamp_tax
        {
            get { return _split_stamp_tax; }

            set
            {
                _split_stamp_tax = value;
                RaisePropertyChanged(() => split_stamp_tax);
            }
        }

        private double _split_trans_fee;
        /// <summary>
        /// 分笔累计过户费
        /// </summary>
        public double split_trans_fee
        {
            get { return _split_trans_fee; }

            set
            {
                _split_trans_fee = value;
                RaisePropertyChanged(() => split_trans_fee);
            }
        }

        private double _split_brkage;
        /// <summary>
        /// 分笔累计经手费
        /// </summary>
        public double split_brkage
        {
            get { return _split_brkage; }

            set
            {
                _split_brkage = value;
                RaisePropertyChanged(() => split_brkage);
            }
        }

        private double _split_SEC_charges;
        /// <summary>
        /// 分笔累计证管费
        /// </summary>
        public double split_SEC_charges
        {
            get { return _split_SEC_charges; }

            set
            {
                _split_SEC_charges = value;
                RaisePropertyChanged(() => split_SEC_charges);
            }
        }

        private double _split_other_fee;
        /// <summary>
        /// 分笔累计其他费用
        /// </summary>
        public double split_other_fee
        {
            get { return _split_other_fee; }

            set
            {
                _split_other_fee = value;
                RaisePropertyChanged(() => split_other_fee);
            }
        }

        private double _split_brkage_commis;
        /// <summary>
        /// 分笔累计交易佣金
        /// </summary>
        public double split_brkage_commis
        {
            get { return _split_brkage_commis; }

            set
            {
                _split_brkage_commis = value;
                RaisePropertyChanged(() => split_brkage_commis);
            }
        }

        private double _split_chann_commis;
        /// <summary>
        /// 分笔累计渠道佣金
        /// </summary>
        public double split_chann_commis
        {
            get { return _split_chann_commis; }

            set
            {
                _split_chann_commis = value;
                RaisePropertyChanged(() => split_chann_commis);
            }
        }

        private double _split_divi_commis;
        /// <summary>
        /// 分笔累计分成佣金
        /// </summary>
        public double split_divi_commis
        {
            get { return _split_divi_commis; }

            set
            {
                _split_divi_commis = value;
                RaisePropertyChanged(() => split_divi_commis);
            }
        }

        private double _split_other_commis;
        /// <summary>
        /// 分笔累计其他佣金
        /// </summary>
        public double split_other_commis
        {
            get { return _split_other_commis; }

            set
            {
                _split_other_commis = value;
                RaisePropertyChanged(() => split_other_commis);
            }
        }

        private int _stock_type;
        /// <summary>
        /// 证券类型
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

        private int _net_price_flag;
        /// <summary>
        /// 净价标志
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

        private int _intrst_days;
        /// <summary>
        /// 计息天数
        /// </summary>
        public int intrst_days
        {
            get { return _intrst_days; }

            set
            {
                _intrst_days = value;
                RaisePropertyChanged(() => intrst_days);
            }
        }

        private double _par_value;
        /// <summary>
        /// 票面面值
        /// </summary>
        public double par_value
        {
            get { return _par_value; }

            set
            {
                _par_value = value;
                RaisePropertyChanged(() => par_value);
            }
        }

        private double _bond_accr_intrst;
        /// <summary>
        /// 债券计提利息
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

        private int _clear_entry_type;
        /// <summary>
        /// 清算入账类型
        /// </summary>
        public int clear_entry_type
        {
            get { return _clear_entry_type; }

            set
            {
                _clear_entry_type = value;
                RaisePropertyChanged(() => clear_entry_type);
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

    public class clsecuL_21_15_Info : ObservableObject
    {

        private int _record_count;
        /// <summary>
        /// 记录个数
        /// </summary>
        public int record_count
        {
            get { return _record_count; }

            set
            {
                _record_count = value;
                RaisePropertyChanged(() => record_count);
            }
        }

        private String _deal_info;
        /// <summary>
        /// 处理信息
        /// </summary>
        public String deal_info
        {
            get { return _deal_info; }

            set
            {
                _deal_info = value;
                RaisePropertyChanged(() => deal_info);
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
    }

    public class clsecuL_21_23_Info : ObservableObject
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

        private double _debt_qty;
        /// <summary>
        /// 负债数量
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

        private double _debt_amt;
        /// <summary>
        /// 负债金额
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

        private int _debt_type;
        /// <summary>
        /// 负债类型
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

        private double _stamp_tax;
        /// <summary>
        /// 印花税
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
        /// 过户费
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
        /// 经手费
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
        /// 证管费
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

        private ulong _busi_jour_no;
        /// <summary>
        /// 成交流水号
        /// </summary>
        public ulong busi_jour_no
        {
            get { return _busi_jour_no; }

            set
            {
                _busi_jour_no = value;
                RaisePropertyChanged(() => busi_jour_no);
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

        private int _stock_type;
        /// <summary>
        /// 证券类型
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

        private int _intrst_days;
        /// <summary>
        /// 计息天数
        /// </summary>
        public int intrst_days
        {
            get { return _intrst_days; }

            set
            {
                _intrst_days = value;
                RaisePropertyChanged(() => intrst_days);
            }
        }

        private double _bond_accr_intrst;
        /// <summary>
        /// 债券计提利息
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
    }

    public class clsecuL_21_24_Info : ObservableObject
    {

        private int _record_count;
        /// <summary>
        /// 记录个数
        /// </summary>
        public int record_count
        {
            get { return _record_count; }

            set
            {
                _record_count = value;
                RaisePropertyChanged(() => record_count);
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
    }

    public class clsecuL_21_25_Info : ObservableObject
    {
    }

    public class clsecuL_21_26_Info : ObservableObject
    {
    }

    public class clsecuL_21_27_Info : ObservableObject
    {
    }

    public class clsecuL_21_28_Info : ObservableObject
    {
    }

    public class clsecuL_21_29_Info : ObservableObject
    {
    }

    public class clsecuL_21_151_Info : ObservableObject
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

        private int _qry_no;
        /// <summary>
        /// 查询序号
        /// </summary>
        public int qry_no
        {
            get { return _qry_no; }

            set
            {
                _qry_no = value;
                RaisePropertyChanged(() => qry_no);
            }
        }
    }

    public class clsecuL_21_153_Info : ObservableObject
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

        private int _qry_no;
        /// <summary>
        /// 查询序号
        /// </summary>
        public int qry_no
        {
            get { return _qry_no; }

            set
            {
                _qry_no = value;
                RaisePropertyChanged(() => qry_no);
            }
        }
    }

    public class clsecuL_21_154_Info : ObservableObject
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

    public class clsecuL_21_201_Info : ObservableObject
    {
    }

    public class clsecuL_21_202_Info : ObservableObject
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

        private int _clear_num;
        /// <summary>
        /// 清算笔数
        /// </summary>
        public int clear_num
        {
            get { return _clear_num; }

            set
            {
                _clear_num = value;
                RaisePropertyChanged(() => clear_num);
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

        private double _strike_aver_price;
        /// <summary>
        /// 成交均价
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

        private double _entry_qty;
        /// <summary>
        /// 入账数量
        /// </summary>
        public double entry_qty
        {
            get { return _entry_qty; }

            set
            {
                _entry_qty = value;
                RaisePropertyChanged(() => entry_qty);
            }
        }

        private double _entry_amt;
        /// <summary>
        /// 入账金额
        /// </summary>
        public double entry_amt
        {
            get { return _entry_amt; }

            set
            {
                _entry_amt = value;
                RaisePropertyChanged(() => entry_amt);
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

        private double _stamp_tax;
        /// <summary>
        /// 印花税
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
        /// 过户费
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
        /// 经手费
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
        /// 证管费
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

        private double _chann_commis;
        /// <summary>
        /// 渠道佣金
        /// </summary>
        public double chann_commis
        {
            get { return _chann_commis; }

            set
            {
                _chann_commis = value;
                RaisePropertyChanged(() => chann_commis);
            }
        }

        private double _divi_commis;
        /// <summary>
        /// 分成佣金
        /// </summary>
        public double divi_commis
        {
            get { return _divi_commis; }

            set
            {
                _divi_commis = value;
                RaisePropertyChanged(() => divi_commis);
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
    }

    public class clsecuL_21_203_Info : ObservableObject
    {

        private double _pre_switch_strike_qty;
        /// <summary>
        /// 待转入成交数
        /// </summary>
        public double pre_switch_strike_qty
        {
            get { return _pre_switch_strike_qty; }

            set
            {
                _pre_switch_strike_qty = value;
                RaisePropertyChanged(() => pre_switch_strike_qty);
            }
        }

        private double _alr_switch_strike_qty;
        /// <summary>
        /// 已转入成交数
        /// </summary>
        public double alr_switch_strike_qty
        {
            get { return _alr_switch_strike_qty; }

            set
            {
                _alr_switch_strike_qty = value;
                RaisePropertyChanged(() => alr_switch_strike_qty);
            }
        }

        private double _pre_clr_strike_qty;
        /// <summary>
        /// 待清算成交数
        /// </summary>
        public double pre_clr_strike_qty
        {
            get { return _pre_clr_strike_qty; }

            set
            {
                _pre_clr_strike_qty = value;
                RaisePropertyChanged(() => pre_clr_strike_qty);
            }
        }

        private double _alr_clr_strike_qty;
        /// <summary>
        /// 已清算成交数
        /// </summary>
        public double alr_clr_strike_qty
        {
            get { return _alr_clr_strike_qty; }

            set
            {
                _alr_clr_strike_qty = value;
                RaisePropertyChanged(() => alr_clr_strike_qty);
            }
        }

        private double _pre_entry_record_qty;
        /// <summary>
        /// 待入账记录数
        /// </summary>
        public double pre_entry_record_qty
        {
            get { return _pre_entry_record_qty; }

            set
            {
                _pre_entry_record_qty = value;
                RaisePropertyChanged(() => pre_entry_record_qty);
            }
        }

        private double _alr_entry_record_qty;
        /// <summary>
        /// 已入账记录数
        /// </summary>
        public double alr_entry_record_qty
        {
            get { return _alr_entry_record_qty; }

            set
            {
                _alr_entry_record_qty = value;
                RaisePropertyChanged(() => alr_entry_record_qty);
            }
        }
    }

    public class clsecuL_21_204_Info : ObservableObject
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
    }

    public class clsecuL_21_205_Info : ObservableObject
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
    }

    public class clsecuL_21_206_Info : ObservableObject
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
    }

    public class clsecuL_21_207_Info : ObservableObject
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
    }

    public class clsecuL_21_301_Info : ObservableObject
    {
    }

}

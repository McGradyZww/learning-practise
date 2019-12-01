using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class rptL_3_1_Info : ObservableObject
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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
        /// 产品名称
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

        private int _found_date;
        /// <summary>
        /// 成立日期
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

        private int _runtime;
        /// <summary>
        /// 运行时长
        /// </summary>
        public int runtime
        {
            get { return _runtime; }

            set
            {
                _runtime = value;
                RaisePropertyChanged(() => runtime);
            }
        }

        private double _unit_nav;
        /// <summary>
        /// 单位净值
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

        private double _daily_pandl_ratio;
        /// <summary>
        /// 当日收益率
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

        private double _daily_pandl_ratio_year;
        /// <summary>
        /// 当日年化收益率
        /// </summary>
        public double daily_pandl_ratio_year
        {
            get { return _daily_pandl_ratio_year; }

            set
            {
                _daily_pandl_ratio_year = value;
                RaisePropertyChanged(() => daily_pandl_ratio_year);
            }
        }

        private double _total_unit_nav;
        /// <summary>
        /// 累计单位净值
        /// </summary>
        public double total_unit_nav
        {
            get { return _total_unit_nav; }

            set
            {
                _total_unit_nav = value;
                RaisePropertyChanged(() => total_unit_nav);
            }
        }

        private double _total_realiz_pandl_ratio;
        /// <summary>
        /// 累计收益率
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

        private double _total_realize_pandl_ratio_year;
        /// <summary>
        /// 累计年化收益率
        /// </summary>
        public double total_realize_pandl_ratio_year
        {
            get { return _total_realize_pandl_ratio_year; }

            set
            {
                _total_realize_pandl_ratio_year = value;
                RaisePropertyChanged(() => total_realize_pandl_ratio_year);
            }
        }

        private double _excess_earning_year;
        /// <summary>
        /// 超额年化收益
        /// </summary>
        public double excess_earning_year
        {
            get { return _excess_earning_year; }

            set
            {
                _excess_earning_year = value;
                RaisePropertyChanged(() => excess_earning_year);
            }
        }

        private double _day_retracement;
        /// <summary>
        /// 每日回撤
        /// </summary>
        public double day_retracement
        {
            get { return _day_retracement; }

            set
            {
                _day_retracement = value;
                RaisePropertyChanged(() => day_retracement);
            }
        }

        private double _day_continue_retracement;
        /// <summary>
        /// 连续回撤幅度
        /// </summary>
        public double day_continue_retracement
        {
            get { return _day_continue_retracement; }

            set
            {
                _day_continue_retracement = value;
                RaisePropertyChanged(() => day_continue_retracement);
            }
        }
    }

    public class rptL_3_2_Info : ObservableObject
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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
        /// 产品名称
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

        private double _unit_nav;
        /// <summary>
        /// 单位净值
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

        private double _daily_pandl_ratio;
        /// <summary>
        /// 当日收益率
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

        private double _total_realize_pandl_ratio_year;
        /// <summary>
        /// 累计年化收益率
        /// </summary>
        public double total_realize_pandl_ratio_year
        {
            get { return _total_realize_pandl_ratio_year; }

            set
            {
                _total_realize_pandl_ratio_year = value;
                RaisePropertyChanged(() => total_realize_pandl_ratio_year);
            }
        }

        private double _sharpe_ration;
        /// <summary>
        /// 夏普比率
        /// </summary>
        public double sharpe_ration
        {
            get { return _sharpe_ration; }

            set
            {
                _sharpe_ration = value;
                RaisePropertyChanged(() => sharpe_ration);
            }
        }

        private double _max_retracement;
        /// <summary>
        /// 最大回撤
        /// </summary>
        public double max_retracement
        {
            get { return _max_retracement; }

            set
            {
                _max_retracement = value;
                RaisePropertyChanged(() => max_retracement);
            }
        }

        private double _market_value_sh;
        /// <summary>
        /// 当前沪市市值
        /// </summary>
        public double market_value_sh
        {
            get { return _market_value_sh; }

            set
            {
                _market_value_sh = value;
                RaisePropertyChanged(() => market_value_sh);
            }
        }

        private double _market_value_avg_sh;
        /// <summary>
        /// 平均沪市市值
        /// </summary>
        public double market_value_avg_sh
        {
            get { return _market_value_avg_sh; }

            set
            {
                _market_value_avg_sh = value;
                RaisePropertyChanged(() => market_value_avg_sh);
            }
        }

        private int _sh_remainday_two;
        /// <summary>
        /// 沪市满足两千万所剩天数
        /// </summary>
        public int sh_remainday_two
        {
            get { return _sh_remainday_two; }

            set
            {
                _sh_remainday_two = value;
                RaisePropertyChanged(() => sh_remainday_two);
            }
        }

        private int _sh_remainday_three;
        /// <summary>
        /// 沪市满足三千万所剩天数
        /// </summary>
        public int sh_remainday_three
        {
            get { return _sh_remainday_three; }

            set
            {
                _sh_remainday_three = value;
                RaisePropertyChanged(() => sh_remainday_three);
            }
        }

        private int _sh_remainday_five;
        /// <summary>
        /// 沪市满足五千万所剩天数
        /// </summary>
        public int sh_remainday_five
        {
            get { return _sh_remainday_five; }

            set
            {
                _sh_remainday_five = value;
                RaisePropertyChanged(() => sh_remainday_five);
            }
        }

        private double _market_value_sz;
        /// <summary>
        /// 当前深市市值
        /// </summary>
        public double market_value_sz
        {
            get { return _market_value_sz; }

            set
            {
                _market_value_sz = value;
                RaisePropertyChanged(() => market_value_sz);
            }
        }

        private double _market_value_avg_sz;
        /// <summary>
        /// 平均深市市值
        /// </summary>
        public double market_value_avg_sz
        {
            get { return _market_value_avg_sz; }

            set
            {
                _market_value_avg_sz = value;
                RaisePropertyChanged(() => market_value_avg_sz);
            }
        }

        private int _sz_remainday_two;
        /// <summary>
        /// 深市满足两千万所剩天数
        /// </summary>
        public int sz_remainday_two
        {
            get { return _sz_remainday_two; }

            set
            {
                _sz_remainday_two = value;
                RaisePropertyChanged(() => sz_remainday_two);
            }
        }

        private int _sz_remainday_three;
        /// <summary>
        /// 深市满足三千万所剩天数
        /// </summary>
        public int sz_remainday_three
        {
            get { return _sz_remainday_three; }

            set
            {
                _sz_remainday_three = value;
                RaisePropertyChanged(() => sz_remainday_three);
            }
        }

        private int _sz_remainday_five;
        /// <summary>
        /// 深市满足五千万所剩天数
        /// </summary>
        public int sz_remainday_five
        {
            get { return _sz_remainday_five; }

            set
            {
                _sz_remainday_five = value;
                RaisePropertyChanged(() => sz_remainday_five);
            }
        }
    }

    public class rptL_3_3_Info : ObservableObject
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

        private int _mach_date;
        /// <summary>
        /// 机器日期
        /// </summary>
        public int mach_date
        {
            get { return _mach_date; }

            set
            {
                _mach_date = value;
                RaisePropertyChanged(() => mach_date);
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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
        /// 产品名称
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

        private double _pd_curr_share;
        /// <summary>
        /// 产品当前份额
        /// </summary>
        public double pd_curr_share
        {
            get { return _pd_curr_share; }

            set
            {
                _pd_curr_share = value;
                RaisePropertyChanged(() => pd_curr_share);
            }
        }

        private double _unit_nav;
        /// <summary>
        /// 单位净值
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

        private double _nav_asset;
        /// <summary>
        /// 净资产
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

    public class rptL_3_4_Info : ObservableObject
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

        private int _region_no;
        /// <summary>
        /// 查询区间编号
        /// </summary>
        public int region_no
        {
            get { return _region_no; }

            set
            {
                _region_no = value;
                RaisePropertyChanged(() => region_no);
            }
        }

        private String _region_name;
        /// <summary>
        /// 查询区间名称
        /// </summary>
        public String region_name
        {
            get { return _region_name; }

            set
            {
                _region_name = value;
                RaisePropertyChanged(() => region_name);
            }
        }

        private double _product_return_rate;
        /// <summary>
        /// 回报率
        /// </summary>
        public double product_return_rate
        {
            get { return _product_return_rate; }

            set
            {
                _product_return_rate = value;
                RaisePropertyChanged(() => product_return_rate);
            }
        }

        private double _max_product_increase;
        /// <summary>
        /// 最大涨幅
        /// </summary>
        public double max_product_increase
        {
            get { return _max_product_increase; }

            set
            {
                _max_product_increase = value;
                RaisePropertyChanged(() => max_product_increase);
            }
        }

        private double _cmp_product_return_rate;
        /// <summary>
        /// 相对回报
        /// </summary>
        public double cmp_product_return_rate
        {
            get { return _cmp_product_return_rate; }

            set
            {
                _cmp_product_return_rate = value;
                RaisePropertyChanged(() => cmp_product_return_rate);
            }
        }
    }

    public class rptL_3_6_Info : ObservableObject
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

        private int _pd_asset_type;
        /// <summary>
        /// 产品资产类型
        /// </summary>
        public int pd_asset_type
        {
            get { return _pd_asset_type; }

            set
            {
                _pd_asset_type = value;
                RaisePropertyChanged(() => pd_asset_type);
            }
        }

        private String _pd_code;
        /// <summary>
        /// 产品编码
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
        /// 产品名称
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
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

        private double _last_price;
        /// <summary>
        /// 最新价
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

        private double _cost_amt;
        /// <summary>
        /// 成本金额
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

        private String _stop_status;
        /// <summary>
        /// 停牌标志
        /// </summary>
        public String stop_status
        {
            get { return _stop_status; }

            set
            {
                _stop_status = value;
                RaisePropertyChanged(() => stop_status);
            }
        }

        private int _circl_flag;
        /// <summary>
        /// 流通标志
        /// </summary>
        public int circl_flag
        {
            get { return _circl_flag; }

            set
            {
                _circl_flag = value;
                RaisePropertyChanged(() => circl_flag);
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
    }

    public class rptL_3_7_Info : ObservableObject
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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
        /// 产品名称
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

        private double _total_asset;
        /// <summary>
        /// 总资产
        /// </summary>
        public double total_asset
        {
            get { return _total_asset; }

            set
            {
                _total_asset = value;
                RaisePropertyChanged(() => total_asset);
            }
        }

        private double _stock_market_value;
        /// <summary>
        /// 股票市值
        /// </summary>
        public double stock_market_value
        {
            get { return _stock_market_value; }

            set
            {
                _stock_market_value = value;
                RaisePropertyChanged(() => stock_market_value);
            }
        }

        private double _pd_share;
        /// <summary>
        /// 产品份额
        /// </summary>
        public double pd_share
        {
            get { return _pd_share; }

            set
            {
                _pd_share = value;
                RaisePropertyChanged(() => pd_share);
            }
        }

        private double _unit_nav;
        /// <summary>
        /// 单位净值
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

        private double _week_nav_change;
        /// <summary>
        /// 周净值累变
        /// </summary>
        public double week_nav_change
        {
            get { return _week_nav_change; }

            set
            {
                _week_nav_change = value;
                RaisePropertyChanged(() => week_nav_change);
            }
        }

        private double _day_nav_change;
        /// <summary>
        /// 日净值累变
        /// </summary>
        public double day_nav_change
        {
            get { return _day_nav_change; }

            set
            {
                _day_nav_change = value;
                RaisePropertyChanged(() => day_nav_change);
            }
        }

        private double _cash_asset;
        /// <summary>
        /// 现金资产
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

        private double _cash_nav_ratio;
        /// <summary>
        /// 现金类占净值比
        /// </summary>
        public double cash_nav_ratio
        {
            get { return _cash_nav_ratio; }

            set
            {
                _cash_nav_ratio = value;
                RaisePropertyChanged(() => cash_nav_ratio);
            }
        }

        private double _stock_asset_ratio;
        /// <summary>
        /// 股票资产占比
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
    }

    public class rptL_3_8_Info : ObservableObject
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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
        /// 产品名称
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

        private double _unit_nav;
        /// <summary>
        /// 单位净值
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

        private double _daily_pandl_ratio;
        /// <summary>
        /// 当日收益率
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

        private double _daily_pandl_ratio_year;
        /// <summary>
        /// 当日年化收益率
        /// </summary>
        public double daily_pandl_ratio_year
        {
            get { return _daily_pandl_ratio_year; }

            set
            {
                _daily_pandl_ratio_year = value;
                RaisePropertyChanged(() => daily_pandl_ratio_year);
            }
        }

        private double _nav_fluct;
        /// <summary>
        /// 净值波动
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

        private double _max_retracement;
        /// <summary>
        /// 最大回撤
        /// </summary>
        public double max_retracement
        {
            get { return _max_retracement; }

            set
            {
                _max_retracement = value;
                RaisePropertyChanged(() => max_retracement);
            }
        }

        private double _curr_share;
        /// <summary>
        /// 当前份额
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

        private double _total_asset;
        /// <summary>
        /// 总资产
        /// </summary>
        public double total_asset
        {
            get { return _total_asset; }

            set
            {
                _total_asset = value;
                RaisePropertyChanged(() => total_asset);
            }
        }
    }

    public class rptL_3_9_Info : ObservableObject
    {
    }

    public class rptL_3_10_Info : ObservableObject
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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
        /// 产品名称
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

        private double _net_performance;
        /// <summary>
        /// 当日净值表现
        /// </summary>
        public double net_performance
        {
            get { return _net_performance; }

            set
            {
                _net_performance = value;
                RaisePropertyChanged(() => net_performance);
            }
        }

        private double _total_unit_nav;
        /// <summary>
        /// 累计单位净值
        /// </summary>
        public double total_unit_nav
        {
            get { return _total_unit_nav; }

            set
            {
                _total_unit_nav = value;
                RaisePropertyChanged(() => total_unit_nav);
            }
        }

        private double _market_value_posi_ratio;
        /// <summary>
        /// 市值仓位占比
        /// </summary>
        public double market_value_posi_ratio
        {
            get { return _market_value_posi_ratio; }

            set
            {
                _market_value_posi_ratio = value;
                RaisePropertyChanged(() => market_value_posi_ratio);
            }
        }

        private String _pd_manager;
        /// <summary>
        /// 产品管理人
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

        private double _nav_asset;
        /// <summary>
        /// 净资产
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

        private double _cash_asset;
        /// <summary>
        /// 现金资产
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

        private double _profit_year;
        /// <summary>
        /// 当年收益
        /// </summary>
        public double profit_year
        {
            get { return _profit_year; }

            set
            {
                _profit_year = value;
                RaisePropertyChanged(() => profit_year);
            }
        }

        private double _profit_year_ratio;
        /// <summary>
        /// 当年收益率
        /// </summary>
        public double profit_year_ratio
        {
            get { return _profit_year_ratio; }

            set
            {
                _profit_year_ratio = value;
                RaisePropertyChanged(() => profit_year_ratio);
            }
        }

        private double _follow_share;
        /// <summary>
        /// 跟投份额
        /// </summary>
        public double follow_share
        {
            get { return _follow_share; }

            set
            {
                _follow_share = value;
                RaisePropertyChanged(() => follow_share);
            }
        }

        private double _follow_nav_asset;
        /// <summary>
        /// 跟投资产净值
        /// </summary>
        public double follow_nav_asset
        {
            get { return _follow_nav_asset; }

            set
            {
                _follow_nav_asset = value;
                RaisePropertyChanged(() => follow_nav_asset);
            }
        }

        private double _follow_income_year;
        /// <summary>
        /// 跟投资产当年损益
        /// </summary>
        public double follow_income_year
        {
            get { return _follow_income_year; }

            set
            {
                _follow_income_year = value;
                RaisePropertyChanged(() => follow_income_year);
            }
        }

        private double _follow_income_total;
        /// <summary>
        /// 跟投资产总损益
        /// </summary>
        public double follow_income_total
        {
            get { return _follow_income_total; }

            set
            {
                _follow_income_total = value;
                RaisePropertyChanged(() => follow_income_total);
            }
        }

        private double _follow_profit_ratio;
        /// <summary>
        /// 跟投资产总收益率
        /// </summary>
        public double follow_profit_ratio
        {
            get { return _follow_profit_ratio; }

            set
            {
                _follow_profit_ratio = value;
                RaisePropertyChanged(() => follow_profit_ratio);
            }
        }

        private double _warn_value;
        /// <summary>
        /// 预警值
        /// </summary>
        public double warn_value
        {
            get { return _warn_value; }

            set
            {
                _warn_value = value;
                RaisePropertyChanged(() => warn_value);
            }
        }

        private double _stop_value;
        /// <summary>
        /// 止损值
        /// </summary>
        public double stop_value
        {
            get { return _stop_value; }

            set
            {
                _stop_value = value;
                RaisePropertyChanged(() => stop_value);
            }
        }

        private double _curr_share;
        /// <summary>
        /// 当前份额
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

        private double _max_retracement;
        /// <summary>
        /// 最大回撤
        /// </summary>
        public double max_retracement
        {
            get { return _max_retracement; }

            set
            {
                _max_retracement = value;
                RaisePropertyChanged(() => max_retracement);
            }
        }

        private int _found_date;
        /// <summary>
        /// 成立日期
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

        private double _last_year_nav;
        /// <summary>
        /// 上年净值
        /// </summary>
        public double last_year_nav
        {
            get { return _last_year_nav; }

            set
            {
                _last_year_nav = value;
                RaisePropertyChanged(() => last_year_nav);
            }
        }
    }

    public class rptL_3_11_Info : ObservableObject
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

        private int _begin_date;
        /// <summary>
        /// 开始日期
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
        /// 结束日期
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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
        /// 产品名称
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

        private double _nav_asset;
        /// <summary>
        /// 净资产
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
        /// 持仓市值
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

        private double _cash_asset;
        /// <summary>
        /// 现金资产
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

        private double _product_return_rate;
        /// <summary>
        /// 回报率
        /// </summary>
        public double product_return_rate
        {
            get { return _product_return_rate; }

            set
            {
                _product_return_rate = value;
                RaisePropertyChanged(() => product_return_rate);
            }
        }

        private double _standard_return;
        /// <summary>
        /// 基准回报
        /// </summary>
        public double standard_return
        {
            get { return _standard_return; }

            set
            {
                _standard_return = value;
                RaisePropertyChanged(() => standard_return);
            }
        }

        private double _curr_share;
        /// <summary>
        /// 当前份额
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

        private double _unit_nav;
        /// <summary>
        /// 单位净值
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

        private double _interval_pandl;
        /// <summary>
        /// 区间盈亏
        /// </summary>
        public double interval_pandl
        {
            get { return _interval_pandl; }

            set
            {
                _interval_pandl = value;
                RaisePropertyChanged(() => interval_pandl);
            }
        }

        private double _total_realiz_pandl_ratio;
        /// <summary>
        /// 累计收益率
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

        private double _cmp_product_return_rate;
        /// <summary>
        /// 相对回报
        /// </summary>
        public double cmp_product_return_rate
        {
            get { return _cmp_product_return_rate; }

            set
            {
                _cmp_product_return_rate = value;
                RaisePropertyChanged(() => cmp_product_return_rate);
            }
        }
    }

    public class rptL_3_12_Info : ObservableObject
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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
        /// 产品名称
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

        private double _product_return_rate;
        /// <summary>
        /// 回报率
        /// </summary>
        public double product_return_rate
        {
            get { return _product_return_rate; }

            set
            {
                _product_return_rate = value;
                RaisePropertyChanged(() => product_return_rate);
            }
        }

        private double _total_asset;
        /// <summary>
        /// 总资产
        /// </summary>
        public double total_asset
        {
            get { return _total_asset; }

            set
            {
                _total_asset = value;
                RaisePropertyChanged(() => total_asset);
            }
        }

        private double _standard_return;
        /// <summary>
        /// 基准回报
        /// </summary>
        public double standard_return
        {
            get { return _standard_return; }

            set
            {
                _standard_return = value;
                RaisePropertyChanged(() => standard_return);
            }
        }

        private double _cmp_product_return_rate;
        /// <summary>
        /// 相对回报
        /// </summary>
        public double cmp_product_return_rate
        {
            get { return _cmp_product_return_rate; }

            set
            {
                _cmp_product_return_rate = value;
                RaisePropertyChanged(() => cmp_product_return_rate);
            }
        }
    }

    public class rptL_3_13_Info : ObservableObject
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

        private int _begin_date;
        /// <summary>
        /// 开始日期
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
        /// 结束日期
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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
        /// 产品名称
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

        private double _asset_market_value;
        /// <summary>
        /// 资产市值
        /// </summary>
        public double asset_market_value
        {
            get { return _asset_market_value; }

            set
            {
                _asset_market_value = value;
                RaisePropertyChanged(() => asset_market_value);
            }
        }

        private double _weight_ratio;
        /// <summary>
        /// 权重比例
        /// </summary>
        public double weight_ratio
        {
            get { return _weight_ratio; }

            set
            {
                _weight_ratio = value;
                RaisePropertyChanged(() => weight_ratio);
            }
        }

        private double _interval_pandl;
        /// <summary>
        /// 区间盈亏
        /// </summary>
        public double interval_pandl
        {
            get { return _interval_pandl; }

            set
            {
                _interval_pandl = value;
                RaisePropertyChanged(() => interval_pandl);
            }
        }

        private double _product_return_rate;
        /// <summary>
        /// 回报率
        /// </summary>
        public double product_return_rate
        {
            get { return _product_return_rate; }

            set
            {
                _product_return_rate = value;
                RaisePropertyChanged(() => product_return_rate);
            }
        }

        private double _return_rate;
        /// <summary>
        /// 回报贡献
        /// </summary>
        public double return_rate
        {
            get { return _return_rate; }

            set
            {
                _return_rate = value;
                RaisePropertyChanged(() => return_rate);
            }
        }
    }

    public class rptL_3_14_Info : ObservableObject
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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
        /// 产品名称
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

        private double _asset_market_value;
        /// <summary>
        /// 资产市值
        /// </summary>
        public double asset_market_value
        {
            get { return _asset_market_value; }

            set
            {
                _asset_market_value = value;
                RaisePropertyChanged(() => asset_market_value);
            }
        }

        private double _weight_ratio;
        /// <summary>
        /// 权重比例
        /// </summary>
        public double weight_ratio
        {
            get { return _weight_ratio; }

            set
            {
                _weight_ratio = value;
                RaisePropertyChanged(() => weight_ratio);
            }
        }

        private int _asset_kind;
        /// <summary>
        /// 资产类别
        /// </summary>
        public int asset_kind
        {
            get { return _asset_kind; }

            set
            {
                _asset_kind = value;
                RaisePropertyChanged(() => asset_kind);
            }
        }

        private double _interval_pandl;
        /// <summary>
        /// 区间盈亏
        /// </summary>
        public double interval_pandl
        {
            get { return _interval_pandl; }

            set
            {
                _interval_pandl = value;
                RaisePropertyChanged(() => interval_pandl);
            }
        }
    }

    public class rptL_3_15_Info : ObservableObject
    {

        private int _begin_date;
        /// <summary>
        /// 开始日期
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
        /// 结束日期
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
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

        private double _last_price;
        /// <summary>
        /// 最新价
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

        private double _asset_market_value;
        /// <summary>
        /// 资产市值
        /// </summary>
        public double asset_market_value
        {
            get { return _asset_market_value; }

            set
            {
                _asset_market_value = value;
                RaisePropertyChanged(() => asset_market_value);
            }
        }

        private double _weight_ratio;
        /// <summary>
        /// 权重比例
        /// </summary>
        public double weight_ratio
        {
            get { return _weight_ratio; }

            set
            {
                _weight_ratio = value;
                RaisePropertyChanged(() => weight_ratio);
            }
        }

        private double _interval_pandl;
        /// <summary>
        /// 区间盈亏
        /// </summary>
        public double interval_pandl
        {
            get { return _interval_pandl; }

            set
            {
                _interval_pandl = value;
                RaisePropertyChanged(() => interval_pandl);
            }
        }

        private double _product_return_rate;
        /// <summary>
        /// 回报率
        /// </summary>
        public double product_return_rate
        {
            get { return _product_return_rate; }

            set
            {
                _product_return_rate = value;
                RaisePropertyChanged(() => product_return_rate);
            }
        }

        private double _return_rate;
        /// <summary>
        /// 回报贡献
        /// </summary>
        public double return_rate
        {
            get { return _return_rate; }

            set
            {
                _return_rate = value;
                RaisePropertyChanged(() => return_rate);
            }
        }
    }

    public class rptL_3_16_Info : ObservableObject
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

        private String _first_indu_code;
        /// <summary>
        /// 一级行业代码
        /// </summary>
        public String first_indu_code
        {
            get { return _first_indu_code; }

            set
            {
                _first_indu_code = value;
                RaisePropertyChanged(() => first_indu_code);
            }
        }

        private double _asset_market_value;
        /// <summary>
        /// 资产市值
        /// </summary>
        public double asset_market_value
        {
            get { return _asset_market_value; }

            set
            {
                _asset_market_value = value;
                RaisePropertyChanged(() => asset_market_value);
            }
        }

        private double _weight_ratio;
        /// <summary>
        /// 权重比例
        /// </summary>
        public double weight_ratio
        {
            get { return _weight_ratio; }

            set
            {
                _weight_ratio = value;
                RaisePropertyChanged(() => weight_ratio);
            }
        }

        private double _interval_pandl;
        /// <summary>
        /// 区间盈亏
        /// </summary>
        public double interval_pandl
        {
            get { return _interval_pandl; }

            set
            {
                _interval_pandl = value;
                RaisePropertyChanged(() => interval_pandl);
            }
        }

        private double _product_return_rate;
        /// <summary>
        /// 回报率
        /// </summary>
        public double product_return_rate
        {
            get { return _product_return_rate; }

            set
            {
                _product_return_rate = value;
                RaisePropertyChanged(() => product_return_rate);
            }
        }
    }

    public class rptL_3_17_Info : ObservableObject
    {

        private int _begin_date;
        /// <summary>
        /// 开始日期
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
        /// 结束日期
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
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

        private double _last_price;
        /// <summary>
        /// 最新价
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

        private double _asset_market_value;
        /// <summary>
        /// 资产市值
        /// </summary>
        public double asset_market_value
        {
            get { return _asset_market_value; }

            set
            {
                _asset_market_value = value;
                RaisePropertyChanged(() => asset_market_value);
            }
        }

        private double _weight_ratio;
        /// <summary>
        /// 权重比例
        /// </summary>
        public double weight_ratio
        {
            get { return _weight_ratio; }

            set
            {
                _weight_ratio = value;
                RaisePropertyChanged(() => weight_ratio);
            }
        }

        private double _interval_pandl;
        /// <summary>
        /// 区间盈亏
        /// </summary>
        public double interval_pandl
        {
            get { return _interval_pandl; }

            set
            {
                _interval_pandl = value;
                RaisePropertyChanged(() => interval_pandl);
            }
        }

        private double _product_return_rate;
        /// <summary>
        /// 回报率
        /// </summary>
        public double product_return_rate
        {
            get { return _product_return_rate; }

            set
            {
                _product_return_rate = value;
                RaisePropertyChanged(() => product_return_rate);
            }
        }

        private double _return_rate;
        /// <summary>
        /// 回报贡献
        /// </summary>
        public double return_rate
        {
            get { return _return_rate; }

            set
            {
                _return_rate = value;
                RaisePropertyChanged(() => return_rate);
            }
        }
    }

    public class rptL_3_18_Info : ObservableObject
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

        private String _pd_name;
        /// <summary>
        /// 产品名称
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
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

        private double _stock_asset_value;
        /// <summary>
        /// 证券市值
        /// </summary>
        public double stock_asset_value
        {
            get { return _stock_asset_value; }

            set
            {
                _stock_asset_value = value;
                RaisePropertyChanged(() => stock_asset_value);
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

        private double _cost_amt;
        /// <summary>
        /// 成本金额
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

        private double _float_pandl;
        /// <summary>
        /// 浮动盈亏
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

        private double _weight_ratio;
        /// <summary>
        /// 权重比例
        /// </summary>
        public double weight_ratio
        {
            get { return _weight_ratio; }

            set
            {
                _weight_ratio = value;
                RaisePropertyChanged(() => weight_ratio);
            }
        }
    }

    public class rptL_3_19_Info : ObservableObject
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
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

        private double _last_price;
        /// <summary>
        /// 最新价
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

        private double _stock_asset_value;
        /// <summary>
        /// 证券市值
        /// </summary>
        public double stock_asset_value
        {
            get { return _stock_asset_value; }

            set
            {
                _stock_asset_value = value;
                RaisePropertyChanged(() => stock_asset_value);
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

        private double _weight_ratio;
        /// <summary>
        /// 权重比例
        /// </summary>
        public double weight_ratio
        {
            get { return _weight_ratio; }

            set
            {
                _weight_ratio = value;
                RaisePropertyChanged(() => weight_ratio);
            }
        }

        private double _float_pandl;
        /// <summary>
        /// 浮动盈亏
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
    }

    public class rptL_3_20_Info : ObservableObject
    {

        private String _pd_name;
        /// <summary>
        /// 产品名称
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

        private String _pd_manager;
        /// <summary>
        /// 产品管理人
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

        private double _stock_asset_value;
        /// <summary>
        /// 证券市值
        /// </summary>
        public double stock_asset_value
        {
            get { return _stock_asset_value; }

            set
            {
                _stock_asset_value = value;
                RaisePropertyChanged(() => stock_asset_value);
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

        private double _weight_ratio;
        /// <summary>
        /// 权重比例
        /// </summary>
        public double weight_ratio
        {
            get { return _weight_ratio; }

            set
            {
                _weight_ratio = value;
                RaisePropertyChanged(() => weight_ratio);
            }
        }

        private double _float_pandl;
        /// <summary>
        /// 浮动盈亏
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

        private double _asset_market_value;
        /// <summary>
        /// 资产市值
        /// </summary>
        public double asset_market_value
        {
            get { return _asset_market_value; }

            set
            {
                _asset_market_value = value;
                RaisePropertyChanged(() => asset_market_value);
            }
        }

        private double _asset_ratio;
        /// <summary>
        /// 资产比例
        /// </summary>
        public double asset_ratio
        {
            get { return _asset_ratio; }

            set
            {
                _asset_ratio = value;
                RaisePropertyChanged(() => asset_ratio);
            }
        }
    }

    public class rptL_3_21_Info : ObservableObject
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

        private double _cost_amt;
        /// <summary>
        /// 成本金额
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

        private double _intrst_cost_amt;
        /// <summary>
        /// 利息成本金额
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
        /// 利息收益
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

        private double _float_pandl;
        /// <summary>
        /// 浮动盈亏
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

        private double _posi_market_value;
        /// <summary>
        /// 持仓市值
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

        private double _buy_qty;
        /// <summary>
        /// 买入数量
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
        /// 买入金额
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

        private double _buy_strike_price;
        /// <summary>
        /// 买入成交价
        /// </summary>
        public double buy_strike_price
        {
            get { return _buy_strike_price; }

            set
            {
                _buy_strike_price = value;
                RaisePropertyChanged(() => buy_strike_price);
            }
        }

        private double _sell_qty;
        /// <summary>
        /// 卖出数量
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
        /// 卖出金额
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

        private double _sell_strike_price;
        /// <summary>
        /// 卖出成交价
        /// </summary>
        public double sell_strike_price
        {
            get { return _sell_strike_price; }

            set
            {
                _sell_strike_price = value;
                RaisePropertyChanged(() => sell_strike_price);
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
    }

    public class rptL_3_22_Info : ObservableObject
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

        private String _pd_name;
        /// <summary>
        /// 产品名称
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
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

        private double _stock_asset_value;
        /// <summary>
        /// 证券市值
        /// </summary>
        public double stock_asset_value
        {
            get { return _stock_asset_value; }

            set
            {
                _stock_asset_value = value;
                RaisePropertyChanged(() => stock_asset_value);
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

        private double _cost_amt;
        /// <summary>
        /// 成本金额
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

        private double _float_pandl;
        /// <summary>
        /// 浮动盈亏
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
    }

    public class rptL_3_23_Info : ObservableObject
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

        private String _pd_name;
        /// <summary>
        /// 产品名称
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
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

        private double _stock_asset_value;
        /// <summary>
        /// 证券市值
        /// </summary>
        public double stock_asset_value
        {
            get { return _stock_asset_value; }

            set
            {
                _stock_asset_value = value;
                RaisePropertyChanged(() => stock_asset_value);
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

        private double _cost_amt;
        /// <summary>
        /// 成本金额
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

        private double _float_pandl;
        /// <summary>
        /// 浮动盈亏
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
    }

    public class rptL_3_24_Info : ObservableObject
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

        private String _pd_name;
        /// <summary>
        /// 产品名称
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
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

        private double _stock_asset_value;
        /// <summary>
        /// 证券市值
        /// </summary>
        public double stock_asset_value
        {
            get { return _stock_asset_value; }

            set
            {
                _stock_asset_value = value;
                RaisePropertyChanged(() => stock_asset_value);
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

        private double _cost_amt;
        /// <summary>
        /// 成本金额
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

        private double _float_pandl;
        /// <summary>
        /// 浮动盈亏
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
    }

    public class rptL_3_25_Info : ObservableObject
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

        private String _pd_name;
        /// <summary>
        /// 产品名称
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
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

        private double _stock_asset_value;
        /// <summary>
        /// 证券市值
        /// </summary>
        public double stock_asset_value
        {
            get { return _stock_asset_value; }

            set
            {
                _stock_asset_value = value;
                RaisePropertyChanged(() => stock_asset_value);
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

        private double _cost_amt;
        /// <summary>
        /// 成本金额
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

        private double _float_pandl;
        /// <summary>
        /// 浮动盈亏
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
    }

    public class rptL_3_26_Info : ObservableObject
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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
        /// 产品名称
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

        private String _bond_code;
        /// <summary>
        /// 债券代码
        /// </summary>
        public String bond_code
        {
            get { return _bond_code; }

            set
            {
                _bond_code = value;
                RaisePropertyChanged(() => bond_code);
            }
        }

        private String _stock_name;
        /// <summary>
        /// 证券名称
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

        private double _last_price;
        /// <summary>
        /// 最新价
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

        private double _stock_asset_value;
        /// <summary>
        /// 证券市值
        /// </summary>
        public double stock_asset_value
        {
            get { return _stock_asset_value; }

            set
            {
                _stock_asset_value = value;
                RaisePropertyChanged(() => stock_asset_value);
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

        private String _rating_agency;
        /// <summary>
        /// 评级机构
        /// </summary>
        public String rating_agency
        {
            get { return _rating_agency; }

            set
            {
                _rating_agency = value;
                RaisePropertyChanged(() => rating_agency);
            }
        }

        private int _bond_level;
        /// <summary>
        /// 债券等级
        /// </summary>
        public int bond_level
        {
            get { return _bond_level; }

            set
            {
                _bond_level = value;
                RaisePropertyChanged(() => bond_level);
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

        private double _value_dirty_price;
        /// <summary>
        /// 估价全价
        /// </summary>
        public double value_dirty_price
        {
            get { return _value_dirty_price; }

            set
            {
                _value_dirty_price = value;
                RaisePropertyChanged(() => value_dirty_price);
            }
        }

        private double _value_net_price;
        /// <summary>
        /// 估价净价
        /// </summary>
        public double value_net_price
        {
            get { return _value_net_price; }

            set
            {
                _value_net_price = value;
                RaisePropertyChanged(() => value_net_price);
            }
        }

        private double _value_price_yield;
        /// <summary>
        /// 估价收益率
        /// </summary>
        public double value_price_yield
        {
            get { return _value_price_yield; }

            set
            {
                _value_price_yield = value;
                RaisePropertyChanged(() => value_price_yield);
            }
        }

        private double _value_price_modi_dur;
        /// <summary>
        /// 估价修正久期
        /// </summary>
        public double value_price_modi_dur
        {
            get { return _value_price_modi_dur; }

            set
            {
                _value_price_modi_dur = value;
                RaisePropertyChanged(() => value_price_modi_dur);
            }
        }

        private double _value_price_conve;
        /// <summary>
        /// 估价凸性
        /// </summary>
        public double value_price_conve
        {
            get { return _value_price_conve; }

            set
            {
                _value_price_conve = value;
                RaisePropertyChanged(() => value_price_conve);
            }
        }

        private double _value_price_point_value;
        /// <summary>
        /// 估价基点价值
        /// </summary>
        public double value_price_point_value
        {
            get { return _value_price_point_value; }

            set
            {
                _value_price_point_value = value;
                RaisePropertyChanged(() => value_price_point_value);
            }
        }

        private double _value_price_intrst_dur;
        /// <summary>
        /// 估价利率久期
        /// </summary>
        public double value_price_intrst_dur
        {
            get { return _value_price_intrst_dur; }

            set
            {
                _value_price_intrst_dur = value;
                RaisePropertyChanged(() => value_price_intrst_dur);
            }
        }

        private double _value_price_intrst_conve;
        /// <summary>
        /// 估价利率凸性
        /// </summary>
        public double value_price_intrst_conve
        {
            get { return _value_price_intrst_conve; }

            set
            {
                _value_price_intrst_conve = value;
                RaisePropertyChanged(() => value_price_intrst_conve);
            }
        }

        private double _value_price_spread_dur;
        /// <summary>
        /// 估价利差久期
        /// </summary>
        public double value_price_spread_dur
        {
            get { return _value_price_spread_dur; }

            set
            {
                _value_price_spread_dur = value;
                RaisePropertyChanged(() => value_price_spread_dur);
            }
        }

        private double _value_price_spread_Conve;
        /// <summary>
        /// 估价利差凸性
        /// </summary>
        public double value_price_spread_Conve
        {
            get { return _value_price_spread_Conve; }

            set
            {
                _value_price_spread_Conve = value;
                RaisePropertyChanged(() => value_price_spread_Conve);
            }
        }

        private double _true_dirty_price;
        /// <summary>
        /// 加权平均结算全价
        /// </summary>
        public double true_dirty_price
        {
            get { return _true_dirty_price; }

            set
            {
                _true_dirty_price = value;
                RaisePropertyChanged(() => true_dirty_price);
            }
        }

        private double _true_net_price;
        /// <summary>
        /// 加权平均结算净价
        /// </summary>
        public double true_net_price
        {
            get { return _true_net_price; }

            set
            {
                _true_net_price = value;
                RaisePropertyChanged(() => true_net_price);
            }
        }

        private double _true_yield;
        /// <summary>
        /// 加权平均结算价收益率
        /// </summary>
        public double true_yield
        {
            get { return _true_yield; }

            set
            {
                _true_yield = value;
                RaisePropertyChanged(() => true_yield);
            }
        }

        private double _true_remain_limit;
        /// <summary>
        /// 实际待偿期
        /// </summary>
        public double true_remain_limit
        {
            get { return _true_remain_limit; }

            set
            {
                _true_remain_limit = value;
                RaisePropertyChanged(() => true_remain_limit);
            }
        }

        private double _true_avg_modi_dur;
        /// <summary>
        /// 加权平均结算价修正久期
        /// </summary>
        public double true_avg_modi_dur
        {
            get { return _true_avg_modi_dur; }

            set
            {
                _true_avg_modi_dur = value;
                RaisePropertyChanged(() => true_avg_modi_dur);
            }
        }

        private double _true_conve;
        /// <summary>
        /// 加权平均结算价凸性
        /// </summary>
        public double true_conve
        {
            get { return _true_conve; }

            set
            {
                _true_conve = value;
                RaisePropertyChanged(() => true_conve);
            }
        }

        private double _true_point_value;
        /// <summary>
        /// 加权平均结算价基点价值
        /// </summary>
        public double true_point_value
        {
            get { return _true_point_value; }

            set
            {
                _true_point_value = value;
                RaisePropertyChanged(() => true_point_value);
            }
        }

        private double _true_intrst_dur;
        /// <summary>
        /// 加权平均结算价利率久期
        /// </summary>
        public double true_intrst_dur
        {
            get { return _true_intrst_dur; }

            set
            {
                _true_intrst_dur = value;
                RaisePropertyChanged(() => true_intrst_dur);
            }
        }

        private double _true_intrst_conve;
        /// <summary>
        /// 加权平均结算价利率凸性
        /// </summary>
        public double true_intrst_conve
        {
            get { return _true_intrst_conve; }

            set
            {
                _true_intrst_conve = value;
                RaisePropertyChanged(() => true_intrst_conve);
            }
        }

        private double _true_spread_dur;
        /// <summary>
        /// 加权平均结算价利差久期
        /// </summary>
        public double true_spread_dur
        {
            get { return _true_spread_dur; }

            set
            {
                _true_spread_dur = value;
                RaisePropertyChanged(() => true_spread_dur);
            }
        }

        private double _true_spread_conve;
        /// <summary>
        /// 加权平均结算价利差凸性
        /// </summary>
        public double true_spread_conve
        {
            get { return _true_spread_conve; }

            set
            {
                _true_spread_conve = value;
                RaisePropertyChanged(() => true_spread_conve);
            }
        }

        private double _abs_liq_coeffi;
        /// <summary>
        /// 绝对流动性系数
        /// </summary>
        public double abs_liq_coeffi
        {
            get { return _abs_liq_coeffi; }

            set
            {
                _abs_liq_coeffi = value;
                RaisePropertyChanged(() => abs_liq_coeffi);
            }
        }

        private double _pstion_per;
        /// <summary>
        /// 位置百分比
        /// </summary>
        public double pstion_per
        {
            get { return _pstion_per; }

            set
            {
                _pstion_per = value;
                RaisePropertyChanged(() => pstion_per);
            }
        }

        private double _rela_liq_coeffi;
        /// <summary>
        /// 相对流动性系数
        /// </summary>
        public double rela_liq_coeffi
        {
            get { return _rela_liq_coeffi; }

            set
            {
                _rela_liq_coeffi = value;
                RaisePropertyChanged(() => rela_liq_coeffi);
            }
        }

        private double _rela_liq_num;
        /// <summary>
        /// 相对流动性取值
        /// </summary>
        public double rela_liq_num
        {
            get { return _rela_liq_num; }

            set
            {
                _rela_liq_num = value;
                RaisePropertyChanged(() => rela_liq_num);
            }
        }

        private double _sett_value_dirty_rice;
        /// <summary>
        /// 日终估价全价
        /// </summary>
        public double sett_value_dirty_rice
        {
            get { return _sett_value_dirty_rice; }

            set
            {
                _sett_value_dirty_rice = value;
                RaisePropertyChanged(() => sett_value_dirty_rice);
            }
        }

        private double _sett_accr_intrst;
        /// <summary>
        /// 日终应计利息
        /// </summary>
        public double sett_accr_intrst
        {
            get { return _sett_accr_intrst; }

            set
            {
                _sett_accr_intrst = value;
                RaisePropertyChanged(() => sett_accr_intrst);
            }
        }

        private double _remain_capit;
        /// <summary>
        /// 剩余本金
        /// </summary>
        public double remain_capit
        {
            get { return _remain_capit; }

            set
            {
                _remain_capit = value;
                RaisePropertyChanged(() => remain_capit);
            }
        }

        private double _point_spread_yield;
        /// <summary>
        /// 点差收益率
        /// </summary>
        public double point_spread_yield
        {
            get { return _point_spread_yield; }

            set
            {
                _point_spread_yield = value;
                RaisePropertyChanged(() => point_spread_yield);
            }
        }
    }

    public class rptL_3_27_Info : ObservableObject
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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
        /// 产品名称
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

        private int _end_date;
        /// <summary>
        /// 结束日期
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

        private String _first_indu_code;
        /// <summary>
        /// 一级行业代码
        /// </summary>
        public String first_indu_code
        {
            get { return _first_indu_code; }

            set
            {
                _first_indu_code = value;
                RaisePropertyChanged(() => first_indu_code);
            }
        }

        private double _end_date_weight;
        /// <summary>
        /// 结束日权重
        /// </summary>
        public double end_date_weight
        {
            get { return _end_date_weight; }

            set
            {
                _end_date_weight = value;
                RaisePropertyChanged(() => end_date_weight);
            }
        }

        private double _end_date_revenue;
        /// <summary>
        /// 结束日回报
        /// </summary>
        public double end_date_revenue
        {
            get { return _end_date_revenue; }

            set
            {
                _end_date_revenue = value;
                RaisePropertyChanged(() => end_date_revenue);
            }
        }

        private double _clean_price_profit;
        /// <summary>
        /// 净价盈亏
        /// </summary>
        public double clean_price_profit
        {
            get { return _clean_price_profit; }

            set
            {
                _clean_price_profit = value;
                RaisePropertyChanged(() => clean_price_profit);
            }
        }

        private double _clean_price_revenue;
        /// <summary>
        /// 净价总回报
        /// </summary>
        public double clean_price_revenue
        {
            get { return _clean_price_revenue; }

            set
            {
                _clean_price_revenue = value;
                RaisePropertyChanged(() => clean_price_revenue);
            }
        }

        private double _total_return;
        /// <summary>
        /// 总回报
        /// </summary>
        public double total_return
        {
            get { return _total_return; }

            set
            {
                _total_return = value;
                RaisePropertyChanged(() => total_return);
            }
        }

        private double _interest_revenue_total;
        /// <summary>
        /// 利息总收入
        /// </summary>
        public double interest_revenue_total
        {
            get { return _interest_revenue_total; }

            set
            {
                _interest_revenue_total = value;
                RaisePropertyChanged(() => interest_revenue_total);
            }
        }

        private double _face_value;
        /// <summary>
        /// 面额
        /// </summary>
        public double face_value
        {
            get { return _face_value; }

            set
            {
                _face_value = value;
                RaisePropertyChanged(() => face_value);
            }
        }

        private double _clean_price_market_value;
        /// <summary>
        /// 净价市值
        /// </summary>
        public double clean_price_market_value
        {
            get { return _clean_price_market_value; }

            set
            {
                _clean_price_market_value = value;
                RaisePropertyChanged(() => clean_price_market_value);
            }
        }

        private double _dirty_price_market_value;
        /// <summary>
        /// 全价市值
        /// </summary>
        public double dirty_price_market_value
        {
            get { return _dirty_price_market_value; }

            set
            {
                _dirty_price_market_value = value;
                RaisePropertyChanged(() => dirty_price_market_value);
            }
        }
    }

    public class rptL_3_29_Info : ObservableObject
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

        private String _pd_name;
        /// <summary>
        /// 产品名称
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
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

        private double _stock_asset_value;
        /// <summary>
        /// 证券市值
        /// </summary>
        public double stock_asset_value
        {
            get { return _stock_asset_value; }

            set
            {
                _stock_asset_value = value;
                RaisePropertyChanged(() => stock_asset_value);
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

        private double _cost_amt;
        /// <summary>
        /// 成本金额
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

        private double _float_pandl;
        /// <summary>
        /// 浮动盈亏
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
    }

    public class rptL_3_30_Info : ObservableObject
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

        private String _pd_name;
        /// <summary>
        /// 产品名称
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
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

        private double _stock_asset_value;
        /// <summary>
        /// 证券市值
        /// </summary>
        public double stock_asset_value
        {
            get { return _stock_asset_value; }

            set
            {
                _stock_asset_value = value;
                RaisePropertyChanged(() => stock_asset_value);
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

        private double _cost_amt;
        /// <summary>
        /// 成本金额
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

        private double _float_pandl;
        /// <summary>
        /// 浮动盈亏
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
    }

    public class rptL_3_31_Info : ObservableObject
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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
        /// 产品名称
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

        private ulong _product_id;
        /// <summary>
        /// 产品序号
        /// </summary>
        public ulong product_id
        {
            get { return _product_id; }

            set
            {
                _product_id = value;
                RaisePropertyChanged(() => product_id);
            }
        }

        private String _contrc_name;
        /// <summary>
        /// 合约名称
        /// </summary>
        public String contrc_name
        {
            get { return _contrc_name; }

            set
            {
                _contrc_name = value;
                RaisePropertyChanged(() => contrc_name);
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

        private double _posi_market_value;
        /// <summary>
        /// 持仓市值
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

        private String _asset_acco;
        /// <summary>
        /// 资产账户
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

        private double _frozen_qty;
        /// <summary>
        /// 冻结数量
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
        /// 解冻数量
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
        /// 买入待交割数量
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
        /// 卖出待交割数量
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

        private double _avail_qty;
        /// <summary>
        /// 可用数量
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
    }

    public class rptL_3_32_Info : ObservableObject
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

        private ulong _product_id;
        /// <summary>
        /// 产品序号
        /// </summary>
        public ulong product_id
        {
            get { return _product_id; }

            set
            {
                _product_id = value;
                RaisePropertyChanged(() => product_id);
            }
        }

        private String _pd_code;
        /// <summary>
        /// 产品编码
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
        /// 产品名称
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

        private String _asset_acco;
        /// <summary>
        /// 资产账户
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

        private double _open_posi_qty;
        /// <summary>
        /// 开仓数量
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

        private double _marked_sett_price;
        /// <summary>
        /// 盯市结算价格
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
        /// 盯市盈亏
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
    }

    public class rptL_3_34_Info : ObservableObject
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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
        /// 产品名称
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

        private double _unit_nav;
        /// <summary>
        /// 单位净值
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

        private double _nav_asset;
        /// <summary>
        /// 净资产
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

        private double _fund_share_total;
        /// <summary>
        /// 基金份额总额
        /// </summary>
        public double fund_share_total
        {
            get { return _fund_share_total; }

            set
            {
                _fund_share_total = value;
                RaisePropertyChanged(() => fund_share_total);
            }
        }

        private double _daily_pandl_ratio;
        /// <summary>
        /// 当日收益率
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

        private double _total_realize_pandl_ratio_year;
        /// <summary>
        /// 累计年化收益率
        /// </summary>
        public double total_realize_pandl_ratio_year
        {
            get { return _total_realize_pandl_ratio_year; }

            set
            {
                _total_realize_pandl_ratio_year = value;
                RaisePropertyChanged(() => total_realize_pandl_ratio_year);
            }
        }

        private String _fund_manager;
        /// <summary>
        /// 基金管理人
        /// </summary>
        public String fund_manager
        {
            get { return _fund_manager; }

            set
            {
                _fund_manager = value;
                RaisePropertyChanged(() => fund_manager);
            }
        }

        private double _standard_return;
        /// <summary>
        /// 基准回报
        /// </summary>
        public double standard_return
        {
            get { return _standard_return; }

            set
            {
                _standard_return = value;
                RaisePropertyChanged(() => standard_return);
            }
        }

        private double _cmp_product_return_rate;
        /// <summary>
        /// 相对回报
        /// </summary>
        public double cmp_product_return_rate
        {
            get { return _cmp_product_return_rate; }

            set
            {
                _cmp_product_return_rate = value;
                RaisePropertyChanged(() => cmp_product_return_rate);
            }
        }

        private int _trade_days;
        /// <summary>
        /// 交易日数
        /// </summary>
        public int trade_days
        {
            get { return _trade_days; }

            set
            {
                _trade_days = value;
                RaisePropertyChanged(() => trade_days);
            }
        }

        private double _excess_earning_year;
        /// <summary>
        /// 超额年化收益
        /// </summary>
        public double excess_earning_year
        {
            get { return _excess_earning_year; }

            set
            {
                _excess_earning_year = value;
                RaisePropertyChanged(() => excess_earning_year);
            }
        }

        private double _annual_yield;
        /// <summary>
        /// 年化收益率
        /// </summary>
        public double annual_yield
        {
            get { return _annual_yield; }

            set
            {
                _annual_yield = value;
                RaisePropertyChanged(() => annual_yield);
            }
        }

        private double _max_retracement;
        /// <summary>
        /// 最大回撤
        /// </summary>
        public double max_retracement
        {
            get { return _max_retracement; }

            set
            {
                _max_retracement = value;
                RaisePropertyChanged(() => max_retracement);
            }
        }

        private double _max_rise_range;
        /// <summary>
        /// 最大上涨
        /// </summary>
        public double max_rise_range
        {
            get { return _max_rise_range; }

            set
            {
                _max_rise_range = value;
                RaisePropertyChanged(() => max_rise_range);
            }
        }

        private double _volatility;
        /// <summary>
        /// 波动率
        /// </summary>
        public double volatility
        {
            get { return _volatility; }

            set
            {
                _volatility = value;
                RaisePropertyChanged(() => volatility);
            }
        }

        private double _volatility_yearly;
        /// <summary>
        /// 年化波动率
        /// </summary>
        public double volatility_yearly
        {
            get { return _volatility_yearly; }

            set
            {
                _volatility_yearly = value;
                RaisePropertyChanged(() => volatility_yearly);
            }
        }

        private double _sharpe_ration;
        /// <summary>
        /// 夏普比率
        /// </summary>
        public double sharpe_ration
        {
            get { return _sharpe_ration; }

            set
            {
                _sharpe_ration = value;
                RaisePropertyChanged(() => sharpe_ration);
            }
        }

        private double _down_risk;
        /// <summary>
        /// 下行风险
        /// </summary>
        public double down_risk
        {
            get { return _down_risk; }

            set
            {
                _down_risk = value;
                RaisePropertyChanged(() => down_risk);
            }
        }

        private double _sortino_ratio;
        /// <summary>
        /// Sortino比率
        /// </summary>
        public double sortino_ratio
        {
            get { return _sortino_ratio; }

            set
            {
                _sortino_ratio = value;
                RaisePropertyChanged(() => sortino_ratio);
            }
        }

        private double _jensen_index;
        /// <summary>
        /// 詹森指数
        /// </summary>
        public double jensen_index
        {
            get { return _jensen_index; }

            set
            {
                _jensen_index = value;
                RaisePropertyChanged(() => jensen_index);
            }
        }

        private double _beta_ratio;
        /// <summary>
        /// Beta
        /// </summary>
        public double beta_ratio
        {
            get { return _beta_ratio; }

            set
            {
                _beta_ratio = value;
                RaisePropertyChanged(() => beta_ratio);
            }
        }

        private double _info_ratio;
        /// <summary>
        /// 信息比率
        /// </summary>
        public double info_ratio
        {
            get { return _info_ratio; }

            set
            {
                _info_ratio = value;
                RaisePropertyChanged(() => info_ratio);
            }
        }

        private double _kamabi;
        /// <summary>
        /// 卡马比
        /// </summary>
        public double kamabi
        {
            get { return _kamabi; }

            set
            {
                _kamabi = value;
                RaisePropertyChanged(() => kamabi);
            }
        }

        private double _timing_ability;
        /// <summary>
        /// 择时能力
        /// </summary>
        public double timing_ability
        {
            get { return _timing_ability; }

            set
            {
                _timing_ability = value;
                RaisePropertyChanged(() => timing_ability);
            }
        }

        private double _stock_selection_ability;
        /// <summary>
        /// 选股能力
        /// </summary>
        public double stock_selection_ability
        {
            get { return _stock_selection_ability; }

            set
            {
                _stock_selection_ability = value;
                RaisePropertyChanged(() => stock_selection_ability);
            }
        }
    }

    public class rptL_3_35_Info : ObservableObject
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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
        /// 产品名称
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

        private String _fund_manager;
        /// <summary>
        /// 基金管理人
        /// </summary>
        public String fund_manager
        {
            get { return _fund_manager; }

            set
            {
                _fund_manager = value;
                RaisePropertyChanged(() => fund_manager);
            }
        }

        private double _annual_yield;
        /// <summary>
        /// 年化收益率
        /// </summary>
        public double annual_yield
        {
            get { return _annual_yield; }

            set
            {
                _annual_yield = value;
                RaisePropertyChanged(() => annual_yield);
            }
        }

        private double _standard_return;
        /// <summary>
        /// 基准回报
        /// </summary>
        public double standard_return
        {
            get { return _standard_return; }

            set
            {
                _standard_return = value;
                RaisePropertyChanged(() => standard_return);
            }
        }

        private double _distributional_effect_rate;
        /// <summary>
        /// 分配效应
        /// </summary>
        public double distributional_effect_rate
        {
            get { return _distributional_effect_rate; }

            set
            {
                _distributional_effect_rate = value;
                RaisePropertyChanged(() => distributional_effect_rate);
            }
        }

        private double _selection_effect_rate;
        /// <summary>
        /// 选择效应
        /// </summary>
        public double selection_effect_rate
        {
            get { return _selection_effect_rate; }

            set
            {
                _selection_effect_rate = value;
                RaisePropertyChanged(() => selection_effect_rate);
            }
        }

        private double _interaction_effect_rate;
        /// <summary>
        /// 互动效应
        /// </summary>
        public double interaction_effect_rate
        {
            get { return _interaction_effect_rate; }

            set
            {
                _interaction_effect_rate = value;
                RaisePropertyChanged(() => interaction_effect_rate);
            }
        }

        private double _all_effect_rate;
        /// <summary>
        /// 全部效应
        /// </summary>
        public double all_effect_rate
        {
            get { return _all_effect_rate; }

            set
            {
                _all_effect_rate = value;
                RaisePropertyChanged(() => all_effect_rate);
            }
        }

        private double _cmp_product_return_rate;
        /// <summary>
        /// 相对回报
        /// </summary>
        public double cmp_product_return_rate
        {
            get { return _cmp_product_return_rate; }

            set
            {
                _cmp_product_return_rate = value;
                RaisePropertyChanged(() => cmp_product_return_rate);
            }
        }
    }

    public class rptL_3_36_Info : ObservableObject
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

        private int _begin_date;
        /// <summary>
        /// 开始日期
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
        /// 结束日期
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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
        /// 产品名称
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

        private int _trade_stock_cnt;
        /// <summary>
        /// 交易个股数
        /// </summary>
        public int trade_stock_cnt
        {
            get { return _trade_stock_cnt; }

            set
            {
                _trade_stock_cnt = value;
                RaisePropertyChanged(() => trade_stock_cnt);
            }
        }

        private double _profit_total;
        /// <summary>
        /// 总盈利
        /// </summary>
        public double profit_total
        {
            get { return _profit_total; }

            set
            {
                _profit_total = value;
                RaisePropertyChanged(() => profit_total);
            }
        }

        private int _profit_stock_cnt;
        /// <summary>
        /// 盈利数
        /// </summary>
        public int profit_stock_cnt
        {
            get { return _profit_stock_cnt; }

            set
            {
                _profit_stock_cnt = value;
                RaisePropertyChanged(() => profit_stock_cnt);
            }
        }

        private int _loss_stock_cnt;
        /// <summary>
        /// 亏损数
        /// </summary>
        public int loss_stock_cnt
        {
            get { return _loss_stock_cnt; }

            set
            {
                _loss_stock_cnt = value;
                RaisePropertyChanged(() => loss_stock_cnt);
            }
        }

        private double _profit_balance;
        /// <summary>
        /// 盈利金额
        /// </summary>
        public double profit_balance
        {
            get { return _profit_balance; }

            set
            {
                _profit_balance = value;
                RaisePropertyChanged(() => profit_balance);
            }
        }

        private double _loss_balance;
        /// <summary>
        /// 亏损金额
        /// </summary>
        public double loss_balance
        {
            get { return _loss_balance; }

            set
            {
                _loss_balance = value;
                RaisePropertyChanged(() => loss_balance);
            }
        }

        private double _win_rate;
        /// <summary>
        /// 胜率
        /// </summary>
        public double win_rate
        {
            get { return _win_rate; }

            set
            {
                _win_rate = value;
                RaisePropertyChanged(() => win_rate);
            }
        }

        private double _profit_loss_ratio;
        /// <summary>
        /// 盈亏比
        /// </summary>
        public double profit_loss_ratio
        {
            get { return _profit_loss_ratio; }

            set
            {
                _profit_loss_ratio = value;
                RaisePropertyChanged(() => profit_loss_ratio);
            }
        }

        private double _max_stock_10_ratio;
        /// <summary>
        /// 前10大股票市值占比
        /// </summary>
        public double max_stock_10_ratio
        {
            get { return _max_stock_10_ratio; }

            set
            {
                _max_stock_10_ratio = value;
                RaisePropertyChanged(() => max_stock_10_ratio);
            }
        }

        private int _max_stock_10_avg_days;
        /// <summary>
        /// 前10大平均持仓时间
        /// </summary>
        public int max_stock_10_avg_days
        {
            get { return _max_stock_10_avg_days; }

            set
            {
                _max_stock_10_avg_days = value;
                RaisePropertyChanged(() => max_stock_10_avg_days);
            }
        }

        private double _tnover_rate;
        /// <summary>
        /// 换手率
        /// </summary>
        public double tnover_rate
        {
            get { return _tnover_rate; }

            set
            {
                _tnover_rate = value;
                RaisePropertyChanged(() => tnover_rate);
            }
        }
    }

    public class rptL_3_37_Info : ObservableObject
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

        private int _curr_month;
        /// <summary>
        /// 当前月份
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

        private int _trade_days;
        /// <summary>
        /// 交易日数
        /// </summary>
        public int trade_days
        {
            get { return _trade_days; }

            set
            {
                _trade_days = value;
                RaisePropertyChanged(() => trade_days);
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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
        /// 产品名称
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

        private String _bond_code;
        /// <summary>
        /// 债券代码
        /// </summary>
        public String bond_code
        {
            get { return _bond_code; }

            set
            {
                _bond_code = value;
                RaisePropertyChanged(() => bond_code);
            }
        }

        private String _stock_name;
        /// <summary>
        /// 证券名称
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

        private double _intrst_ratio;
        /// <summary>
        /// 年利率
        /// </summary>
        public double intrst_ratio
        {
            get { return _intrst_ratio; }

            set
            {
                _intrst_ratio = value;
                RaisePropertyChanged(() => intrst_ratio);
            }
        }

        private int _begin_date;
        /// <summary>
        /// 开始日期
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

        private double _begin_value;
        /// <summary>
        /// 期初估值
        /// </summary>
        public double begin_value
        {
            get { return _begin_value; }

            set
            {
                _begin_value = value;
                RaisePropertyChanged(() => begin_value);
            }
        }

        private double _begin_net_price;
        /// <summary>
        /// 期初净价
        /// </summary>
        public double begin_net_price
        {
            get { return _begin_net_price; }

            set
            {
                _begin_net_price = value;
                RaisePropertyChanged(() => begin_net_price);
            }
        }

        private double _begin_full_price;
        /// <summary>
        /// 期初全价
        /// </summary>
        public double begin_full_price
        {
            get { return _begin_full_price; }

            set
            {
                _begin_full_price = value;
                RaisePropertyChanged(() => begin_full_price);
            }
        }

        private int _end_date;
        /// <summary>
        /// 结束日期
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

        private double _end_value;
        /// <summary>
        /// 期末估值
        /// </summary>
        public double end_value
        {
            get { return _end_value; }

            set
            {
                _end_value = value;
                RaisePropertyChanged(() => end_value);
            }
        }

        private double _end_net_price;
        /// <summary>
        /// 期末净价
        /// </summary>
        public double end_net_price
        {
            get { return _end_net_price; }

            set
            {
                _end_net_price = value;
                RaisePropertyChanged(() => end_net_price);
            }
        }

        private double _end_full_price;
        /// <summary>
        /// 期末全价
        /// </summary>
        public double end_full_price
        {
            get { return _end_full_price; }

            set
            {
                _end_full_price = value;
                RaisePropertyChanged(() => end_full_price);
            }
        }

        private double _pay_interest_term;
        /// <summary>
        /// 期间发放利息
        /// </summary>
        public double pay_interest_term
        {
            get { return _pay_interest_term; }

            set
            {
                _pay_interest_term = value;
                RaisePropertyChanged(() => pay_interest_term);
            }
        }

        private double _profit_from_capital;
        /// <summary>
        /// 资本利得
        /// </summary>
        public double profit_from_capital
        {
            get { return _profit_from_capital; }

            set
            {
                _profit_from_capital = value;
                RaisePropertyChanged(() => profit_from_capital);
            }
        }

        private double _coupon_yield;
        /// <summary>
        /// 票息收益
        /// </summary>
        public double coupon_yield
        {
            get { return _coupon_yield; }

            set
            {
                _coupon_yield = value;
                RaisePropertyChanged(() => coupon_yield);
            }
        }

        private double _cb_profit;
        /// <summary>
        /// 中债收益
        /// </summary>
        public double cb_profit
        {
            get { return _cb_profit; }

            set
            {
                _cb_profit = value;
                RaisePropertyChanged(() => cb_profit);
            }
        }

        private int _bond_kind;
        /// <summary>
        /// 债券品种
        /// </summary>
        public int bond_kind
        {
            get { return _bond_kind; }

            set
            {
                _bond_kind = value;
                RaisePropertyChanged(() => bond_kind);
            }
        }

        private double _recover_capital;
        /// <summary>
        /// 发放本金
        /// </summary>
        public double recover_capital
        {
            get { return _recover_capital; }

            set
            {
                _recover_capital = value;
                RaisePropertyChanged(() => recover_capital);
            }
        }

        private double _value_price_modi_dur;
        /// <summary>
        /// 估价修正久期
        /// </summary>
        public double value_price_modi_dur
        {
            get { return _value_price_modi_dur; }

            set
            {
                _value_price_modi_dur = value;
                RaisePropertyChanged(() => value_price_modi_dur);
            }
        }
    }

    public class rptL_3_38_Info : ObservableObject
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

        private int _curr_month;
        /// <summary>
        /// 当前月份
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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
        /// 产品名称
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

        private String _bond_code;
        /// <summary>
        /// 债券代码
        /// </summary>
        public String bond_code
        {
            get { return _bond_code; }

            set
            {
                _bond_code = value;
                RaisePropertyChanged(() => bond_code);
            }
        }

        private String _stock_name;
        /// <summary>
        /// 证券名称
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

        private int _trade_date;
        /// <summary>
        /// 交易日期
        /// </summary>
        public int trade_date
        {
            get { return _trade_date; }

            set
            {
                _trade_date = value;
                RaisePropertyChanged(() => trade_date);
            }
        }

        private String _bank_ib_member;
        /// <summary>
        /// 交易对手
        /// </summary>
        public String bank_ib_member
        {
            get { return _bank_ib_member; }

            set
            {
                _bank_ib_member = value;
                RaisePropertyChanged(() => bank_ib_member);
            }
        }

        private double _value_yield;
        /// <summary>
        /// 估值收益率
        /// </summary>
        public double value_yield
        {
            get { return _value_yield; }

            set
            {
                _value_yield = value;
                RaisePropertyChanged(() => value_yield);
            }
        }

        private double _value_net_price;
        /// <summary>
        /// 估价净价
        /// </summary>
        public double value_net_price
        {
            get { return _value_net_price; }

            set
            {
                _value_net_price = value;
                RaisePropertyChanged(() => value_net_price);
            }
        }

        private double _trade_yield;
        /// <summary>
        /// 交易收益率
        /// </summary>
        public double trade_yield
        {
            get { return _trade_yield; }

            set
            {
                _trade_yield = value;
                RaisePropertyChanged(() => trade_yield);
            }
        }

        private double _trade_net_price;
        /// <summary>
        /// 交易净价
        /// </summary>
        public double trade_net_price
        {
            get { return _trade_net_price; }

            set
            {
                _trade_net_price = value;
                RaisePropertyChanged(() => trade_net_price);
            }
        }

        private double _profit;
        /// <summary>
        /// 收益
        /// </summary>
        public double profit
        {
            get { return _profit; }

            set
            {
                _profit = value;
                RaisePropertyChanged(() => profit);
            }
        }

        private int _bond_kind;
        /// <summary>
        /// 债券品种
        /// </summary>
        public int bond_kind
        {
            get { return _bond_kind; }

            set
            {
                _bond_kind = value;
                RaisePropertyChanged(() => bond_kind);
            }
        }
    }

    public class rptL_3_39_Info : ObservableObject
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

        private int _curr_month;
        /// <summary>
        /// 当前月份
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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
        /// 产品名称
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

        private String _bond_code;
        /// <summary>
        /// 债券代码
        /// </summary>
        public String bond_code
        {
            get { return _bond_code; }

            set
            {
                _bond_code = value;
                RaisePropertyChanged(() => bond_code);
            }
        }

        private String _stock_name;
        /// <summary>
        /// 证券名称
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

        private int _bond_type;
        /// <summary>
        /// 债券类型
        /// </summary>
        public int bond_type
        {
            get { return _bond_type; }

            set
            {
                _bond_type = value;
                RaisePropertyChanged(() => bond_type);
            }
        }

        private double _avg_invest_ratio;
        /// <summary>
        /// 平均投资比例
        /// </summary>
        public double avg_invest_ratio
        {
            get { return _avg_invest_ratio; }

            set
            {
                _avg_invest_ratio = value;
                RaisePropertyChanged(() => avg_invest_ratio);
            }
        }

        private double _avg_yield;
        /// <summary>
        /// 平均收益率
        /// </summary>
        public double avg_yield
        {
            get { return _avg_yield; }

            set
            {
                _avg_yield = value;
                RaisePropertyChanged(() => avg_yield);
            }
        }

        private double _yield_ratio;
        /// <summary>
        /// 收益率贡献
        /// </summary>
        public double yield_ratio
        {
            get { return _yield_ratio; }

            set
            {
                _yield_ratio = value;
                RaisePropertyChanged(() => yield_ratio);
            }
        }

        private double _holder_profit;
        /// <summary>
        /// 持仓盈亏
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

        private double _trade_profit;
        /// <summary>
        /// 交易盈亏
        /// </summary>
        public double trade_profit
        {
            get { return _trade_profit; }

            set
            {
                _trade_profit = value;
                RaisePropertyChanged(() => trade_profit);
            }
        }

        private double _total_profit;
        /// <summary>
        /// 合计盈亏
        /// </summary>
        public double total_profit
        {
            get { return _total_profit; }

            set
            {
                _total_profit = value;
                RaisePropertyChanged(() => total_profit);
            }
        }

        private double _bond_cr_level;
        /// <summary>
        /// 债项评级
        /// </summary>
        public double bond_cr_level
        {
            get { return _bond_cr_level; }

            set
            {
                _bond_cr_level = value;
                RaisePropertyChanged(() => bond_cr_level);
            }
        }

        private double _rem_per;
        /// <summary>
        /// 剩余期限
        /// </summary>
        public double rem_per
        {
            get { return _rem_per; }

            set
            {
                _rem_per = value;
                RaisePropertyChanged(() => rem_per);
            }
        }

        private double _bond_limit;
        /// <summary>
        /// 债券期限
        /// </summary>
        public double bond_limit
        {
            get { return _bond_limit; }

            set
            {
                _bond_limit = value;
                RaisePropertyChanged(() => bond_limit);
            }
        }
    }

    public class rptL_3_40_Info : ObservableObject
    {

        private int _curr_month;
        /// <summary>
        /// 当前月份
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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
        /// 产品名称
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

        private double _begin_invest_ratio;
        /// <summary>
        /// 期初投资比例
        /// </summary>
        public double begin_invest_ratio
        {
            get { return _begin_invest_ratio; }

            set
            {
                _begin_invest_ratio = value;
                RaisePropertyChanged(() => begin_invest_ratio);
            }
        }

        private double _end_invest_ratio;
        /// <summary>
        /// 期末投资比例
        /// </summary>
        public double end_invest_ratio
        {
            get { return _end_invest_ratio; }

            set
            {
                _end_invest_ratio = value;
                RaisePropertyChanged(() => end_invest_ratio);
            }
        }

        private double _avg_invest_ratio;
        /// <summary>
        /// 平均投资比例
        /// </summary>
        public double avg_invest_ratio
        {
            get { return _avg_invest_ratio; }

            set
            {
                _avg_invest_ratio = value;
                RaisePropertyChanged(() => avg_invest_ratio);
            }
        }

        private double _return_on_investment;
        /// <summary>
        /// 平均投资收益率
        /// </summary>
        public double return_on_investment
        {
            get { return _return_on_investment; }

            set
            {
                _return_on_investment = value;
                RaisePropertyChanged(() => return_on_investment);
            }
        }

        private double _yield_ratio;
        /// <summary>
        /// 收益率贡献
        /// </summary>
        public double yield_ratio
        {
            get { return _yield_ratio; }

            set
            {
                _yield_ratio = value;
                RaisePropertyChanged(() => yield_ratio);
            }
        }

        private double _cmp_ytm;
        /// <summary>
        /// 基准收益率
        /// </summary>
        public double cmp_ytm
        {
            get { return _cmp_ytm; }

            set
            {
                _cmp_ytm = value;
                RaisePropertyChanged(() => cmp_ytm);
            }
        }

        private double _excess_earning_year;
        /// <summary>
        /// 超额年化收益
        /// </summary>
        public double excess_earning_year
        {
            get { return _excess_earning_year; }

            set
            {
                _excess_earning_year = value;
                RaisePropertyChanged(() => excess_earning_year);
            }
        }

        private double _begin_market_value;
        /// <summary>
        /// 期初市值
        /// </summary>
        public double begin_market_value
        {
            get { return _begin_market_value; }

            set
            {
                _begin_market_value = value;
                RaisePropertyChanged(() => begin_market_value);
            }
        }

        private double _end_market_value;
        /// <summary>
        /// 期末市值
        /// </summary>
        public double end_market_value
        {
            get { return _end_market_value; }

            set
            {
                _end_market_value = value;
                RaisePropertyChanged(() => end_market_value);
            }
        }

        private double _avg_market_value;
        /// <summary>
        /// 平均持仓
        /// </summary>
        public double avg_market_value
        {
            get { return _avg_market_value; }

            set
            {
                _avg_market_value = value;
                RaisePropertyChanged(() => avg_market_value);
            }
        }

        private double _holder_profit;
        /// <summary>
        /// 持仓盈亏
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

        private double _trade_profit;
        /// <summary>
        /// 交易盈亏
        /// </summary>
        public double trade_profit
        {
            get { return _trade_profit; }

            set
            {
                _trade_profit = value;
                RaisePropertyChanged(() => trade_profit);
            }
        }

        private double _total_profit;
        /// <summary>
        /// 合计盈亏
        /// </summary>
        public double total_profit
        {
            get { return _total_profit; }

            set
            {
                _total_profit = value;
                RaisePropertyChanged(() => total_profit);
            }
        }
    }

    public class rptL_3_61_Info : ObservableObject
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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
        /// 产品名称
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
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

        private double _stock_asset_value;
        /// <summary>
        /// 证券市值
        /// </summary>
        public double stock_asset_value
        {
            get { return _stock_asset_value; }

            set
            {
                _stock_asset_value = value;
                RaisePropertyChanged(() => stock_asset_value);
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

        private double _cost_amt;
        /// <summary>
        /// 成本金额
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

        private double _float_pandl;
        /// <summary>
        /// 浮动盈亏
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

        private double _weight_ratio;
        /// <summary>
        /// 权重比例
        /// </summary>
        public double weight_ratio
        {
            get { return _weight_ratio; }

            set
            {
                _weight_ratio = value;
                RaisePropertyChanged(() => weight_ratio);
            }
        }
    }

    public class rptL_3_62_Info : ObservableObject
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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
        /// 产品名称
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
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

        private double _order_frozen_amt;
        /// <summary>
        /// 订单冻结金额
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
    }

    public class rptL_3_63_Info : ObservableObject
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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
        /// 产品名称
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

        private double _order_frozen_amt;
        /// <summary>
        /// 订单冻结金额
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
    }

    public class rptL_3_64_Info : ObservableObject
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
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

        private double _order_frozen_amt;
        /// <summary>
        /// 订单冻结金额
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
    }

    public class rptL_3_66_Info : ObservableObject
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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
        /// 产品名称
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
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

        private double _today_buy_qty;
        /// <summary>
        /// 当日买入数量
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
        /// 当日卖出数量
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

        private double _today_close_price;
        /// <summary>
        /// 今收盘价
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
        /// 持仓市值
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

    public class rptL_3_67_Info : ObservableObject
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
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

        private double _today_buy_qty;
        /// <summary>
        /// 当日买入数量
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
        /// 当日卖出数量
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

        private double _today_close_price;
        /// <summary>
        /// 今收盘价
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
        /// 持仓市值
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
        /// 持仓净值占比
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

    public class rptL_3_68_Info : ObservableObject
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
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
        /// 产品名称
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
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

        private double _pre_holding_qty;
        /// <summary>
        /// 昨日持仓数量
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
        /// 当日买入数量
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
        /// 当日买入金额
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
        /// 当日买入价格
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
        /// 买入开始时间
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
        /// 买入结束时间
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
        /// 当日卖出数量
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
        /// 当日卖出金额
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
        /// 当日卖出价格
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
        /// 卖出开始时间
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
        /// 卖出结束时间
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

        private double _today_close_price;
        /// <summary>
        /// 今收盘价
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
        /// 持仓市值
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

    public class rptL_3_81_Info : ObservableObject
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

        private double _exch_group_pd_share;
        /// <summary>
        /// 交易组产品份额
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
        /// 单位净值
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
        /// 昨日净值
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

        private double _nav_asset;
        /// <summary>
        /// 净资产
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

        private double _nav_fluct;
        /// <summary>
        /// 净值波动
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

        private double _posi_ratio;
        /// <summary>
        /// 持股比例
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

        private double _securities_ratio;
        /// <summary>
        /// 证券占比
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

        private double _float_pandl;
        /// <summary>
        /// 浮动盈亏
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

        private double _total_divi_amt;
        /// <summary>
        /// 累计分红金额
        /// </summary>
        public double total_divi_amt
        {
            get { return _total_divi_amt; }

            set
            {
                _total_divi_amt = value;
                RaisePropertyChanged(() => total_divi_amt);
            }
        }

        private double _first_asset;
        /// <summary>
        /// 原始资产
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

        private int _strategy_type;
        /// <summary>
        /// 策略类型
        /// </summary>
        public int strategy_type
        {
            get { return _strategy_type; }

            set
            {
                _strategy_type = value;
                RaisePropertyChanged(() => strategy_type);
            }
        }

        private double _total_pre_fee;
        /// <summary>
        /// 累计计提费用
        /// </summary>
        public double total_pre_fee
        {
            get { return _total_pre_fee; }

            set
            {
                _total_pre_fee = value;
                RaisePropertyChanged(() => total_pre_fee);
            }
        }

        private double _posi_market_value;
        /// <summary>
        /// 持仓市值
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

        private double _cash_asset;
        /// <summary>
        /// 现金资产
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
        /// 股票资产
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
        /// 债券资产
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
        /// 基金资产
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
        /// 回购资产
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
        /// 其他资产
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

        private double _total_payab_amt;
        /// <summary>
        /// 累计应付金额
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
        /// 累计应收金额
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
    }

    public class rptL_3_82_Info : ObservableObject
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

        private double _posi_market_value;
        /// <summary>
        /// 持仓市值
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
    }

    public class rptL_3_83_Info : ObservableObject
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

        private double _posi_market_value;
        /// <summary>
        /// 持仓市值
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

        private double _posi_ratio;
        /// <summary>
        /// 持股比例
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

        private double _float_pandl;
        /// <summary>
        /// 浮动盈亏
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

        private double _cost_amt;
        /// <summary>
        /// 成本金额
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

        private double _last_price;
        /// <summary>
        /// 最新价
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

    public class rptL_3_101_Info : ObservableObject
    {

        private int _begin_date;
        /// <summary>
        /// 开始日期
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
        /// 结束日期
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

        private double _begin_close_price;
        /// <summary>
        /// 期初收盘价
        /// </summary>
        public double begin_close_price
        {
            get { return _begin_close_price; }

            set
            {
                _begin_close_price = value;
                RaisePropertyChanged(() => begin_close_price);
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

        private double _begin_cost_amt;
        /// <summary>
        /// 期初成本
        /// </summary>
        public double begin_cost_amt
        {
            get { return _begin_cost_amt; }

            set
            {
                _begin_cost_amt = value;
                RaisePropertyChanged(() => begin_cost_amt);
            }
        }

        private double _begin_posi_market_value;
        /// <summary>
        /// 期初持仓市值
        /// </summary>
        public double begin_posi_market_value
        {
            get { return _begin_posi_market_value; }

            set
            {
                _begin_posi_market_value = value;
                RaisePropertyChanged(() => begin_posi_market_value);
            }
        }

        private double _begin_realize_pandl;
        /// <summary>
        /// 期初实现盈亏
        /// </summary>
        public double begin_realize_pandl
        {
            get { return _begin_realize_pandl; }

            set
            {
                _begin_realize_pandl = value;
                RaisePropertyChanged(() => begin_realize_pandl);
            }
        }

        private double _end_close_price;
        /// <summary>
        /// 期末收盘价
        /// </summary>
        public double end_close_price
        {
            get { return _end_close_price; }

            set
            {
                _end_close_price = value;
                RaisePropertyChanged(() => end_close_price);
            }
        }

        private int _end_cur_qty;
        /// <summary>
        /// 期末数量
        /// </summary>
        public int end_cur_qty
        {
            get { return _end_cur_qty; }

            set
            {
                _end_cur_qty = value;
                RaisePropertyChanged(() => end_cur_qty);
            }
        }

        private double _end_cost_amt;
        /// <summary>
        /// 期末成本
        /// </summary>
        public double end_cost_amt
        {
            get { return _end_cost_amt; }

            set
            {
                _end_cost_amt = value;
                RaisePropertyChanged(() => end_cost_amt);
            }
        }

        private double _end_posi_market_value;
        /// <summary>
        /// 期末持仓市值
        /// </summary>
        public double end_posi_market_value
        {
            get { return _end_posi_market_value; }

            set
            {
                _end_posi_market_value = value;
                RaisePropertyChanged(() => end_posi_market_value);
            }
        }

        private double _end_realize_pandl;
        /// <summary>
        /// 期末实现盈亏
        /// </summary>
        public double end_realize_pandl
        {
            get { return _end_realize_pandl; }

            set
            {
                _end_realize_pandl = value;
                RaisePropertyChanged(() => end_realize_pandl);
            }
        }

        private double _float_pandl;
        /// <summary>
        /// 浮动盈亏
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

        private double _interval_realize_pandl;
        /// <summary>
        /// 区间实现盈亏
        /// </summary>
        public double interval_realize_pandl
        {
            get { return _interval_realize_pandl; }

            set
            {
                _interval_realize_pandl = value;
                RaisePropertyChanged(() => interval_realize_pandl);
            }
        }

        private double _interval_pandl;
        /// <summary>
        /// 区间盈亏
        /// </summary>
        public double interval_pandl
        {
            get { return _interval_pandl; }

            set
            {
                _interval_pandl = value;
                RaisePropertyChanged(() => interval_pandl);
            }
        }
    }

    public class rptL_3_102_Info : ObservableObject
    {

        private int _begin_date;
        /// <summary>
        /// 开始日期
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
        /// 结束日期
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

        private double _weight_ratio;
        /// <summary>
        /// 权重比例
        /// </summary>
        public double weight_ratio
        {
            get { return _weight_ratio; }

            set
            {
                _weight_ratio = value;
                RaisePropertyChanged(() => weight_ratio);
            }
        }

        private double _begin_cost_amt;
        /// <summary>
        /// 期初成本
        /// </summary>
        public double begin_cost_amt
        {
            get { return _begin_cost_amt; }

            set
            {
                _begin_cost_amt = value;
                RaisePropertyChanged(() => begin_cost_amt);
            }
        }

        private double _begin_posi_market_value;
        /// <summary>
        /// 期初持仓市值
        /// </summary>
        public double begin_posi_market_value
        {
            get { return _begin_posi_market_value; }

            set
            {
                _begin_posi_market_value = value;
                RaisePropertyChanged(() => begin_posi_market_value);
            }
        }

        private double _begin_realize_pandl;
        /// <summary>
        /// 期初实现盈亏
        /// </summary>
        public double begin_realize_pandl
        {
            get { return _begin_realize_pandl; }

            set
            {
                _begin_realize_pandl = value;
                RaisePropertyChanged(() => begin_realize_pandl);
            }
        }

        private double _end_cost_amt;
        /// <summary>
        /// 期末成本
        /// </summary>
        public double end_cost_amt
        {
            get { return _end_cost_amt; }

            set
            {
                _end_cost_amt = value;
                RaisePropertyChanged(() => end_cost_amt);
            }
        }

        private double _end_posi_market_value;
        /// <summary>
        /// 期末持仓市值
        /// </summary>
        public double end_posi_market_value
        {
            get { return _end_posi_market_value; }

            set
            {
                _end_posi_market_value = value;
                RaisePropertyChanged(() => end_posi_market_value);
            }
        }

        private double _end_realize_pandl;
        /// <summary>
        /// 期末实现盈亏
        /// </summary>
        public double end_realize_pandl
        {
            get { return _end_realize_pandl; }

            set
            {
                _end_realize_pandl = value;
                RaisePropertyChanged(() => end_realize_pandl);
            }
        }

        private double _float_pandl;
        /// <summary>
        /// 浮动盈亏
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

        private double _interval_realize_pandl;
        /// <summary>
        /// 区间实现盈亏
        /// </summary>
        public double interval_realize_pandl
        {
            get { return _interval_realize_pandl; }

            set
            {
                _interval_realize_pandl = value;
                RaisePropertyChanged(() => interval_realize_pandl);
            }
        }

        private double _interval_pandl;
        /// <summary>
        /// 区间盈亏
        /// </summary>
        public double interval_pandl
        {
            get { return _interval_pandl; }

            set
            {
                _interval_pandl = value;
                RaisePropertyChanged(() => interval_pandl);
            }
        }
    }

    public class rptL_3_103_Info : ObservableObject
    {

        private int _begin_date;
        /// <summary>
        /// 开始日期
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
        /// 结束日期
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

        private double _begin_close_price;
        /// <summary>
        /// 期初收盘价
        /// </summary>
        public double begin_close_price
        {
            get { return _begin_close_price; }

            set
            {
                _begin_close_price = value;
                RaisePropertyChanged(() => begin_close_price);
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

        private double _begin_cost_amt;
        /// <summary>
        /// 期初成本
        /// </summary>
        public double begin_cost_amt
        {
            get { return _begin_cost_amt; }

            set
            {
                _begin_cost_amt = value;
                RaisePropertyChanged(() => begin_cost_amt);
            }
        }

        private double _begin_posi_market_value;
        /// <summary>
        /// 期初持仓市值
        /// </summary>
        public double begin_posi_market_value
        {
            get { return _begin_posi_market_value; }

            set
            {
                _begin_posi_market_value = value;
                RaisePropertyChanged(() => begin_posi_market_value);
            }
        }

        private double _begin_realize_pandl;
        /// <summary>
        /// 期初实现盈亏
        /// </summary>
        public double begin_realize_pandl
        {
            get { return _begin_realize_pandl; }

            set
            {
                _begin_realize_pandl = value;
                RaisePropertyChanged(() => begin_realize_pandl);
            }
        }

        private double _end_close_price;
        /// <summary>
        /// 期末收盘价
        /// </summary>
        public double end_close_price
        {
            get { return _end_close_price; }

            set
            {
                _end_close_price = value;
                RaisePropertyChanged(() => end_close_price);
            }
        }

        private int _end_cur_qty;
        /// <summary>
        /// 期末数量
        /// </summary>
        public int end_cur_qty
        {
            get { return _end_cur_qty; }

            set
            {
                _end_cur_qty = value;
                RaisePropertyChanged(() => end_cur_qty);
            }
        }

        private double _end_cost_amt;
        /// <summary>
        /// 期末成本
        /// </summary>
        public double end_cost_amt
        {
            get { return _end_cost_amt; }

            set
            {
                _end_cost_amt = value;
                RaisePropertyChanged(() => end_cost_amt);
            }
        }

        private double _end_posi_market_value;
        /// <summary>
        /// 期末持仓市值
        /// </summary>
        public double end_posi_market_value
        {
            get { return _end_posi_market_value; }

            set
            {
                _end_posi_market_value = value;
                RaisePropertyChanged(() => end_posi_market_value);
            }
        }

        private double _end_realize_pandl;
        /// <summary>
        /// 期末实现盈亏
        /// </summary>
        public double end_realize_pandl
        {
            get { return _end_realize_pandl; }

            set
            {
                _end_realize_pandl = value;
                RaisePropertyChanged(() => end_realize_pandl);
            }
        }

        private double _float_pandl;
        /// <summary>
        /// 浮动盈亏
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

        private double _interval_realize_pandl;
        /// <summary>
        /// 区间实现盈亏
        /// </summary>
        public double interval_realize_pandl
        {
            get { return _interval_realize_pandl; }

            set
            {
                _interval_realize_pandl = value;
                RaisePropertyChanged(() => interval_realize_pandl);
            }
        }

        private double _interval_pandl;
        /// <summary>
        /// 区间盈亏
        /// </summary>
        public double interval_pandl
        {
            get { return _interval_pandl; }

            set
            {
                _interval_pandl = value;
                RaisePropertyChanged(() => interval_pandl);
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
    }

    public class rptL_3_201_Info : ObservableObject
    {

        private int _begin_date;
        /// <summary>
        /// 开始日期
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
        /// 结束日期
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

        private double _share_net;
        /// <summary>
        /// 份额净值
        /// </summary>
        public double share_net
        {
            get { return _share_net; }

            set
            {
                _share_net = value;
                RaisePropertyChanged(() => share_net);
            }
        }

        private double _share_net_total;
        /// <summary>
        /// 份额累计净值
        /// </summary>
        public double share_net_total
        {
            get { return _share_net_total; }

            set
            {
                _share_net_total = value;
                RaisePropertyChanged(() => share_net_total);
            }
        }

        private double _sharpe_ration;
        /// <summary>
        /// 夏普比率
        /// </summary>
        public double sharpe_ration
        {
            get { return _sharpe_ration; }

            set
            {
                _sharpe_ration = value;
                RaisePropertyChanged(() => sharpe_ration);
            }
        }

        private double _max_retracement;
        /// <summary>
        /// 最大回撤
        /// </summary>
        public double max_retracement
        {
            get { return _max_retracement; }

            set
            {
                _max_retracement = value;
                RaisePropertyChanged(() => max_retracement);
            }
        }

        private double _annual_yield;
        /// <summary>
        /// 年化收益率
        /// </summary>
        public double annual_yield
        {
            get { return _annual_yield; }

            set
            {
                _annual_yield = value;
                RaisePropertyChanged(() => annual_yield);
            }
        }

        private double _net_growth_rate_stdev;
        /// <summary>
        /// 净值增长率标准差
        /// </summary>
        public double net_growth_rate_stdev
        {
            get { return _net_growth_rate_stdev; }

            set
            {
                _net_growth_rate_stdev = value;
                RaisePropertyChanged(() => net_growth_rate_stdev);
            }
        }

        private double _achi_compa_pandl_ratio;
        /// <summary>
        /// 业绩比较基准收益率
        /// </summary>
        public double achi_compa_pandl_ratio
        {
            get { return _achi_compa_pandl_ratio; }

            set
            {
                _achi_compa_pandl_ratio = value;
                RaisePropertyChanged(() => achi_compa_pandl_ratio);
            }
        }

        private double _profit_year_ratio;
        /// <summary>
        /// 当年收益率
        /// </summary>
        public double profit_year_ratio
        {
            get { return _profit_year_ratio; }

            set
            {
                _profit_year_ratio = value;
                RaisePropertyChanged(() => profit_year_ratio);
            }
        }
    }

    public class rptL_3_202_Info : ObservableObject
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

        private double _share_net_total;
        /// <summary>
        /// 份额累计净值
        /// </summary>
        public double share_net_total
        {
            get { return _share_net_total; }

            set
            {
                _share_net_total = value;
                RaisePropertyChanged(() => share_net_total);
            }
        }

        private double _pre_nav;
        /// <summary>
        /// 昨日净值
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

        private int _busin_date;
        /// <summary>
        /// 业务日期
        /// </summary>
        public int busin_date
        {
            get { return _busin_date; }

            set
            {
                _busin_date = value;
                RaisePropertyChanged(() => busin_date);
            }
        }

        private double _return_ratio_in_single_month;
        /// <summary>
        /// 一个月收益率
        /// </summary>
        public double return_ratio_in_single_month
        {
            get { return _return_ratio_in_single_month; }

            set
            {
                _return_ratio_in_single_month = value;
                RaisePropertyChanged(() => return_ratio_in_single_month);
            }
        }
    }

}

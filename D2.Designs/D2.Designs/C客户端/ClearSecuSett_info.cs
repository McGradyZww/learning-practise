using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class clsecuL_3_1_Info : ObservableObject
    {
    }

    public class clsecuL_3_2_Info : ObservableObject
    {
    }

    public class clsecuL_3_3_Info : ObservableObject
    {
    }

    public class clsecuL_3_4_Info : ObservableObject
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

        private int _divi_cacl_num;
        /// <summary>
        /// 行为单位
        /// </summary>
        public int divi_cacl_num
        {
            get { return _divi_cacl_num; }

            set
            {
                _divi_cacl_num = value;
                RaisePropertyChanged(() => divi_cacl_num);
            }
        }

        private double _divi_amt;
        /// <summary>
        /// 分红金额
        /// </summary>
        public double divi_amt
        {
            get { return _divi_amt; }

            set
            {
                _divi_amt = value;
                RaisePropertyChanged(() => divi_amt);
            }
        }

        private double _divi_qty;
        /// <summary>
        /// 红股数量
        /// </summary>
        public double divi_qty
        {
            get { return _divi_qty; }

            set
            {
                _divi_qty = value;
                RaisePropertyChanged(() => divi_qty);
            }
        }

        private double _equity_trans_qty;
        /// <summary>
        /// 转赠数量
        /// </summary>
        public double equity_trans_qty
        {
            get { return _equity_trans_qty; }

            set
            {
                _equity_trans_qty = value;
                RaisePropertyChanged(() => equity_trans_qty);
            }
        }

        private double _rights_issue_qty;
        /// <summary>
        /// 配股数量
        /// </summary>
        public double rights_issue_qty
        {
            get { return _rights_issue_qty; }

            set
            {
                _rights_issue_qty = value;
                RaisePropertyChanged(() => rights_issue_qty);
            }
        }

        private double _placement_price;
        /// <summary>
        /// 配股价格
        /// </summary>
        public double placement_price
        {
            get { return _placement_price; }

            set
            {
                _placement_price = value;
                RaisePropertyChanged(() => placement_price);
            }
        }

        private int _notice_date;
        /// <summary>
        /// 公告日期
        /// </summary>
        public int notice_date
        {
            get { return _notice_date; }

            set
            {
                _notice_date = value;
                RaisePropertyChanged(() => notice_date);
            }
        }

        private int _reg_date;
        /// <summary>
        /// 登记日期
        /// </summary>
        public int reg_date
        {
            get { return _reg_date; }

            set
            {
                _reg_date = value;
                RaisePropertyChanged(() => reg_date);
            }
        }

        private int _ex_date;
        /// <summary>
        /// 除权日期
        /// </summary>
        public int ex_date
        {
            get { return _ex_date; }

            set
            {
                _ex_date = value;
                RaisePropertyChanged(() => ex_date);
            }
        }

        private int _arrive_date;
        /// <summary>
        /// 到账日期
        /// </summary>
        public int arrive_date
        {
            get { return _arrive_date; }

            set
            {
                _arrive_date = value;
                RaisePropertyChanged(() => arrive_date);
            }
        }

        private int _begin_trade_date;
        /// <summary>
        /// 上市日期
        /// </summary>
        public int begin_trade_date
        {
            get { return _begin_trade_date; }

            set
            {
                _begin_trade_date = value;
                RaisePropertyChanged(() => begin_trade_date);
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
    }

    public class clsecuL_3_11_Info : ObservableObject
    {
    }

    public class clsecuL_3_12_Info : ObservableObject
    {
    }

    public class clsecuL_3_13_Info : ObservableObject
    {
    }

    public class clsecuL_3_14_Info : ObservableObject
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

        private double _divi_tax_rate;
        /// <summary>
        /// 行为税率
        /// </summary>
        public double divi_tax_rate
        {
            get { return _divi_tax_rate; }

            set
            {
                _divi_tax_rate = value;
                RaisePropertyChanged(() => divi_tax_rate);
            }
        }
    }

    public class clsecuL_3_16_Info : ObservableObject
    {
    }

    public class clsecuL_3_17_Info : ObservableObject
    {
    }

    public class clsecuL_3_18_Info : ObservableObject
    {
    }

    public class clsecuL_3_19_Info : ObservableObject
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

        private double _divi_tax_rate;
        /// <summary>
        /// 行为税率
        /// </summary>
        public double divi_tax_rate
        {
            get { return _divi_tax_rate; }

            set
            {
                _divi_tax_rate = value;
                RaisePropertyChanged(() => divi_tax_rate);
            }
        }
    }

    public class clsecuL_3_21_Info : ObservableObject
    {
    }

    public class clsecuL_3_22_Info : ObservableObject
    {
    }

    public class clsecuL_3_23_Info : ObservableObject
    {
    }

    public class clsecuL_3_24_Info : ObservableObject
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
    }

    public class clsecuL_3_26_Info : ObservableObject
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
    }

    public class clsecuL_3_31_Info : ObservableObject
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
    }

    public class clsecuL_3_34_Info : ObservableObject
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

        private int _dist_qty;
        /// <summary>
        /// 分配数量
        /// </summary>
        public int dist_qty
        {
            get { return _dist_qty; }

            set
            {
                _dist_qty = value;
                RaisePropertyChanged(() => dist_qty);
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

        private int _trade_code_no;
        /// <summary>
        /// 交易代码编号
        /// </summary>
        public int trade_code_no
        {
            get { return _trade_code_no; }

            set
            {
                _trade_code_no = value;
                RaisePropertyChanged(() => trade_code_no);
            }
        }

        private int _target_code_no;
        /// <summary>
        /// 标的代码编号
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
    }

    public class clsecuL_3_36_Info : ObservableObject
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

        private int _dist_qty;
        /// <summary>
        /// 分配数量
        /// </summary>
        public int dist_qty
        {
            get { return _dist_qty; }

            set
            {
                _dist_qty = value;
                RaisePropertyChanged(() => dist_qty);
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

        private int _trade_code_no;
        /// <summary>
        /// 交易代码编号
        /// </summary>
        public int trade_code_no
        {
            get { return _trade_code_no; }

            set
            {
                _trade_code_no = value;
                RaisePropertyChanged(() => trade_code_no);
            }
        }

        private int _target_code_no;
        /// <summary>
        /// 标的代码编号
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
    }

    public class clsecuL_3_37_Info : ObservableObject
    {
    }

    public class clsecuL_3_38_Info : ObservableObject
    {
    }

    public class clsecuL_3_39_Info : ObservableObject
    {
    }

    public class clsecuL_3_40_Info : ObservableObject
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
    }

    public class clsecuL_3_41_Info : ObservableObject
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
    }

    public class clsecuL_3_44_Info : ObservableObject
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

        private double _repo_qty;
        /// <summary>
        /// 回购数量
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
        /// 回购金额
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
        /// 回购利率
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
        /// 回购交易日期
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
        /// 回购委托序号
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
        /// 回购成交序号
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

        private int _repo_cale_days;
        /// <summary>
        /// 回购实际天数
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
        /// 回购到期日期
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

        private int _repo_back_trade_date;
        /// <summary>
        /// 实际回购到期日期
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

        private double _repo_back_amt;
        /// <summary>
        /// 回购购回金额
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
        /// 回购购回利息
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

        private String _repo_status;
        /// <summary>
        /// 回购处理状态
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

        private int _trade_code_no;
        /// <summary>
        /// 交易代码编号
        /// </summary>
        public int trade_code_no
        {
            get { return _trade_code_no; }

            set
            {
                _trade_code_no = value;
                RaisePropertyChanged(() => trade_code_no);
            }
        }

        private int _target_code_no;
        /// <summary>
        /// 标的代码编号
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
    }

    public class clsecuL_3_50_Info : ObservableObject
    {
    }

    public class clsecuL_3_86_Info : ObservableObject
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

        private int _act_record_flag;
        /// <summary>
        /// 账户登记标志
        /// </summary>
        public int act_record_flag
        {
            get { return _act_record_flag; }

            set
            {
                _act_record_flag = value;
                RaisePropertyChanged(() => act_record_flag);
            }
        }

        private int _acco_entry_flag;
        /// <summary>
        /// 账户入账标志
        /// </summary>
        public int acco_entry_flag
        {
            get { return _acco_entry_flag; }

            set
            {
                _acco_entry_flag = value;
                RaisePropertyChanged(() => acco_entry_flag);
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

        private int _reg_date;
        /// <summary>
        /// 登记日期
        /// </summary>
        public int reg_date
        {
            get { return _reg_date; }

            set
            {
                _reg_date = value;
                RaisePropertyChanged(() => reg_date);
            }
        }

        private int _arrive_date;
        /// <summary>
        /// 到账日期
        /// </summary>
        public int arrive_date
        {
            get { return _arrive_date; }

            set
            {
                _arrive_date = value;
                RaisePropertyChanged(() => arrive_date);
            }
        }
    }

    public class clsecuL_3_87_Info : ObservableObject
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

        private int _trade_code_no;
        /// <summary>
        /// 交易代码编号
        /// </summary>
        public int trade_code_no
        {
            get { return _trade_code_no; }

            set
            {
                _trade_code_no = value;
                RaisePropertyChanged(() => trade_code_no);
            }
        }

        private int _target_code_no;
        /// <summary>
        /// 标的代码编号
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

        private double _impawn_ratio;
        /// <summary>
        /// 质押比例
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

        private int _repo_back_date;
        /// <summary>
        /// 回购到期日期
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
    }

    public class clsecuL_3_88_Info : ObservableObject
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
    }

    public class clsecuL_3_89_Info : ObservableObject
    {
    }

    public class clsecuL_3_90_Info : ObservableObject
    {
    }

    public class clsecuL_3_152_Info : ObservableObject
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

    public class clsecuL_3_153_Info : ObservableObject
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

    public class clsecuL_3_201_Info : ObservableObject
    {
    }

    public class clsecuL_3_202_Info : ObservableObject
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

        private int _sett_num;
        /// <summary>
        /// 结算笔数
        /// </summary>
        public int sett_num
        {
            get { return _sett_num; }

            set
            {
                _sett_num = value;
                RaisePropertyChanged(() => sett_num);
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
    }

    public class clsecuL_3_203_Info : ObservableObject
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

        private int _divi_cacl_num;
        /// <summary>
        /// 行为单位
        /// </summary>
        public int divi_cacl_num
        {
            get { return _divi_cacl_num; }

            set
            {
                _divi_cacl_num = value;
                RaisePropertyChanged(() => divi_cacl_num);
            }
        }

        private double _divi_amt;
        /// <summary>
        /// 分红金额
        /// </summary>
        public double divi_amt
        {
            get { return _divi_amt; }

            set
            {
                _divi_amt = value;
                RaisePropertyChanged(() => divi_amt);
            }
        }

        private double _divi_qty;
        /// <summary>
        /// 红股数量
        /// </summary>
        public double divi_qty
        {
            get { return _divi_qty; }

            set
            {
                _divi_qty = value;
                RaisePropertyChanged(() => divi_qty);
            }
        }

        private double _equity_trans_qty;
        /// <summary>
        /// 转赠数量
        /// </summary>
        public double equity_trans_qty
        {
            get { return _equity_trans_qty; }

            set
            {
                _equity_trans_qty = value;
                RaisePropertyChanged(() => equity_trans_qty);
            }
        }

        private double _rights_issue_qty;
        /// <summary>
        /// 配股数量
        /// </summary>
        public double rights_issue_qty
        {
            get { return _rights_issue_qty; }

            set
            {
                _rights_issue_qty = value;
                RaisePropertyChanged(() => rights_issue_qty);
            }
        }

        private int _notice_date;
        /// <summary>
        /// 公告日期
        /// </summary>
        public int notice_date
        {
            get { return _notice_date; }

            set
            {
                _notice_date = value;
                RaisePropertyChanged(() => notice_date);
            }
        }

        private int _reg_date;
        /// <summary>
        /// 登记日期
        /// </summary>
        public int reg_date
        {
            get { return _reg_date; }

            set
            {
                _reg_date = value;
                RaisePropertyChanged(() => reg_date);
            }
        }

        private int _ex_date;
        /// <summary>
        /// 除权日期
        /// </summary>
        public int ex_date
        {
            get { return _ex_date; }

            set
            {
                _ex_date = value;
                RaisePropertyChanged(() => ex_date);
            }
        }

        private int _arrive_date;
        /// <summary>
        /// 到账日期
        /// </summary>
        public int arrive_date
        {
            get { return _arrive_date; }

            set
            {
                _arrive_date = value;
                RaisePropertyChanged(() => arrive_date);
            }
        }

        private int _begin_trade_date;
        /// <summary>
        /// 上市日期
        /// </summary>
        public int begin_trade_date
        {
            get { return _begin_trade_date; }

            set
            {
                _begin_trade_date = value;
                RaisePropertyChanged(() => begin_trade_date);
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

    public class clsecuL_3_101_Info : ObservableObject
    {
    }

    public class clsecuL_3_51_Info : ObservableObject
    {
    }

    public class clsecuL_3_204_Info : ObservableObject
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

        private double _rights_issue_qty;
        /// <summary>
        /// 配股数量
        /// </summary>
        public double rights_issue_qty
        {
            get { return _rights_issue_qty; }

            set
            {
                _rights_issue_qty = value;
                RaisePropertyChanged(() => rights_issue_qty);
            }
        }

        private double _placement_price;
        /// <summary>
        /// 配股价格
        /// </summary>
        public double placement_price
        {
            get { return _placement_price; }

            set
            {
                _placement_price = value;
                RaisePropertyChanged(() => placement_price);
            }
        }

        private double _avail_pla_qty;
        /// <summary>
        /// 可配数量
        /// </summary>
        public double avail_pla_qty
        {
            get { return _avail_pla_qty; }

            set
            {
                _avail_pla_qty = value;
                RaisePropertyChanged(() => avail_pla_qty);
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

        private int _reg_date;
        /// <summary>
        /// 登记日期
        /// </summary>
        public int reg_date
        {
            get { return _reg_date; }

            set
            {
                _reg_date = value;
                RaisePropertyChanged(() => reg_date);
            }
        }

        private int _ex_date;
        /// <summary>
        /// 除权日期
        /// </summary>
        public int ex_date
        {
            get { return _ex_date; }

            set
            {
                _ex_date = value;
                RaisePropertyChanged(() => ex_date);
            }
        }

        private int _arrive_date;
        /// <summary>
        /// 到账日期
        /// </summary>
        public int arrive_date
        {
            get { return _arrive_date; }

            set
            {
                _arrive_date = value;
                RaisePropertyChanged(() => arrive_date);
            }
        }

        private int _begin_trade_date;
        /// <summary>
        /// 上市日期
        /// </summary>
        public int begin_trade_date
        {
            get { return _begin_trade_date; }

            set
            {
                _begin_trade_date = value;
                RaisePropertyChanged(() => begin_trade_date);
            }
        }

        private String _placement_status;
        /// <summary>
        /// 配股状态
        /// </summary>
        public String placement_status
        {
            get { return _placement_status; }

            set
            {
                _placement_status = value;
                RaisePropertyChanged(() => placement_status);
            }
        }
    }

    public class clsecuL_3_205_Info : ObservableObject
    {
    }

    public class clsecuL_3_206_Info : ObservableObject
    {
    }

}

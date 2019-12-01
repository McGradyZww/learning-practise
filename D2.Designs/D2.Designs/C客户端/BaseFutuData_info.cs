using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class pubL_13_112_Info : ObservableObject
    {
    }

    public class pubL_13_114_Info : ObservableObject
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

        private String _contrc_type_name;
        /// <summary>
        /// 合约类型简称
        /// </summary>
        public String contrc_type_name
        {
            get { return _contrc_type_name; }

            set
            {
                _contrc_type_name = value;
                RaisePropertyChanged(() => contrc_type_name);
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

        private int _report_unit;
        /// <summary>
        /// 申报单位
        /// </summary>
        public int report_unit
        {
            get { return _report_unit; }

            set
            {
                _report_unit = value;
                RaisePropertyChanged(() => report_unit);
            }
        }

        private int _min_unit;
        /// <summary>
        /// 最小单位
        /// </summary>
        public int min_unit
        {
            get { return _min_unit; }

            set
            {
                _min_unit = value;
                RaisePropertyChanged(() => min_unit);
            }
        }

        private double _max_qty;
        /// <summary>
        /// 最大数量
        /// </summary>
        public double max_qty
        {
            get { return _max_qty; }

            set
            {
                _max_qty = value;
                RaisePropertyChanged(() => max_qty);
            }
        }

        private double _min_qty;
        /// <summary>
        /// 最小数量
        /// </summary>
        public double min_qty
        {
            get { return _min_qty; }

            set
            {
                _min_qty = value;
                RaisePropertyChanged(() => min_qty);
            }
        }

        private int _type_unit;
        /// <summary>
        /// 类型单位
        /// </summary>
        public int type_unit
        {
            get { return _type_unit; }

            set
            {
                _type_unit = value;
                RaisePropertyChanged(() => type_unit);
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

        private int _capit_reback_days;
        /// <summary>
        /// 资金回转天数
        /// </summary>
        public int capit_reback_days
        {
            get { return _capit_reback_days; }

            set
            {
                _capit_reback_days = value;
                RaisePropertyChanged(() => capit_reback_days);
            }
        }

        private int _posi_reback_days;
        /// <summary>
        /// 持仓回转天数
        /// </summary>
        public int posi_reback_days
        {
            get { return _posi_reback_days; }

            set
            {
                _posi_reback_days = value;
                RaisePropertyChanged(() => posi_reback_days);
            }
        }

        private int _is_order_dir_flag;
        /// <summary>
        /// 区分订单方向标志
        /// </summary>
        public int is_order_dir_flag
        {
            get { return _is_order_dir_flag; }

            set
            {
                _is_order_dir_flag = value;
                RaisePropertyChanged(() => is_order_dir_flag);
            }
        }

        private int _time_stamp;
        /// <summary>
        /// 时间戳
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

    public class pubL_13_115_Info : ObservableObject
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

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
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

        private String _jour_occur_field;
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field
        {
            get { return _jour_occur_field; }

            set
            {
                _jour_occur_field = value;
                RaisePropertyChanged(() => jour_occur_field);
            }
        }

        private String _jour_after_occur_info;
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info
        {
            get { return _jour_after_occur_info; }

            set
            {
                _jour_after_occur_info = value;
                RaisePropertyChanged(() => jour_after_occur_info);
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

    public class pubL_13_116_Info : ObservableObject
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

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
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

        private String _jour_occur_field;
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field
        {
            get { return _jour_occur_field; }

            set
            {
                _jour_occur_field = value;
                RaisePropertyChanged(() => jour_occur_field);
            }
        }

        private String _jour_after_occur_info;
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info
        {
            get { return _jour_after_occur_info; }

            set
            {
                _jour_after_occur_info = value;
                RaisePropertyChanged(() => jour_after_occur_info);
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

    public class pubL_13_124_Info : ObservableObject
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

        private int _cash_frozen_type;
        /// <summary>
        /// 资金冻结方式
        /// </summary>
        public int cash_frozen_type
        {
            get { return _cash_frozen_type; }

            set
            {
                _cash_frozen_type = value;
                RaisePropertyChanged(() => cash_frozen_type);
            }
        }

        private int _order_split_flag;
        /// <summary>
        /// 订单数量拆分标志
        /// </summary>
        public int order_split_flag
        {
            get { return _order_split_flag; }

            set
            {
                _order_split_flag = value;
                RaisePropertyChanged(() => order_split_flag);
            }
        }

        private int _min_unit;
        /// <summary>
        /// 最小单位
        /// </summary>
        public int min_unit
        {
            get { return _min_unit; }

            set
            {
                _min_unit = value;
                RaisePropertyChanged(() => min_unit);
            }
        }

        private double _min_qty;
        /// <summary>
        /// 最小数量
        /// </summary>
        public double min_qty
        {
            get { return _min_qty; }

            set
            {
                _min_qty = value;
                RaisePropertyChanged(() => min_qty);
            }
        }

        private double _max_qty;
        /// <summary>
        /// 最大数量
        /// </summary>
        public double max_qty
        {
            get { return _max_qty; }

            set
            {
                _max_qty = value;
                RaisePropertyChanged(() => max_qty);
            }
        }

        private int _time_stamp;
        /// <summary>
        /// 时间戳
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

    public class pubL_13_131_Info : ObservableObject
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

    public class pubL_13_132_Info : ObservableObject
    {
    }

    public class pubL_13_133_Info : ObservableObject
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

        private String _pinyin_short;
        /// <summary>
        /// 拼音简称
        /// </summary>
        public String pinyin_short
        {
            get { return _pinyin_short; }

            set
            {
                _pinyin_short = value;
                RaisePropertyChanged(() => pinyin_short);
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

        private int _report_unit;
        /// <summary>
        /// 申报单位
        /// </summary>
        public int report_unit
        {
            get { return _report_unit; }

            set
            {
                _report_unit = value;
                RaisePropertyChanged(() => report_unit);
            }
        }

        private int _min_unit;
        /// <summary>
        /// 最小单位
        /// </summary>
        public int min_unit
        {
            get { return _min_unit; }

            set
            {
                _min_unit = value;
                RaisePropertyChanged(() => min_unit);
            }
        }

        private double _max_qty;
        /// <summary>
        /// 最大数量
        /// </summary>
        public double max_qty
        {
            get { return _max_qty; }

            set
            {
                _max_qty = value;
                RaisePropertyChanged(() => max_qty);
            }
        }

        private double _min_qty;
        /// <summary>
        /// 最小数量
        /// </summary>
        public double min_qty
        {
            get { return _min_qty; }

            set
            {
                _min_qty = value;
                RaisePropertyChanged(() => min_qty);
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

        private int _capit_reback_days;
        /// <summary>
        /// 资金回转天数
        /// </summary>
        public int capit_reback_days
        {
            get { return _capit_reback_days; }

            set
            {
                _capit_reback_days = value;
                RaisePropertyChanged(() => capit_reback_days);
            }
        }

        private int _posi_reback_days;
        /// <summary>
        /// 持仓回转天数
        /// </summary>
        public int posi_reback_days
        {
            get { return _posi_reback_days; }

            set
            {
                _posi_reback_days = value;
                RaisePropertyChanged(() => posi_reback_days);
            }
        }

        private String _fee_set;
        /// <summary>
        /// 费用设置
        /// </summary>
        public String fee_set
        {
            get { return _fee_set; }

            set
            {
                _fee_set = value;
                RaisePropertyChanged(() => fee_set);
            }
        }

        private int _is_order_dir_flag;
        /// <summary>
        /// 区分订单方向标志
        /// </summary>
        public int is_order_dir_flag
        {
            get { return _is_order_dir_flag; }

            set
            {
                _is_order_dir_flag = value;
                RaisePropertyChanged(() => is_order_dir_flag);
            }
        }

        private int _valid_flag;
        /// <summary>
        /// 有效标志
        /// </summary>
        public int valid_flag
        {
            get { return _valid_flag; }

            set
            {
                _valid_flag = value;
                RaisePropertyChanged(() => valid_flag);
            }
        }

        private int _contrc_limit_flag;
        /// <summary>
        /// 合约限制
        /// </summary>
        public int contrc_limit_flag
        {
            get { return _contrc_limit_flag; }

            set
            {
                _contrc_limit_flag = value;
                RaisePropertyChanged(() => contrc_limit_flag);
            }
        }

        private int _margin_pref;
        /// <summary>
        /// 保证金优惠
        /// </summary>
        public int margin_pref
        {
            get { return _margin_pref; }

            set
            {
                _margin_pref = value;
                RaisePropertyChanged(() => margin_pref);
            }
        }

        private int _posi_type;
        /// <summary>
        /// 持仓类型
        /// </summary>
        public int posi_type
        {
            get { return _posi_type; }

            set
            {
                _posi_type = value;
                RaisePropertyChanged(() => posi_type);
            }
        }

        private int _deli_year;
        /// <summary>
        /// 交割年份
        /// </summary>
        public int deli_year
        {
            get { return _deli_year; }

            set
            {
                _deli_year = value;
                RaisePropertyChanged(() => deli_year);
            }
        }

        private int _deli_month;
        /// <summary>
        /// 交割月份
        /// </summary>
        public int deli_month
        {
            get { return _deli_month; }

            set
            {
                _deli_month = value;
                RaisePropertyChanged(() => deli_month);
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

        private int _expire_date;
        /// <summary>
        /// 到期日期
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

        private int _begin_deli_date;
        /// <summary>
        /// 开始交割日
        /// </summary>
        public int begin_deli_date
        {
            get { return _begin_deli_date; }

            set
            {
                _begin_deli_date = value;
                RaisePropertyChanged(() => begin_deli_date);
            }
        }

        private int _end_deli_date;
        /// <summary>
        /// 结束交割日
        /// </summary>
        public int end_deli_date
        {
            get { return _end_deli_date; }

            set
            {
                _end_deli_date = value;
                RaisePropertyChanged(() => end_deli_date);
            }
        }

        private int _open_order_type;
        /// <summary>
        /// 交割月自然人允许开仓标志
        /// </summary>
        public int open_order_type
        {
            get { return _open_order_type; }

            set
            {
                _open_order_type = value;
                RaisePropertyChanged(() => open_order_type);
            }
        }

        private double _step_price;
        /// <summary>
        /// 最小价差
        /// </summary>
        public double step_price
        {
            get { return _step_price; }

            set
            {
                _step_price = value;
                RaisePropertyChanged(() => step_price);
            }
        }

        private double _hold_qty;
        /// <summary>
        /// 持仓量
        /// </summary>
        public double hold_qty
        {
            get { return _hold_qty; }

            set
            {
                _hold_qty = value;
                RaisePropertyChanged(() => hold_qty);
            }
        }

        private int _main_flag;
        /// <summary>
        /// 主力标志
        /// </summary>
        public int main_flag
        {
            get { return _main_flag; }

            set
            {
                _main_flag = value;
                RaisePropertyChanged(() => main_flag);
            }
        }

        private int _time_stamp;
        /// <summary>
        /// 时间戳
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

    public class pubL_13_134_Info : ObservableObject
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

        private String _model_name;
        /// <summary>
        /// 模板名称
        /// </summary>
        public String model_name
        {
            get { return _model_name; }

            set
            {
                _model_name = value;
                RaisePropertyChanged(() => model_name);
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

        private String _prefix_char;
        /// <summary>
        /// 前缀字符
        /// </summary>
        public String prefix_char
        {
            get { return _prefix_char; }

            set
            {
                _prefix_char = value;
                RaisePropertyChanged(() => prefix_char);
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

        private int _report_unit;
        /// <summary>
        /// 申报单位
        /// </summary>
        public int report_unit
        {
            get { return _report_unit; }

            set
            {
                _report_unit = value;
                RaisePropertyChanged(() => report_unit);
            }
        }

        private double _market_min_qty;
        /// <summary>
        /// 市价单最小下单量
        /// </summary>
        public double market_min_qty
        {
            get { return _market_min_qty; }

            set
            {
                _market_min_qty = value;
                RaisePropertyChanged(() => market_min_qty);
            }
        }

        private double _market_max_qty;
        /// <summary>
        /// 市价单最大下单量
        /// </summary>
        public double market_max_qty
        {
            get { return _market_max_qty; }

            set
            {
                _market_max_qty = value;
                RaisePropertyChanged(() => market_max_qty);
            }
        }

        private double _limit_min_qty;
        /// <summary>
        /// 限价单最小下单量
        /// </summary>
        public double limit_min_qty
        {
            get { return _limit_min_qty; }

            set
            {
                _limit_min_qty = value;
                RaisePropertyChanged(() => limit_min_qty);
            }
        }

        private double _limit_max_qty;
        /// <summary>
        /// 限价单最大下单量
        /// </summary>
        public double limit_max_qty
        {
            get { return _limit_max_qty; }

            set
            {
                _limit_max_qty = value;
                RaisePropertyChanged(() => limit_max_qty);
            }
        }

        private int _open_order_type;
        /// <summary>
        /// 交割月自然人允许开仓标志
        /// </summary>
        public int open_order_type
        {
            get { return _open_order_type; }

            set
            {
                _open_order_type = value;
                RaisePropertyChanged(() => open_order_type);
            }
        }
    }

    public class pubL_13_141_Info : ObservableObject
    {

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
    }

    public class pubL_13_142_Info : ObservableObject
    {
    }

    public class pubL_13_144_Info : ObservableObject
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

        private String _pinyin_short;
        /// <summary>
        /// 拼音简称
        /// </summary>
        public String pinyin_short
        {
            get { return _pinyin_short; }

            set
            {
                _pinyin_short = value;
                RaisePropertyChanged(() => pinyin_short);
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

        private int _report_unit;
        /// <summary>
        /// 申报单位
        /// </summary>
        public int report_unit
        {
            get { return _report_unit; }

            set
            {
                _report_unit = value;
                RaisePropertyChanged(() => report_unit);
            }
        }

        private int _min_unit;
        /// <summary>
        /// 最小单位
        /// </summary>
        public int min_unit
        {
            get { return _min_unit; }

            set
            {
                _min_unit = value;
                RaisePropertyChanged(() => min_unit);
            }
        }

        private double _max_qty;
        /// <summary>
        /// 最大数量
        /// </summary>
        public double max_qty
        {
            get { return _max_qty; }

            set
            {
                _max_qty = value;
                RaisePropertyChanged(() => max_qty);
            }
        }

        private double _min_qty;
        /// <summary>
        /// 最小数量
        /// </summary>
        public double min_qty
        {
            get { return _min_qty; }

            set
            {
                _min_qty = value;
                RaisePropertyChanged(() => min_qty);
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

        private int _capit_reback_days;
        /// <summary>
        /// 资金回转天数
        /// </summary>
        public int capit_reback_days
        {
            get { return _capit_reback_days; }

            set
            {
                _capit_reback_days = value;
                RaisePropertyChanged(() => capit_reback_days);
            }
        }

        private int _posi_reback_days;
        /// <summary>
        /// 持仓回转天数
        /// </summary>
        public int posi_reback_days
        {
            get { return _posi_reback_days; }

            set
            {
                _posi_reback_days = value;
                RaisePropertyChanged(() => posi_reback_days);
            }
        }

        private String _fee_set;
        /// <summary>
        /// 费用设置
        /// </summary>
        public String fee_set
        {
            get { return _fee_set; }

            set
            {
                _fee_set = value;
                RaisePropertyChanged(() => fee_set);
            }
        }

        private int _is_order_dir_flag;
        /// <summary>
        /// 区分订单方向标志
        /// </summary>
        public int is_order_dir_flag
        {
            get { return _is_order_dir_flag; }

            set
            {
                _is_order_dir_flag = value;
                RaisePropertyChanged(() => is_order_dir_flag);
            }
        }

        private int _valid_flag;
        /// <summary>
        /// 有效标志
        /// </summary>
        public int valid_flag
        {
            get { return _valid_flag; }

            set
            {
                _valid_flag = value;
                RaisePropertyChanged(() => valid_flag);
            }
        }

        private int _contrc_limit_flag;
        /// <summary>
        /// 合约限制
        /// </summary>
        public int contrc_limit_flag
        {
            get { return _contrc_limit_flag; }

            set
            {
                _contrc_limit_flag = value;
                RaisePropertyChanged(() => contrc_limit_flag);
            }
        }

        private int _margin_pref;
        /// <summary>
        /// 保证金优惠
        /// </summary>
        public int margin_pref
        {
            get { return _margin_pref; }

            set
            {
                _margin_pref = value;
                RaisePropertyChanged(() => margin_pref);
            }
        }

        private int _posi_type;
        /// <summary>
        /// 持仓类型
        /// </summary>
        public int posi_type
        {
            get { return _posi_type; }

            set
            {
                _posi_type = value;
                RaisePropertyChanged(() => posi_type);
            }
        }

        private int _deli_year;
        /// <summary>
        /// 交割年份
        /// </summary>
        public int deli_year
        {
            get { return _deli_year; }

            set
            {
                _deli_year = value;
                RaisePropertyChanged(() => deli_year);
            }
        }

        private int _deli_month;
        /// <summary>
        /// 交割月份
        /// </summary>
        public int deli_month
        {
            get { return _deli_month; }

            set
            {
                _deli_month = value;
                RaisePropertyChanged(() => deli_month);
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

        private int _expire_date;
        /// <summary>
        /// 到期日期
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

        private int _begin_deli_date;
        /// <summary>
        /// 开始交割日
        /// </summary>
        public int begin_deli_date
        {
            get { return _begin_deli_date; }

            set
            {
                _begin_deli_date = value;
                RaisePropertyChanged(() => begin_deli_date);
            }
        }

        private int _end_deli_date;
        /// <summary>
        /// 结束交割日
        /// </summary>
        public int end_deli_date
        {
            get { return _end_deli_date; }

            set
            {
                _end_deli_date = value;
                RaisePropertyChanged(() => end_deli_date);
            }
        }

        private int _open_order_type;
        /// <summary>
        /// 交割月自然人允许开仓标志
        /// </summary>
        public int open_order_type
        {
            get { return _open_order_type; }

            set
            {
                _open_order_type = value;
                RaisePropertyChanged(() => open_order_type);
            }
        }

        private double _step_price;
        /// <summary>
        /// 最小价差
        /// </summary>
        public double step_price
        {
            get { return _step_price; }

            set
            {
                _step_price = value;
                RaisePropertyChanged(() => step_price);
            }
        }

        private double _hold_qty;
        /// <summary>
        /// 持仓量
        /// </summary>
        public double hold_qty
        {
            get { return _hold_qty; }

            set
            {
                _hold_qty = value;
                RaisePropertyChanged(() => hold_qty);
            }
        }

        private int _main_flag;
        /// <summary>
        /// 主力标志
        /// </summary>
        public int main_flag
        {
            get { return _main_flag; }

            set
            {
                _main_flag = value;
                RaisePropertyChanged(() => main_flag);
            }
        }

        private int _time_stamp;
        /// <summary>
        /// 时间戳
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

    public class pubL_13_148_Info : ObservableObject
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

        private String _pinyin_short;
        /// <summary>
        /// 拼音简称
        /// </summary>
        public String pinyin_short
        {
            get { return _pinyin_short; }

            set
            {
                _pinyin_short = value;
                RaisePropertyChanged(() => pinyin_short);
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

        private int _capit_reback_days;
        /// <summary>
        /// 资金回转天数
        /// </summary>
        public int capit_reback_days
        {
            get { return _capit_reback_days; }

            set
            {
                _capit_reback_days = value;
                RaisePropertyChanged(() => capit_reback_days);
            }
        }

        private int _posi_reback_days;
        /// <summary>
        /// 持仓回转天数
        /// </summary>
        public int posi_reback_days
        {
            get { return _posi_reback_days; }

            set
            {
                _posi_reback_days = value;
                RaisePropertyChanged(() => posi_reback_days);
            }
        }

        private double _step_price;
        /// <summary>
        /// 最小价差
        /// </summary>
        public double step_price
        {
            get { return _step_price; }

            set
            {
                _step_price = value;
                RaisePropertyChanged(() => step_price);
            }
        }

        private int _main_flag;
        /// <summary>
        /// 主力标志
        /// </summary>
        public int main_flag
        {
            get { return _main_flag; }

            set
            {
                _main_flag = value;
                RaisePropertyChanged(() => main_flag);
            }
        }

        private int _time_stamp;
        /// <summary>
        /// 时间戳
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

    public class pubL_13_145_Info : ObservableObject
    {

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

        private String _pinyin_short;
        /// <summary>
        /// 拼音简称
        /// </summary>
        public String pinyin_short
        {
            get { return _pinyin_short; }

            set
            {
                _pinyin_short = value;
                RaisePropertyChanged(() => pinyin_short);
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

        private int _report_unit;
        /// <summary>
        /// 申报单位
        /// </summary>
        public int report_unit
        {
            get { return _report_unit; }

            set
            {
                _report_unit = value;
                RaisePropertyChanged(() => report_unit);
            }
        }

        private int _min_unit;
        /// <summary>
        /// 最小单位
        /// </summary>
        public int min_unit
        {
            get { return _min_unit; }

            set
            {
                _min_unit = value;
                RaisePropertyChanged(() => min_unit);
            }
        }

        private double _max_qty;
        /// <summary>
        /// 最大数量
        /// </summary>
        public double max_qty
        {
            get { return _max_qty; }

            set
            {
                _max_qty = value;
                RaisePropertyChanged(() => max_qty);
            }
        }

        private double _min_qty;
        /// <summary>
        /// 最小数量
        /// </summary>
        public double min_qty
        {
            get { return _min_qty; }

            set
            {
                _min_qty = value;
                RaisePropertyChanged(() => min_qty);
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

        private int _capit_reback_days;
        /// <summary>
        /// 资金回转天数
        /// </summary>
        public int capit_reback_days
        {
            get { return _capit_reback_days; }

            set
            {
                _capit_reback_days = value;
                RaisePropertyChanged(() => capit_reback_days);
            }
        }

        private int _posi_reback_days;
        /// <summary>
        /// 持仓回转天数
        /// </summary>
        public int posi_reback_days
        {
            get { return _posi_reback_days; }

            set
            {
                _posi_reback_days = value;
                RaisePropertyChanged(() => posi_reback_days);
            }
        }

        private String _fee_set;
        /// <summary>
        /// 费用设置
        /// </summary>
        public String fee_set
        {
            get { return _fee_set; }

            set
            {
                _fee_set = value;
                RaisePropertyChanged(() => fee_set);
            }
        }

        private int _is_order_dir_flag;
        /// <summary>
        /// 区分订单方向标志
        /// </summary>
        public int is_order_dir_flag
        {
            get { return _is_order_dir_flag; }

            set
            {
                _is_order_dir_flag = value;
                RaisePropertyChanged(() => is_order_dir_flag);
            }
        }

        private int _valid_flag;
        /// <summary>
        /// 有效标志
        /// </summary>
        public int valid_flag
        {
            get { return _valid_flag; }

            set
            {
                _valid_flag = value;
                RaisePropertyChanged(() => valid_flag);
            }
        }

        private int _contrc_limit_flag;
        /// <summary>
        /// 合约限制
        /// </summary>
        public int contrc_limit_flag
        {
            get { return _contrc_limit_flag; }

            set
            {
                _contrc_limit_flag = value;
                RaisePropertyChanged(() => contrc_limit_flag);
            }
        }

        private int _margin_pref;
        /// <summary>
        /// 保证金优惠
        /// </summary>
        public int margin_pref
        {
            get { return _margin_pref; }

            set
            {
                _margin_pref = value;
                RaisePropertyChanged(() => margin_pref);
            }
        }

        private int _posi_type;
        /// <summary>
        /// 持仓类型
        /// </summary>
        public int posi_type
        {
            get { return _posi_type; }

            set
            {
                _posi_type = value;
                RaisePropertyChanged(() => posi_type);
            }
        }

        private int _deli_year;
        /// <summary>
        /// 交割年份
        /// </summary>
        public int deli_year
        {
            get { return _deli_year; }

            set
            {
                _deli_year = value;
                RaisePropertyChanged(() => deli_year);
            }
        }

        private int _deli_month;
        /// <summary>
        /// 交割月份
        /// </summary>
        public int deli_month
        {
            get { return _deli_month; }

            set
            {
                _deli_month = value;
                RaisePropertyChanged(() => deli_month);
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

        private int _expire_date;
        /// <summary>
        /// 到期日期
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

        private int _begin_deli_date;
        /// <summary>
        /// 开始交割日
        /// </summary>
        public int begin_deli_date
        {
            get { return _begin_deli_date; }

            set
            {
                _begin_deli_date = value;
                RaisePropertyChanged(() => begin_deli_date);
            }
        }

        private int _end_deli_date;
        /// <summary>
        /// 结束交割日
        /// </summary>
        public int end_deli_date
        {
            get { return _end_deli_date; }

            set
            {
                _end_deli_date = value;
                RaisePropertyChanged(() => end_deli_date);
            }
        }

        private int _open_order_type;
        /// <summary>
        /// 交割月自然人允许开仓标志
        /// </summary>
        public int open_order_type
        {
            get { return _open_order_type; }

            set
            {
                _open_order_type = value;
                RaisePropertyChanged(() => open_order_type);
            }
        }

        private double _step_price;
        /// <summary>
        /// 最小价差
        /// </summary>
        public double step_price
        {
            get { return _step_price; }

            set
            {
                _step_price = value;
                RaisePropertyChanged(() => step_price);
            }
        }

        private double _hold_qty;
        /// <summary>
        /// 持仓量
        /// </summary>
        public double hold_qty
        {
            get { return _hold_qty; }

            set
            {
                _hold_qty = value;
                RaisePropertyChanged(() => hold_qty);
            }
        }

        private int _main_flag;
        /// <summary>
        /// 主力标志
        /// </summary>
        public int main_flag
        {
            get { return _main_flag; }

            set
            {
                _main_flag = value;
                RaisePropertyChanged(() => main_flag);
            }
        }

        private int _time_stamp;
        /// <summary>
        /// 时间戳
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

    public class pubL_13_146_Info : ObservableObject
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

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
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

        private String _jour_occur_field;
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field
        {
            get { return _jour_occur_field; }

            set
            {
                _jour_occur_field = value;
                RaisePropertyChanged(() => jour_occur_field);
            }
        }

        private String _jour_after_occur_info;
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info
        {
            get { return _jour_after_occur_info; }

            set
            {
                _jour_after_occur_info = value;
                RaisePropertyChanged(() => jour_after_occur_info);
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

    public class pubL_13_147_Info : ObservableObject
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

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
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

        private String _jour_occur_field;
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field
        {
            get { return _jour_occur_field; }

            set
            {
                _jour_occur_field = value;
                RaisePropertyChanged(() => jour_occur_field);
            }
        }

        private String _jour_after_occur_info;
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info
        {
            get { return _jour_after_occur_info; }

            set
            {
                _jour_after_occur_info = value;
                RaisePropertyChanged(() => jour_after_occur_info);
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

    public class pubL_13_149_Info : ObservableObject
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

    public class pubL_13_151_Info : ObservableObject
    {
    }

    public class pubL_13_152_Info : ObservableObject
    {
    }

    public class pubL_13_153_Info : ObservableObject
    {
    }

    public class pubL_13_154_Info : ObservableObject
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

        private int _cash_frozen_type;
        /// <summary>
        /// 资金冻结方式
        /// </summary>
        public int cash_frozen_type
        {
            get { return _cash_frozen_type; }

            set
            {
                _cash_frozen_type = value;
                RaisePropertyChanged(() => cash_frozen_type);
            }
        }

        private int _order_split_flag;
        /// <summary>
        /// 订单数量拆分标志
        /// </summary>
        public int order_split_flag
        {
            get { return _order_split_flag; }

            set
            {
                _order_split_flag = value;
                RaisePropertyChanged(() => order_split_flag);
            }
        }

        private int _min_unit;
        /// <summary>
        /// 最小单位
        /// </summary>
        public int min_unit
        {
            get { return _min_unit; }

            set
            {
                _min_unit = value;
                RaisePropertyChanged(() => min_unit);
            }
        }

        private double _min_qty;
        /// <summary>
        /// 最小数量
        /// </summary>
        public double min_qty
        {
            get { return _min_qty; }

            set
            {
                _min_qty = value;
                RaisePropertyChanged(() => min_qty);
            }
        }

        private double _max_qty;
        /// <summary>
        /// 最大数量
        /// </summary>
        public double max_qty
        {
            get { return _max_qty; }

            set
            {
                _max_qty = value;
                RaisePropertyChanged(() => max_qty);
            }
        }

        private int _time_stamp;
        /// <summary>
        /// 时间戳
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

    public class pubL_13_155_Info : ObservableObject
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

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
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

        private String _jour_occur_field;
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field
        {
            get { return _jour_occur_field; }

            set
            {
                _jour_occur_field = value;
                RaisePropertyChanged(() => jour_occur_field);
            }
        }

        private String _jour_after_occur_info;
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info
        {
            get { return _jour_after_occur_info; }

            set
            {
                _jour_after_occur_info = value;
                RaisePropertyChanged(() => jour_after_occur_info);
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

    public class pubL_13_156_Info : ObservableObject
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

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
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

        private String _jour_occur_field;
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field
        {
            get { return _jour_occur_field; }

            set
            {
                _jour_occur_field = value;
                RaisePropertyChanged(() => jour_occur_field);
            }
        }

        private String _jour_after_occur_info;
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info
        {
            get { return _jour_after_occur_info; }

            set
            {
                _jour_after_occur_info = value;
                RaisePropertyChanged(() => jour_after_occur_info);
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

    public class pubL_13_157_Info : ObservableObject
    {
    }

    public class pubL_13_158_Info : ObservableObject
    {
    }

    public class pubL_13_159_Info : ObservableObject
    {
    }

    public class pubL_13_160_Info : ObservableObject
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

    public class pubL_13_161_Info : ObservableObject
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

        private int _pref_type;
        /// <summary>
        /// 优惠类型
        /// </summary>
        public int pref_type
        {
            get { return _pref_type; }

            set
            {
                _pref_type = value;
                RaisePropertyChanged(() => pref_type);
            }
        }

        private String _partic_code;
        /// <summary>
        /// 参与代码
        /// </summary>
        public String partic_code
        {
            get { return _partic_code; }

            set
            {
                _partic_code = value;
                RaisePropertyChanged(() => partic_code);
            }
        }

        private double _margin_ratio;
        /// <summary>
        /// 保证金比例
        /// </summary>
        public double margin_ratio
        {
            get { return _margin_ratio; }

            set
            {
                _margin_ratio = value;
                RaisePropertyChanged(() => margin_ratio);
            }
        }

        private int _prior_type;
        /// <summary>
        /// 优先级
        /// </summary>
        public int prior_type
        {
            get { return _prior_type; }

            set
            {
                _prior_type = value;
                RaisePropertyChanged(() => prior_type);
            }
        }

        private int _trade_pref;
        /// <summary>
        /// 交易优惠
        /// </summary>
        public int trade_pref
        {
            get { return _trade_pref; }

            set
            {
                _trade_pref = value;
                RaisePropertyChanged(() => trade_pref);
            }
        }

        private int _sett_pref;
        /// <summary>
        /// 清算优惠
        /// </summary>
        public int sett_pref
        {
            get { return _sett_pref; }

            set
            {
                _sett_pref = value;
                RaisePropertyChanged(() => sett_pref);
            }
        }
    }

    public class pubL_13_170_Info : ObservableObject
    {
    }

    public class pubL_13_171_Info : ObservableObject
    {
    }

    public class pubL_13_172_Info : ObservableObject
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
    }

    public class pubL_13_173_Info : ObservableObject
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

        private double _pre_close_price;
        /// <summary>
        /// 昨收盘价
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

        private double _hold_qty;
        /// <summary>
        /// 持仓量
        /// </summary>
        public double hold_qty
        {
            get { return _hold_qty; }

            set
            {
                _hold_qty = value;
                RaisePropertyChanged(() => hold_qty);
            }
        }

        private double _pre_hold_qty;
        /// <summary>
        /// 昨持仓量
        /// </summary>
        public double pre_hold_qty
        {
            get { return _pre_hold_qty; }

            set
            {
                _pre_hold_qty = value;
                RaisePropertyChanged(() => pre_hold_qty);
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

        private double _today_open_price;
        /// <summary>
        /// 今开盘价
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

        private double _max_buy_price;
        /// <summary>
        /// 最高买价
        /// </summary>
        public double max_buy_price
        {
            get { return _max_buy_price; }

            set
            {
                _max_buy_price = value;
                RaisePropertyChanged(() => max_buy_price);
            }
        }

        private double _min_sale_price;
        /// <summary>
        /// 最低卖价
        /// </summary>
        public double min_sale_price
        {
            get { return _min_sale_price; }

            set
            {
                _min_sale_price = value;
                RaisePropertyChanged(() => min_sale_price);
            }
        }

        private double _total_buy_qty;
        /// <summary>
        /// 市场总买量
        /// </summary>
        public double total_buy_qty
        {
            get { return _total_buy_qty; }

            set
            {
                _total_buy_qty = value;
                RaisePropertyChanged(() => total_buy_qty);
            }
        }

        private double _total_sale_qty;
        /// <summary>
        /// 市场总卖量
        /// </summary>
        public double total_sale_qty
        {
            get { return _total_sale_qty; }

            set
            {
                _total_sale_qty = value;
                RaisePropertyChanged(() => total_sale_qty);
            }
        }

        private double _up_limit_price;
        /// <summary>
        /// 涨停价
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
        /// 跌停价
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

        private double _buy_price_1;
        /// <summary>
        /// 买一价
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
        /// 买一量
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
        /// 买二价
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
        /// 买二量
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
        /// 买三价
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
        /// 买三量
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
        /// 买四价
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
        /// 买四量
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
        /// 买五价
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
        /// 买五量
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
        /// 卖一价
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
        /// 卖一量
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
        /// 卖二价
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
        /// 卖二量
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
        /// 卖三价
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
        /// 卖三量
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
        /// 卖四价
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
        /// 卖四量
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
        /// 卖五价
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
        /// 卖五量
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

        private int _time_stamp;
        /// <summary>
        /// 时间戳
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

    public class pubL_13_174_Info : ObservableObject
    {
    }

}
